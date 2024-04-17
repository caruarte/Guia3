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

esDivisible :: Integer -> Integer -> Bool
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

-- ej 8

iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i = mod (div n (10^((cantDigitos n) - i))) 10

-- iesimoDigito 123 3 = 3

cantDigitos :: Integer -> Integer
cantDigitos n
    | n < 10 = 1
    | otherwise = 1 + cantDigitos(div n 10)

-- cD 20 = 1 + cD 2 = 1 + 1 + cD 

-- ej 9

esCapicua :: Integer -> Bool -- ESTA MAL NO ANDA PARA 2034
esCapicua n
    | cantDigitos n == 1 = True
    | cantDigitos n == 2 = iesimoDigito n 1 == iesimoDigito n 2
    | otherwise = (iesimoDigito n 1 == iesimoDigito n (cantDigitos n)) && esCapicua (div (mod n ((iesimoDigito n 1) * 10^((cantDigitos n)-1))) 10)

-- esCapicua 7345 = False && esCapicua (div (mod n ((iesimoDigito n 1) * 10^((cantDigitos n)-1))) 10)
-- esCapicua 2032 = True && esCapicua (div (mod n (2000) 10)

-- ej 10
-- a

f1 :: Integer -> Integer
f1 0 = 1
f1 n = 2^n + f1 (n-1)

-- b 

f2 :: Integer -> Float -> Float
f2 1 q = q^1
f2 n q = q^n + f2 (n-1) q

-- f2 2 3.4 = 3.4^2 + 3.4^1

-- c

f3 :: Integer -> Float -> Float
f3 0 q = 0
f3 n q = q^(n*2) + q^(n*2 - 1) + f3 (n-1) q


-- f3 0 3.4 = 0 (conjunto vacio)
-- f3 1 3.4 = 3.4^1 + 3.4^2
-- f3 2 3.4 = 3.4^4 + 3.4^3 + 3.4^1 + 3.4^2
-- f3 3 3.4 = 3.4^6 + 3.4^5 + 3.4^4 + 3.4^3 + 3.4^1 + 3.4^2

-- d

f4 :: Integer -> Float -> Float
f4 0 q = q^0
f4 n q = q^(n*2) + q^(n*2 - 1) + f4 (n-1) q - q^(n-1)

-- f4 0 3.4 = 3.4 ^ 0 = 1
-- f4 1 3.4 = 3.4^2 + 3.4^1
-- f4 2 3.4 = 3.4^4 + 3.4^3 + 3.4^2
-- f4 3 3.4 = 3.4^6 + 3.4^5 + 3.4^4 + 3.4^3
-- f4 4 3.4 = 3.4^8 + 3.4^7 + 3.4^6 + 3.4^5 + 3.4^4

-- ej 11
-- a
eAprox :: Integer -> Float
eAprox 0 = 1 / fromIntegral (factorial 0)
eAprox n = (1 / fromIntegral (factorial n)) + eAprox (n-1)

factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n-1)

-- b
e :: Float
e = eAprox 9

-- ej 12
raizDe2Aprox :: Integer -> Float
