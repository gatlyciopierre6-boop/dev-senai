const entrada = require('readline-sync');

const produto = entrada.question("Qual o nome do produto: ");
const qtd_Porhora = entrada.questionInt("Quantas pecas sao produzidas por hora: ");
const horas = entrada.questionFloat("Digite a quantidade de horas trabalhadas:  ");

const calculo = qtd_Porhora * horas;

console.log("========= Relatorio De Produção ========");
console.log(`Produto: ${produto}`);
console.log(`Producao por hora: ${qtd_Porhora} por hora`);
console.log(`Horas trabalhadas: ${horas} horas`);
console.log(`Total de pecas produzidas: ${calculo} pecas`);
