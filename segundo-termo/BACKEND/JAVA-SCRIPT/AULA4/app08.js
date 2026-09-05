const entrada = require("readline-sync");
console.log("----RADAR----");

const nome = entrada.question ("Nome do motorista: ");
const velocidade = entrada.questionFloat("Digite sua velocidade em km/h: ");

if (velocidade >= 80) {
    console.log(`Sinto muito, ${nome}. Você ultrapassou a velocidade máxima e foi multado.`);
} else {
    console.log(`Muito bem, ${nome}! Você pode continuar a sua viagem!`);
}
