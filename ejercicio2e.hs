

--1. Tripleta
pyths n = [(x,y,z)|x <- [0..n],y <- [0..n],z <- [0..n], z^2 == y^2+x^2,y/=0,x/=0]

--2. Entero positivo perfecto
factores n = [x | x<- [1..n], n `mod` x == 0,x/=n]

perfectos n = [ x |x <-[1..n], x == sum (factores x)]

--3. Lista anidada
ejemplo = [(x,y) | x <- [1,2], y <- [3,4]]


concatenar =  [x | x <- [(x,y)| x <- [1,2], y <- [3,4]]]


--4. Redefinir funcions posiciones 

--funcion creada en el ejercicio 2c
encontrar a xs = [x | (a',x) <-xs, a'== a]  

posiciones x xs = encontrar x (zip xs [0..])


--5. Producto Escalar 
productoEscalar xs ys =  sum [(x*y) | (x,y) <-zip xs ys]
