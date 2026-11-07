// CARROSSEL DO BANNER PROMOCIONAL
// Este carrossel fica exatamente no espaço do antigo banner-promocional.

const faixaBanner = document.querySelector(".faixa-banner");
const imagensBanner = document.querySelectorAll(".faixa-banner img");
const anteriorBanner = document.querySelector(".anterior-banner");
const proximoBanner = document.querySelector(".proximo-banner");
const indicadoresBanner = document.querySelectorAll(".indicador-banner");

let bannerAtual = 0;

function mostrarBanner(indice) {
    bannerAtual = indice;

    // Move a faixa para exibir somente o banner selecionado.
    faixaBanner.style.transform = `translateX(-${bannerAtual * 100}%)`;

    // Destaca o indicador do banner que está aparecendo.
    indicadoresBanner.forEach(function (indicador, posicao) {
        indicador.classList.toggle("ativo", posicao === bannerAtual);
    });
}

proximoBanner.addEventListener("click", function () {
    bannerAtual++;

    if (bannerAtual >= imagensBanner.length) {
        bannerAtual = 0;
    }

    mostrarBanner(bannerAtual);
});

anteriorBanner.addEventListener("click", function () {
    bannerAtual--;

    if (bannerAtual < 0) {
        bannerAtual = imagensBanner.length - 1;
    }

    mostrarBanner(bannerAtual);
});

// Permite clicar nos pontinhos para escolher um banner.
indicadoresBanner.forEach(function (indicador, indice) {
    indicador.addEventListener("click", function () {
        mostrarBanner(indice);
    });
});


// ------------------------------------------------------------
// Melhorias de acabamento
// ------------------------------------------------------------

// Passa os banners sozinho a cada 6 segundos (pausa ao passar o mouse
// e não roda para quem prefere menos movimento).
const reduzirMovimento = window.matchMedia("(prefers-reduced-motion: reduce)").matches;
const carrossel = document.querySelector(".carrossel-banner");
let temporizador = null;

function iniciarAutoplay() {
    if (reduzirMovimento || temporizador) return;
    temporizador = setInterval(function () {
        mostrarBanner((bannerAtual + 1) % imagensBanner.length);
    }, 6000);
}

function pararAutoplay() {
    clearInterval(temporizador);
    temporizador = null;
}

if (carrossel) {
    carrossel.addEventListener("mouseenter", pararAutoplay);
    carrossel.addEventListener("mouseleave", iniciarAutoplay);
    carrossel.addEventListener("focusin", pararAutoplay);
    carrossel.addEventListener("focusout", iniciarAutoplay);
    iniciarAutoplay();
}

// Se uma imagem externa não carregar, usa uma imagem do próprio projeto
// em vez de mostrar o ícone de imagem quebrada.
function aplicarFallback(img) {
    if (img.dataset.fallbackAplicado) return;
    img.dataset.fallbackAplicado = "true";

    if (img.dataset.fallback) {
        img.src = img.dataset.fallback;
    } else if (img.closest(".faixa-banner")) {
        img.src = "../img/logo-apresentacao.jpg";
    } else if (img.closest(".card")) {
        img.src = "../img/LogoPizza.png";
        img.classList.add("imagem-reserva");
    }
}

document.querySelectorAll("main img").forEach(function (img) {
    img.addEventListener("error", function () { aplicarFallback(img); });
    if (img.complete && img.naturalWidth === 0) aplicarFallback(img);
});
