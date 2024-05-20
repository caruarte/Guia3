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

def longitudMayorASiete()

print(ordenados([2,3,6,8]))


    

# in no se modifica. al principio y al final tienen que quedar intacto
# out se modifica (no es la salida). No te importa lo que tenes antes. No se trabaja con informacion previa.
# inout se modifica. Si te importa lo que hay antes.

#por referencia: se cambia la lista original
#por valor/copia: es una copia nueva