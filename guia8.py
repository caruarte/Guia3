# archivo = secuencia de caracteres
# <'H', 'o','l','a'>

# abrir -> archivo = open("archivo.txt")
# leer/escribir -> contenido = archivo.read()
# cerrar -> archivo.close()

# ej 1

def contar_lineas(nombre_archivo:str) -> int:
    archivo = open(nombre_archivo)
    contenido = archivo.read()
    res:int = 1
    for i in contenido:
        if i == "\n":
            res += 1
    archivo.close()
    return res

#print(contar_lineas("texto.txt"))

def dividirEnPalabras(archivo: str) -> list[str]:
    res = []
    palabra = ""
    for i in range(len(archivo)):
        if archivo[i] == " " or archivo[i] == "\n" or archivo[i] == "." or archivo[i] == "," or archivo[i] == ";" or archivo[i] == ":":
            res.append(palabra)
            palabra = ""
        else:
            palabra += archivo[i]
        if i == len(archivo) - 1:
            res.append(palabra)
    return res


def pertenece(e: str, lista:list[str]) -> bool:
    res:bool = False
    for i in lista:
        if i == e:
            res = True
    return res


def existe_palabra(palabra:str, nombre_archivo: str) -> bool:
    archivo = open(nombre_archivo)
    contenido = archivo.read()
    res:bool = False
    if pertenece(palabra, dividirEnPalabras(contenido)):
        res = True
    archivo.close()
    return res

# print(existe_palabra("hola", "texto.txt"))

def cantidad_apariciones(nombre_archivo: str, palabra:str) -> int:
    archivo = open(nombre_archivo)
    contenido = archivo.read()
    res:int = 0
    for i in dividirEnPalabras(contenido):
        if i == palabra:
            res += 1
    archivo.close()
    return res

# ejercicio 2

def clonar_sin_comentarios(nombre_archivo:str) -> None:
    archivo = open(nombre_archivo, "r")
    archivo2 = open("archivo_sin_comentarios.txt", "w")
    contenido = archivo.readlines() # el contenido del texto en una lista donde cada elemento es una linea
    for i in range(len(contenido)):
        if not esComentario(contenido[i]):
            archivo2.write(contenido[i])
    archivo.close()
    archivo2.close()

def esComentario(linea: str) -> bool:
    res:bool = False
    for i in range(len(linea)):
        if linea[i] == "#":
            return True
        elif linea[i] != " ":
            return False

# clonar_sin_comentarios("texto.txt")

# EJ 3
def invertir_lineas(nombre_archivo:str) -> None:
    archivo = open(nombre_archivo, "r")
    archivo2 = open("reverso.txt", "w")
    contenido = archivo.readlines() # el contenido del texto en una lista donde cada elemento es una linea
    for i in range(len(contenido) - 1, -1 , -1):
        archivo2.write(sacarSalto(contenido[i]))
        if i != 0:
            archivo2.write("\n")
    archivo.close()
    archivo2.close()

def sacarSalto(linea:str) -> str:
    res:str = ""
    for i in range(len(linea)):
        if linea[i] != "\n":
            res += linea[i]
    return res

# ej 4

def agregar_frase_al_final(nombre_archivo: str, frase: str) -> None:
    archivo = open(nombre_archivo, "a")
    archivo.write(frase)
    archivo.close()

# agregar_frase_al_final("texto.txt", "\nCesar")

# ej 5

def agregar_frase_al_principio(nombre_archivo: str, frase: str) -> None:
    archivo = open(nombre_archivo, "r+")
    contenido = archivo.readlines()
    archivo.close()
    archivo = open(nombre_archivo, "w")
    archivo.write(frase + "\n")
    archivo.writelines(contenido)
    archivo.close()

# agregar_frase_al_principio("texto.txt", "sadsxc")

# ej 6

def listar_palabras_de_archivo(nombre_archivo:str) -> list:
    archivo = open(nombre_archivo, "rb")
    contenido = archivo.read()
    palabrasLegibles:list[str] = []
    palabra:str = ""
    for i in contenido:
        if chr(i) == " " or chr(i) == "_"  or (chr(i) >= "A" and chr(i) <= "Z") or (chr(i) >= "a" and chr(i) <= "z"): 
            palabra += chr(i)
        else:
            palabra = ""
        if len(palabra) >= 5:
            palabrasLegibles.append(palabra)
            palabra = ""
    return palabrasLegibles


#print(listar_palabras_de_archivo("texto.txt"))

# ej 7

def calcular_promedio_por_estudiante(nombre_archivo_notas:str, nombre_archivo_promedios:str) -> None:

def promedio_estudiante(nombre_archivo:str, lu:str) -> float:
    


# HACER UN DICCIONARIO
#d:dict[str, int] = {}

# es necesario close: SI
# se puede usar "in": NO, solamente cuando es in range
# comas, espacios, puntos y comas