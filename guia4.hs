fibonacci:: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n-1) + fibonacci (n-2)

parteEntera :: Float -> Integer
parteEntera x 
    | x < 1 && x >= 0 = 0
    | x >= 1 = 1 + parteEntera (x-1)
    | x < 0 = -1 + parteEntera (x+1)

-- parteEntera 2.5 = 1 + 1 + 0
-- pE -2.5 = -1 - 1 + pE -0.5

esDivisible :: Float -> Float -> Bool
esDivisible x y
    | x - y  == 0 = True
    | x - y  < 0 = False
    | otherwise = esDivisible (x-y) y

-- eD 4 2 = eD 2 2 = True
-- eD 5 2 = eD 3 2 = eD 1 2 = False

sumaImpares :: Integer -> Integer
sumaImpares n 
    | n == 1 = 1 
    | otherwise = 2*n-1 + sumaImpares (n-1)

medioFact :: Integer -> Integer
medioFact n
    | n <= 0 = 1
    | otherwise = n * medioFact (n-2)

-- ej 6
-- problema sumaDigitos(n: Z) : Z {
--      requiere: {n >= 0}    
--      asegura: {res es la suma de los dígitos de n}    
-- }

sumaDigitos :: Integer -> Integer
sumaDigitos n
    | n == 0 = 0
    | otherwise = mod n 10 + sumaDigitos (div n 10)

-- sumaDigitos 374 = 4 + sumaDigitos 37 = 4 + 7 + sumaDigitos 3 = 4 + 7 + 3 + sumaDigitos 0

-- ej 7

todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n
    | n < 10 = True
    | (mod n 10 == mod (div n 10) 10) = todosDigitosIguales(div n 10)
    | otherwise = False

-- tDI 55 = tDI 5 = True
-- tDI 23 = False
-- tDI 555 = tDI 55 = tDI 5 = True 
-- tDI 10 = False