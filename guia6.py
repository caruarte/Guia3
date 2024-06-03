from math import *

def imprimir_hola_mundo() -> None:
    print("¡Hola mundo!")

def imprimir_un_verso() -> None:
    print("Hola\nHola")

def raizDe2() -> int:
    return round(sqrt(2), 4)

def factorial_de_dos() -> int:
    print(factorial(2))

def perimetro() -> float:
    return 2*pi

def imprimir_saludo(nombre: str) -> None:
    print("Hola", nombre)

def raiz_cuadrada_de(numero: float) -> float:
    return sqrt(numero)

def fahrenheit_a_celsius(t: float) -> float:
    return ((t-32)*5)/9

def imprimir_dos_veces(estribillo:str) -> None:
    print(estribillo*2)

def es_multiplo_de2(n: int, m: int) -> bool:
    if n == m:
        return True
    elif n < m:
        return False
    else:
        return es_multiplo_de2((n-m), m)

def es_multiplo_de(n: int, m: int) -> bool:
    if n % m == 0:
        return True
    else: 
        return False
    
def es_par(numero: int) -> bool:
    return es_multiplo_de(numero, 2)

def cantidad_de_pizzas(comensales: int, min_cant_de_porciones: int) -> int:
    return ceil((comensales*min_cant_de_porciones)/8)

# ej 3

def alguno_es_0(numero1: float, numero2: float) -> bool:
    return numero1 == 0 or numero2 == 0
    
def ambos_son_0(numero1: float, numero2: float) -> bool:
    return numero1 == 0 and numero2 == 0

def es_nombre_largo(nombre: str) -> bool:
    return len(nombre) >= 3 and len(nombre) <= 8

def es_bisiesto(año: int) -> bool:
    return es_multiplo_de(año, 400) or (es_multiplo_de(año, 4) and (not es_multiplo_de(año, 100)))

# ej 4

def peso_pino(metros: int) -> int:
    peso:int = 0
    for i in range(metros):
        if i >= 3:
            peso += 100 * 2
        else:
            peso += 100 * 3
    return peso

def es_peso_util(peso:int) -> bool:
    res:bool = False
    if peso >= 400 and peso <= 1000:
        res = True
    return res

def sirve_pino(altura:int) -> bool:
    return es_peso_util(peso_pino(altura))

# ej 5

def esPar(numero:int) -> bool:
    res:bool = False
    if numero % 2 == 0:
        res = True
    return res

def devolver_el_doble_si_es_par(numero:int) -> int:
    res:int = numero
    if esPar(numero):
        res *= 2
    return res

def devolver_valor_si_es_par_sino_el_que_sigue(numero:int) -> int:
    res:int = numero
    if not esPar(numero):
        res += 1
    return res

def devolver_el_doble_si_es_multiplo3_el_triple_si_es_multiplo9(numero: int) -> int:
    res:int = numero
    if numero % 9 == 0:
        res *= 3
    elif numero % 3 == 0:
        res *= 2
    return res

def lindo_nombre(nombre:str) -> str:
    res:str = "Tu nombre tiene menos de 5 caracteres"
    if len(nombre) >= 5:
        res = "Tu nombre tiene muchas letras!"
    return res

def elRango(numero:int) -> None:
    if numero < 5:
        print("Menor a 5")
    elif numero >= 10 and numero <= 20:
        print("Entre 10 y 20")
    elif numero > 20:
        print("Mayor a 20")
        
def vacas(sexo:str, edad:int) -> None:
    if (sexo == "F" and edad >= 18 and edad < 60) or (sexo == "M" and edad >= 18 and edad < 65):
        print("Te toca trabajar")
    else:
        print("Anda de vacaciones")

# ej 6

def unoAlDiez() -> None:
    i:int = 1
    while i <= 10:
        print(i)
        i += 1

def paresEntreDiezYCuarenta() -> None:
    i:int = 10
    while i <= 40:
        if esPar(i):
            print(i)
        i += 1

def eco() -> None:
    i:int = 0
    while i < 10:
        print("eco")
        i += 1

def despegue(numero:int) -> None:
    while numero >= 1:
        print(numero)
        numero -= 1
    print("Despegue")

def viaje(partida: int, llegada:int) -> None:
    while partida >= llegada:
        print("Viajó un año al pasado, estamos en el año: {0}".format(str(partida)))
        partida -= 1

def aristoteles(partida: int) -> None:
    while partida >= -394:
        print("Viajó un año al pasado, estamos en el año: {0}".format(str(partida)))
        partida -= 20

# ej 7 no

# ej 9

def rt(x: int, g: int) -> int:
    g = g + 1
    return x + g
g: int = 0
def ro(x: int) -> int:
    global g
    g = g + 1
    return x + g

print(ro(1))
print(ro(1))
print(ro(1))