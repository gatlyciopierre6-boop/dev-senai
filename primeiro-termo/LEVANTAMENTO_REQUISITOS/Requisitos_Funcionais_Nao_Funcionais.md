# Requisitos Funcionais e Não Funcionais

## Introdução
No desenvolvimento de software, a clareza e a precisão na definição dos requisitos são cruciais para o sucesso de um projeto. Os requisitos são as descrições das necessidades, condições ou capacidades que um sistema deve possuir para satisfazer um contrato, padrão, especificação ou outro documento formalmente imposto. Eles são categorizados principalmente em Requisitos Funcionais e Requisitos Não Funcionais.

## Requisitos Funcionais (RF)

Os **Requisitos Funcionais** descrevem o comportamento do sistema, ou seja, *o que* o sistema deve fazer. Eles especificam as funções que o sistema deve executar para que os usuários possam realizar suas tarefas. Geralmente, são expressos em termos de ações, entradas, saídas e o comportamento do sistema em resposta a eventos específicos.

### Exemplos de Requisitos Funcionais:

*   O sistema deve permitir que o usuário faça login com nome de usuário e senha.
*   O sistema deve gerar um relatório de vendas diárias.
*   O sistema deve permitir o cadastro de novos produtos com nome, descrição, preço e estoque.
*   O sistema deve enviar uma notificação por e-mail ao usuário quando um pedido for despachado.
*   O sistema deve permitir a busca de produtos por categoria.

## Requisitos Não Funcionais (RNF)

Os **Requisitos Não Funcionais** descrevem as características de qualidade do sistema, ou seja, *como* o sistema deve se comportar. Eles impõem restrições sobre as funções do sistema e definem critérios de desempenho, segurança, usabilidade, confiabilidade, entre outros. Embora não descrevam diretamente as funcionalidades, são igualmente importantes, pois afetam a experiência do usuário e a aceitação do sistema.

### Categorias Comuns de Requisitos Não Funcionais:

| Categoria | Descrição | Exemplos |
| :--- | :--- | :--- |
| **Desempenho** | Velocidade, tempo de resposta, taxa de transferência. | O sistema deve carregar as páginas em menos de 2 segundos. O sistema deve suportar 1000 usuários simultâneos. |
| **Segurança** | Proteção contra acessos não autorizados, integridade dos dados. | O sistema deve criptografar as senhas dos usuários. O sistema deve registrar todas as tentativas de login falhas. |
| **Usabilidade** | Facilidade de uso, aprendizado e satisfação do usuário. | A interface do usuário deve ser intuitiva e de fácil navegação. O sistema deve fornecer mensagens de erro claras. |
| **Confiabilidade** | Capacidade de operar sem falhas por um período de tempo. | O sistema deve estar disponível 99,9% do tempo. O sistema deve se recuperar de falhas em menos de 5 minutos. |
| **Manutenibilidade** | Facilidade de modificação e correção de erros. | O código-fonte deve ser modular e bem documentado. |
| **Portabilidade** | Capacidade de operar em diferentes ambientes. | O sistema deve ser compatível com navegadores Chrome, Firefox e Edge. |
| **Escalabilidade** | Capacidade de lidar com o aumento da carga de trabalho. | O sistema deve ser capaz de escalar horizontalmente para atender a um aumento de 50% no número de usuários. |

## Diferenças Chave

| Característica | Requisitos Funcionais | Requisitos Não Funcionais |
| :--- | :--- | :--- |
| **O que descreve?** | O que o sistema *faz*. | Como o sistema *funciona* ou suas qualidades. |
| **Foco** | Funcionalidades e serviços. | Atributos de qualidade, restrições e desempenho. |
| **Natureza** | Baseado nas necessidades do usuário e do negócio. | Baseado nas expectativas de qualidade e restrições técnicas. |
| **Verificação** | Testes de aceitação, casos de uso. | Testes de desempenho, segurança, usabilidade. |
| **Impacto** | Afeta diretamente a utilidade do sistema. | Afeta a experiência do usuário e a aceitação do sistema. |

## Conclusão

Ambos os tipos de requisitos são essenciais para o desenvolvimento de um sistema de software bem-sucedido. Os requisitos funcionais garantem que o sistema atenda às necessidades de negócio, enquanto os requisitos não funcionais asseguram que o sistema seja robusto, seguro, eficiente e agradável de usar. Um levantamento de requisitos eficaz deve abordar e documentar ambos os tipos de forma clara e inequívoca.
