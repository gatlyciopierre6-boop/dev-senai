function calculaOrcamento (precoPeca, horasTrabalho) {
    const valorHora = 85.00;
    const totalMaoDeObra = horasTrabalho * valorHora;
    return precoPeca + totalMaoDeObra;
}

function verificarGarantia(meses) {
    if (meses <=3) {
        return "Dentro da Garantia";
    }else {
        return "Fora da Garantia";
    }
}

//para  a desconto criamos uma nova funçao
// o return garante a execucao do calculo e envio para o programa principal 
function valorDesconto(valorTotal) {
    return valorTotal * 0.80;
}

module.exports = {
    calculaOrcamento,
    verificarGarantia,
    valorDesconto
};
