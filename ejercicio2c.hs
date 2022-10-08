

halve xs = splitAt n xs where n = length xs `div` 2 
-- En vez de usar splitAt n xs: (take n xs , drop n xs ) 

--2. Devolviendo tercer elemento de una lista
--a) head y tail
third xs = head (tail (tail xs))
--a) indización de listas mediante !!
third2 xs = xs !!2

third3 [] = 0
third3 [_,_] = 0
third3 xs =  head (tail (tail xs))
--third3 
--thirdd xs =  reverse (tail(reverse xs))

{- True && True = True
_ && _ = False -}

--Operador OR con patrones
{- False || False = False
False || True = True
True || False = True
True || True = True -}

alternativa a b = if a==True && b==True then True else False 


safetail' xs = if null[xs] then [] else tail xs  

safetail2 xs | null [xs] = []
             | otherwise = tail xs
             






{- safetail (x:xs) = if null[xs] then [] else xs

safetail2 (x:xs) | null[xs] = []
                 | otherwise = xs -}

{- luhnDouble x  | x * 2 > 9 = x * 2 - 9
              | otherwise = x 
 -}

luhnDouble x = if x * 2 < 9 then x * 2 else x * 2 - 9  

luhn w x y z = if (luhnDouble  w + luhnDouble x + luhnDouble y ) `mod` 10 == 0 then True else False 