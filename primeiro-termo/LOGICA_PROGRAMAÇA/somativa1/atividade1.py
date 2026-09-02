#atividade1

# modelo = input("digite o modelo do veiculo:")
# placa = input("digite a a placa do veiculo: ")

# print(f"veiculo {modelo} de placa{placa} foi registrado no sistema.boa viagem")

# #Ativiade2
# capaciade_t = float(input("digite a capacidade do tanque em (litros): "))
# consumoM= float(input("digite o o consumo médio do caminhão (km/l): "))
# Autonomia = capaciade_t/consumoM

# print(f"a distancia total que o veiculo percorre com tanque cheio é de {Autonomia}.")

# #ativiade3
# print("conversor de moedas")
# usd= int(input("digite o valor em dólar"))
# brl= usd * 5,00
# print(f"convertendo para reais fica: R${brl:}")

# #atividade4
# print("Média de Entrega:")
# rota1=float(input("o tempo de entrega (em horas) na primeira rota:"))
# rota2=float(input("o tempo de entrega (em horas) na segunda rota:"))
# rota3=float(input("o tempo de entrega (em horas) na terceira rota:"))
# mediaari=(rota1+rota2+rota3)/3
# print(f"a média aritmética simples do tempo dessas entregas é {mediaari}horas:")

# #atividade5

# peso= float(input("digite o seu peso:"))

# if peso<10:
#    print("carga leve")
# elif 10 <= peso <=25:
#    print("Carga padrão")
# else:
#    print("ALERTA: Excesso de Peso!")

# #atividade6
# codigo= input(("codigo da carga:"))

# if codigo == ("N"):
#     print("Região norte")
# elif codigo == ("S"):
#     print("Regiao sul")
# else:
#     print("Região internacional")

# #atividade7
# checklist= input("checklist concluido? (sim/não):")
# motorista= input("motoristas identificados? (sim/não):")

# if checklist == "sim" and motorista == "sim":
#     print("veículo está autorizado a iniciar a rota.")
    
# else:
#     print("saida não autorizada")

# #atividade8
# total=int(input("total de entregas:"))
# atrasos=int(input("entregues com atraso:"))

# percentual= (atrasos/total)*100
# if percentual>10:
#     print("Necessário Otimizar rotas")
# else:
#     print("Logística Eficiente")

# #atividade9
# pressão=float(input("pressão do pneu (PSI):"))

# if 100<= pressão<= 110:
#     print("dentro do padrão")
# elif pressão<100:
#     print("abaixo do recomendado")
# else:
#     print("acima do recomendado")

# #atividade10
# import time

# for I in range(5,0,-1):
#  print(f"o portão fecha em {I}")
#  time.sleep(1)
# print("portão trancado!")

# #atividade11
# faturamento_total =0
# valor_frete = -1
# while valor_frete !=0:
#     valor_frete=float(input("valor do frete(0 para parar):"))
#     faturamento_total += valor_frete
#     print(f"faturamento total:{faturamento_total:}")


# #atividade12

# maior= 0
# for i in range(5):
#     km=float(input("quilometragem do veiculo"))
#     if km > maior:
#         maior=km
    
#     print(f"maior quilometragem: {maior}")




 
# Solicita o nick do jogador
print("perfil gamer")
nick = input("Digite o seu nick: ")

# Solicita o nível do jogador
# Convertendo para inteiro para garantir que seja um número
while True:
    try:
        nivel = int(input("Digite o seu nível atual: "))
        break
    except ValueError:
        print("Por favor, digite um número válido para o nível.")

# Exibe a mensagem formatada
print(f"O jogador {nick} está no nível {nivel}")




# Linguagem: Python
# Calculadora de mesada mensal com base no valor semanal

# Função principal
print("calculo de mesada mensal ")
def calcular_mesada_mensal():
    try:
        
        valor_semanal = float(input("Digite o valor que você recebe por semana (R$): "))
        
        valor_mensal = valor_semanal * 4
        
        print(f"Se você recebe R$ {valor_semanal:.2f} por semana, seu ganho mensal será aproximadamente R$ {valor_mensal:.2f}.")
    
    except ValueError:
        print("Por favor, digite um número válido para o valor semanal.")
calcular_mesada_mensal()
