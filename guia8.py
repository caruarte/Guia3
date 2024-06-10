# archivo = secuencia de caracteres
# <'H', 'o','l','a'>

# abrir -> archivo = open("archivo.txt")
# leer/escribir -> contenido = archivo.read()
# cerrar -> archivo.close()

from queue import LifoQueue as Pila
from queue import Queue as Cola
from random import *

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
    archivo = open(nombre_archivo_notas, "r")
    archivoPromedio = open(nombre_archivo_promedios, "w")
    contenido:list[str] = archivo.readlines()
    contenidoSeparado:list[list[str]] = separarCSV(contenido, [","])
    estudiantes:list[int] = []
    archivoPromedio.write("lu,promedio\n")
    cantAlumnos:int = 0
    for i in range(1, len(contenidoSeparado), 1):
        if not (int(contenidoSeparado[i][0]) in estudiantes):
            cantAlumnos += 1
            estudiantes.append(int(contenidoSeparado[i][0]))

    for i in range(len(estudiantes)):
        promedio = str(promedio_estudiante(nombre_archivo_notas, str(estudiantes[i])))
        archivoPromedio.write(str(estudiantes[i]) + "," + promedio)
        if i != (len(estudiantes) - 1):
            archivoPromedio.write("\n")
            
    archivo.close()
    archivoPromedio.close()
    


def separarCSV(contenido:list[str], caracteres:list[str]) -> list[list[str]]:
    contenidoSeparado:list[list[str]] = []
    palabra:str = ""
    for i in range(len(contenido)):
        contenidoSeparado.append([])
        for j in range(len(contenido[i])):
            if contenido[i][j] in caracteres:
                contenidoSeparado[i].append(palabra)
                palabra = ""
            else:
                palabra += contenido[i][j]
        contenidoSeparado[i].append(palabra)
        palabra = ""
    return contenidoSeparado
            


def promedio_estudiante(nombre_archivo:str, lu:str) -> float:
    promedio:float = 0
    sumaNotas:float = 0
    cantidadDeNotas:int = 0
    archivo = open(nombre_archivo, "r")
    contenido = archivo.readlines()
    contenidoSeparado = separarCSV(contenido, [","])
    for i in range(len(contenidoSeparado)):
        if contenidoSeparado[i][0] == lu:
            sumaNotas += float(contenidoSeparado[i][3])
            cantidadDeNotas += 1
    if cantidadDeNotas > 0:
        promedio = sumaNotas / cantidadDeNotas
    archivo.close()
    return promedio

#calcular_promedio_por_estudiante("archivo.csv", "promedios.csv")

# ej 8
def generar_nros_al_azar(cantidad:int, desde:int, hasta:int) -> Pila[int]:
    p = Pila()
    for i in range(cantidad):
        p.put(randint(desde, hasta))
    return p

#print(generar_nros_al_azar(3, 1, 100).queue)

# ej 9
def cantidad_elementos(p:Pila) -> int:
    res:int = 0
    lista:list = []
    while not p.empty():
        res += 1
        lista.append(p.get())
    for i in range(res-1, -1, -1):
        p.put(lista[i])
    return res

#print(cantidad_elementos(generar_nros_al_azar(5, 1, 10)))

# ej 10

def buscar_el_maximo(p: Pila[int]) -> int:
    res:int = 0
    lista:list[int] = []
    if not p.empty():
        res:int = p.get()
        lista.append(res)
    while not p.empty():
        elem = p.get()
        lista.append(elem)
        if elem > res:
            res = elem
    for i in range(len(lista)-1, -1, -1):
        p.put(lista[i])
    return res

# pila = generar_nros_al_azar(5, 1, 10)
# print(buscar_el_maximo(pila))

# ej 11

def esta_bien_balanceada(s:str) -> bool:
    res:bool = True
    p:Pila[int] = Pila()
    for i in s:
        if i == "(":
            p.put("(")
        elif i == ")":
            if p.empty():
                res = False
            else:
                p.get()
    return res

# print(esta_bien_balanceada("1 + ( 2 x 3 = ( 2 0 / 5 ) )"))
# print(esta_bien_balanceada("10 * ( 1 + ( 2 * ( =1)))"))
# print(esta_bien_balanceada("1 + ) 2 x 3 ( ( )"))

# ej 12

def separarConEspacios(s:str) -> str:
    res:str = ""
    for i in s:
        if i != " ":
            res += i
    return res


def evaluar_expresion(s:str) -> float:
    p:Pila[float] = Pila()
    operadores:list[str] = ["+", "-", "*", "/"]
    for i in separarConEspacios(s):
        if i in operadores:
            segundoElemento:float = p.get()
            primerElemento:float = p.get()
            if i == "+":
                p.put(primerElemento + segundoElemento)
            elif i == "-":
                p.put(primerElemento - segundoElemento)
            elif i == "*":
                p.put(primerElemento * segundoElemento)
            elif i == "/":
                p.put(primerElemento / segundoElemento)
        else:
            p.put(float(i))
    return p.get()

# print(evaluar_expresion("3 4 + 5 * 2 -"))

# ej 13

def generar_nros_al_azar2(cantidad:int, desde:int, hasta:int) -> Cola[int]:
    res:Cola[int] = Cola()
    for i in range(cantidad):
        res.put(randint(desde, hasta))
    return res

# cola = generar_nros_al_azar2(1, 1, 10)
# print(list(cola.queue))

# ej 14

def cantidad_elementos2(c: Cola) -> int:
    res:int = 0
    lista:list = []
    while not c.empty():
        res += 1
        lista.append(c.get())
    for i in lista:
        c.put(i)
    return res

