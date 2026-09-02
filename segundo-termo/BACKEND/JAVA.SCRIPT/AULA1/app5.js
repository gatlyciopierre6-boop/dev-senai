const entrada = require('readline-sync');

console.log("-----Sistema de Vendas Padaria-----");

const nomeProduto = entrada.question("Qual o nome do produto? ");
const precoUnitario = entrada.questionFloat("Qual o preço unitário? ");
const quantidade = entrada.questionInt("Quantas unidades foram vendidas? ");

if (!Number.isFinite(precoUnitario) || precoUnitario < 0) {
    throw new Error("O preço unitário deve ser um número maior ou igual a zero.");
}

if (!Number.isInteger(quantidade) || quantidade < 0) {
    throw new Error("A quantidade deve ser um número inteiro maior ou igual a zero.");
}

const total = precoUnitario * quantidade;

console.log("\n-----RECIBO DE VENDA-----");
console.log(`Produto: ${nomeProduto}`);
console.log(`Quantidade de produtos: ${quantidade}`);
console.log(`Total a pagar: R$ ${total.toFixed(2)}`);


