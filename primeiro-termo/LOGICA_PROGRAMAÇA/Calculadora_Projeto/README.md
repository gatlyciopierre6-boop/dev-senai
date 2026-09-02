# Calculadora Interativa - Versão Web 2.0

## Descrição

Este projeto é uma calculadora web interativa desenvolvida com **HTML**, **CSS** e **JavaScript puro**. É um excelente exemplo prático para aprender conceitos fundamentais de programação, como manipulação do DOM, tratamento de eventos, validação de entrada, lógica matemática com parser seguro (sem `eval()`), e recursos modernos da web.

## Funcionalidades

A calculadora oferece operações matemáticas básicas e avançadas:

| Operação | Descrição | Tecla |
|----------|-----------|-------|
| **Adição (+)** | Soma dois ou mais números | `+` |
| **Subtração (−)** | Subtrai números | `-` |
| **Multiplicação (×)** | Multiplica números | `*` |
| **Divisão (÷)** | Divide números | `/` |
| **Porcentagem (%)** | Calcula porcentagem do valor | `%` |
| **Raiz Quadrada (√)** | Calcula a raiz quadrada | — |
| **Potência (x²)** | Eleva ao quadrado | — |
| **Ponto Decimal (.)** | Permite cálculos decimais | `.` |
| **Limpeza (C)** | Reseta todo o estado | `Escape` |
| **Deletar (⌫)** | Remove último caractere | `Backspace` |
| **Cálculo (=)** | Executa a operação | `Enter` |

## Novidades da Versão 2.0

- **Parser seguro sem `eval()`**: Usa um parser recursivo descente para avaliar expressões, eliminando riscos de segurança e bugs.
- **Tema claro/escuro**: Alterne entre temas com um clique. Preferência salva no LocalStorage e respeita a preferência do sistema.
- **Histórico de cálculos**: Cada cálculo é salvo e exibido em uma seção de histórico. Clique em um item para reutilizar o resultado.
- **Display de expressão**: Mostra a expressão completa acima do resultado, para melhor acompanhamento visual.
- **Operações avançadas**: Porcentagem, raiz quadrada e potência.
- **Responsividade aprimorada**: Design otimizado para desktop, tablet e celular.
- **Acessibilidade**: Suporte a `prefers-reduced-motion` e foco visível para navegação por teclado.
- **Persistência**: Tema e histórico são mantidos entre sessões usando `localStorage`.

## Suporte a Teclado

| Tecla | Ação |
|-------|------|
| `0-9` | Insere número |
| `+`, `-`, `*`, `/` | Insere operador |
| `.` ou `,` | Insere ponto decimal |
| `%` | Calcula porcentagem |
| `Enter` ou `=` | Calcula o resultado |
| `Backspace` | Deleta último caractere |
| `Escape` | Limpa tudo |

## Estrutura do Projeto

```
Calculadora_Projeto/
├── index.html       # Estrutura HTML semântica
├── style.css        # Estilos com variáveis CSS e tema claro/escuro
├── script.js        # Lógica com parser seguro, histórico e tema
└── README.md        # Este arquivo
```

## Como Usar

1. Abra o arquivo `index.html` em qualquer navegador web moderno.
2. Digite os números clicando nos botões ou usando o teclado.
3. Selecione a operação desejada (básica ou avançada).
4. Pressione "=" ou Enter para calcular o resultado.
5. Use "C" ou Escape para limpar e começar novamente.
6. Alterne o tema clicando no botão de lua/sol no canto superior.

## Conceitos de Programação Abordados

### HTML
- Estrutura semântica com elementos `<button>`, `<input>`, `<header>` e `<div>`
- Atributos `onclick` para eventos de clique
- Uso de `<meta>` para responsividade e charset
- Integração com Google Fonts (Inter)

### CSS
- **Variáveis CSS** (`:root` e `[data-theme]`) para temas dinâmicos
- Layout com **CSS Grid** para organização dos botões
- Gradientes lineares para design moderno
- **Flexbox** para centralização e alinhamento
- Animações (`@keyframes`) e transições suaves
- Media queries para responsividade em dispositivos móveis
- Sombras (`box-shadow`) para profundidade visual
- Suporte a `prefers-reduced-motion` para acessibilidade
- Customização de scrollbar com `::-webkit-scrollbar`

### JavaScript
- **Parser recursivo descente**: Avaliação segura de expressões sem `eval()`
- **Manipulação do DOM**: Acesso e modificação dinâmica de elementos
- **Funções e modularização**: Código organizado em funções específicas
- **Tratamento de Eventos**: Cliques de botões, eventos de teclado e mudança de tema do sistema
- **Validação**: Prevenção de múltiplos pontos decimais, operadores consecutivos e expressões inválidas
- **Tratamento de Erros**: Try-catch para capturar erros de cálculo
- **LocalStorage**: Persistência de tema e histórico entre sessões
- **Comentários e JSDoc**: Código bem documentado

## Exemplos de Uso

**Cálculo básico:**
1. Digite: `5 + 3`
2. Pressione: `=`
3. Resultado: `8`

**Raiz quadrada:**
1. Digite: `144`
2. Pressione: `√`
3. Resultado: `12`

**Porcentagem:**
1. Digite: `50`
2. Pressione: `%`
3. Resultado: `0.5`

## Melhorias Futuras

- Adicionar suporte a parênteses com botões dedicados
- Implementar conversão de unidades (tempo, comprimento, temperatura)
- Adicionar modo científico (sin, cos, tan, log)
- Criar versão com notação polonesa reversa (RPN)
- Adicionar exportação do histórico em CSV

## Autor

Desenvolvido como material educacional para o primeiro termo - Lógica de Programação.

**Jhon Wensky Pierre** - Turma 2devies

## Licença

Este projeto é de código aberto e pode ser utilizado livremente para fins educacionais.
