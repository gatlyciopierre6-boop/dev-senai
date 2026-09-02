andar_atual = 0
pessoas_no_elevador = 0
CAPACIDADE_MAXIMA = 5
TOTAL_ANDARES = 10

print("=== SISTEMA DE ELEVADOR ===")

while True:
    print("\n--------------------------")
    print(f"Andar atual: {andar_atual}")
    print(f"Pessoas no elevador: {pessoas_no_elevador}")

    opcao = input("\nDeseja chamar o elevador? (s/n): ")

    if opcao.lower() == "n":
        print("Sistema encerrado.")
        break

    andar_chamada = int(input("Digite o andar da chamada (0 a 9): "))

    if andar_chamada < 0 or andar_chamada >= TOTAL_ANDARES:
        print("Andar inválido!")
        continue

    if andar_chamada > andar_atual:
        print("Elevador subindo...")
        while andar_atual < andar_chamada:
            andar_atual += 1
            print(f"Andar atual: {andar_atual}")

    elif andar_chamada < andar_atual:
        print("Elevador descendo...")
        while andar_atual > andar_chamada:
            andar_atual -= 1
            print(f"Andar atual: {andar_atual}")

    print("Elevador parou para embarque.")

    entrar = int(input("Quantas pessoas vão entrar? "))

    if pessoas_no_elevador + entrar > CAPACIDADE_MAXIMA:
        print("Capacidade máxima excedida!")
        continue

    pessoas_no_elevador += entrar

    destino = int(input("Digite o andar de destino (0 a 9): "))

    if destino < 0 or destino >= TOTAL_ANDARES:
        print("Andar inválido!")
        pessoas_no_elevador -= entrar
        continue

    if destino > andar_atual:
        print("Elevador subindo...")
        while andar_atual < destino:
            andar_atual += 1
            print(f"Andar atual: {andar_atual}")

    elif destino < andar_atual:
        print("Elevador descendo...")
        while andar_atual > destino:
            andar_atual -= 1
            print(f"Andar atual: {andar_atual}")

    print("Elevador parou no destino.")

    sair = int(input("Quantas pessoas vão sair? "))

    if sair > pessoas_no_elevador:
        print("Número inválido!")
    else:
        pessoas_no_elevador -= sair

print("Fim do programa.")