# cola = generar_nros_al_azar2(5, 1, 10)
# print(cantidad_elementos2(cola))

# ej 15

def buscar_el_maximo2(c: Cola[int]) -> int:
    res:int = 0
    lista:list[int] = []
    if not c.empty():
        res = c.get()
        lista.append(res)
    while not c.empty():
        elem:int = c.get()
        lista.append(elem)
        if elem > res:
            res = elem
    for i in lista:
        c.put(i)
    return res

# cola = generar_nros_al_azar2(5, 1, 10)
# print(buscar_el_maximo2(cola))

# ej 16

def armar_secuencia_de_bingo() -> Cola[int]:
    res:Cola[int] = Cola()
    bingo:list[int] = []
    for i in range(100):
        bingo.append(i)
    for i in range(100):
        numero:int = choice(bingo)
        copia:list[int] = bingo.copy()
        for j in range(len(copia)):
            if copia[j] == numero:
                bingo.pop(j)
        res.put(numero)
    return res

def jugar_carton_de_bingo(carton:list[int], bolillero:Cola[int]) -> int:
    jugadas:int = 0
    res:int = 0
    faltan:int = 12
    terminado:bool = False
    lista:list[int] = []
    while not bolillero.empty():
        bola:int = bolillero.get()
        lista.append(bola)
        for i in carton:
            if i == bola:
                faltan -= 1
        jugadas += 1
        if faltan == 0 and terminado == False:
            res = jugadas
            terminado = True
    for i in lista:
        bolillero.put(i)
    return res

# secuencia = armar_secuencia_de_bingo()
# print(jugar_carton_de_bingo([0,1,2,3,4,5,6,7,8,9,10,11], secuencia))

# ej 17

def n_pacientes_urgentes(c: Cola[(int, str, str)]) -> int:
    res:int = 0
    lista:list[(int, str, str)] = []
    while not c.empty():
        paciente:tuple[int, str, str] = c.get()
        lista.append(paciente)
        if paciente[0] in [1,2,3]:
            res += 1
    for i in lista:
        c.put(i)
    return res

# c = Cola()
# c.put((5, "a", "j"))
# c.put((1, "a", "j"))
# c.put((8, "a", "j"))
# c.put((3, "a", "j"))
# print(n_pacientes_urgentes(c))

# ej 18

def atencion_a_clientes(c:Cola[(str,int,bool,bool)]) -> Cola[(str,int,bool,bool)]:
    prioridad:Cola[(str,int,bool,bool)] = Cola()
    preferencial:Cola[(str,int,bool,bool)] = Cola()
    otros:Cola[(str,int,bool,bool)] = Cola()
    lista:list[(str,int,bool,bool)] = []
    res:Cola[(str,int,bool,bool)] = Cola()
    while not c.empty():
        cliente:tuple[str,int,bool,bool] = c.get()
        lista.append(cliente)
        if cliente[3]:
            prioridad.put(cliente)
        elif cliente[2]:
            preferencial.put(cliente)
        else:
            otros.put(cliente)
    while not prioridad.empty():
        res.put(prioridad.get()) 
    while not preferencial.empty():
        res.put(preferencial.get()) 
    while not otros.empty():
        res.put(otros.get()) 
    for i in lista:
        c.put(i)
    return res

# c = Cola()
# c.put(("cesar", 12, False, False))
# c.put(("juan", 12, True, False))
# c.put(("lucas", 12, False, True))
# c.put(("sanin", 12, False, False))
# c.put(("pablo", 12, True, True))
# c.put(("sofi", 12, True, False))

# print(atencion_a_clientes(c).queue)


# ej 19, 20, 21 no

# ej 22

historiales:dict[str, Pila[str]] = {}

def visitar_sitio(historiales:dict[str, Pila[str]], usuario:str, sitio:str):
    if not (usuario in historiales):
        historiales[usuario]:Pila[str] = Pila()
    historiales[usuario].put(sitio) 

def navegar_atras(historiales:dict[str, Pila[str]], usuario:str):
    historiales[usuario].get()


# for i, k in historiales.items():
#     print(i,k.queue)
# visitar_sitio(historiales, "Usuario1", "google.com")
# visitar_sitio(historiales, "Usuario1", "facebook.com")
# navegar_atras(historiales, "Usuario1")
# visitar_sitio(historiales, "Usuario2", "youtube.com")
# for i, k in historiales.items():
#     print(i,k.queue)

# ej 23

inventario:dict = {}
def agregar_producto(inventario, nombre, precio, cantidad) -> None:
    inventario[nombre] = {"precio": precio, "cantidad": cantidad}

def actualizar_stock(inventario, nombre, cantidad) -> None:
    inventario[nombre]["cantidad"] = cantidad

def actualizar_precios(inventario, nombre, precio) -> None:
    inventario[nombre]["precio"] = precio

def calcular_valor_inventario(inventario) -> float:
    res:float = 0
    for i in inventario:
        res += inventario[i]["precio"] * inventario[i]["cantidad"]
    return res

agregar_producto(inventario, "Camisa", 20.0, 50)
agregar_producto(inventario, "Pantal´on", 30.0, 30)
actualizar_stock(inventario, "Camisa", 10)
valor_total = calcular_valor_inventario(inventario)
print("Valor total del inventario:", valor_total)







# ACORDARME DE TIPAR
# ACORDARME DE LOS IN OUT E INOUT

# HACER UN DICCIONARIO
#d:dict[str, int] = {}

# es necesario close: SI
# se puede usar "in": NO, solamente cuando es in range
# comas, espacios, puntos y comas