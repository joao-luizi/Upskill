const storeID = 1;

const carrinho = document.querySelector('#carrinho');
const listaCursos = document.querySelector('#lista-cursos');
const divcarrinho = document.querySelector('#lista-carrinho tbody');
const limparcarrinhoBtn = document.querySelector('#limpar-carrinho');

//#region Login Components
const loginForm = document.getElementById("loginForm")
const loginBtn = document.getElementById("login-button")
const loginCancelBtn = document.getElementById("login-cancelbtn")
const loginLogOutBtn = document.getElementById("login-logout")
const loginContainer = document.getElementById("container-login")
const loginBackDrop = document.getElementById("login-backdrop")
const inputPsw = document.getElementById("inputPsw")
const inputUname = document.getElementById("inputUname")
const loginWelcome = document.getElementById("login-welcome");

const toggleShowPsw = document.getElementById("toggleShowPsw")
//#endregion Login Components

let artigoscarrinho = [];


function Init(){
     getLocalStoreInfo();
     initEventListeners();
     toggleLoginStatus();
     // Run the function to render the courses
     renderizarCursos();
}

function submitLoginForm(e){
     e.preventDefault();
     const form = e.target;
     checkUserLogin(form.inputUname.value, form.inputPsw.value)
     toggleLoginStatus();
     hideLogin()
}

function logout(){
     currentUser = undefined;
     toggleLoginStatus();
     hideLogin();
}
function initEventListeners() {
     listaCursos.addEventListener('click', adicionarCurso);
     carrinho.addEventListener('click', eliminarCurso);
     limparcarrinhoBtn.addEventListener('click', limparcarrinho);
     loginBtn.addEventListener('click', showLogin);
     toggleShowPsw.addEventListener('change', togglePswVisible)
     loginForm.addEventListener('submit', submitLoginForm)
     loginCancelBtn.addEventListener('click', hideLogin);
     loginLogOutBtn.addEventListener('click', logout);
     document.addEventListener('keydown', (event) => {
  if (event.key === "Escape") {
     console.log(loginBtn)
    console.log("bookdb:");
    console.log(db);
    console.log("current User")
    console.log(currentUser)
    console.log("db Stores")
    console.log(dbStores)
    if (loginContainer.style.display === "block")
          hideLogin()
  }
});
}

function adicionarCurso(e) {
     e.preventDefault();
     if (e.target.classList.contains('adicionar-carrinho')) {
          const curso = e.target.parentElement.parentElement;
          lerDadosCurso(curso);
     }
}

function lerDadosCurso(curso) {
     const infoCurso = {
          imagem: curso.querySelector('img').src,
          titulo: curso.querySelector('h4').textContent,
          preco: curso.querySelector('.preco span').textContent,
          id: curso.querySelector('a').getAttribute('data-id'),
          qtd: 1
     }

     if (artigoscarrinho.some(curso => curso.id === infoCurso.id)) {
          const cursos = artigoscarrinho.map(curso => {
               if (curso.id === infoCurso.id) {
                    curso.qtd++;
                    return curso;
               } else {
                    return curso;
               }
          })
          artigoscarrinho = [...cursos];
     } else {
          artigoscarrinho = [...artigoscarrinho, infoCurso];
     }

     console.log(artigoscarrinho)

     carrinhoHTML();
}

function eliminarCurso(e) {
     e.preventDefault();
     if (e.target.classList.contains('apagar-curso')) {
          // e.target.parentElement.parentElement.remove();
          const cursoId = e.target.getAttribute('data-id')

          artigoscarrinho = artigoscarrinho.filter(curso => curso.id !== cursoId);

          carrinhoHTML();
     }
}





