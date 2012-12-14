import Test.QuickCheck

check :: Int -> Int -> [Int] -> Property
check m m' zs = n + n' < length zs ==> 
                drop n (drop n' (zs ++ take n' zs))
                ++ take n (drop n' (zs ++ take n' zs))
                == drop (n + n') (zs ++ take (n + n') zs)
    where n = abs m `rem` 10
          n' = abs m' `rem` 10
          