const readline = require("readline");
console.log("=========CLASSIFICACAO DE TEMPERATURA==============");
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

rl.question("Informe a temperatura da máquina em (°C): ", (resposta) => {
  const temperatura = Number(resposta);
  let situacao;

  if (temperatura <= 60) {
    situacao = "NORMAL";
  } else if (temperatura <= 80) {
    situacao = "ATENÇÃO";
  } else {
    situacao = "CRÍTICA";
  }

  console.log(`Temperatura: ${temperatura} °C`);
  console.log(`Situação: ${situacao}`);
  rl.close();
});
