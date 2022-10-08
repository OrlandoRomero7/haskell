
concatenar xss = [x | xs <- xss, x<-xs]

primeros ps = [x | (x,_) <- ps]

longitud xs = sum([1| _ <- xs])

factores n = [x | x<- [1..n], n `mod` x == 0]

primos n = factores n == [1,n]

