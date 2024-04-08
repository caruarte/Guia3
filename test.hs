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
    | n > 0 = n
    | n < 0 = -n
    | otherwise = n


maximoabsoluto :: Int -> Int -> Int
maximoabsoluto x y = max (absoluto x) (absoluto y)


maximo3 :: Int -> Int -> Int -> Int
maximo3 x y z  = max (max x y) z


