const entrada = require("readline-sync");

const nome = entrada.question("nome do aluno: ");
const n1 = entrada.questionFloat("nota 1: ");
const n2 = entrada.questionFloat("nota 2: ");

const media = (n1 + n2) / 2;

console.log(`\nmedia final de ${nome}: ${media.toFixed(1)}`);

if (media >= 7) {
    console.log("SITUACAO: APROVADO!");
} else if (media >= 5 && media < 7) {
    console.log("SITUACAO: RECUPERACAO");
} else {
    console.log("SITUACAO: REPROVADO ");
}