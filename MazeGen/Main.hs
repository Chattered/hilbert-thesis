{-# LANGUAGE DeriveFunctor #-}

-- module Maze (Maze, makeMaze, Motion(..), navigate, walledMaze, simplify, points
--             ,pack, stringMaze, toLoop) where

import Control.Monad
import Control.Monad.Random
import Data.Array
import Data.Function (on)
import Data.List (groupBy,sort,transpose,foldl')
import Data.UnionFind
import Geom
import System.Random.Shuffle
import System.Environment

newtype Maze = Maze [(Wall,Bool)]

data WallType = EastWall | SouthWall
              deriving (Eq,Ord,Show)

type Coord = (Int,Int)
type Wall  = (Coord,WallType)

walls :: Coord -> Coord -> [Wall]
walls (topLeftX,topLeftY) (botRightX,botRightY) =
  concat [ row y | y <- [topLeftY..botRightY - 1] ]
  ++ [ ((x,botRightY),EastWall) | x <- [topLeftX..botRightX-1] ]
  where row y = concat [ [((x,y),EastWall), ((x,y),SouthWall)]
                       | x <- [topLeftX..botRightX - 1] ]
                ++ [ ((botRightX,y),SouthWall) ]

throughWall :: WallType -> Coord -> Coord
throughWall EastWall  (x,y) = (x+1,y)
throughWall SouthWall (x,y) = (x,y+1)

kruskal :: [Wall] -> UnionFind s Coord [Bool]
kruskal = mapM (\(r,d) -> do
                   b <- equiv r (throughWall d r)
                   unless b (union r (throughWall d r))
                   return b)

makeMaze :: MonadRandom m => Coord -> Coord -> m Maze
makeMaze tl br = do
  walls <- shuffleM (walls tl br)
  return $ Maze $ sort $ zip walls (runUF (kruskal walls) (tl,br))

gridMaze :: [(Wall,Bool)] -> [[[(Wall,Bool)]]]
gridMaze ws =
  mapInitLast (mapInitLast id addEast)
  (\l -> map addSouth l ++ [addCorner l]) ws'
  where ws'  = transpose (map (groupBy ((==) `on` (snd . fst . fst)))
                          (groupBy ((==) `on` (fst . fst . fst)) (sort ws)))
        addEast  (ws@[((r,_),_)]) = [((r,EastWall),True)] ++ ws
        addSouth (ws@[((r,_),_)]) = ws ++ [((r,SouthWall),True)]
        addCorner l               = let [(((x,y),_),b)] = last l in
          [(((x+1,y),EastWall),True),(((x+1,y),SouthWall),True)]

stringMaze :: Maze -> String
stringMaze (Maze ws) =
  unlines ([top] ++ [ "|" ++ row ws | ws <- gridMaze ws ])
  where top    = "_" ++ concat (replicate (length (head wss)) "__")
        row ws = concat [ (if s then "_" else " ")
                          ++ (if e then "|" else " ")
                        | [(_,e),(_,s)] <- ws ]
        wss    = gridMaze ws

mapInitLast :: (a -> a) -> (a -> a) -> [a] -> [a]
mapInitLast f g []     = []
mapInitLast f g [x]    = [g x]
mapInitLast f g (x:xs) = f x : mapInitLast f g xs

data Direction   = North | East | South | West deriving (Eq,Show)
data Motion a    = Forward a | Turn | TurnAnti | TurnAround
                 deriving (Eq,Show,Functor)
data Orientation = Face Direction deriving (Eq,Show)
data Vector a    = Vector { position    :: (a,a),
                            orientation :: Orientation }
                 deriving (Eq,Show)

move :: Num a => Motion a -> Vector a -> Vector a
move (Forward n) (Vector (x,y) (Face North)) = Vector (x,y-n) (Face North)
move (Forward n) (Vector (x,y) (Face East))  = Vector (x+n,y) (Face East)
move (Forward n) (Vector (x,y) (Face South)) = Vector (x,y+n) (Face South)
move (Forward n) (Vector (x,y) (Face West))  = Vector (x-n,y) (Face West)
move Turn (Vector p (Face North))            = Vector p (Face East)
move Turn (Vector p (Face East))             = Vector p (Face South)
move Turn (Vector p (Face South))            = Vector p (Face West)
move Turn (Vector p (Face West))             = Vector p (Face North)
move TurnAnti (Vector p (Face North))        = Vector p (Face West)
move TurnAnti (Vector p (Face East))         = Vector p (Face North)
move TurnAnti (Vector p (Face South))        = Vector p (Face East)
move TurnAnti (Vector p (Face West))         = Vector p (Face South)
move TurnAround (Vector p (Face North))      = Vector p (Face South)
move TurnAround (Vector p (Face East))       = Vector p (Face West)
move TurnAround (Vector p (Face South))      = Vector p (Face North)
move TurnAround (Vector p (Face West))       = Vector p (Face East)

takeToLoop :: Eq a => [a] -> [a]
takeToLoop []     = []
takeToLoop (x:xs) = x : takeWhile (/= x) xs

navigate :: Maze -> [Motion Int]
navigate (Maze ws) = simplify (concat (hug (Vector (0,0) (Face East))))
  where hug v = let ms = if not (w (move TurnAnti v)) then [TurnAnti, Forward 1]
                         else if not (w v) then [Forward 1] else [Turn] in
                ms : hug (foldl' (flip move) v ms)
        w v@(Vector c (Face North)) = let c' = position (move (Forward 1) v) in
          not (inRange southDim c') || southWalls ! c'
        w (Vector   c (Face East))  = not (inRange eastDim c)  || eastWalls  ! c
        w (Vector   c (Face South)) = not (inRange southDim c) || southWalls ! c
        w v@(Vector c (Face West))  = let c' = position (move (Forward 1) v) in
          not (inRange eastDim c') || eastWalls ! c'
        eastWalls   = listArray eastDim  [ b | ((c,d),b) <- ws, d == EastWall ]
        southWalls  = listArray southDim [ b | ((c,d),b) <- ws, d == SouthWall ]
        minDim      = minimum (map (fst . fst) ws)
        dimX        = maximum (map (fst . fst . fst) ws)
        dimY        = maximum (map (snd . fst . fst) ws)
        eastDim     = (minDim, (dimX-1,dimY))
        southDim    = (minDim, (dimX,dimY-1))

simplify :: Num a => [Motion a] -> [Motion a]
simplify (Forward n:Forward p:ms)   = simplify (Forward (n+p):ms)
simplify (Turn:Turn:ms)             = simplify (TurnAround:ms)
simplify (Turn:TurnAnti:ms)         = simplify ms
simplify (Turn:TurnAround:ms)       = simplify (TurnAnti:ms)
simplify (TurnAnti:Turn:ms)         = simplify ms
simplify (TurnAnti:TurnAnti:ms)     = simplify (TurnAround:ms)
simplify (TurnAnti:TurnAround:ms)   = simplify (Turn:ms)
simplify (TurnAround:Turn:ms)       = simplify (TurnAnti:ms)
simplify (TurnAround:TurnAnti:ms)   = simplify (Turn:ms)
simplify (TurnAround:TurnAround:ms) = simplify ms
simplify (m:ms)                     = m:simplify ms

toLoop :: Real a => [Motion a] -> [Motion a]
toLoop (m:ms) = m : zipWith const ms loopps
  where loopps   = takeWhile (\(q,r) -> q == p || null (intersect (0,0) p q r))
                   (zip ps (tail ps))
        (_:p:ps) = points' ((fmap.fmap) toRational (m:ms))

points' :: Num a => [Motion a] -> [(a,a)]
points' ms =
  let p:ps = map position (scanl (flip move) (Vector (0,0) (Face East)) ms) in
  p:ps++[p]

points :: (Eq a, Num a) => [Motion a] -> [(a,a)]
points = map head . groupBy (==) . points'

walledMaze :: (Eq a, Num a) => a -> a -> Maze -> [Motion a]
walledMaze cw ww ms =
  simplify (poly ((fmap . fmap) fromIntegral $ navigate ms))
  where poly (Forward n:ms)            = Forward (n*tw) : poly ms
        poly (Turn:Forward n:ms)       =
          Forward cw : Turn : Forward (n*tw) : poly ms
        poly (TurnAnti:Forward n:ms)   =
          TurnAnti : Forward ww : Forward ((n-1)*tw) : poly ms
        poly (TurnAround:Forward n:ms) =
          Forward cw : Turn : Forward cw : Turn : Forward (n*tw) : poly ms
        tw = cw + ww

pack :: Show a => [Motion a] -> String
pack []                        = ""
pack (Turn:Forward n:ms)       = "R" ++ show n ++ pack ms
pack (TurnAnti:Forward n:ms)   = "L" ++ show n ++ pack ms
pack (TurnAround:Forward n:ms) = "B" ++ show n ++ pack ms
pack (Forward n:ms)            = "F" ++ show n ++ pack ms
pack [m]                       = ""

main = do
  g <- getStdGen
  m <- makeMaze (0,0) (25,25)
  writeFile "mazePoints" (unlines $ map show $ map head (groupBy (==) (points (toLoop $ walledMaze 0.4 0.4 m))))
