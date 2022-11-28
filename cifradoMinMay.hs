import Data.Char


-- ->Definir una funcion que convierta 'a',...,'c' -> 0,...,25
-- -> Y convierta 'A',...,'C' -> 0,...,25

let2int :: Char -> Int
let2int c = ord c - ord 'a'

let2int2 :: Char -> Int
let2int2 c = ord c - ord 'A'

--La funcion ord convierte el caracer a una representacion unicode 

-- ->Definir uan funcion qe convierta un entero 0,..,25 -> 'a',...'z' let2int
int2let :: Int-> Char
int2let n = chr(ord 'a' + n)
int2let2 :: Int-> Char
int2let2 n = chr(ord 'A' + n)

--chr convierte de un caracter uncode a un caracter



--isLower :: Char -> Bool
--isLower decide si un caracter es una letra minuscula
--isUpper decide si un caracter es una letra mayuscula
-- ------------------------------------------
shift :: Int -> Char -> Char
shift n c | isLower c = int2let ((let2int c + n)`mod` 26)
          | isUpper c = int2let2 ((let2int2 c + n)`mod` 26)
          | otherwise = c


-- Funcion para codificar y descodificar

encode :: Int -> String -> String
encode n xs = [shift n x|x <- xs] 

--frecuencia

tabla :: [Float]
tabla = [8.1, 1.5, 2.8, 4.2, 12.7, 2.2, 2.0, 6.1, 7.0,
        0.2, 0.8, 4.0, 2.4, 6.7, 7.5, 1.9, 0.1, 6.0, 
        6.3, 9.0, 2.8, 1.0, 2.4, 0.2, 2.0, 0.1]

porcentaje :: Int -> Int -> Float
porcentaje n m = (fromIntegral n / fromIntegral m) * 100

-- fromInegral convierte un entero a un flotante


lowers :: String -> Int
lowers xs =  length [x | x <- xs, x >= 'a' && x<='z']

count :: Char -> String -> Int
count x xs = length [ x' | x' <- xs, x == x']

--freqs xs = [ porcentaje (count x xs) n | x <- ['a'..'z'] ] where n = lowers xs 

freqs :: String -> [Float]
freqs xs = [porcentaje ( count x xs ) n | x <-  ['a'..'z']]
            where n = lowers xs


-- chi-square -> mide la similitud de dos listas

chisqr :: [Float] -> [Float] -> Float
chisqr os es = sum[(o-e)^2/e | (o,e) <- zip os es]

rotate :: Int -> [a] -> [a]
rotate n xs = drop n xs ++ take n xs 

--table = freqs "kdvnhoo lv ixq" [chisqr (rotate n table) tabla | n <- [0..25] ] 

posiciones x xs = [i | (x',i) <- zip xs[0..], x'==x]

crack :: String -> String
crack xs = encode (-factor ) xs where 
    factor = head (posiciones (minimum chitab) chitab) 
    chitab = [chisqr (rotate n table) tabla | n <- [0..25]] 
    table = freqs xs 

-- >crack "kdvnhoo lv ixq"

-- > crack "vscd mywzboroxcsyxc kbo ecopev"

-- > crack (encode 3 "hello world")