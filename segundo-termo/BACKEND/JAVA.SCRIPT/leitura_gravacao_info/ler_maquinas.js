const fs = require('fs');
console.log("==== SISTEMA DE LEITURA DE INFORMACOES==== ")

const nomeDoArquivo = "maquinas.json";

if (!fs.existsSync(nomeDoArquivo)) {
    console.error(`ERRO: o arquivo '${nomeDoArquivo}' nao foi encontrado`);
    process.exit(1);
}

const conteudoTexto = fs.readFileSync(nomeDoArquivo, 'utf-8');
const maquinasRecuperadas = JSON.parse(conteudoTexto);

console.log("dados carregados com sucesso");
console.table(maquinasRecuperadas);

console.log(`\ntotal de maquinas cadastradas: ${maquinasRecuperadas.length}`);
console.log(`primeira maquina da lista: ${maquinasRecuperadas[0].nome}`);
