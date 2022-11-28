import System.IO (hSetEcho, stdin)



{- getLine :: IO String
getLine = do x <- getChar
             if x == '\n' then
                return []
             else 
                do xs <- getLine
                   return (x:xs) -}

putString :: String -> IO ()
putString [] = return ()
putString (x:xs) = do putChar x
                      putString xs

{- putStrLn :: String -> IO ()
putStrLn xs = do putString xs
                 putChar '\n' -}



strlen :: IO ()
strlen = do putString "Enter a string: "
            xs <- getLine
            putString "The String has "
            putString (show (length xs))
            putStrLn " characters"

{-
>strlen
Enter a String: Haskell
the String has 7 characters
-}

{-
Juego del ahorcado
-}

play :: String -> IO ()
play word = do putStr "?"
               guess <- getLine
               if guess == word then
                  putStrLn "Acertaste"
               else
                do putStrLn (match word guess)
                   play word

match :: String -> String -> String
match xs ys = [if elem x ys then x else '_' | x <- xs]

getCh :: IO Char
getCh = do hSetEcho stdin False
           x <- getChar
           hSetEcho stdin True
           return x 




sgetLine :: IO String
sgetLine = do x <- getCh
              if x == '\n' then
                do putChar x
                   return []
              else
                do putChar '_'
                   xs <- getLine
                   return (x:xs)

hangman :: IO ()
hangman = do putStrLn "Piensa en una palabra: "
             word <- sgetLine
             putStrLn "Trata de adivinarla: "
             play p[---fg-rl]'7