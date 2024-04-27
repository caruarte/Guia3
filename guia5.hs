-- ej 1
longitud :: [t] -> Integer              -- IMPORTANTE
longitud [] = 0
longitud (x:xs) = 1 + longitud (xs)

ultimo :: [t] -> t
ultimo (x:xs)
    | longitud xs == 0 = x
    | otherwise = ultimo (xs)

principio :: [t] -> [t]
principio (x:xs) 
    | longitud xs == 0 = []
    | otherwise = x:principio xs

-- principio [1,2,3] = 1 : principio [2,3] = 1 : 2 : principio [3] = 1 : 2 : []

reverso :: [t] -> [t]
reverso xs
    | longitud xs == 0 = []
    | otherwise = ultimo xs : reverso (principio xs)

reverso2 :: (Eq t) => [t] -> [t]
reverso2 [] = []
reverso2 (x:xs) = reverso2 xs ++ [x]


-- ej 2

pertenece :: (Eq t) => t -> [t] -> Bool       -- IMPORTANTE
pertenece a [] = False
pertenece a (x:xs)
    | a == x = True
    | otherwise = pertenece a xs

todosIguales :: (Eq t) => [t] -> Bool
todosIguales (x:xs)
    | longitud xs == 0 = True
    | otherwise = pertenece x xs == todosIguales xs

-- todosIguales [1,1] = True == True

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos (x:xs)
    | longitud xs == 0 = True
    | pertenece x xs = False
    | otherwise = todosDistintos xs

hayRepetidos :: (Eq t) => [t] -> Bool      -- IMPORTANTE
hayRepetidos (x:xs)
    | longitud xs == 0 = False
    | pertenece x xs = True
    | otherwise = hayRepetidos xs

quitar :: (Eq t) => t -> [t] -> [t] -- IMPORTANTE
quitar a [] = []
quitar a (x:xs)
    | a == x = xs
    | otherwise = x : quitar a xs

quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos a [] = []
quitarTodos a (x:xs)
    | a == x = quitarTodos a xs
    | otherwise = x : quitarTodos a xs

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x:xs)
    | pertenece x xs = eliminarRepetidos xs
    | otherwise = x : eliminarRepetidos xs

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos [] [] = True
mismosElementos xs ys
    | listaContenida xs ys && listaContenida ys xs = True
    | otherwise = False

listaContenida :: (Eq t) => [t] -> [t] -> Bool
listaContenida [] _ = True
listaContenida (x:xs) ys
    | pertenece x ys = listaContenida xs ys
    | otherwise = False

capicua :: (Eq t) => [t] -> Bool
capicua [] = True
capicua xs = xs == reverso2 xs

-- ej 3

sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

productoria :: [Integer] -> Integer
productoria [] = 1
productoria (x:xs) = x * productoria xs

maximo :: [Integer] -> Integer
maximo (x:xs)
    | xs == [] = x
    | x >= maximo xs = x
    | otherwise = maximo xs

sumarN :: Integer -> [Integer] -> [Integer]
sumarN _ [] = []
sumarN a (x:xs) = (x+a) : sumarN a xs

sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero [] = []
sumarElPrimero (x:xs) = sumarN x (x:xs)

sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo [] = []
sumarElUltimo (x:xs) = sumarN (ultimo (x:xs)) (x:xs)

pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs)
    | mod x 2 == 0 = x : pares xs
    | otherwise = pares xs

multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] = []
multiplosDeN a (x:xs)
    | mod x a == 0 = x : multiplosDeN a xs
    | otherwise = multiplosDeN a xs

ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar (x:xs) = reverso2 (ordenarAux (x:xs))

ordenarAux :: [Integer] -> [Integer]
ordenarAux [] = []
ordenarAux (x:xs) = maximo (x:xs) : ordenarAux (quitar (maximo (x:xs)) (x:xs))

-- ej 4