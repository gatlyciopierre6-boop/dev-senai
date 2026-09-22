const readline = require("readline-sync");

function calcularAproveitamento(util, total) {
    return (util / total) * 100;
}

function classificarAproveitamento(percentual) {

    if (percentual >= 90) {
        return "EXCELENTE";
    } else if (percentual >= 75) {
        return "ADEQUADO";
    } else {
        return "REVISAR PROCESSO";
    }
}

let total = readline.questionInt("Quantidade total: ");
let util = readline.questionInt("Quantidade util: ");

let percentual = calcularAproveitamento(util, total);
let classificacao = classificarAproveitamento(percentual);

console.log("\nTotal: " + total);
console.log("Quantidade util: " + util);
console.log("Percentual: " + percentual.toFixed(2) + "%");
console.log("Classificacao: " + classificacao);
