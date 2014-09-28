module Geom where

import Data.Function
import Data.List (nub,sortBy)

norm :: Num a => (a, a) -> a
norm v = v `dot` v

(-.) :: (Num a, Num b) => (a, b) -> (a, b) -> (a, b)
(ux,uy) -. (vx,vy) = (ux-vx,uy-vy)

(+.) :: (Num a, Num b) => (a, b) -> (a, b) -> (a, b)
(ux,uy) +. (vx,vy) = (ux+vx,uy+vy)

(*.) :: Num a => a -> (a, a) -> (a, a)
k *. (x,y) = (k*x,k*y)

cross :: Num a => (a, a) -> (a, a) -> a
cross (ux,uy) (vx,vy) = ux*vy-uy*vx

dot :: Num a => (a, a) -> (a, a) -> a
dot (ux,uy) (vx,vy) = ux*vx+uy*vy

between :: Ord a => (a,a) -> (a,a) -> (a,a) -> Bool
between (qx1,qy1) (px,py) (qx2,qy2) =
  if qx1 /= qx2 then qx1 <= px && px <= qx2 || qx2 <= px && px <= qx1
  else if qy1 /= qy2 then qy1 <= py && py <= qy2 || qy2 <= py && py <= qy1
       else px == qx1 && py == qy1

intersect :: (Fractional a, Ord a)
             => (a, a) -> (a, a) -> (a, a) -> (a, a) -> [(a, a)]
intersect p1 p2 q1 q2 =
  let r = p2 -. p1
      s = q2 -. q1 in
  let rs = r `cross` s in
  let qp = q1 -. p1 in
  let x  = qp `cross` r in
  case (rs == 0, x == 0) of
    (True, True)  -> nub ([ p1 | between q1 p1 q2 ]
                          ++ [ p2 | between q1 p2 q2 ]
                          ++ [ q1 | between p1 q1 p2 ]
                          ++ [ q2 | between p1 q2 p2 ])
    (True, False) -> []
    (False,_)     -> let t = qp `cross` s / rs
                         u = qp `cross` r / rs
                     in if 0 <= t && t <= 1 && 0 <= u && u <= 1
                        then [p1 +. (t *. r)] else []

castThrough :: (Fractional a, Ord a)
        => (a, a) -> (a, a) -> (a, a) -> (a, a) -> [(a, a)]
castThrough rayStart rayPoint p1 p2 =
  let r = rayPoint -. rayStart
      s = p2 -. p1 in
  let rs = r `cross` s in
  let qp = p1 -. rayStart in
  let x  = qp `cross` r in
  case (rs == 0, x == 0) of
    (True, True)  -> nub ([ p1 | between rayStart p1 rayPoint
                                 || between rayStart rayPoint p1 ]
                          ++ [ p2 | between rayStart p2 rayPoint
                                    || between rayStart rayPoint p2 ]
                          ++ [ rayStart | between p1 rayStart p2 ])
    (True, False) -> []
    (False,_)     -> let t = qp `cross` s / rs
                         u = qp `cross` r / rs
                     in if 0 <= t && 0 <= u && u <= 1
                        then [rayStart +. (t *. r)] else []

segLine :: (Fractional a, Ord a)
        => (a, a) -> (a, a) -> (a, a) -> (a, a) -> [(a, a)]
segLine a b l1 l2 =
  let r = b -. a
      s = l2 -. l1 in
  let rs = r `cross` s in
  let qp = l1 -. a in
  let x  = qp `cross` r in
  case (rs == 0, x == 0) of
    (True, True)  -> [a,b]
    (True, False) -> []
    (False,_)     -> let t = qp `cross` s / rs
                     in if 0 <= t && t <= 1
                        then [(a +. (t *. r))] else []

midpoint :: (Fractional a, Fractional b) => (a, b) -> (a, b) -> (a, b)
midpoint (px,py) (qx,qy) = ((px+qx)/2, (py+qy)/2)

toCycle :: Eq a => [a] -> [a]
toCycle []     = []
toCycle (x:xs) = x:takeWhile (/= x) xs++[x]

rayCast :: (Fractional a, Ord a) => (a, a) -> (a, a) -> [(a, a)] -> (a, a)
rayCast rayStart rayEnd ps =
  head (sortBy (compare `on` p) (concat inters) ++ [rayEnd])
  where ps'    = toCycle ps
        inters = zipWith (castThrough rayStart rayEnd) ps' (tail ps')
        p u    = norm (u -. rayStart)
