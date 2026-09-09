const readline = require("readline");
console.log("========TABELA DE PRODUÇÃO========")
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.question("Quantas peças a máquina produz por ciclo? ", (resposta) => {
  const pecasPorCiclo = Number(resposta);
  let producaoAcumulada = 0;

  for (let ciclo = 1; ciclo <= 10; ciclo++) {
    producaoAcumulada += pecasPorCiclo;
    console.log(`Ciclo ${ciclo}: produção acumulada de ${producaoAcumulada} peças`);
  }

  rl.close();
});
