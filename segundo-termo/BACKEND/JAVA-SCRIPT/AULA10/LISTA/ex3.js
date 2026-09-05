const entrada = require('readline-sync');
const alunos = ["Ana", "Bruno", "Carlos", "Diego", "Eduarda", "Fernanda"];

console.log("Lista de alunos:");
console.log(alunos);

console.log(`Primeiro aluno: ${alunos[0]}`);
console.log(`Segundo aluno: ${alunos[1]}`);
console.log(`Terceiro aluno: ${alunos[2]}`);
console.log(`Último aluno: ${alunos[alunos.length - 1]}`);
console.log(`Quantidade de alunos: ${alunos.length}`);

alunos.push("Gabriel");
alunos.push("Heloísa");
alunos.splice(2, 0, "Isabela"); // Adiciona Isabela na posição 2

console.log("\nLista de alunos atualizada:");
console.log(alunos);