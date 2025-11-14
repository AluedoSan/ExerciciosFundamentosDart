"""a = [1, 2, 3]
b = {
    "nome": "alek",
    "moradia":{
        "cidade": "Londrina",
        "local": [2222222, "apartamento", "bairro etc"],
        "complemento": "ap 20120" 
    }
}
print(b["nome"])
print(b["moradia"])

class Pessoa:
    def __init__(self, nome, idade):
        self.nome = nome
        self.idade = idade
        self.moradia = {
            "cidade": "",
            "estado": "",
            "pais": "",
            "bairro": ""
        }
    
    def adicionar_moradia(self):
        self.moradia["cidade"] = str(input("Cidade: "))
        self.moradia["estado"] = str(input("Estado: "))
        self.moradia["pais"] = str(input("País: "))
        self.moradia["bairro"] = str(input("Bairro: "))

    def saudacoes(self, a = lambda x, y: (x * y) / 2):
        print(a)




print(">> Faça sua pessoa")
eu = Pessoa("Alexander", 22)
eu.adicionar_moradia()
print(eu.moradia)
eu.saudacoes(a(2, 3))"""

a = int(input("DIGITE AGORA: "))

b = ""

def centena(num):
    mn = num // 100
    
    if mn == 0:
        return
    lista = {
        1: "cento",
        2: "duzentos",
        3: "trezentos",
        4: "quatrocentos",
        5: "quinhentos",
        6: "seiscentos",
        7: "setecentos",
        8: "oitocentos",
        9: "novecentos",
    }
    for x in lista:
        if x == mn:
            return f"{lista[x]}", num % 100


x, y = centena(a)
if x != None:
    b += x + " "
listaTeens = ["dez", "onze", "doze", "treze", "quatorze", "quinze", "dezesseis", "dezessete", "dezoito", "dezenove"]

print(x, y)
def decimais(num):
    mn = num // 10
    if mn == 1:
        return listaTeens[num % 10], None
    lista = {
        2: "vinte",
        3: "trinta",
        4: "quarenta",
        5: "cinquenta",
        6: "sessenta",
        7: "setenta",
        8: "oitenta",
        9: "noventa",
    }
    for x in lista:
        if x == mn:
            return f"{lista[x]}", num % 10

    print(mn)

p, o = decimais(y)
if p != None:
    b += p + " "
print(b)