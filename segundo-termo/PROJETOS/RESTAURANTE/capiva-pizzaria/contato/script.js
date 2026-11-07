// Página de Contato — formulário de mensagem

const formContato = document.getElementById("form-contato");
const avisoEnvio = document.getElementById("ok");

formContato.addEventListener("submit", function (evento) {
    evento.preventDefault();

    avisoEnvio.hidden = false;
    avisoEnvio.scrollIntoView({ behavior: "smooth", block: "center" });
    formContato.reset();
});

// Se a foto externa não carregar, mostra a logo em vez do ícone quebrado.
document.querySelectorAll("#sobre img").forEach(function (img) {
    function usarLogo() {
        if (img.dataset.fallback) return;
        img.dataset.fallback = "true";
        img.src = "../img/LogoPizza.png";
        img.classList.add("sem-foto");
    }
    img.addEventListener("error", usarLogo);
    if (img.complete && img.naturalWidth === 0) usarLogo();
});
