const readline = require('readline-sync');
console.log("======VERIFICADOR DE VOTAÇÃO======")
const nome = entrada.question('Digite seu nome: ');
const anoNascimento = entrada.questionInt(`Digite o ano do seu nascimento:`)

const anoAtual = new Date().getFullYear();
const idade = anoAtual - anoNascimento;

console.log(`${nome}, você tem ${idade} anos.`);
if (idade >= 16) {
    console.log('Você já tem idade mínima para votar!');
} else {
    console.log('Você ainda não pode votar.');
}