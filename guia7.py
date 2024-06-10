import numpy as np

def pertenece(s: list [int], e: int) -> bool:
    i: int = 0
    while i < len(s):
        if s[i] == e:
            return True
        i += 1
    return False

def divide_a_todos(s: list[int], e: int) -> bool:
    i: int = 0
    while i < len(s):
        if s[i] % e != 0:
            return False
        i += 1
    return True

def suma_total(s: list[int]) -> int:
    acum: int = 0
    i: int = 0
    while i < len(s):
        acum += s[i]
        i += 1
    return acum

def ordenados(s: list[int]) -> bool:
    i: int = 0
    while i < len(s) - 1:
        if s[i] >= s[i+1]:
            return False
        i += 1
    return True

def longitudMayorASiete(s: list[int]) -> bool:
    for i in range(len(s)):
        if len(s[i]) > 7:
            return True
    return False

def palindromo(s: str) -> bool:
    i:int = 0
    res:bool = True
    while i < (len(s)/2):
        if s[i] != s[len(s)-1-i]:
            res = False
        i += 1
    return res

def fortaleza(s: str) -> str:
    res:str = "AMARILLA"
    if len(s) > 8 and hayMinuscula(s) and hayMayuscula(s) and hayNumero(s):
        res = "VERDE"
    elif len(s) < 5:
        res = "ROJA"
    return res

def hayMinuscula (s:str) -> bool:
    res:bool = False
    for i in range(len(s)):
        if ord(s[i]) >= 97 and ord(s[i]) <= 122:
            res = True
    return res

def hayMayuscula (s:str) -> bool:
    res:bool = False
    for i in range(len(s)):
        if ord(s[i]) >= 65 and ord(s[i]) <= 90:
            res = True
    return res

def hayNumero (s:str) -> bool:
    res:bool = False
    for i in range(len(s)):
        if ord(s[i]) >= 48 and ord(s[i]) <= 57:
            res = True
    return res


def movimientos (s: list[(tuple[str, float])]) -> float:
    res:float = 0
    for (x,y) in s:
        if x == 'I':
            res += y
        else:
            res-= y
    return res


def pertenece(e: str, s: list[str]) -> bool:
    res:bool = False
    for i in s:
        if i == e:
            res = True
    return res

def vocales(s: str) -> bool:
    res:bool = False
    vocales:list[str] = []
    for i in s:
        if pertenece(i, ["a", "e", "i", "o", "u"]) and not pertenece(i, vocales):
            vocales.append(i)
    if len(vocales) >= 3:
        res = True
    return res

# Ejercicio 2

lista = [1,2,3,4,5]

def borrarPares(s: list[int]) -> None: # inout
    for i in range(len(s)):
        if i % 2 == 0:
            s[i] = 0

def borrarPares2(s: list[int]) -> list[int]: # in
    lista:list[int] = s.copy()
    for i in range(len(lista)):
        if i % 2 == 0:
            lista[i] = 0
    return lista

borrarPares2(lista)
print(lista)

def sinVocales(s: str) -> str:
    res:str = ""
    for i in s:
        if not pertenece(i, ["a", "e", "i", "o", "u"]):
            res += i
    return res

def reemplaza_vocales(s: str) -> str:
    res:str = ""
    for i in s:
        if pertenece(i, ["a", "e", "i", "o", "u"]):
            res += "_"
        else:
            res += i
    return res

def da_vuelta_str(s: str) -> str:
    res:str = ""
    for i in range(len(s)):
        res += s[len(s) - i - 1]
    return res

def eliminar_repetidos(s:str) -> str:
    res:str = ""
    letras = []
    for i in s:
        if not pertenece(i, letras):
            res += i
            letras.append(i)
    return res

# ejercicio 3

def aprobado(notas: list[int]) -> int:
    res:int = 3
    if mayorACuatro(notas) and promedio(notas) >= 7:
        res = 1
    elif mayorACuatro(notas) and promedio(notas) >= 4:
        res = 2
    else:
        res = 3
    return res

def mayorACuatro(notas: list[int]) -> bool:
    res = True
    for i in notas:
        if i < 4:
            res = False
    return res

def promedio(notas: list[int]) -> float:
    suma:int = 0
    for i in notas:
        suma += i
    return (suma/len(notas))

# ejercicio 4

def estudiantes() -> list[str]:
    termina:bool = False
    listaEstudiantes: list[str] = []
    while not termina:
        estudiante:str = input("Ingrese los nombres:")
        if estudiante == "listo":
            termina = True
        else:
            listaEstudiantes.append(estudiante)
    return listaEstudiantes

def monedero() -> list[tuple[str, float]]:
    termina:bool = False
    movimientos:list[tuple[str, float]] = []
    while not termina:
        opcion:str = input("Elegir opcion: ")
        if opcion == "C":
            monto:str = float(input("Monto a cargar: "))
            movimientos += [("C", monto)]
        elif opcion == "D":
            monto:str = float(input("Monto a descontar: "))
            movimientos += [("D", monto)]
        elif opcion == "X":
            termina = True
        else:
            print("Opcion invalida")
    return movimientos

# random.randint(desdenumeroinclusive, hasta numero inclusive)
# random.choice(lista)

# ejercicio 5

def pertenece_a_cada_uno_version_2(s: list[list[int]], e: int, res: list[bool]) -> None:
    lista:list[bool] = res
    for i in lista.copy():
        lista.remove(i)
    for i in range(len(s)):
        if pertenece(e, s[i]):
            lista.append(True)
        else:
            lista.append(False)

#booleanos = [False, False, False, False]
#pertenece_a_cada_uno_version_2([[1,2,3,4],[1,2,6,8],[1,8,5,0]], 1, booleanos)
#print(booleanos)


def es_matriz(s: list[list[int]]) -> bool:
    res:bool = False
    if len(s) > 0 and len(s[0]) > 0 and chequearMatriz(s):
        res = True
    return res

def chequearMatriz(s: list[list[int]]) -> bool:
    res:bool = True
    for i in s:
        if len(i) != len(s[0]):
            res= False
    return res

def filas_ordenadas(m: list[list[int]], res: list[bool]) -> None:
    for i in res.copy():
        res.remove(i)
    for i in m:
        if ordenados(i):
            res.append(True)
        else:
            res.append(False)


def potenciaMatriz(d: int, p: int) -> list[list[int]]:
    m = np.random.randint(0, 10, (d,d))
    res = []
    for i in range(d):
        res.append([])
        for j in range(d):
            res[i].append(sumatoriaMatriz(m, d, i, j))
    return res

def sumatoriaMatriz(m: list[list[int]], d:int, i:int, j:int) -> int:
    res: int = 0
    for k in range(d):
        res += (m[i][k]*m[k][j])
    return res

# print(potenciaMatriz(3,5))



# in no se modifica. al principio y al final tienen que quedar intacto
# out se modifica (no es la salida). No te importa lo que tenes antes. No se trabaja con informacion previa.
# inout se modifica. Si te importa lo que hay antes.

# las listas se pasan por referencia por default
# los int string y tipos simples se pasan por valor

# inout y out son modificables pero no devolvibles
# in no es ni modificable ni devolvible
# in out inout no se retornan!
# out no aparece en el requiere


#por referencia: listas y diccionarios - se cambia la lista original
#por valor/copia: str, int, tuple, float - es una copia nueva