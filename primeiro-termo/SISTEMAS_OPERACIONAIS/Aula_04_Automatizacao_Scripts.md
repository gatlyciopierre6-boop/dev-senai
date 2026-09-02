# Aula 04: Automatização e Introdução a Variáveis

## 1. O Conceito de Script

Um **script** (ou roteiro) é um arquivo de texto simples que contém uma sequência de comandos do terminal (CMD, PowerShell ou Bash). O objetivo do script é **automatizar tarefas**, permitindo que o usuário execute várias operações com apenas um comando, em vez de digitá-las uma por uma.

A automação é um pilar fundamental da infraestrutura de TI e do DevOps. Ao escrever scripts, eliminamos o erro humano em tarefas repetitivas, garantimos consistência nas operações e economizamos tempo valioso.

Exemplos de tarefas que podem ser automatizadas:
*   Limpeza de arquivos temporários de um servidor.
*   Instalação e configuração de um ambiente de desenvolvimento em uma nova máquina.
*   Backup (cópia de segurança) de bancos de dados diariamente.
*   Verificação do uso de espaço em disco e envio de alertas por e-mail.

## 2. Introdução a Variáveis

Para que um script seja dinâmico e reutilizável, precisamos do conceito de **variáveis**. Uma variável é, essencialmente, um "espaço na memória" do computador onde armazenamos informações (dados) para uso posterior. Imagine que uma variável é uma caixa etiquetada onde você guarda algo para usar depois.

As variáveis podem armazenar diferentes tipos de dados, como:
*   **Textos (Strings):** Nomes de arquivos, caminhos de diretórios, mensagens.
*   **Números:** Contadores, tamanhos de arquivos, portas de rede.

### Sintaxe de Variáveis

A forma de criar e usar variáveis muda dependendo do sistema operacional:

| Ação | Windows (CMD / Batch) | Windows (PowerShell) | Linux (Bash) |
| :--- | :--- | :--- | :--- |
| **Criar/Definir** | `set NOME_JOAO=Joao` | `$nomeJoao = "Joao"` | `NOME_JOAO="Joao"` |
| **Usar/Ler** | `%NOME_JOAO%` | `$nomeJoao` | `$NOME_JOAO` |
| **Imprimir** | `echo %NOME_JOAO%` | `Write-Output $nomeJoao` | `echo $NOME_JOAO` |

> **Dica Importante:** Em programação e scripts, é uma boa prática usar letras maiúsculas para variáveis de ambiente do sistema e letras minúsculas ou *camelCase* para variáveis criadas pelo usuário.

## 3. Criação e Atribuição de Variáveis de Ambiente

Existem dois tipos principais de variáveis em um sistema operacional:
1.  **Variáveis Locais:** Existem apenas enquanto o terminal (sessão) está aberto. Quando você fecha o terminal, elas somem.
2.  **Variáveis de Ambiente (Environment Variables):** São variáveis globais do sistema. Elas persistem mesmo após o reinício do computador e podem ser acessadas por qualquer programa em execução.

### Exemplos Práticos

#### Windows (CMD)
Vamos criar um script simples para fazer backup de uma pasta.

```batch
@echo off
:: Define a pasta de origem e destino
set PASTA_ORIGEM=C:\Projetos\Site
set PASTA_DESTINO=D:\Backups\Site

:: Cria a pasta de destino se ela não existir
if not exist "%PASTA_DESTINO%" mkdir "%PASTA_DESTINO%"

:: Copia os arquivos de forma recursiva (incluindo subpastas)
echo Iniciando backup de %PASTA_ORIGEM% para %PASTA_DESTINO%...
xcopy "%PASTA_ORIGEM%" "%PASTA_DESTINO%" /E /Y /I

echo Backup concluído com sucesso!
```

*Nota: Salve o código acima em um arquivo com a extensão `.bat` (ex: `backup.bat`) e execute-o clicando duas vezes.*

#### Linux (Bash)
Vamos criar um script para listar arquivos grandes.

```bash
#!/bin/bash
# Define o diretório a ser verificado
DIRETORIO="/home/usuario/Documentos"

# Define o tamanho limite (ex: 10MB)
TAMANHO_LIMITE="10M"

echo "Verificando arquivos maiores que $TAMANHO_LIMITE em $DIRETORIO..."

# O comando 'find' localiza os arquivos que atendem aos critérios
find $DIRETORIO -type f -size +$TAMANHO_LIMITE -print

echo "Verificação concluída."
```

*Nota: Salve o código acima em um arquivo com a extensão `.sh` (ex: `verificar_arquivos.sh`), dê permissão de execução com `chmod +x verificar_arquivos.sh` e execute com `./verificar_arquivos.sh`.*

## 4. Estruturas Lógicas Básicas em Scripts

Assim como na programação tradicional, os scripts de S.O. permitem estruturas de controle:

*   **Condicionais (if/else):** Executar um comando apenas se uma condição for verdadeira. (Ex: "Se o arquivo existe, copie-o; senão, mostre um erro").
*   **Laços de Repetição (loops):** Executar o mesmo comando várias vezes ou para vários arquivos. (Ex: "Para cada arquivo .log na pasta, compacte-o em .zip").

## 5. Desafio Prático

1.  Crie um script no seu sistema operacional atual.
2.  O script deve solicitar (ou ter definida em uma variável) uma pasta de origem.
3.  Ele deve verificar se existem arquivos de texto (`.txt`) dentro dessa pasta.
4.  Se encontrar, deve copiá-los para uma nova pasta chamada "Arquivos_Txt_Backup".
5.  Ao final, deve exibir uma mensagem informando quantos arquivos foram copiados.

---
*Continuação na próxima aula: Fundamentos de Segurança Cibernética.*
