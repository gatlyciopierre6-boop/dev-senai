// Página de Reserva — validações conforme as regras de negócio do projeto
//  - todos os campos obrigatórios preenchidos
//  - telefone em formato válido
//  - data não pode ser anterior a hoje
//  - horário dentro do funcionamento (terça a domingo, 18h às 23h)
//  - não aceitar data/horário que já passou
//  - quantidade de pessoas maior que zero
// Uma reserva enviada fica com o status "solicitada".

const formulario = document.getElementById("form-reserva");
const campoData = document.getElementById("data");
const campoTelefone = document.getElementById("telefone");
const resultado = document.getElementById("resultado");

const ABERTURA = 18 * 60;      // 18:00 em minutos
const FECHAMENTO = 23 * 60;    // 23:00 em minutos
const SEGUNDA = 1;             // dia em que a pizzaria fecha

function dataDeHoje() {
    const agora = new Date();
    const mes = String(agora.getMonth() + 1).padStart(2, "0");
    const dia = String(agora.getDate()).padStart(2, "0");
    return agora.getFullYear() + "-" + mes + "-" + dia;
}

campoData.min = dataDeHoje();

// Máscara simples: (19) 98123-6776
campoTelefone.addEventListener("input", function () {
    let n = campoTelefone.value.replace(/\D/g, "").slice(0, 11);
    if (n.length > 10) {
        n = n.replace(/^(\d{2})(\d{5})(\d{4}).*/, "($1) $2-$3");
    } else if (n.length > 6) {
        n = n.replace(/^(\d{2})(\d{4})(\d{0,4}).*/, "($1) $2-$3");
    } else if (n.length > 2) {
        n = n.replace(/^(\d{2})(\d{0,5})/, "($1) $2");
    } else if (n.length > 0) {
        n = n.replace(/^(\d{0,2})/, "($1");
    }
    campoTelefone.value = n;
});

function mostrarErro(id, mensagem) {
    const campo = document.getElementById(id);
    const aviso = document.getElementById("erro-" + id);
    aviso.textContent = mensagem;
    campo.classList.toggle("invalido", Boolean(mensagem));
    campo.setAttribute("aria-invalid", mensagem ? "true" : "false");
    return !mensagem;
}

function validar() {
    const nome = document.getElementById("nome").value.trim();
    const telefone = campoTelefone.value.replace(/\D/g, "");
    const data = campoData.value;
    const horario = document.getElementById("horario").value;
    const pessoas = Number(document.getElementById("pessoas").value);

    const resultados = [];

    resultados.push(mostrarErro("nome",
        nome.split(/\s+/).length < 2 ? "Informe nome e sobrenome." : ""));

    resultados.push(mostrarErro("telefone",
        telefone.length < 10 || telefone.length > 11 ? "Informe um telefone válido com DDD." : ""));

    let erroData = "";
    if (!data) {
        erroData = "Escolha a data da reserva.";
    } else if (data < dataDeHoje()) {
        erroData = "A data não pode ser anterior a hoje.";
    } else if (new Date(data + "T12:00:00").getDay() === SEGUNDA) {
        erroData = "Não abrimos às segundas-feiras.";
    }
    resultados.push(mostrarErro("data", erroData));

    let erroHorario = "";
    if (!horario) {
        erroHorario = "Escolha o horário.";
    } else {
        const [h, m] = horario.split(":").map(Number);
        const minutos = h * 60 + m;

        if (minutos < ABERTURA || minutos > FECHAMENTO) {
            erroHorario = "Escolha um horário entre 18h e 23h.";
        } else if (data === dataDeHoje()) {
            const agora = new Date();
            if (minutos <= agora.getHours() * 60 + agora.getMinutes()) {
                erroHorario = "Esse horário já passou.";
            }
        }
    }
    resultados.push(mostrarErro("horario", erroHorario));

    resultados.push(mostrarErro("pessoas",
        !Number.isInteger(pessoas) || pessoas < 1 ? "Informe pelo menos 1 pessoa." : ""));

    return resultados.every(Boolean);
}

formulario.addEventListener("submit", function (evento) {
    evento.preventDefault();
    resultado.hidden = true;

    if (!validar()) {
        const primeiro = formulario.querySelector(".invalido");
        if (primeiro) primeiro.focus();
        return;
    }

    const nome = document.getElementById("nome").value.trim().split(/\s+/)[0];
    const [ano, mes, dia] = campoData.value.split("-");
    const horario = document.getElementById("horario").value;
    const pessoas = document.getElementById("pessoas").value;

    resultado.innerHTML =
        "<strong>Reserva solicitada!</strong><br>" +
        "Obrigado, " + nome + ". Pedimos mesa para " + pessoas +
        (pessoas === "1" ? " pessoa" : " pessoas") +
        " em " + dia + "/" + mes + "/" + ano + " às " + horario + ".<br>" +
        "Status: <strong>solicitada</strong> — aguarde a confirmação da pizzaria.";
    resultado.hidden = false;
    resultado.scrollIntoView({ behavior: "smooth", block: "center" });
    formulario.reset();
    document.getElementById("pessoas").value = 2;
});

// Limpa o aviso de erro assim que a pessoa corrige o campo
formulario.querySelectorAll("input").forEach(function (campo) {
    campo.addEventListener("input", function () {
        const aviso = document.getElementById("erro-" + campo.id);
        if (aviso) aviso.textContent = "";
        campo.classList.remove("invalido");
        campo.removeAttribute("aria-invalid");
    });
});
