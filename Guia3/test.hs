doubleMe :: Int -> Int
doubleMe x = x + x

f :: Int -> Int
f n | n == 1 = 8
    | n == 4 = 131
    | n == 16 = 16    

g :: Int -> Int
g 8 = 16
g 16 = 4
g 131 = 1

h :: Int -> Int
h n = f (g n)

k :: Int -> Int
k n = g (f n)

absoluto :: Int -> Int
absoluto n 
    | n >= 0 = n
    | otherwise = -n


maximoabsoluto :: Int -> Int -> Int
maximoabsoluto x y  | absoluto x >= absoluto y = absoluto x
                    | otherwise = absoluto y


maximo3 :: Int -> Int -> Int -> Int
maximo3 x y z  
    | x > y && x > z = x
    | y > z = y
    | otherwise = z

algunoEs0 :: Float -> Float -> Bool
algunoEs0 x y = x == 0 || y == 0

ambosSon0 :: Float -> Float -> Bool
ambosSon0 x y = x == y && x == 0

mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y
    | x <= 3 && y <= 3 = True
    | x > 3 && x <= 7 && y <= 7 && y > 3 = True
    | x > 7 && y > 7 = True
    | otherwise = False

sumaDistintos :: Int -> Int -> Int -> Int
sumaDistintos x y z
    | x /= y && x /= z && z /= y = x + y + z
    | x == y && x /= z = z
    | x == z && y /= z = y
    | y == z && y /= x = x
    | x == y && x == z = 0

esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y = mod x y == 0 

digitoUnidades :: Int -> Int
digitoUnidades x = mod x 10

digitoDecenas :: Int -> Int
digitoDecenas x = div (mod x 100) 10 

estanRelacionados :: Int -> Int -> Bool
estanRelacionados a b = mod (a*a) (a*b) == 0

-- ejercicio 4

prodInt :: (Float, Float) -> (Float, Float) -> Float
prodInt (a,b) (c,d) = a*c + b*d

todoMenor :: (Float, Float) -> (Float, Float) -> Bool
todoMenor (a,b) (c,d) = a < c && b < d

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (a,b) (c,d) = sqrt(((c - a)**2) + ((d - b)**2))

sumaTerna :: (Int, Int, Int) -> Int
sumaTerna (a,b,c) = a+b+c

sumarSoloMultiplos :: (Int, Int, Int) -> Int -> Int
sumarSoloMultiplos (a,b,c) d
    | mod a d == 0 && mod b d == 0 && mod c d == 0 = a+b+c
    | mod a d == 0 && mod b d == 0 && mod c d /= 0 = a+b
    | mod a d == 0 && mod b d /= 0 && mod c d == 0 = a+c
    | mod a d /= 0 && mod b d == 0 && mod c d == 0 = b+c
    | mod a d == 0 = a
    | mod b d == 0 = b
    | mod c d == 0 = c
    | otherwise = 0

posPrimerPar :: (Int, Int, Int) -> Int
posPrimerPar (x, y, z)
    | mod x 2 == 0 = 1
    | mod y 2 == 0 = 2
    | mod z 2 == 0 = 3
    | otherwise = 4

crearPar :: a -> b -> (a,b)
crearPar x y = (x, y)

invertir :: (a,b) -> (b, a)
invertir (x,y) = (y,x)

-- ej 5

todosMenores :: (Int, Int, Int) -> Bool
todosMenores (x, y, z) = b x > c x && b y > c y && b z > c z

b :: Int -> Int
b x | x <= 7 = x^2
    | otherwise = 2*x-1

c :: Int -> Int
c x | mod x 2 == 0 = div x 2
    | otherwise = 3*x+1

-- ej 6

bisiesto :: Int -> Bool
bisiesto x = mod x 4 == 0 && (mod x 100 /= 0 || mod x 400 == 0)

-- ej 7

distanciaManhattan :: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (x, y, z) (a, b, c) = abs (x-a) + abs (y-b) + abs (z-c)

--ej 8

comparar :: Int -> Int -> Int
comparar x y 
    | sumaUltimosDosDigitos(x) < sumaUltimosDosDigitos(y) = 1
    | sumaUltimosDosDigitos(x) > sumaUltimosDosDigitos(y) = -1
    | otherwise = 0

sumaUltimosDosDigitos :: Int -> Int
sumaUltimosDosDigitos x = mod (abs x) 10 + mod (div (abs x) 10) 10

-- TEORICA PARO - apuntes

-- f5 :: (Num t1, Eq t1, Ord t2, Eq t2) => t1 -> t1 -> t2 -> t2
-- f5 x y z 
--     | x == y = z
--     | x ** y == y = z
--     | otherwise = z

angulo0 :: (Float , Float) -> Bool
angulo0 (_,0) = True
angulo0 (_,_) = False

-- (*+) :: (Num a) => a -> a -> abs

suma :: Int -> Int -> Int
suma x y = x+y

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)