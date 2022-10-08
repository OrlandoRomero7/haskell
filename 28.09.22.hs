

--isor :: Ord a => [a] => a
{- isort [] = []
isort (x:xs) = isort x (isort x ) -}


{-Funciones con multiples argunmentos tambien pueder ser definidas 
-- como funciones recursivas -}

-- -> Defininir su propia funcion zip como un funcion recursiva

myZip [] _ = []
myZip _ [] = [] 
myZip (x:xs) (y:ys) = (x,y):myZip xs ys


-- -> Definir su propia funcion drop como un funcion recursiva
-- myDrop :: Int -> [a] -> a
myDrop 0 xs = xs
myDrop _ [] = []
myDrop n (_:xs) = myDrop (n-1) xs

-- -> Definir una funcion que calcule el elementos n-esimo de la sucesion de Fibonacci.
--fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-2) + fibonacci (n-1)

-- -> Definir una funcion recursiva que ordene una lista, utilizando el algoritmo de quicksort

quicksort' [] = []
quicksort' (x:xs) =    quicksort' smaller ++ [x] ++ quicksort' larger
                       where
                        smaller = [x' | x' <- xs, x'<=x]
                        larger = [y' | y' <- xs, y' > x]

-- -> Definir una funcion que diga si un numero es par o impar 

--even:: Int -> Bool
even' 0 = True
even' n = odd' (n-1)

odd' 0 = False
odd' n = even' (n-1)

{- ejemplo
    {aplicar even'}
        odd'(3)
    {aplicar odd'}
        even'(2)
    {aplicar even'}
        odd'(1)
    {aplicar odd'}
        even'(0)
    {aplicar even'}
        True
-}

-- -> Realizar un funcion recursiva que seleccione los elementos en las posiciones 
-- pares de una lista y los devuelva en otra lista. Realizar lo mismo para los elementos que estan
-- en una posicion impar, contando desde la posicion cero.

pPares [] = []
pPares (x:xs) = x: pImpares (xs)

pImpares [] = []
pImpares (_:xs) = pPares (xs)