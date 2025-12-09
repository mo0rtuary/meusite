// TROCAR FOTO
function trocarFoto() {
  document.getElementById("trocarFoto").click();
}

document.getElementById("trocarFoto").addEventListener("change", function(e) {
  let arquivo = e.target.files[0];
  if (arquivo) {
    document.getElementById("fotoPerfil").src = URL.createObjectURL(arquivo);
  }
});


// 1 — Alterar nome
function alterarNome() {
  let nome = prompt("Digite seu novo nome:");
  if (nome) alert("Nome alterado para: " + nome);
}

// 2 — Alterar Bio
function alterarBio() {
  let bio = prompt("Digite sua nova bio:");
  if (bio) alert("Bio atualizada!");
}

// 3 — Trocar Tema
function trocarTema() {
  document.body.classList.toggle("dark");
  alert("Tema alterado!");
}

// 4 — Resetar Perfil
function resetarPerfil() {
  document.getElementById("fotoPerfil").src = "https://i.imgur.com/QnU7P7D.png";
  alert("Perfil resetado!");
}

// 5 — Mudar Cor dos cartões
function mudarCorCartoes() {
  let cor = prompt("Digite uma cor (ex: red, blue, #123456):");
  if(cor){
    document.querySelectorAll(".card").forEach(c => {
      c.style.background = cor;
    });
  }
}

// 6 — Adicionar Status
function adicionarStatus() {
  let status = prompt("Digite seu status:");
  alert("Status salvo: " + status);
}

// 7 — Adicionar Link
function adicionarLink() {
  let link = prompt("Cole seu link pessoal:");
  alert("Link salvo!");
}

// 8 — Mostrar Data
function mostrarData() {
  alert("Conta criada em: 07/12/2025");
}

// 9 — Notificações Fake
function ativarNotificacoes() {
  alert("🔔 Notificações ativadas!");
}

// 10 — Confetes (efeito simples)
function confetes() {
  alert("🎉🎉🎉 Festejando!");
}
