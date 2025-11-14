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

"""a = int(input("DIGITE AGORA: "))

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
print(b)"""

"""funcionarios = [[1, 3200, 5], [2, 1500, 2], [3, 4000, 10], [4, 2800, 3], [5, 5000, 8]]
relatorio_mais = ""
relatorio_menos = ""
relatorio_neutro = 0
valor = 2000
count = 0
codigo_menor_salario = []
menor_salario = funcionarios[0][1]
for funcionario in funcionarios:
    if funcionario[1] > valor:
        relatorio_mais += f"Funcionário {funcionario[0]} recebe {funcionario[1]}\n"
    elif funcionario[1] <= valor:
        relatorio_menos += f"Funcionário {funcionario[0]} recebe {funcionario[1]} e está abaixo do valor base\n"
        if count == 0:
            codigo_menor_salario.append(funcionario[0])
            menor_salario = funcionario[1]
        else:
            if funcionario[1] < menor_salario:
                codigo_menor_salario.append(funcionario[0])
                menor_salario = funcionario[1]

            elif funcionario[1] == menor_salario:
                codigo_menor_salario.append(funcionario[0])
    else:
        relatorio_neutro += 1
    count += 1

if relatorio_neutro == 5:
    relatorio_neutro = "Nenhum funcionário está na faixa solicitada."
else:
    print("Relatórios gerados com sucesso.")
print("Funcionários que recebem acima do valor base:")
print(relatorio_mais)
print("Funcionários que recebem abaixo do valor base:")
print(relatorio_menos)

print(f"Funcionário(s) com menor salário: {codigo_menor_salario} com o valor de {menor_salario}")"""


vetor = []

while True:
    n = int(input("Escolha um das opções abaixo: \n1 - Adicionar número ao vetor\n2 - Mostrar vetor\n3 - Consultar UM número do vetor\n4 - Excluir um número do vetor\n5 - Sair\n"))
    match n:
        case 1:
            num = int(input("Digite o número a ser adicionado: "))
            vetor.append(num)
            print(f"Número {num} adicionado com sucesso.")
        case 2:
            print("Vetor atual:")
            print(vetor)
        case 3:
            num = int(input("Digite o número a ser consultado: "))
            if num in vetor:
                print(f"Número {num} encontrado no vetor.")
            else:
                print(f"Número {num} não encontrado no vetor.")
        case 4:
            num = int(input("Digite o número a ser excluído: "))
            if num in vetor:
                vetor.remove(num)
                print(f"Número {num} excluído com sucesso.")
            else:
                print(f"Número {num} não encontrado no vetor.")
        case 5:
            print("Saindo do programa.")
            break
        case _:
            print("Opção inválida. Tente novamente.")
