const readline = require("readline-sync");

console.log("==========PEDIDO DE MATERIA PRIMA============");

const nomeMaterial = readline.question("Nome do material: ");
const quantidade = readline.questionInt("Quantidade comprada: ");
const precoUnitario =readline.questionFloat("Preco unitario: ");
const valorTotal = quantidade * precoUnitario;

console.log("\n--- Resumo da compra ---");
console.log(`Material: ${nomeMaterial}`);
console.log(`Quantidade: ${quantidade}`);
console.log(`Preço unitário: R$ ${precoUnitario.toFixed(2)}`);
console.log(`Valor total: R$ ${valorTotal.toFixed(2)}`);
