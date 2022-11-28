import Data.List

--votes :: [String]

votes = ["Red","Blue","Green","Blue","Blue","Red"]

--count :: Eq a=>a -> [a] -> Int
count x = length.filter (==x)

-- -> Una funcion que elimine los valores duplicados de una list

--rmdups :: Eq a=> [a] -> [a]

rmdups [] = []
rmdups (x:xs) = x:filter(/=x) (rmdups xs)

--result :: Ord a=>[a] -> [(Int,a)]

resultado vs = sort [(count v vs, v)| v <- rmdups vs]

winner :: Ord a=> [a] -> a
winner  = snd . last . resultado

--eleccion :: [[String]]

eleccion = [["Red","Green"],
            ["Blue"],
            ["Greeen","Red","Blue"],
            ["Blue","Green","Red"],
            ["Greens"]]

{-
Para decidir el ganador, primero se eliminan las listas vacias,
despues, el cantidato con el menor nuermo de valores de la preferencias
es eleimnada de la eleccion, y este proceso se repite  hasta que un solo 
candidato queda, y este es ganador.
-}

--rmempty :: Eq a => [[a]] -> [[a]]

--rmempty = filter( /= [ ] )   --elimina listas vacias

--elim :: Eq a=>a->[[a]] -> [[a]]

elim x = map(filter (/=x)) -- Elimina un elemento dado de las listas de listas

-- rank :: Ord a => [[a]] -> [a]

--rank = map snd.resultado.map head


{-
rank eleccion
["Red","Blue", "Green"]
    se elimina el rojo


rank hace un raking sobre la primera preferencia ordenandolas de menor a mayor
-}

--winner':: ord a> [[a]] -> a
{- 
winner' bs = case rank (rmempty bs) of
             [c] -> c
             (c:cs) -> winner' (elim c bs)  -}

{-
winner' eleccion
"Green"
-}