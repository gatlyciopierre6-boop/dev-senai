# # lógica e decisões 
# # se condição verdadeira 
# # se condição ainda verdadeira porém com critérios 
# # senao condicao falsa
# # if elif else
# # sinais de > < =

# #Exemplo 1
# print("Verificar idade")
# idade = int(input("digite sua idade"))

# if idade >= 18:
#     print("voce é maior de idade")

# else:
    # print("voce nao é de maior")

#eEXEMPLO2 
#VALORES
# print("checar valores")
# valor = int(input("digite o valor"))

# if valor > 100:
#     print("valor acima de 100")
          
# else:
#     print("valor abaixo de 100")

#exemplo3
#criar algoritmo que permita escolher a opçao que deseja

# print("menu de opçao")
# print("escolha uma das opçoes")
# print("filmes F e séries S e X para sair")

# escolha =  input("Digite uma das opcões")
                 
# if escolha == "F":
#   print("voce escolheu Filmes")

# elif escolha == "F":
#    print("voce escolheu séries")

# else:
#    print("voce saiu do programa")

 # exercicio 1
# criar um algoritmo para realizar a locação de filmes ou séries seguir o modelo anterior. Ao escolher a opção você deverá perguntar o nome do cliente do filme ou serie e quantidade que deseja assim como o valor de aluguel
#para filmes R$ 5,00 e para séries R$ 10,00

#exercicios 2
# loja de comida e doces 
#criar um algoritmo para compra de produto 
#1-comida
#2-bebida 
#3-doces

#ao escolher as opcoes cada um terá um valor de porcentagem, comida=10%, bebidas =5%, doces=2%


# def loja_comida_doces():
#     print("=== Loja de Comida e Doces ===")
#     print("1 - Comida (10% de desconto)")
#     print("2 - Bebida (5% de desconto)")
#     print("3 - Doces (2% de desconto)")
    
#     opcao = int(input("Escolha uma opção (1, 2 ou 3): "))
#     nome_cliente = input("Digite o nome do cliente: ")
#     valor_compra = float(input("Digite o valor da compra: R$ "))
    
#     if opcao == 1:
#         desconto = valor_compra * 0.10
#         valor_final = valor_compra - desconto
#         print(f"\nCliente: {nome_cliente}")
#         print(f"Produto: Comida")
#         print(f"Valor da compra: R$ {valor_compra:.2f}")
#         print(f"Desconto: R$ {desconto:.2f}")
#         print(f"Valor final: R$ {valor_final:.2f}")
    
#     elif opcao == 2:
#         desconto = valor_compra * 0.05
#         valor_final = valor_compra - desconto
#         print(f"\nCliente: {nome_cliente}")
#         print(f"Produto: Bebida")
#         print(f"Valor da compra: R$ {valor_compra:.2f}")
#         print(f"Desconto: R$ {desconto:.2f}")
#         print(f"Valor final: R$ {valor_final:.2f}")
    
#     elif opcao == 3:
#         desconto = valor_compra * 0.02
#         valor_final = valor_compra - desconto
#         print(f"\nCliente: {nome_cliente}")
#         print(f"Produto: Doces")
#         print(f"Valor da compra: R$ {valor_compra:.2f}")
#         print(f"Desconto: R$ {desconto:.2f}")
#         print(f"Valor final: R$ {valor_final:.2f}")
    
#     else:
#         print("Opção inválida! Escolha 1, 2 ou 3.")

# # Executar o programa
# loja_comida_doces()

#exercicio 3
#calculadora com operadores
#sua calculadora deverá perguntar qual operador ele deseja e  a  calcular os valores desejados.
#operador + - / *

# def calculadora():
#     print("=== Calculadora ===")
#     print("Operadores disponíveis: +  -  *  /")
    
#     operador = input("Digite o operador desejado (+, -, *, /): ")
#     num1 = float(input("Digite o primeiro número: "))
#     num2 = float(input("Digite o segundo número: "))
    
#     if operador == "+":
#         resultado = num1 + num2
#         print(f"\nResultado: {num1} + {num2} = {resultado}")
    
#     elif operador == "-":
#         resultado = num1 - num2
#         print(f"\nResultado: {num1} - {num2} = {resultado}")
    
#     elif operador == "*":
#         resultado = num1 * num2
#         print(f"\nResultado: {num1} * {num2} = {resultado}")
    
#     elif operador== "\"
#  resultado = num1/num2
# print(f"\nResultado: {num1} / {num2} = {resultado}")

#Execico 4
#calculo de notas 
#nossas atividades são por base de calculo em somativa 1 e somativa2, no final temos um media.
#acima ou igual a 50 o aluno será aprovado caso contrario reprovado.
#o programa deverá perguntar o nome e as notas e apresentar
#  o resultado final do aluno.

# print("calculo de nota")
# smt1=float(input("Digite a primrira nota"))
# smt2=float(input("Digite a segunda nota"))
# smtotal:(smt1+smt2)/2

# if smtotal>=50:
#     print("aprovado")
# float(input("Digite a primrira nota: "))

# else smtotal<50:
#     print("reprovado")
