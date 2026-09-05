const entrada = require('readline-sync');

console.log("-----------------------------");
console.log("   CALCULADORA DE IMC        ");
console.log("-----------------------------\n");

const nome = entrada.question("Qual o seu nome? ");
const peso = entrada.questionFloat("Digite o seu peso (ex: 70.50): ");
const altura = entrada.questionFloat("Digite sua altura (ex: 1.75): ");

if (!Number.isFinite(peso) || peso <= 0) {
    throw new Error("O peso deve ser um número maior que zero.");
}

if (!Number.isFinite(altura) || altura <= 0) {
    throw new Error("A altura deve ser um número maior que zero.");
}

const imc = peso / (altura * altura);

console.log("\n-------------------------------");
console.log(`olá, ${nome}!`);
console.log(`seu peso: ${peso} kg`);
console.log(`Sua altura: ${altura} m`);

let classificacao;

if (imc < 18.5) {
    classificacao = "Abaixo do peso";
} else if (imc < 25) {
    classificacao = "Peso normal";
} else if (imc < 30) {
    classificacao = "Sobrepeso";
} else {
    classificacao = "Obesidade";
}

console.log(`Seu IMC calculado é: ${imc.toFixed(2)}`);
console.log(`Classificação: ${classificacao}`);
console.log("----------------------------");
