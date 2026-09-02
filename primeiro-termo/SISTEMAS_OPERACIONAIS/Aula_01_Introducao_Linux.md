# Aula 01: Introdução e Distribuições Linux

## 1. O Papel do Sistema Operacional

O **Sistema Operacional (S.O.)** é o software mais importante de um computador. Ele atua como um gerenciador de recursos, servindo como a interface intermediária entre o hardware (componentes físicos, como processador, memória RAM e disco rígido) e o software aplicativo (programas que usamos, como navegadores e editores de texto).

O sistema operacional é responsável por diversas tarefas críticas que ocorrem nos bastidores, tais como:
*   **Gerenciamento de Processos:** Controla quais programas estão em execução, como eles compartilham o tempo do processador (CPU) e como se comunicam entre si.
*   **Gerenciamento de Memória:** Aloca e libera espaço na memória RAM para os programas, garantindo que não haja conflitos de dados.
*   **Gerenciamento de Arquivos:** Organiza, armazena, recupera e protege os dados em discos rígidos, SSDs ou pen drives.
*   **Gerenciamento de Dispositivos:** Permite que o software interaja com periféricos como mouses, teclados, impressoras e placas de rede através de *drivers*.

> **Analogia Simples:** Se o computador fosse uma empresa, o hardware seriam os prédios e equipamentos, os aplicativos seriam os funcionários de diferentes setores, e o Sistema Operacional seria o CEO (Diretor Executivo) que orquestra tudo para que a empresa funcione.

## 2. O Ecossistema Open Source

Diferente do Windows, que é um sistema proprietário (o código-fonte é fechado e pertence a uma única empresa), o **Linux** é um sistema operacional de código aberto (*Open Source*). Isso significa que o seu código-fonte é público, permitindo que qualquer pessoa visualize, modifique e distribua o sistema.

O Linux foi originalmente criado por Linus Torvalds em 1991. Desde então, ele se tornou a base para inúmeras versões, conhecidas como **distribuições** (ou *distros*). Uma distribuição é uma versão empacotada do kernel Linux (o núcleo do sistema) combinada com ferramentas, gerenciadores de janelas e aplicativos.

### Principais Distribuições Linux

Existem centenas de distribuições Linux, cada uma voltada para um público ou propósito específico. As três mais populares e relevantes para o estudo de fundamentos de TI são:

| Distribuição | Base | Características e Público-Alvo |
| :--- | :--- | :--- |
| **Ubuntu** | Debian | Famosa por ser amigável, estável e com uma vasta comunidade. É a porta de entrada mais comum para iniciantes no mundo Linux. |
| **Debian** | Independente | Conhecida pela extrema estabilidade e aderência rigorosa aos princípios do software livre. É a base do Ubuntu e de muitas outras distros. |
| **Fedora** | Independente | Mantida pela comunidade (patrocinada pela Red Hat). Foca em inovação e tecnologia de ponta, introduzindo recursos novos antes de chegarem ao mercado corporativo. |

## 3. Diferenças Fundamentais: Windows vs. Linux

Compreender as diferenças entre os dois principais ecossistemas operacionais é crucial para qualquer profissional de TI.

*   **Arquitetura de Arquivos:** O Windows utiliza letras de drive (ex: `C:\`, `D:\`). O Linux utiliza uma única árvore hierárquica que começa no diretório raiz, representado pela barra `/` (ex: `/home/usuario/documentos`).
*   **Licenciamento e Custo:** O Windows requer a compra de uma licença comercial. O Linux é gratuito para baixar e usar.
*   **Consola de Comandos:** O Windows utiliza o *Command Prompt* (CMD) e o *PowerShell*. O Linux utiliza terminais como o **Bash** (Bourne Again Shell), que são extremamente poderosos para automação.
*   **Instalação de Programas:** No Windows, geralmente baixamos um arquivo `.exe` de um site. No Linux, usamos gerenciadores de pacotes (como `apt` ou `dnf`) que baixam e instalam o software de repositórios seguros com um único comando.

## 4. Exercício Prático

1.  Acesse o site oficial do **Ubuntu** ou **Fedora**.
2.  Baixe a imagem ISO da versão mais recente (Desktop).
3.  Utilize um software como o **Rufus** ou **BalenaEtcher** para gravar a imagem em um pen drive.
4.  Teste o sistema no modo *Live USB* (sem instalar, apenas para testar a interface e os programas pré-instalados).

---
*Continuação na próxima aula: Operação e Configuração do Windows.*
