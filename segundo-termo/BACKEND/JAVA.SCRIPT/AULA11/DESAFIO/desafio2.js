const readline = require('readline-sync');

const valorConta = parseFloat(readline.question('Digite o valor total da conta (R$): '));

if (valorConta > 100) {
    const valorComDesconto = valorConta * 0.90;
    console.log(`Desconto aplicado! Valor final: R$ ${valorComDesconto.toFixed(2)}`);
} else {
    console.log(`Valor total a pagar: R$ ${valorConta.toFixed(2)}`);
}