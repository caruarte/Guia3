import Distribution.Simple.Utils (xargs)
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
