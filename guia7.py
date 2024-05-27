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



def vocales(s: str) -> bool:
    res:bool = False
    for i in s:


print(movimientos([('I', 2000), ('R', 20),('R', 1000),('I', 300)]))


    

# in no se modifica. al principio y al final tienen que quedar intacto
# out se modifica (no es la salida). No te importa lo que tenes antes. No se trabaja con informacion previa.
# inout se modifica. Si te importa lo que hay antes.

# inout y out son modificables pero no devolvibles
# in no es ni modificable ni devolvible
# in out inout no se retornan!
# out no aparece en el requiere


#por referencia: se cambia la lista original
#por valor/copia: es una copia nueva