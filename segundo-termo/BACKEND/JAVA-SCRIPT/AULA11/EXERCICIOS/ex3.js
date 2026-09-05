const entrada = require ("readline-sync")
function CalcularMedia(n1, n2) {
    return (n1 + n2) / 2;
}

const numero1 = entarada.questionInt("qual sua nota 1?")
const numero2 = entarada.questionInt("qual sua nota 2?")
const resultado = CalcularMedia(numero1, numero2)
console.log(`A media calculada foi: ${resultado}`);