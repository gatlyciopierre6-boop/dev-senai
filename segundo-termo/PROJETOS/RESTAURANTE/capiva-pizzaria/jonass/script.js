// Página de detalhe do prato — interações

// ---------- Mensagens de retorno (sem recarregar a página) ----------
function mostrarMensagem(elemento, texto, erro) {
    elemento.textContent = texto;
    elemento.classList.toggle("retorno-erro", Boolean(erro));
    elemento.classList.toggle("retorno-ok", !erro);
}

// ---------- Promoção e finalização do pedido ----------
const botaoParticipar = document.getElementById("participar");
const botaoFinalizar = document.getElementById("finalizar");
const retornoPedido = document.getElementById("retornoPedido");

botaoParticipar.addEventListener("click", function () {
    document.getElementById("tamanho-pizza").scrollIntoView({ behavior: "smooth", block: "center" });
});

botaoFinalizar.addEventListener("click", function () {
    const tamanho = document.querySelector('input[name="tamanho"]:checked');

    if (!tamanho) {
        mostrarMensagem(retornoPedido, "Escolha o tamanho da pizza (P, M ou G) para finalizar.", true);
        return;
    }

    mostrarMensagem(
        retornoPedido,
        "Pedido registrado: pizza de calabresa, tamanho " + tamanho.value + ". Obrigado!",
        false
    );
});

// ---------- Cancelamento do pedido ----------
const abrir = document.getElementById("abrir");
const confirma = document.getElementById("confirma");
const cancelar = document.getElementById("cancelar");
const confirmar = document.getElementById("confirmar");
const retornoCancelamento = document.getElementById("retornoCancelamento");

abrir.addEventListener("click", () => {
    confirma.showModal();
});

cancelar.addEventListener("click", () => {
    confirma.close();
});

confirmar.addEventListener("click", () => {
    confirma.close();
    mostrarMensagem(retornoCancelamento, "Pedido cancelado.", false);
});

// ---------- Formulário de avaliação ----------
document.getElementById("formAvaliacao").addEventListener("submit", function (evento) {
    evento.preventDefault();

    const nome = document.getElementById("nome").value.trim();
    mostrarMensagem(
        document.getElementById("retornoAvaliacao"),
        "Obrigado pela avaliação, " + nome + "!",
        false
    );
    this.reset();
});

// ---------- Formulário de reclamação ----------
document.getElementById("formProblema").addEventListener("submit", function (evento) {
    evento.preventDefault();

    const numero = document.getElementById("numeroPedido").value.trim();
    mostrarMensagem(
        document.getElementById("retornoProblema"),
        "Recebemos o relato do pedido " + numero + ". Nossa equipe vai analisar.",
        false
    );
    this.reset();
});

// ---------- Imagens externas: usa a logo se alguma não carregar ----------
function usarLogo(img) {
    if (img.dataset.fallback) return;
    img.dataset.fallback = "true";
    img.src = "../img/LogoPizza.png";
    img.classList.add("sem-foto");
}

document.querySelectorAll("main img").forEach(function (img) {
    img.addEventListener("error", function () { usarLogo(img); });
    if (img.complete && img.naturalWidth === 0) usarLogo(img);
});
