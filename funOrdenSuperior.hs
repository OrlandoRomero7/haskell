import Data.Char

type Bit = Int

bin2int :: [Bit] -> Int
bin2int bits = sum [w*b | (w,b) <- zip weights bits]
                where weights = iterate (*2) 1
{-
> bin2int [1,0,1,1]
13
-}

--bin2int = foldr (\x y -> x + 2*y) 0
int2bin :: Int -> [Bit]
int2bin 0 = []
int2bin n = n `mod` 2 : int2bin (n `div` 2)

{-
> int2bin 13
[1,0,1,1]
-}

make8 :: [Bit] -> [Bit]
make8 bits = take 8 (bits ++ repeat 0)



{-
> make 8 [1,0,1,1]
[1,0,1,1,0,0,0,0]
-}

{-
Se le agregar la funcion agregarParidad, convirtiendo cada uno de dichos 
números en un octeto con su paridad y concatenando los octetos con paridad
para obtener una lista de bits.
-}
encode :: String -> [Bit]
encode = concat . map (agregaParidad . make8 . int2bin . ord)

{-
> encode "abc"
[1,0,0,0,0,1,1,0,0,1,0,0,0,1,1,0,1,1,0,0,0,1,1,0]
-}

{- chop8 :: [Bit] -> [[Bit]]
chop8 [] = []
chop8 bits = take 8 bits : chop8 (drop 8 bits) -}

{-
es la cadena correspondiente a la lista de bits con paridad. Para ello, en cada número binario de 9 cifras debe
comprobarse que la paridad es correcta, en cuyo caso se descarta el bit de paridad. En caso contrario, 
debe generarse un mensaje de error en la paridad.
-}
decode :: [Bit] -> String
decode = map (chr . bin2int . comprobarParidad) . chop9

{-
> decode [1,0,0,0,0,1,1,0,0,1,0,0,0,1,1,0,1,1,0,0,0,1,1,0]
"abc"
-}

--transmit :: String -> String
transmit :: ([Bit] -> [Bit]) -> String -> String
transmit channel = decode . channel . encode

channel :: [Bit] -> [Bit]
channel = id

{-
Por ejemplo:
> transmit "las funciones de orden superior son sencillas"
-}
----------------------------------------------------

--2. Ejercicios

{-
paridad bs,  suma la cantidad de 1 y 0 de la lista, regresara 1 si bs
contiene un número impar de unos y 0 en caso contrario.
-}

paridad :: [Bit] -> Bit
paridad bs | odd (sum bs)  = 1
           | otherwise     = 0

{-
agregarParidad bs, es la lista obtenida añadiendo al principio de bs su paridad.
-}
agregaParidad :: [Bit] -> [Bit]
agregaParidad bs = (paridad bs) : bs

{-
separa9 bs, es la lista obtenida separando la lista de bits bs en listas de 9 elementos. 
Es lo mimo que chop8, pero ahora con 9 elemtnos.
-}

chop9 :: [Bit] -> [[Bit]]
chop9 []   = []
chop9 bits = take 9 bits : chop9 (drop 9 bits)

{-
compruebaParidad bs, es el resto de bs si el primer elemento
de bs es el bit de paridad del resto de bs y devuelve error de
paridad en caso contrario.
-}

comprobarParidad :: [Bit] -> [Bit]
comprobarParidad (b:bs) | b == paridad bs = bs
                        | otherwise = error "paridad erronea"


{-






descodifica = map (chr . bin2int . compruebaParidad) . separa9 -}
 