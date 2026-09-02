# Aula 05: Fundamentos de Segurança Cibernética

## 1. A Importância da Segurança no Sistema Operacional

A segurança cibernética não é apenas uma camada de software adicional (como um antivírus), mas um conjunto de práticas, configurações e políticas que devem ser integradas ao dia a dia da administração de qualquer sistema operacional. 

O sistema operacional é o guardião dos recursos do computador. Se ele for comprometido, o invasor (hacker ou malware) ganha controle total sobre o hardware, a rede e os dados sensíveis armazenados. Portanto, a **proteção ativa** é a chave para manter a integridade do sistema.

## 2. Firewalls: A Primeira Linha de Defesa

Um **Firewall** (parede de fogo) é um sistema de segurança que monitora e controla o tráfego de rede de entrada e saída com base em regras de segurança predefinidas. Ele atua como uma barreira entre o seu computador (ou rede interna) e a internet (ou outras redes não confiáveis).

Existem dois tipos principais de firewall no contexto de sistemas operacionais:
1.  **Firewall de Software (Host-based):** Integrado ao S.O. (como o Firewall do Windows Defender ou o `ufw` no Linux). Protege a máquina individual.
2.  **Firewall de Hardware (Network-based):** Dispositivo físico (como roteadores de empresas) que protege toda a rede.

### Configuração e Boas Práticas
A maioria dos usuários domésticos não precisa configurar regras complexas, pois os firewalls modernos são inteligentes. No entanto, é fundamental:
*   **Mantê-lo ativo:** Nunca desative o firewall do sistema a menos que saiba exatamente o que está fazendo.
*   **Monitorar alertas:** Quando um firewall bloqueia uma conexão inesperada, investigue qual programa está tentando acessar a rede.
*   **Regras de Saída (Outbound Rules):** Muitos malwares enviam seus dados roubados para servidores externos. Configurar o firewall para bloquear programas desconhecidos de acessar a internet (regras de saída) é uma prática avançada e segura.

## 3. Controle de Malware e Antivírus

**Malware** (Malicious Software) é um termo guarda-chuva para qualquer software criado para causar danos, extorquir dados ou obter acesso não autorizado. Exemplos incluem vírus, trojans, ransomware e spyware.

Os Sistemas Operacionais modernos já vêm equipados com soluções robustas de defesa:
*   **Windows:** O **Windows Defender** (agora chamado Microsoft Defender) é altamente eficaz e leve. Ele escaneia arquivos em tempo real, atualiza suas assinaturas automaticamente e inclui proteções contra *ransomware*.
*   **Linux:** Embora o Linux seja historicamente mais seguro devido à sua arquitetura e menor parcela de mercado, ele não é imune. Ferramentas como `ClamAV` (antivírus de linha de comando) e boas práticas de permissão de arquivos são essenciais.

### Como se Proteger:
1.  **Atualize sempre:** Tanto o S.O. quanto o antivírus precisam das atualizações mais recentes para reconhecer novas ameaças.
2.  **Escaneios regulares:** Programe escaneamentos completos do sistema periodicamente.
3.  **Cuidado com as fontes:** Nunca baixe executáveis (`.exe` no Windows ou scripts `.sh` no Linux) de sites não confiáveis.
4.  **Desconfie de anexos:** O e-mail continua sendo o principal vetor de infecção por malware em ambientes corporativos.

## 4. Princípio do Privilégio Mínimo

O **Princípio do Privilégio Mínimo** (ou Princípio do Menor Privilégio) é um conceito fundamental em segurança da informação e administração de sistemas. Ele afirma que qualquer usuário, programa ou processo deve ter acesso apenas às informações e recursos estritamente necessários para desempenhar sua função legítima.

### Na Prática:

*   **Uso do Usuário Padrão:** O maior erro de segurança é usar o computador diário com uma conta de *Administrador* (root no Linux). Se você for infectado com um vírus enquanto estiver logado como Administrador, o vírus herda esses privilégios e pode destruir o sistema inteiro.
    *   *Regra:* Navegue na internet e use programas normais com uma conta **Padrão**. Só use a conta de Administrador quando precisar instalar um programa ou fazer uma configuração crítica.
    
*   **Controle de Acesso a Arquivos:** Como vimos na Aula 02, o sistema de arquivos do Windows (NTFS) e do Linux permitem restringir quem pode ler ou modificar um arquivo. Aplique o princípio do privilégio mínimo para que um setor financeiro não tenha acesso à pasta de TI, por exemplo.

*   **Configuração de Serviços:** Se um serviço do Windows ou do Linux (como um servidor web) não precisa acessar todo o sistema, ele deve ser configurado para rodar com permissões limitadas.

## 5. Autenticação Forte

A segurança também começa no momento do login. Senhas fracas são a porta de entrada para 80% das invasões.
*   **Senhas Fortes:** Devem ter mais de 12 caracteres, combinando letras maiúsculas, minúsculas, números e símbolos.
*   **Autenticação de Dois Fatores (2FA):** Sempre que possível, ative a 2FA. Mesmo que roubem sua senha, não conseguirão acessar sua conta sem o segundo fator (como um código no seu celular).
*   **Gerenciadores de Senhas:** Use ferramentas para gerar e armazenar senhas complexas e únicas para cada serviço.

## 6. Exercício Prático: Auditoria Básica

1.  **Windows:** Vá em Configurações > Atualização e Segurança > Central de Segurança do Windows. Verifique se as proteções contra vírus e ameaças estão ativas e se o firewall está ligado.
2.  **Linux:** Abra o terminal e digite `sudo ufw status` para verificar se o firewall (se instalado) está ativo. Digite `whoami` para ver se você está logado como root. Tente usar `sudo su` e observe o alerta de segurança do sistema.
3.  **Geral:** Acesse um site de verificação de senhas (como o *Have I Been Pwned*) e verifique se algum de seus e-mails já foi vazado em algum ataque.

---
*Fim do módulo de Sistemas Operacionais e Fundamentos de TI.*
