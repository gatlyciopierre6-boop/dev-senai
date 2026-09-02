#Lógica de programação.
#somativa02

# ativivdade.1. Registro de Operador: Peça o nome do operador e o turno (A, B ou C). Exiba:
# "Operador [Nome] registrado no Turno [Turno]. Boa jornada!"

from tkinter import *

def registrar():
    nome = entry_nome.get()
    turno = entry_turno.get().upper()
    resultado.config(
        text=f"Operador {nome} registrado no Turno {turno}. Boa jornada!"
    )

janela = Tk()
janela.title("Registro de Operador")
janela.geometry("350x220")

Label(janela, text="Nome do Operador:").pack()
entry_nome = Entry(janela)
entry_nome.pack()

Label(janela, text="Turno (A, B ou C):").pack()
entry_turno = Entry(janela)
entry_turno.pack()

Button(janela, text="Registrar", command=registrar).pack(pady=10)

resultado = Label(janela, text="")
resultado.pack()

Button(janela, text="Fechar", command=janela.destroy).pack(pady=5)

janela.mainloop()


# ativivdade.2. Cálculo de Produção: Peça a quantidade de peças produzidas em 1 hora. Calcule e
# exiba quantas peças serão produzidas em um turno de 8 horas.

from tkinter import *

def calcular():
    try:
        producao_hora = float(entry_producao.get())
        total = producao_hora * 8
        resultado.config(text=f"Produção em 8 horas: {total:.2f} peças")
    except ValueError:
        resultado.config(text="Digite um valor válido!")

janela = Tk()
janela.title("Atividade 2")
janela.geometry("350x220")

Label(janela, text="Peças produzidas em 1 hora:").pack(pady=5)

entry_producao = Entry(janela)
entry_producao.pack()

Button(janela, text="Calcular", command=calcular).pack(pady=10)

resultado = Label(janela, text="")
resultado.pack()

Button(janela, text="Fechar", command=janela.destroy).pack(pady=5)

janela.mainloop()


# ativivdade.3. Conversor de Unidade: O sistema lê uma pressão em Bar. Converta para PSI (1 Bar
# ≈ 14.5 PSI) e exiba com duas casas decimais.

from tkinter import *

def converter():
    bar = float(txt.get())
    psi = bar * 14.5
    resp["text"] = "Pressão em PSI: " + str(round(psi, 2))

janela = Tk()
janela.title("Atividade 3")

Label(janela, text="Digite a pressão em Bar").pack()

txt = Entry(janela)
txt.pack()

Button(janela, text="Converter", command=converter).pack()

resp = Label(janela, text="")
resp.pack()

Button(janela, text="Fechar", command=janela.destroy).pack(pady=5)

janela.mainloop()


# ativivdade.4. Média de Qualidade: Peça 3 notas de inspeção de uma peça (0 a 10). Exiba a média
# aritmética simples delas.

from tkinter import *

def calcular():
    n1 = float(txt1.get())
    n2 = float(txt2.get())
    n3 = float(txt3.get())
    media = (n1 + n2 + n3) / 3
    resp["text"] = "Média: " + str(round(media, 2))

janela = Tk()
janela.title("Media de qualidade")

Label(janela, text="Nota 1").pack()
txt1 = Entry(janela)
txt1.pack()

Label(janela, text="Nota 2").pack()
txt2 = Entry(janela)
txt2.pack()

Label(janela, text="Nota 3").pack()
txt3 = Entry(janela)
txt3.pack()

Button(janela, text="Calcular", command=calcular).pack()

resp = Label(janela, text="")
resp.pack()

Button(janela, text="Fechar", command=janela.destroy).pack(pady=5)

janela.mainloop()


# ativivdade.5. Termostato Inteligente: Peça a temperatura de um motor.
# ● Abaixo de 40°C: "Baixa carga".
# ● Entre 40°C e 70°C: "Normal".
# ● Acima de 70°C: "ALERTA: Resfriamento Ativado!".

from tkinter import *

def verificar():
    temp = float(txt.get())
    if temp < 40:
        resp["text"] = "Baixa carga"
    elif temp <= 70:
        resp["text"] = "Normal"
    else:
        resp["text"] = "ALERTA: Resfriamento Ativado!"

janela = Tk()
janela.title("Atividade 5")

Label(janela, text="Temperatura do motor").pack()

txt = Entry(janela)
txt.pack()

Button(janela, text="Verificar", command=verificar).pack()

