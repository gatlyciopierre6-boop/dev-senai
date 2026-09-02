<<<<<<< HEAD
import datetime
print("gerenciamento de cancelas para um shopping")
VALOR_ENTRADA = float(input("Digite o valor base de entrada (R$): "))
VALOR_HORA = float(input("Digite o valor da hora adicional (R$): "))

veiculos_no_patio = {} 

def sinalizar(mensagem):
    """Simula a sinalização de entrada/saída (Irradiador de Informação) [Turno 1]"""
    print(f"\n[SINALIZAÇÃO]: {mensagem}")

def registrar_entrada():
    """Implementa o Passo 1: Elicitação de informações e estímulos [Turno 19]"""
    sinalizar("Veículo detectado na cancela de ENTRADA.")
    
    try:
        placa = input("Informe a placa do veículo: ").upper()
        tem_tag = input("Possui TAG de acesso livre? (S/N): ").upper() == 'S'
        
        if tem_tag:
            sinalizar(f"TAG Identificada. Acesso LIBERADO para placa {placa}.")
            veiculos_no_patio[placa] = {"entrada": datetime.datetime.now(), "tipo": "TAG"}
        else:
            print("Pressione o botão para emitir o ticket...")
            input("[BOTÃO PRESSIONADO]")
            sinalizar(f"Ticket emitido. Acesso LIBERADO para placa {placa}.")
            veiculos_no_patio[placa] = {"entrada": datetime.datetime.now(), "tipo": "TICKET"}
            
    except Exception as e:

        print(f"ERRO AO PROCESSAR ENTRADA: {e}. Por favor, acione o suporte.")

def registrar_saida():
    """Implementa os Passos 2 e 3: Processamento de Transação e Saída [1242, Turno 19]"""
    sinalizar("Veículo detectado na cancela de SAÍDA.")
    placa = input("Informe a placa para saída: ").upper()
    
    if placa in veiculos_no_patio:
        dados = veiculos_no_patio.pop(placa)
        hora_entrada = dados["entrada"]
        hora_saida = datetime.datetime.now()
    
        permanencia = (hora_saida - hora_entrada).total_seconds() / 3600 + 2 
        
        valor_total = VALOR_ENTRADA + (int(permanencia) * VALOR_HORA)
        
        print(f"Tempo de permanência: {permanencia:.2f} horas.")
        
        if dados["tipo"] == "TAG":
            sinalizar(f"Saída via TAG. Valor de R${valor_total:.2f} gerado na fatura.")
        else:
            print(f"Valor a pagar: R${valor_total:.2f}")
            input("Aguardando pagamento... [PAGO]")
            print("Recolha o ticket na saída.")
            
        sinalizar("Cancela aberta. Boa viagem!")
    else:
    
        print("ALERTA: Placa não registrada. Verifique com a administração.")

while True:
    print("\n1- Entrada | 2- Saída | 3- Relatório (Sair)")
    opcao = input("Escolha a operação: ")
=======
import math

print("--- Gerenciamento de Cancelas para Shopping ---")
VALOR_ENTRADA = float(input("Digite o valor base de entrada (R$): "))
VALOR_HORA = float(input("Digite o valor da hora adicional (R$): "))

veiculos_no_patio = {} 

def sinalizar(mensagem):
    """Simula os painéis informativos e avisos sonoros da cancela."""
    print(f"\n[SINALIZAÇÃO]: {mensagem}")

