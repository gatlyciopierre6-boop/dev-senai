# Aula 03: Operação de Sistemas via CLI (Interface de Linha de Comando)

## 1. A Importância do Terminal (CLI)

A Interface de Linha de Comando (*Command Line Interface* - CLI) é um método de interação com o computador onde o usuário digita instruções textuais (comandos) para que o sistema execute tarefas. 

Embora as interfaces gráficas (como o ambiente do Windows) sejam intuitivas para o uso diário, a CLI é **indispensável** para profissionais de TI, desenvolvedores e administradores de sistemas por várias razões:
*   **Precisão:** A execução de um comando é exata, sem ambiguidades de cliques errados.
*   **Automatização:** Comandos podem ser agrupados em scripts para executar tarefas complexas repetitivas.
*   **Velocidade:** Para tarefas avançadas, a CLI é frequentemente mais rápida do que navegar por menus.
*   **Acesso Remoto:** A maioria dos servidores na nuvem (cloud computing) não possui interface gráfica. O acesso é feito exclusivamente via terminal (ex: SSH).

## 2. Diferença entre CMD e Bash

Embora o conceito de linha de comando seja o mesmo, a "linguagem" do terminal varia conforme o sistema operacional.

*   **CMD (Command Prompt):** É o terminal clássico do Windows. Seus comandos têm uma sintaxe própria (ex: `dir`, `copy`, `del`).
*   **PowerShell:** O sucessor moderno do CMD no Windows. É muito mais poderoso e baseado em objetos .NET, permitindo automações complexas.
*   **Bash (Bourne Again Shell):** É o terminal padrão (e mais popular) do Linux e macOS. A sintaxe do Bash é a mais utilizada na indústria e em tutoriais de programação.

## 3. Comandos Essenciais (Navegação e Gerenciamento)

Abaixo apresentamos os comandos mais fundamentais para navegação e gerenciamento de arquivos, comparando as sintaxes do Windows (CMD) e do Linux (Bash).

| Ação Desejada | Comando Windows (CMD) | Comando Linux (Bash) | Descrição |
| :--- | :--- | :--- | :--- |
| **Listar conteúdo** | `dir` | `ls` (ou `ls -la` para detalhes) | Mostra os arquivos e pastas do diretório atual. |
| **Mudar de diretório** | `cd nome_da_pasta` | `cd nome_da_pasta` | Entra em uma pasta. Use `cd ..` para voltar um nível. |
| **Criar diretório** | `mkdir nome` | `mkdir nome` | Cria uma nova pasta. |
| **Criar arquivo vazio** | `type nul > arquivo.txt` | `touch arquivo.txt` | Cria um arquivo de texto vazio. |
| **Copiar arquivo** | `copy origem destino` | `cp origem destino` | Duplica um arquivo de um local para outro. |
| **Mover/Renomear** | `move origem destino` | `mv origem destino` | Move um arquivo. Se o destino estiver no mesmo local, renomeia. |
| **Deletar arquivo** | `del arquivo.txt` | `rm arquivo.txt` | Remove um arquivo. No Linux, use `rm -r pasta` para apagar pastas. |
| **Limpar tela** | `cls` | `clear` (ou `Ctrl+L`) | Limpa o texto exibido no terminal. |
| **Ver caminho atual** | `cd` (sem argumentos) | `pwd` (Print Working Directory) | Mostra o endereço completo da pasta onde você está. |

## 4. Caminhos Relativos vs. Absolutos

Ao navegar pelo terminal, é crucial entender a diferença entre caminhos:

*   **Caminho Absoluto (Absolute Path):** O endereço completo do arquivo, começando da raiz.
    *   *Windows:* `C:\Users\Usuario\Documentos\arquivo.txt`
    *   *Linux:* `/home/usuario/documentos/arquivo.txt`
*   **Caminho Relativo (Relative Path):** O endereço do arquivo em relação à pasta onde você está atualmente.
    *   Se você está em `Documentos` e quer acessar `arquivo.txt`, basta digitar `arquivo.txt`.
    *   Se quer acessar `pasta_imagens` que está dentro de `Documentos`, basta digitar `cd pasta_imagens`.
    *   Se quer voltar para `Documentos`, use `cd ..`.

## 5. Práticas Recomendadas (Boas Práticas)

1.  **Use a tecla Tab:** Ao digitar o nome de um arquivo ou pasta, pressione `Tab`. O terminal tentará completar o nome automaticamente, evitando erros de digitação.
2.  **Histórico de Comandos:** No Windows, use a seta para cima (`↑`) para repetir comandos anteriores. No Linux, use o comando `history` para ver um registro de tudo o que foi digitado.
3.  **Cuidado com permissões de administrador:** No Linux, comandos que alteram o sistema exigem a palavra `sudo` (ex: `sudo apt update`). Use com responsabilidade.
4.  **Documente seus comandos:** Se você criou uma sequência complexa de comandos para resolver um problema, salve em um arquivo de texto para uso futuro.

## 6. Exercício Prático

1.  Abra o terminal (CMD no Windows ou Terminal no Linux/Mac).
2.  Use o comando `pwd` ou `cd` para descobrir onde você está.
3.  Crie uma nova pasta chamada `ExercicioCLI` usando `mkdir`.
4.  Entre na pasta (`cd ExercicioCLI`).
5.  Crie um arquivo de texto (`touch arquivo.txt` no Linux ou `type nul > arquivo.txt` no Windows).
6.  Verifique se o arquivo foi criado (`ls` ou `dir`).
7.  Renomeie o arquivo para `meu_primeiro_script.txt` (use `mv` ou `ren`).
8.  Copie o arquivo (`cp` ou `copy`).
9.  Apague o arquivo original (`rm` ou `del`).
10. Volte para a pasta inicial (`cd ..`) e apague a pasta de exercícios.

---
*Continuação na próxima aula: Automatização e Introdução a Variáveis.*
