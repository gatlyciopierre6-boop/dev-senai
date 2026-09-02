const entrada = require("readline-sync");

console.log("----SISTEMA DE ANALISE DE CREDITO----");

const nome = entrada.question("Nome do cliente:"); 
const idade = entrada.questionInt("idade:");
const renda = entrada.questionFloat("renda mensal:");
const temimovel = entrada.keyInYNStrict("possui imovel proprio ?");

// a logica combinada
// idade >=18) é obrigatorio
// (renda >= 2500 temimovel === true) um dos dois tem que ser verdade

if (idade >= 18 && (renda >= 2500 || temimovel === true)) {
    console.log(`\nPARABENS, ${nome}! Seu credito foi APROVADO!`);
} else {
    console.log(`\nsinto muito, ${nome}. Seu credito foi NEGADO.`);
}