def registrar_entrada():
    """Registra o veículo e armazena o momento da entrada."""
    sinalizar("Veículo detectado na cancela de ENTRADA.")
    try:
        placa = input("Informe a placa do veículo (Ex: ABC1234): ").upper().strip()
        if not placa:
            print("Erro: Placa inválida.")
            return
            
        tem_tag = input("Possui TAG de acesso livre? (S/N): ").upper().strip() == 'S'
        
        # Simulação de tempo: digite a hora de entrada para testar o cálculo de permanência
        print("\n[Simulação de Tempo]")
        hora_ent = int(input("Digite a HORA de entrada (0-23): "))
        min_ent = int(input("Digite os MINUTOS de entrada (0-59): "))
        
        tempo_minutos = (hora_ent * 60) + min_ent
        
        if tem_tag:
            sinalizar(f"TAG Identificada. Acesso LIBERADO para a placa {placa}.")
            veiculos_no_patio[placa] = {"entrada_minutos": tempo_minutos, "tipo": "TAG"}
        else:
            print("Pressione o botão para emitir o ticket...")
            input("[BOTÃO PRESSIONADO - ENTER]")
            sinalizar(f"Ticket emitido. Acesso LIBERADO para a placa {placa}.")
            veiculos_no_patio[placa] = {"entrada_minutos": tempo_minutos, "tipo": "TICKET"}
            
    except ValueError:
        print("Erro: Formato de hora ou minuto inválido.")
    except Exception as e:
        print(f"ERRO AO PROCESSAR ENTRADA: {e}. Acione o suporte técnico.")

def registrar_saida():
    """Processa a saída, calcula a permanência simulada e o valor final."""
    sinalizar("Veículo detectado na cancela de SAÍDA.")
    placa = input("Informe a placa para saída: ").upper().strip()
    
    if placa in veiculos_no_patio:
        try:
            dados = veiculos_no_patio.pop(placa)
            
            print("\n[Simulação de Tempo]")
            hora_sai = int(input("Digite a HORA de saída (0-23): "))
            min_sai = int(input("Digite os MINUTOS de saída (0-59): "))
            
            tempo_saida_minutos = (hora_sai * 60) + min_sai
            minutos_permanencia = tempo_saida_minutos - dados["entrada_minutos"]
            
            # Tratamento para virada de dia (caso saia após a meia-noite)
            if minutos_permanencia < 0:
                minutos_permanencia += 24 * 60
                
            horas_reais = minutos_permanencia / 60
            print(f"\nTempo de permanência real: {horas_reais:.2f} horas ({minutos_permanencia} minutos).")
            
            # Se ficou menos ou igual a 1 hora: paga apenas a entrada base
            # Se passou de 1 hora: paga a base + horas adicionais arredondadas para cima
            if horas_reais <= 1:
                valor_total = VALOR_ENTRADA
            else:
                horas_adicionais = math.ceil(horas_reais - 1)
                valor_total = VALOR_ENTRADA + (horas_adicionais * VALOR_HORA)
            
            if dados["tipo"] == "TAG":
                sinalizar(f"Saída via TAG. Valor de R$ {valor_total:.2f} lançado na fatura.")
            else:
                print(f"Valor a pagar: R$ {valor_total:.2f}")
                input("Insira o cartão ou pague no terminal... [ENTER para confirmar pagamento]")
                print("Ticket recolhido pelo totem de saída.")
                
            sinalizar("Cancela aberta. Boa viagem!")
            
        except ValueError:
            print("Erro: Entrada de horário inválida. Operação cancelada.")
            veiculos_no_patio[placa] = dados # Devolve o veículo ao pátio em caso de erro
    else:
        print("ALERTA: Placa não encontrada no pátio. Verifique com a administração.")

# Menu Principal
while True:
    print("\n==============================")
    print("1 - Registrar ENTRADA")
    print("2 - Registrar SAÍDA")
    print("3 - Encerrar Sistema (Relatório)")
    opcao = input("Escolha a operação desejada: ").strip()
>>>>>>> 5fe1ac2045698296645af6a0a043a63a8f3832ec
    
    if opcao == '1':
        registrar_entrada()
    elif opcao == '2':
        registrar_saida()
    elif opcao == '3':
<<<<<<< HEAD
        print(f"Encerrando... Veículos ainda no pátio: {len(veiculos_no_patio)}")
        break
=======
        print(f"\nFechando sistema... Veículos restantes no pátio: {len(veiculos_no_patio)}")
        break
    else:
        print("Opção inválida. Tente novamente.")
>>>>>>> 5fe1ac2045698296645af6a0a043a63a8f3832ec
