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

reverso2 :: (Eq t) => [t] -> [t] -- IMPORTANTE
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

sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos (x:xs)
    | xs == [] = [x]
    | x == head xs && x == ' ' = sacarBlancosRepetidos xs
    | otherwise = x : sacarBlancosRepetidos xs

contarPalabras :: [Char] -> Integer
contarPalabras [] = 0
contarPalabras (x:xs)
    | xs == [] = 1
    | x == ' ' = 1 + contarPalabras xs
    | otherwise = contarPalabras xs

palabras :: [Char] -> [[Char]]
palabras xs = palabrasAux xs []

palabrasAux :: [Char] -> [Char] -> [[Char]]
palabrasAux [] actual = [actual]                -- IMPORTANTE PUEDE HABER FUNCION AUXILIAR VACIA QUE FUNCIONE COMO VARIABLE
palabrasAux (x:xs) actual | x /= ' ' = (palabrasAux xs (actual ++ [x]))
                          | x == ' ' = [actual] ++ (palabrasAux xs []) 

palabraMasLarga :: [Char] -> [Char]
palabraMasLarga [] = []
palabraMasLarga xs = chequearMasLarga (palabras xs)

chequearMasLarga :: [[Char]] -> [Char]
chequearMasLarga [] = []
chequearMasLarga (x:xs)
    | longitud x > longitud (chequearMasLarga xs) = x
    | otherwise = chequearMasLarga xs

aplanar :: [[Char]] -> [Char]
aplanar [] = []                       
aplanar (x:xs) = x ++ aplanar xs

aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = []
aplanarConBlancos [x] = x                  -- IMPORTANTE PUEDE HABER CASO DE LISTA DE UN ELEMENTO
aplanarConBlancos (x:xs) = x ++ " " ++ aplanarConBlancos xs


aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos [] _ = []
aplanarConNBlancos [x] _ = x                  -- IMPORTANTE PUEDE HABER CASO DE LISTA DE UN ELEMENTO
aplanarConNBlancos (x:xs) a = x ++ blancos a ++ aplanarConNBlancos xs a

blancos :: Integer -> [Char]
blancos 0 = ""
blancos n = " " ++ blancos (n-1)

type Texto = [Char]

blancos2 :: Integer -> Texto
blancos2 0 = ""
blancos2 n = " " ++ blancos2 (n-1)


--ej 5

sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada xs = sumaAcumuladaAux xs []

sumaAcumuladaAux :: (Num t) => [t] -> [t] -> [t]
sumaAcumuladaAux [] _ = []
sumaAcumuladaAux (x:xs) numeros
    | otherwise = (x + sumatoriaReal numeros) : sumaAcumuladaAux xs (x:numeros)

sumatoriaReal :: (Num t) => [t] -> t
sumatoriaReal [] = 0
sumatoriaReal (x:xs) = x + sumatoriaReal xs



descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs) = factorizar x 1 : descomponerEnPrimos xs

factorizar :: Integer -> Integer -> [Integer]
factorizar 1 _= []
factorizar n m
    | mod n (nEsimoPrimo m) == 0 = nEsimoPrimo m : factorizar (div n (nEsimoPrimo m)) 1
    | otherwise = factorizar n (m+1)




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

nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n = nEsimoPrimoDesde n 1

nEsimoPrimoDesde :: Integer -> Integer -> Integer
nEsimoPrimoDesde n m
    | esPrimo m && n == 1 = m
    | esPrimo m = nEsimoPrimoDesde (n-1) (m+1)
    | otherwise = nEsimoPrimoDesde n (m+1)
