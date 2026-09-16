const entrada = require('readline-sync');

const Temperatura = entrada.questionFloat("Digite a temperatura:  ")

let Situacao;

if (Temperatura <= 60) {
    Situacao = "NORMAL"
} else if (Temperatura <= 80) {
    Situacao = "ATENCAO"
} else {
    Situacao = "CRITICA"
}

console.log(`Temperatura: ${Temperatura}°C`);
console.log(`Situacao: ${Situacao}`);