// Cardápio — filtro por categoria
(function () {
  var botoes = document.querySelectorAll('nav[aria-label="Filtros do cardápio"] button');
  var secoes = document.querySelectorAll('section.lista');

  function mostrar(cat) {
    var existe = false;
    secoes.forEach(function (s) {
      var ativa = s.id === cat;
      if (ativa) existe = true;
      s.classList.toggle('ativo', ativa);
    });
    if (!existe) return false;

    botoes.forEach(function (b) {
      var ativo = b.dataset.cat === cat;
      b.classList.toggle('ativo', ativo);
      b.setAttribute('aria-pressed', ativo ? 'true' : 'false');
    });
    return true;
  }

  botoes.forEach(function (b) {
    b.addEventListener('click', function () {
      mostrar(b.dataset.cat);
      history.replaceState(null, '', '#' + b.dataset.cat);
    });
  });

  // Abre a categoria pedida na URL (ex.: cardapio.html#sobremesas)
  var hash = location.hash.replace('#', '');
  if (hash) mostrar(hash);

  // Se alguma foto falhar, mostra a logo da pizzaria em vez do ícone quebrado
  function usarLogo(img) {
    if (img.dataset.fallback) return;
    img.dataset.fallback = 'true';
    img.src = '../img/LogoPizza.png';
    img.classList.add('sem-foto');
  }
  document.querySelectorAll('section.lista img').forEach(function (img) {
    img.addEventListener('error', function () { usarLogo(img); });
    if (img.complete && img.naturalWidth === 0) usarLogo(img);
  });
})();