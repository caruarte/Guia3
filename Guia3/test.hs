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
estanRelacionados a b = a*a + a*b*k == 0 && k /= 0