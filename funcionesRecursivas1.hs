
ordenaInsercion [] = []
ordenaInsercion (x:xs) = inserta x (ordenaInsercion xs)



inserta x xs = takeWhile (<= x) xs ++ [x] ++ dropWhile (<=x) xs