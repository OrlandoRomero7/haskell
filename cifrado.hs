import Data.Char


-- ->Definiar una funcion que converta 'a',...,'c' -> 0,...,25

--let2int :: char -> Int

let2int c = ord c - ord 'a'

--La funcion ord convierte el caracer a una representacion unicode 

-- ->Definiar uan funcion qe convierta un entero 0,..,25 -> 'a',...'z' let2int
--int2lent :: Int->
int2let n = chr(ord 'a' + n)
--chr convierte de un caracter uncode a un caracter

--isLower :: Char -> Bool
--isLower decide si un caracter es una letra minuscula
-- ------------------------------------------

--shift :: Int -> Char -> Char

shift n c | isLower c = int2let ((let2int c + n)`mod` 26)
          | otherwise = c

--encode :: Int -> String -> String

-- Funcion para codificar y descodificar
encode n xs = [shift n x|x <- xs] 

--frecuencia

--tabla :: [float]

tabla = [8.1, 1.5, 2.8, 4.2, 12.7, 2.2, 2.0, 6.1, 7.0,
        0.2, 0.8, 4.0, 2.4, 6.7, 7.5, 1.9, 0.1, 6.0, 
        6.3, 9.0, 2.8, 1.0, 2.4, 0.2, 2.0, 0.1]

--porcentaje :: Int -> Int -> Float

porcentaje n m = (fromIntegral n / fromIntegral m) * 100

-- fromInegral convierte un entero a un flotante

-- freqs :: String -> [Float]

--lowers :: String -> Int

lowers xs =  length [x | x <- xs, x >= 'a' && x<='z']

count x xs = length [ x' | x' <- xs, x == x']

--freqs xs = [ porcentaje (count x xs) n | x <- ['a'..'z'] ] where n = lowers xs 

freqs xs = [porcentaje ( count x xs ) n | x <-  ['a'..'z']]
            where n = lowers xs

--count :: Char -> String - Int

-- chi-square -> mide la similitud de dos listas

-- chisqr :: [Float] -> [Float] -> Float

chisqr os es = sum[(o-e)^2/e | (o,e) <- zip os es]

--rotate :: Int -> [a] -> [a]

rotate n xs = drop n xs ++ take n xs 

--table = freqs "kdvnhoo lv ixq" [chisqr (rotate n table) tabla | n <- [0..25] ] 

posiciones x xs = [i | (x',i) <- zip xs[0..], x'==x]

--crack :: String -> String

crack xs = encode (-factor ) xs where 
    factor = head (posiciones (minimum chitab) chitab) 
    chitab = [chisqr (rotate n table) tabla | n <- [0..25]] 
    table = freqs xs 

-- >crack "kdvnhoo lv ixq"

-- > crack "vscd mywzboroxcsyxc kbo ecopev"

-- > crack (encode 3 "hello world")