resp = Label(janela, text="")
resp.pack()

Button(janela, text="Fechar", command=janela.destroy).pack(pady=5)

janela.mainloop()


# ativivdade.6. Classificador de Lotes: O usuário insere o código do produto. Se começar com "A",
# exiba "Alimentos". Se "E", "Eletrônicos". Para qualquer outro, "Desconhecido".

from tkinter import *

def verificar():
    codigo = txt.get()
    if codigo[0] == "A":
        resp["text"] = "Alimentos"
    elif codigo[0] == "E":
        resp["text"] = "Eletrônicos"
    else:
        resp["text"] = "Desconhecido"

janela = Tk()
janela.title("Atividade 6")

Label(janela, text="Código do produto").pack()

txt = Entry(janela)
txt.pack()

Button(janela, text="Verificar", command=verificar).pack()

resp = Label(janela, text="")
resp.pack()

Button(janela, text="Fechar", command=janela.destroy).pack(pady=5)

janela.mainloop()


# ativivdade.7. Segurança de Operação: A máquina só liga se o sensor_porta == "fechada" E o
# botao_emergencia == "desligado". Peça esses dois inputs e diga se a máquina pode
# iniciar.

from tkinter import *

def ligar():
    porta = txt1.get()
    emergencia = txt2.get()
    if porta == "fechada" and emergencia == "desligado":
        resp["text"] = "Máquina pode iniciar"
    else:
        resp["text"] = "Máquina não pode iniciar"

janela = Tk()
janela.title("Atividade 7")

Label(janela, text="Sensor da porta").pack()
txt1 = Entry(janela)
txt1.pack()

Label(janela, text="Botão de emergência").pack()
txt2 = Entry(janela)
txt2.pack()

Button(janela, text="Verificar", command=ligar).pack()

resp = Label(janela, text="")
resp.pack()

Button(janela, text="Fechar", command=janela.destroy).pack(pady=5)

janela.mainloop()


# atividade.8. Cálculo de Descarte: Peça o total de peças produzidas e o total de defeituosas. Se
# o descarte for maior que 5% do total, exiba "Revisar Processo", caso contrário,
# "Processo Otimizado".

from tkinter import *

def calcular():
    total = int(txt1.get())
    defeito = int(txt2.get())
    porcentagem = (defeito * 100) / total
    if porcentagem > 5:
        resp["text"] = "Revisar Processo"
    else:
        resp["text"] = "Processo Otimizado"

janela = Tk()
janela.title("Atividade 8")

Label(janela, text="Total de peças").pack()
txt1 = Entry(janela)
txt1.pack()

Label(janela, text="Peças defeituosas").pack()
txt2 = Entry(janela)
txt2.pack()

Button(janela, text="Calcular", command=calcular).pack()

resp = Label(janela, text="")
resp.pack()

Button(janela, text="Fechar", command=janela.destroy).pack(pady=5)

janela.mainloop()


# Atividade.9. Validação de Medida: Uma peça deve ter entre 9.8mm e 10.2mm. Peça a medida e
# diga se está dentro da tolerância, acima ou abaixo.

from tkinter import *

def verificar():
    medida = float(txt.get())
    if medida < 9.8:
        resp["text"] = "Abaixo da tolerância"
    elif medida <= 10.2:
        resp["text"] = "Dentro da tolerância"
    else:
        resp["text"] = "Acima da tolerância"

janela = Tk()
janela.title("Atividade 9")

Label(janela, text="Digite a medida").pack()

txt = Entry(janela)
txt.pack()

Button(janela, text="Verificar", command=verificar).pack()

resp = Label(janela, text="")
resp.pack()

Button(janela, text="Fechar", command=janela.destroy).pack(pady=5)

janela.mainloop()


# atividade.10. Contagem Regressiva de Setup: Use um for para fazer uma contagem regressiva
# de 10 até 1 para o início de uma prensa, e finalize com "Prensa Ativada!".

from tkinter import *
import time

def iniciar():
    resp["text"] = ""
    for i in range(10, 0, -1):
        resp["text"] = i
        janela.update()
        time.sleep(1)
    resp["text"] = "Prensa Ativada!"

janela = Tk()
janela.title("Atividade 10")

Button(janela, text="Iniciar", command=iniciar).pack()

resp = Label(janela, text="", font=("Arial", 20))
resp.pack()

Button(janela, text="Fechar", command=janela.destroy).pack(pady=5)

janela.mainloop()