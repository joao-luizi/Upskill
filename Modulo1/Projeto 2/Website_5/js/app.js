const storeID = 1;
//filtro Favoritos
let showFavorites = false;

//#region Paginação Variaveis Globais
let currentPage = 1;
const pageSize = 3;
//#endregion

const favoritosBtn = document.querySelector("#favoritos");
const carrinho = document.querySelector("#carrinho");
const listaCursos = document.querySelector("#lista-cursos");
const divcarrinho = document.querySelector("#lista-carrinho tbody");
const limparcarrinhoBtn = document.querySelector("#limpar-carrinho");
const finalizarcarrinhoBtn = document.querySelector("#finalizar-carrinho");

const confirmContainer = document.getElementById("container-confirm");
const confirmLogInForm = document.getElementById("confirmForm");
const confirmCancelBtn = document.getElementById("confirm-cancelbtn");

//#region Login Components
const loginForm = document.getElementById("loginForm");
const loginBtn = document.getElementById("login-button");
const loginCancelBtn = document.getElementById("login-cancelbtn");
const loginLogOutBtn = document.getElementById("login-logout");
const loginContainer = document.getElementById("container-login");
const loginBackDrop = document.getElementById("login-backdrop");
const inputPsw = document.getElementById("inputPsw");
const inputUname = document.getElementById("inputUname");
const loginWelcome = document.getElementById("login-welcome");
const toggleShowPsw = document.getElementById("toggleShowPsw");
//#endregion Login Components

let artigoscarrinho = [];

function Init() {
  getLocalBookDb();
  getLocalStoreInfo();
  initEventListeners();
  updateLoginUI();
  // Run the function to render the courses
  renderizarCursos();
  showHeart();
}

function submitConfirmForm(e) {
  e.preventDefault();
  const form = e.target;
  if (
    currentUser.username === form.confirmUname.value &&
    currentUser.userpass === form.confirmPsw.value
  ) {
    //encontrar a store correcta
    const currStore = dbStores.find((item) => item.storeid === storeID);
    artigoscarrinho.forEach((item) => {
      console.log(item);
      if (currStore.storesales.some((element) => element.ISBN === item.id)) {
        const existingElement = currStore.storesales.find(
          (element) => element.ISBN === item.id
        );
        existingElement.Qtd + item.qtd;
      } else {
        currStore.storesales.push({ ISBN: item.id, Qtd: item.qtd });
      }
    });
    saveLocalItem("stores", dbStores);
    artigoscarrinho = [];
    hideConfirmLogin();
    confirmFormReset();
    alert("Obrigado pela sua preferência");
  } else {
    alert("Autenticação Inválida");
  }
}

function submitLoginForm(e) {
  e.preventDefault();
  const form = e.target;
  if (checkUserLogin(form.inputUname.value, form.inputPsw.value)) {
    updateLoginUI();
    hideLogin();
    renderizarCursos(bookDb);
  }
}

function logout() {
  currentUser = undefined;
  updateLoginUI();
  hideLogin();
}

function finalizarCompra() {
  if (artigoscarrinho.length > 0) {
    if (currentUser) {
      showConfirmLogin();
    } else {
      alert("Por favor autentique-se para concluir esta acção");
    }
  }
}

function filtrarFavoritos(e) {
  e.preventDefault();
  if (!currentUser) {
    alert("Faz login para veres os teus favoritos!");
    return;
  }
  if (showFavorites === true) {
    showFavorites = false;
  } else {
    showFavorites = true;
  }
  showHeart();
  renderizarCursos();
}

function initEventListeners() {
  initAdminEventListeners();
  confirmLogInForm.addEventListener("submit", submitConfirmForm);
  loginForm.addEventListener("submit", submitLoginForm);
  listaCursos.addEventListener("click", adicionarRemoverCurso);
  carrinho.addEventListener("click", eliminarCurso);
  limparcarrinhoBtn.addEventListener("click", limparcarrinho);
  finalizarcarrinhoBtn.addEventListener("click", finalizarCompra);
  loginBtn.addEventListener("click", showLogin);
  toggleShowPsw.addEventListener("change", togglePswVisible);
  loginCancelBtn.addEventListener("click", hideLogin);
  loginLogOutBtn.addEventListener("click", logout);

  favoritosBtn.addEventListener("click", filtrarFavoritos);

  document.addEventListener("keydown", (event) => {
    if (event.key === "Escape") {
      if (loginContainer.style.display === "block") hideLogin();
      if (containerAddCurso.style.display === "block") hideAddCurso();
    }
  });
}

function adicionarRemoverCurso(e) {
  e.preventDefault();
  if (e.target.classList.contains("botao-favoritos")) {
    const cursoId = e.target.getAttribute("data-id");
    gerirFavoritos(cursoId);
  }
  if (e.target.classList.contains("adicionar-carrinho")) {
    const curso = e.target.parentElement.parentElement;
    lerDadosCurso(curso);
  }
  if (e.target.classList.contains("apagar-curso-card")) {
    if (currentUser) {
      const curso = e.target.parentElement.parentElement;
      apagarCurso(curso);
    } else {
      alert("Por favor autentique-se para concluir esta acção");
    }
  }
}
function inserirCurso(e) {
  e.preventDefault();
  showAddCurso();
}
function apagarCurso(curso) {
  const cursoId = curso.querySelector("a").getAttribute("data-id");
  //remover id dos artigos carrnho
  artigoscarrinho = artigoscarrinho.filter((curso) => curso.id !== cursoId);
  //remover id da bd
  bookDb = bookDb.filter((curso) => curso.ISBN !== cursoId);
  //salvar bd
  saveLocalItem("books", bookDb);
  //recarregar
  currentPage = 1;
  renderizarCursos();
  carrinhoHTML();
}
function lerDadosCurso(curso) {
  const infoCurso = {
    imagem: curso.querySelector("img").src,
    titulo: curso.querySelector("h4").textContent,
    preco: curso.querySelector(".preco span").textContent,
    id: curso.querySelector("a").getAttribute("data-id"),
    qtd: 1,
  };

  if (artigoscarrinho.some((curso) => curso.id === infoCurso.id)) {
    const cursos = artigoscarrinho.map((curso) => {
      if (curso.id === infoCurso.id) {
        curso.qtd++;
        return curso;
      } else {
        return curso;
      }
    });
    artigoscarrinho = [...cursos];
  } else {
    artigoscarrinho = [...artigoscarrinho, infoCurso];
  }
  carrinhoHTML();
}

function eliminarCurso(e) {
  e.preventDefault();
  if (e.target.classList.contains("apagar-curso")) {
    // e.target.parentElement.parentElement.remove();
    const cursoId = e.target.getAttribute("data-id");
    artigoscarrinho = artigoscarrinho.filter((curso) => curso.id !== cursoId);
    carrinhoHTML();
  }
}
