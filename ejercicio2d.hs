


encontrar a xs = [x | (a',x) <-xs, a'== a]  

grid n m = [(a,b) | a <- [0..n], b <- [0..m]]

--cuadrado n = [(a,b) | a <- [0..n], b <-[1..n]]

cuadrado n = drop 1 (grid n n) 


suma = sum [x^2 | x <- [1..100]]

replicate' n a =  [a | _ <- [1..n]]