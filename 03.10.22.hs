-- FUNCIONES DE ORDEN MAYOR

{- 
Una funcion que toma una funcion com un argumento o bien regresa una funcion como
un resultado, es llamada funcion de mayor orden.
-}

{- estas funciones toman ventaja de la currificacion es decir , los agunmentos son tomados uno a
la vez y se aprovecha el hecho de que las funciones pueden regresar como un resultado.
-}

{- 
add:: Int -> Int -> Int
add x y = x + y

add:: Int -> (Int -> Int)
add = \x -> (\y -> x + y)

        ^ una funcion que regresa otra funcion

Ejemplo de una funcion que toma una funcion u in valor como parametro:

twice :: (a -> a) -> a ->a

-}

twice f x = f (f x)

-- >twice (*2) 3 
-- > 12

-- > twice reverse [1,2,3]
-- > [1,2,3]

{-
Al utilizar el concepto de funciones de orden mayor es posible que los patrones que definen a una 
funcion pueden ser encapsuladas como otra funcion.

Ejemplos:

-> Procesamiento de listas:

-> La funciones map. Esta instruccion aplica una funcion a todos los elementos de una lista.

> map :: (a->b) -> [a] -> [b]



-}
map f xs = [f x | x <- xs]

{-
 >map (+1) [1,3,5,7]
 [2,4,6,8]

 >map even [1,2,3,4]
 [False,True,False,True]

 >map reverse ["abc","def","ghi"]
 ["cba","fcd","igh"]

 map es una funcion polimorfica

 >map (map (+1)) [[1,2,3],[4,5]]
 [[2,3,4],[5,6]]

 a pasos:
 aplicando el map mas hacia afuera
 [map (+1) [1,2,3], map(+1) [4,5]]
 {aplicando el map mas interno}
 [[2,3,4],[5,6]]

-}

{- 
map:: (a->b) -> [a] -> [b]
-}
map2 f [] = []
map2 f (x:xs) = f x : map2 f xs

{- 
-> La funcion filter, esta selecciona todos los elementos de una lista que satisface un predicado , donde 
el predicado o propiedad es una funcion que regresa un valor logico.
-}

--filter:: (a->Bool) -> [a] -> [a]
filter p xs= [x | x <- xs, p x]


{-
Ejemplo:
>filter even [1..10]
[2,4,6,8]

>filter (>5) [1..10]
[6,7,8,9,10]

>filter (/=' ') "abc def ghi"
"abcdefghi"
-}

{-
filter :: (a -> Bool) -> [a] -> [a]
filter p [] = []
filter p (x:xs) | p x = x:filter p xs
                | otherwise = filter p xs
-}

{-
 ->Defina una funcion que regrese la suma de los cuadrados de los enteros pares de una lista
 dada utilizando, map y filter.
 
 mapFilter :: [Int] -> Int
 
-}

--mapFilter xs = sum( map(^2) (filter even xs))

{-
Otras funciones de mayor orden definidas en el preludio estandar.

 ->Decidir di todos los elementos de una lista satisfacen un predicado.
 >all even [2,4,6,8]
 True
 
 >any odd [2,4,6,8]
 False

 ^Si algun elemento satisface la condicion o propiedad

-}

{-
Seleccionar los elementos de una lsita mientras estos cumplan con alguna condicion

 >takeWhile [2,4,6,8]
 [2,4,6]

 >dropWhile odd [1,3,5,6,7]
 [6,7]

 ^quita los elementos de una lista mientras se satisface la condicion.
-}

{-
 -> Funcion foldr
 Muchas funciones recursivas se definene bajo el siguiente esquema de patrones

 f [] = v
 f (x:xs) = x # f xs

 Ejemplo:
 Sumar los elementos de una lista
 sum [] = 0
 sum (x:xs) = x + sum xs

                ^ la suma seria el #

 product [] = 1        -- 1 seria el valor  
 product (x:xs) = x * product xs
                    ^ * seria el gatito (#)

 or [] = True
 or (x:xs) = x || or xs
               ^ || seria el gatito

 and [] = True
 and (x:xs) = x && and xs
                ^ && seria #, y and f
-}

{-
La funcion foldr (fold right) encapsula este patron de recursion con el operador # 
y valor v como argumentos. Por ejemplo:

 sum:: Num a=>[a] -> a
 sum = foldr (+) 0

 product:: Num a=>[a] -> a
 product = foldr (*) 1

 or:: [Bool] -> Bool
 or = foldr (||) False

 and:: [Bool] -> Bool
 and = foldr (&&) True


-}

{-
---------------------------------------------------
 sum xs = foldr (+) 0 xs    <- forma explicita
-}

{-
 foldr:: (a->b->b) -> b -> [a] -> b
 foldr f v [ ] = v
 foldr f v (x:xs) = f x (foldr f v xs)
-}