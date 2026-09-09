const readlineSync = require("readline-sync");
console.log("========MEDIA DE CINCO MEDIÇOES=========");

let soma = 0;

for (let i = 1; i <= 5; i++) {
  const medicao = readline.questionFloat(`Informe a medição ${i}: `);
  soma += medicao;
}

const media = soma / 5;

console.log(`Soma das medições: ${soma}`);
console.log(`Média final: ${media}`);
