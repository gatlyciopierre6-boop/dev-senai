const entrada = require("readline-sync");

console.log("=== REGISTRO DE TEMPERATURAS ===");

// Cria um array vazio
const temperaturas = [];

// Pergunta quantas temperaturas serão registradas
const quantidade = entrada.questionInt(
    "Quantas temperaturas deseja registrar? "
);

// Repete de acordo com a quantidade informada
for (let i = 0; i < quantidade; i++) {

    let temperatura = entrada.questionFloat(
        `Temperatura ${i + 1}: `
    );

    // Adiciona a temperatura no array
    temperaturas.push(temperatura);
}

console.log("\n--- RELATORIO ---");

// Mostra todas as temperaturas
console.log(
    `Temperaturas registradas: ${temperaturas.join(" °C | ")} °C`
);

console.log(`quantidade de temperaturas registradas: ${temperaturas.length}`);
console.log(`a primeira temperatura registrada foi: ${temperaturas[0]} °C`);
console.log(`a última temperatura registrada foi: ${temperaturas[temperaturas.length - 1]} °C`);
console.log(`a maior temperatura registrada foi: ${Math.max(...temperaturas)} °C`);