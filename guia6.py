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