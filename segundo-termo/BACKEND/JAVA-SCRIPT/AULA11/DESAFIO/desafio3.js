const readline = require('readline-sync');

console.log("====Álcool ou Gasolina?=====")

const precoAlcool = entrada.questionFloat('Digite o preço do litro do álcool (R$): ');
const precoGasolina = entrada.questionFloat('Digite o preço do litro da gasolina (R$):');

const razao = precoAlcool / precoGasolina;

if (razao < 0.7) {
    console.log('Abasteça com ÁLCOOL');
} else {
    console.log('Abasteça com GASOLINA');
}