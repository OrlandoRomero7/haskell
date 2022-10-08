
{-
f [] = v

f (x:xs) = x # f xs



Ejemplos:


length:: [a -> INt]
lengh [] = 0
length (x:xs) = 1 + length xs

suma:: Num a => [a] -> a
suma = foldr (+) 0

 + es la funcion #
 0 es el valor


Problema: Defenir la funcin lenght utilizando foldr
longitud:: [a] -> Int
longitud = foldr (\_ n -> 1 + n)
------------------------------------
longitud [] = 0
longiutd (x:xs) = x (\_n->1+n) longitud xs

longitud [1,2,3]
-}

{- agregar x xs = xs ++ [x]
reversa [] = []

reversa (x:xs) = agregar x (reversa xs)

reversa = foldr agregar [] -}

{- suma = foldl (+) 0
 -}

 impar n = not (even n)

 sumsqreven = sum.map(^2).filter even