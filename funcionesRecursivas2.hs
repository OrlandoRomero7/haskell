{- 1. ¿Cómo se comporta la funci ́on factorial si su argumento es un número
negativo? Modifique la definción de la función factorial vista en clase
para prohibir el uso de números negativos, utilice una guarda en el caso
recursivo. -}

factorial 0 = 1           
factorial n | n > 0 = n * factorial (n-1) 
            | otherwise = error "No es posible hacer factorial de números negativos!"

{- 2. Proponga una función sumdown :: Int → [Int] que regrese la suma de
todos los números enteros no negativos desde un valor dado hasta el cero.
Por ejemplo, sumdown 3 deber ́a regresar 3+2+1+0=6.-}          
sumDown n | n > 0 = n + sumDown (n-1) 
          | n == 0 = 0
          | otherwise = error "No es posible hacerlo con numeros negativos!"            

{- 3. Defina el operador ˆ para enteros no negativos utilizando los mismos pa-
trones de recursi ́on como en el operador *, y muestre como la expresión
2ˆ 3 es evaluada usando su definición.-}

n `potencia` m | n < 0  || m < 0 = error "No es posible hacerlo con numeros negativos!"
               | n > 0  && m == 0 = 1 
               | otherwise = n * n `potencia` (m-1) 

{- 4. Defina una función recursiva euclid :: Int → Int → Int que implemente el
algoritmo de Euclides para calcular el común divisor m ́as grande de dos
enteros no negativos: si los dos n ́umeros son iguales, ese es el resultado;
de otra forma, el n ́umero m ́as peque ̃no se resta del mayor, y este proceso
se repite. -}
euclid a 0 = a
euclid a b | b>=0 && a>=0 = euclid b (a `mod` b)
           | otherwise = error "No es posible hacerlo con numeros negativos!"

{- n `por` 0 = 0
n `por` m = n + n `por` (m-1)  -}

--5. Usando funciones recursivas sobres listas proponga una función que:

--(a) Decida si todos los valores logicos en una lista son True 
and' [] = True
and' (b:bs) = b && and' bs

--(b) Concatenar una lista de listas:
concat' [] = []
concat' (xs:xss) = xs ++ concat' xss

--(c) Produce una lista con n elementos identicos:

replicate' 0 _  = []
replicate' n x = x : replicate' (n-1) x

--(d) Seleccione el eńesimo elemento de una lista:

enesimo (x:_) 0 = x
enesimo (_:xs) n = enesimo xs (n-1)

--(e) Decide si un valor es un elemento de una lista:

elem' x [] = False
elem' x (y:ys) | x == y    = True
               | otherwise = elem' x ys

{- 6. Defina una función recursiva merge:: Ord a ⇒ [a] → [a] que combine dos
listas ordenadas en una sola lista ordenada. -}

merge [] ys = ys
merge xs [] = xs
merge (x:xs) (y:ys) | x <= y    = x : merge xs (y:ys)
                    | otherwise = y : merge (x:xs) ys     


{- 7. Usando merge, defina una funci ́on recursiva msort:: Ord a ⇒ [a] → [a]
que implemente el algoritmo de ordenamiento por combinaci ́on, en el
cual la lista vac ́ıa y la lista con un solo elemento son ya una lista ordenada,
y cualquier otra lista es ordenada combinando las dos listas que resultan
al separar y ordenar las mitades de la lista original por separado.
Ayuda: primero defina una funci ́on mitad:: [a] → ([a],[a]) que separa una
lista en dos mitades, cuyas longitudes difieren a lo m ́as de un elemento. -}                             


mitad xs = splitAt (length xs `div` 2) xs 

msort []  = []
msort [x] = [x]
msort xs  = merge (msort ys) (msort zs)
                where (ys,zs) = mitad xs