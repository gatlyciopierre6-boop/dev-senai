# revisâo de conteudo:
# print ="Função se saida de dados pra o console"
# input="Função de entrada de dados do usuario via teclado"
# if ="Estrutura de decisão para executar codigo condicionalmente"
#      elif = "combinaçao de eslse + if para verificar multiplas condições"
#     else =" parte opcional de um if que executa codigo quando a condiçao do if é falsa  "
# for = "laço de repetição para iterar sobre uma sequencia de elementos "
# while= laço de repeticao para executar codigo enquanto uma condiçao for veradadeira
# operadores matematicos: +,-,*,/,//,%,
# operadores de comparacao:==,!,>,<,>=,<=
# variavel= "exemplo de variavel para armazenar dados"
# print(variavel)

# # Exemlpo1= com print e input
# nome= input("digite seu nome")
# print(f"olá, {nome}! Bem vindo á aula de python para desenvolvimrnto de sistema!")

# #EXEMPLO2
# nota= float(input("digite a nota do aluno: "))
# if nota >= 7:
#    print("aluno aprovado!")

# elif nota >= 5:
#    print("aluno em recuperação")

# else:
#    print("aluno reprovado!")

# # exemplo3 com for
# materiais = ["Metal", "plastico", "vidro"]
# for metal in materiais:
#     print(f" processando material: {material}.")
#     print(f"material {material} processado com sucesso!")
# print("fim do processamento de materiais.")

#use o while quando voce nao sabe quando vi parar.ele depende uma condiçao (como um sensor de sensor de segurança ou um botao
# de emergencia)

#exemplo: monitor de temperatura (loop infinito controlado)
#repete enquanto a temperatura estiver segura
# import time
# temperatura = 25
# while temperatura < 40:
#    print(f"temperatura atual: {temperatura}")°C. sistema operando...")
#    time.sleep(1)
#    temperatura += 3 # simulando o aquecimento da maquina 
# print("ALERTA! Tempertura atingiu o limite. desligando o motor...") 

# #lista de temperatura lidas pelo sensor por minuto
# leituras = [70,75,82,98,110,85,80]
# for temp in leituras:
#    while temp > 100:
#        print(f"CRITICO: {temp}°C detectado! Acionando parada de emergencia.")
#        break # o loop para aqui e não lê os proximos valores (85 e 80)
#    print(f"temperatura esta em {temp}°C. operaçao normal.")
# print("sistema desligado. Aguardando manutençao.")

# #produçao de peças com controle de material usando continue 
# materis = ["metal","plastico","metal","vidro","matal"]
# for peca in materis:
#    if peca != "metal":
#       print(f"Aviso: Peça de {peca} detectada. desviando para descarte...")
#       continue
#    #este codigo só roda se for de metal 
#    print(f"processando peça de {peca}. furando e polindo...")
# print("fim do  lote de peroduçao.")

# for sensor in range(1,11):
#     if sensor == 5:
#      print(f"sensor n°{sensor} com falha")
#     print(f"sensor {sensor} sem falha")
#     continue
# print("fim! :)")

#exercicio2
#simule um semaforo com parada para cada cor.determine um tempo que
# deseja para que qaundo mudar para tal cor ele represente uma pausa 
# para cada cor. use o continue para pular a cor amarela (simulando um semaforo com defeito que nao acende a luz amarela)
# import time

# cores = ["vermelho", "amarelo", "verde"]

# # tempos (em segundos) para cada cor
# tempos = {
#     "vermelho": 3,
#     "amarelo": 2,
#     "verde": 3
# }

# # simular alguns ciclos
# for ciclo in range(3):
#     for cor in cores:
#         if cor == "amarelo":
#             # semáforo com defeito: não acende amarelo
#             continue

#         print(f"Luz: {cor} (esperando {tempos[cor]}s)")
#         time.sleep(tempos[cor])

# print("Fim da simulação.")
# # exercicio3 soma de cargas de energia (for)
# # uma fabrica tem 5 maquinas peça ao usuario (via input dentro do loop)
# # o consumo em kwhde cada uma das 5 maquinas ao final do loop o programa deve exibir o consumo total da fabrica.
# total = 0.0

# for i in range(1, 6):
#     consumo = float(input(f"Digite o consumo (kWh) da máquina {i}: "))
#     total += consumo

# print(f"Consumo total da fábrica: {total:.2f} kWh")

#exercicio4 identificador de peças defeituosas (for + if)
#percorra uma lista de medidas de peças:
#medidas = [50.1,49.8,52.2,50.0,48.5].
#o padrão de qualidade aceita apenas peças com extamente 50.0 ou mais.
#use um for para ler a lista e pra cada peça diga se ela está "aprovado" ou rejeitada".

# medidas = [50.1, 49.8, 52.2, 50.0, 48.5]

# for medida in medidas:
#     if medida >= 50.0:
#         print(f"{medida} - aprovado")
#     else:
#         print(f"{medida} - rejeitada")