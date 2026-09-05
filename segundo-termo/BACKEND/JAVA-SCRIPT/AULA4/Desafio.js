const entrada = require('readline-sync');

const nome = entrada.question("Digite seu o nome:");
const ano_nasc = entrada.questionInt("digite o ano de seu nascimento:");

const idade = (2026 - ano_nasc);

if (idade >=16) {
    console.log(`\nParabens, ${nome}! voce esta apto para votar!`);
} else {
    console.log(`\nSinto muito, ${nome} voce nao esta apto para votar`);
}