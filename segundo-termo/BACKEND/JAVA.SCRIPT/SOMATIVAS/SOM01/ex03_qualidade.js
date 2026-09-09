const readline = require("readline-sync")
console.log("======PEÇA APROVADA OU REPROVADA========");

const peso = readline.questionFloat('informe o peso da peca em (g):');

if (peso >= 95 && peso <= 105) {
    console.log("PEÇA APROVADA");
  } else {
    console.log("PEÇA REPROVADA");
  }

  console.log(`Peso informado: ${peso} g`);