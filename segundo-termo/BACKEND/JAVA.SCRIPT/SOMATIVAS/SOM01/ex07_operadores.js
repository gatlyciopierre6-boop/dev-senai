const readline = require("readline-sync");
console.log("=========LISTA DE OPERADORES==========");
const operadores = [];

for (let i = 1; i <= 5; i++) {
  const nome = readline.question(`Nome do operador ${i}: `);
  operadores.push(nome);
}

console.log("\nEquipe cadastrada:");
for (let i = 0; i < operadores.length; i++) {
  console.log(`${i + 1} - ${operadores[i]}`);
}
