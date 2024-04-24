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
raizDe2Aprox n = (raizDe2 n) - 1

raizDe2 :: Integer -> Float
raizDe2 1 = 2
raizDe2 n = 2 + 1/raizDe2 (n-1)

-- raizDe2Aprox 2 = 2 + 1/ (raizDe2Aprox 1) = 2,5

-- ej 13

g :: Integer -> Integer -> Integer
g n 0 = 0
g n m = n^m + g n (m-1)

f :: Integer -> Integer -> Integer
f n m 
    | n == 0 = 0
    | otherwise = g n m + f (n-1) m

-- 2^1 + 2^2 + 2^3

-- 1^1 + 1^2 + 1^3 + 2^1 + 2^2 + 2^3 = 1+1+1+2+4+8=17

-- 1^1 + 1^2 + 2^1 + 2^2 + 3^1 + 3^2 + 4^1 + 4^2 + 5^1 + 5^2 = 1+1+2+4+3+9+4+16+5+25 = 70 

-- ej 14

sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias q n m
    | n == 1 = sumaPotenciasInterna q 1 m
    | otherwise = sumaPotenciasInterna q n m + sumaPotencias q (n-1) m

sumaPotenciasInterna :: Integer -> Integer -> Integer -> Integer
sumaPotenciasInterna q n m
    | m == 1 = q^(n+1)
    | otherwise = q^(n+m) + sumaPotenciasInterna q n (m-1)

-- sumaPotencias 2 2 3 = sumaPotenciasInterna 2 2 3 + sumaPotenciasInterna 2 1 3 = 2^(2+3) + 2^(2+2) + 2^(2+1) + 2^(1+3) + 2^(1+2) + 2^(1+1)

--ej 15

sumaRacionales :: Integer -> Integer -> Float
sumaRacionales 1 m = sumaRacionalesInterno 1 m
sumaRacionales n m = sumaRacionalesInterno n m + sumaRacionales (n-1) m

sumaRacionalesInterno :: Integer -> Integer -> Float
sumaRacionalesInterno n 1 = (fromIntegral n) / 1
sumaRacionalesInterno n m = (fromIntegral n) / (fromIntegral m) + sumaRacionalesInterno n (m-1)

-- ej 16

menorDivisor :: Integer -> Integer
menorDivisor 1 = 1
menorDivisor n = menorDivisorInterno n 2

menorDivisorInterno :: Integer -> Integer -> Integer
menorDivisorInterno x y
    | mod x y == 0 = y
    | otherwise = menorDivisorInterno x (y+1)

esPrimo :: Integer -> Bool
esPrimo 1 = False
esPrimo n = n == menorDivisor n

sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos 1 _ = True
sonCoprimos _ 1 = True
sonCoprimos n m = menorDivisor n /= menorDivisor m && mod n m /= 0 && mod m n /= 0


nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n = nEsimoPrimoDesde n 1

nEsimoPrimoDesde :: Integer -> Integer -> Integer
nEsimoPrimoDesde n m
    | esPrimo m && n == 1 = m
    | esPrimo m = nEsimoPrimoDesde (n-1) (m+1)
    | otherwise = nEsimoPrimoDesde n (m+1)

-- PRUEBA----------------------------------------------------------------

esIgualaDiez :: Integer -> Bool
esIgualaDiez x
    | multiplicarPorDos x == 10 = True
    | otherwise = False
    where multiplicarPorDos x
            | x == 5 = x*2
            | x == 20 = div x 2
            | otherwise = x


-- ej 17

esFibonacci :: Integer -> Bool
esFibonacci x = compararFibonacci x 0

compararFibonacci :: Integer -> Integer -> Bool
compararFibonacci x y
    | x < (fibonacci y) = False
    | x == (fibonacci y) = True
    | otherwise = compararFibonacci x (y+1)

-- ej 18

mayorDigitoPar :: Integer -> Integer
mayorDigitoPar n
    | cantDigitos n == 1 = n
    | unidad n >= mayorDigitoPar (numeroSinUnidad n) && esPar (unidad n) = unidad n
    | unidad n < mayorDigitoPar (numeroSinUnidad n) && esPar (mayorDigitoPar (numeroSinUnidad n)) = mayorDigitoPar (numeroSinUnidad n)
    | esPar (mayorDigitoPar (numeroSinUnidad n)) = mayorDigitoPar (numeroSinUnidad n)
    | esPar (unidad n) = unidad n
    | otherwise = -1
    where   unidad n = mod n 10
            esPar n = mod n 2 == 0
            numeroSinUnidad n = div n 10


-- mayorDigitoPar 23 = 3 >= 2 && esPar (3)

-- ej 19

esSumaInicialDePrimos :: Int -> Bool
esSumaInicialDePrimos n = sumaPrimos n (fromIntegral (nEsimoPrimo 1)) 1

sumaPrimos :: Int -> Int -> Integer -> Bool
sumaPrimos n m i
    | m > n = False
    | m == n = True
    | otherwise = sumaPrimos n (m + fromIntegral(nEsimoPrimo (i+1))) (i+1)