/*
Contains all functions with DOM manipulation or HTML elements
*/

function togglePswVisible(e) {
  if (e.target.checked) inputPsw.type = "text";
  else inputPsw.type = "password";
}

//#region ShowModals
function showLogin() {
  loginFormReset();
  loginContainer.style.display = "block";
  loginBackDrop.style.display = "block";
}

function showAddCurso() {
  addCursoFormReset();
  containerAddCurso.style.display = "block";
  loginBackDrop.style.display = "block";
}

function showConfirmLogin() {
  confirmFormreset();
  confirmContainer.style.display = "block";
  loginBackDrop.style.display = "block";
}
//#endregionShowModals

//#region  HideModals
function hideAddCurso() {
  containerAddCurso.style.display = "none";
  loginBackDrop.style.display = "none";
}

function hideLogin() {
  loginContainer.style.display = "none";
  loginBackDrop.style.display = "none";
}

function hideConfirmLogin() {
  confirmContainer.style.display = "none";
  loginBackDrop.style.display = "none";
}
//#endregion HideModals

//#region ResetModals
function addCursoFormReset() {
  const target = AddCursoForm;
  target.ISBN.value = "";
  target.titulo.value = "";
  target.autor.value = "";
  target.categoria.value = "";
  target.preco.value = 0;
  target.promocao.value = false;
  target.rating.value = 5;
  target.imagem.value = "";
  target.info.value = "";
}

function confirmFormreset() {
  const target = confirmLogInForm;
  target.confirmUname = "";
  target.confirmPsw = "";
  target.confirmShowPsw.checked = false;
}
function loginFormReset() {
  inputPsw.value = "";
  inputUname.value = "";
  toggleShowPsw.checked = false;
  if (!currentUser) loginLogOutBtn.style.display = "none";
  else loginLogOutBtn.style.display = "block";
}
//#endregion ResetModals


function updateLoginUI() {
  const targetImg = loginBtn.querySelector("img");

  // default (guest / non-admin)
  targetImg.src = "./img/ProfileGuest.png";
  loginWelcome.innerText = "Welcome Guest";
  adicionarCurso.style.display = "none";
  adicionarCurso.classList.remove(["button", "u-middle-width", "inserir-curso"]);

  if (currentUser) {
    targetImg.src = "./img/Profile.png";
    loginWelcome.innerText = `Welcome ${currentUser.username}`;

    if (currentUser.userrole === "admin") {
      loginWelcome.innerText += " (admin)"; 
      adicionarCurso.classList.add(["button", "u-middle-width", "inserir-curso"]);
      adicionarCurso.style.display = "inline-block";
    }
  }
}

function gerarHTMLCurso(curso) {
  return `
         <div class="four columns">
             <div class="card">
                 <img src="img/${curso.imagem}" class="imagen-curso u-full-width">
                 <div class="info-card">
                     <h4>${curso.titulo}</h4>
                     <p>${curso.autor}</p>
                     <img src="img/estrelas.png">
                     <p class="preco">${curso.preco}€ <span class="u-pull-right">15€</span></p>
                     <a href="#" class="u-full-width button-primary button input adicionar-carrinho" data-id="${curso.ISBN}">Adicionar ao Carrinho</a>
                 </div>
             </div>
         </div>
     `;
}

function paginacao(filteredBooks) {
  const paginacaoContainer = document.getElementById("paginacao");
  paginacaoContainer.innerHTML = "";
  let bookDbSize = filteredBooks.length;
  const totalPages = Math.ceil(bookDbSize / pageSize);
  if (totalPages !== 1) {
    for (let i = 1; i <= totalPages; i++) {
      const btn = document.createElement("button");
      btn.textContent = i;
      btn.dataset.page = i;

      btn.addEventListener("click", function () {
        currentPage = Number(this.dataset.page); //melhor deixar explicito que é numero
        renderizarCursos();
      });
      paginacaoContainer.appendChild(btn);
    }
  }
}

function renderizarCursos() {
  // Reference to the container where the courses will be inserted
  const listaCursos = document.querySelector("#lista-cursos");

  const start = (currentPage - 1) * pageSize;
  const end = start + pageSize;
  let filteredBooks = bookDb;
  //introduzir outros filtros aquil um a um por exemplo
  if (showFavorites) {
    filteredBooks = filteredBooks.filter((item) =>
      currentUser.userfavs.some((element) => element === item.ISBN)
    );
  }
  //se a combobox de categoria não for Todos os Cursos então queremos filtrar mais
  //assim filteredBooks = filteredBooks.filter(blah blah bla)
  booksToShow = filteredBooks.slice(start, end);

  // Clear any hard-coded content from the container (optional, if content should be replaced)
  listaCursos.innerHTML = `
          <h1 id="cabecalho" class="cabecalho">Cursos Online</h1>
     `;

  // Create a counter to track the number of items added to the current row
  let row;

  // Loop through the database (db) and create HTML for each course
  booksToShow.forEach((curso, index) => {
    // For every 3 items, create a new row
    if (index % 3 === 0) {
      row = document.createElement("div");
      row.classList.add("row");
      listaCursos.appendChild(row); // Append the row to the main container
    }
    // Create a new div for the course card
    const courseCard = document.createElement("div");
    courseCard.classList.add("four", "columns");

    // Build the inner HTML for the course card using template literals
    let adminPrefix = "";
    if (currentUser && currentUser.userrole == "admin") {
      adminPrefix = `<a href="#" class="apagar-curso-card" data-id=${curso.ISBN}>Apagar Curso</a>`;
    }
    let adminSuffix = "";
    if (currentUser && currentUser.userrole !== "admin") {
      adminSuffix = `<a href="#" class="u-full-width button-primary button input adicionar-carrinho" data-id='${curso.ISBN}'>Adicionar ao Carrinho</a>`;
    }
    courseCard.innerHTML = `
          <div class="card">
          <div class="login-row">
            ${adminPrefix}
              </div>
            <img src="img/${curso.imagem}" class="imagen-curso u-full-width">
            <div class="info-card">
                <h4>${curso.titulo}</h4>
                <p>${curso.autor}</p>
                <img src="img/estrelas.png">
                <p class="preco">${curso.preco}€ <span class="u-pull-right">${
      curso.promocao ? "15€" : ""
    }</span></p>
                ${adminSuffix}
            </div>
        </div>
    `;
    // Append the course card to the current row
    row.appendChild(courseCard);
  });
  paginacao(filteredBooks);
}

function showHeart() {
  if (showFavorites === true) {
    favoritosBtn.innerHTML = "❤️";
  } else {
    favoritosBtn.innerHTML = "🤍";
  }
}

function carrinhoHTML() {
  limparcarrinho();
  artigoscarrinho.forEach((curso) => {
    const row = document.createElement("tr");
    row.innerHTML = `
               <td>  
                    <img src="${curso.imagem}" width=100>
               </td>
               <td>${curso.titulo}</td>
               <td>${curso.preco}</td>
               <td>${curso.qtd} </td>
               <td>
                    <a href="#" class="apagar-curso" data-id="${curso.id}">X</a>
               </td>
          `;
    divcarrinho.appendChild(row);
  });
}

function limparcarrinho() {
  // divcarrinho.innerHTML = '';
  while (divcarrinho.firstChild) {
    divcarrinho.removeChild(divcarrinho.firstChild);
  }
}
