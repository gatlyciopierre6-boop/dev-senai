const fs = require('fs');

const amostrasColetadas = [12.1, 12.3, 11.9, 12.0];

// O lote só é aprovado quando todas as amostras atendem ao mínimo de 12.0 mm.
const loteAprovado = amostrasColetadas.every((amostra) => amostra >= 12.0);

const relatorioInspecao = {
  data: '2026-09-23',
  inspetor: 'Carlos Eduardo',
  amostras: amostrasColetadas,
  loteAprovado
};

fs.writeFileSync(
  'inspecao_qualidade.json',
  JSON.stringify(relatorioInspecao, null, 2)
);

console.log('=== RELATÓRIO DE QUALIDADE GERADO ===');
console.log(`Status do Lote: ${loteAprovado ? 'APROVADO' : 'REPROVADO'}`);
console.log("Arquivo 'inspecao_qualidade.json' gravado em disco.");
