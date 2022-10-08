-- 3.Dada la definición de los tipos de datos siguientes, escriba alguna función que cumpla con esta. 
bools = [True]

nums = [[1]]

add' x y z = x + y + z 

copy a = (a,a)

apply a b = a b

--4. Definción de tipos de datos
second xs = head (tail xs)

swap (x,y) = (y,x)

pair x y = (x,y)

double x = x*2 

palindrome xs = reverse xs == xs

twice f x = f (f x)

