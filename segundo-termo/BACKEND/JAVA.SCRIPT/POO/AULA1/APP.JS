// Vetor original
const ingredientes = ["queijo", "tomate", "cebola", "açúcar"];

// Função para capitalizar (primeira letra maiúscula)
function capitalizar(lista) {
let modificado = [];
for (let i = 0; i < lista.length; i++) {
let texto = lista[i];
modificado.push(texto.charAt(0).toUpperCase() + texto.slice(1));
}
return modificado;
}

// Função para ordenar (considerando acentos)
function ordenar(lista) {
return lista.sort(function(a, b) {
return a.localeCompare(b);
});
}

// Execução e aplicação das responsabilidades
const resultadoCapitalizado = capitalizar(ingredientes);
const resultadoOrdenado = ordenar(resultadoCapitalizado);

console.log(resultadoCapitalizado);
console.log(resultadoOrdenado);