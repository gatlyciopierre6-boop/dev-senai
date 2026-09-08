const entrada = require(`readline-sync`)
const oficina = require(`./funcoesOficina`);

console.log("====== SISTEMA DE GESTAO DE OFICNA 1.0 ======")

const peca = entrada.questionFloat("Preco da peca: R$ ");
const horas = entrada.questionInt("Horas de servico: ");
const tempoUso = entrada.questionInt("Meses desde o ultimo conserto: ");

const total = oficina.calculaOrcamento(peca,horas);
const Garantia = oficina.verificarGarantia(tempoUso);

//aplica 20% de desconto
const totalComDesconto = oficina.valorDesconto(total);

console.log("\n---- RELATORIO DE SERVIÇO ----");
console.log(`Orcamento total: R$ ${total.toFixed(2)}`);
console.log(`orcamento com desconto de (20%):   R$ ${totalComDesconto.toFixed(2)}`);
console.log(`TOTAL A PAGAR:   R$ ${totalComDesconto.toFixed(2)}`);
console.log(`Garantia:           ${Garantia}`);
console.log("-------------------------------");
