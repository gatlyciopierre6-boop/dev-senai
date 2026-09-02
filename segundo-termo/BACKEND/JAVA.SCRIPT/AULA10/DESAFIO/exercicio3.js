const entrda = require('readline-sync');
console.log("===Controle de Qualidade: Pesagem de Peças===")

const pesos = [];
let somaTotal = 0

const quantidade = entrda.questionInt("Quantas peças deseja registrar? ");

for (let i = 0; i < quantidade; i++) {
    let peso = entrda.questionFloat(`Digite o peso da peça ${i + 1} (kg): `);
    pesos.push(peso);
    somaTotal += peso;
}  
media = somaTotal / quantidade;

console.log("\n--- Relatório da Auditoria ---");
console.log(`Pesos registrados: [ ${pesos.join(" kg ")} kg ]`);
console.log(`Média de peso do lote: ${media.toFixed(2)} kg`);