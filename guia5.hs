import Distribution.Simple.Utils (xargs)
-- ej 1
longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud (xs)

ultimo :: [t] -> t
ultimo xs
    | longitud xs == 1 = head xs
    | otherwise = ultimo (tail xs)

principio :: [t] -> [t]
principio (x:xs) 
    | longitud xs == 0 = []
    | otherwise = x:principio xs

-- principio [1,2,3] = 1 : principio [2,3] = 1 : 2 : principio [3] = 1 : 2 : []

reverso :: [t] -> [t]
reverso xs
    | longitud xs == 0 = []
    | otherwise = ultimo xs : reverso (principio xs)


-- ej 2

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece a (x:xs)
    | a == x = True
    | longitud xs == 0 = False
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
    | otherwise = 
