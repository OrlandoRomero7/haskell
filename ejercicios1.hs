--1. Correccion de errores sintacticos. 
n = a `div` length xs 
    where 
        a = 10 
        xs = [1,2,3,4,5]
        
--2. Alternativa de función last(función que selecciona el último elemento de la lista).

seleccionaUltimo xs = head (reverse xs)

--3. Alternativa de función init(función que elimina el último elemento de la lista).

eliminaUltimo xs = reverse (tail (reverse xs) )

eliminaUltimo2 xs = take (length xs -1) xs






