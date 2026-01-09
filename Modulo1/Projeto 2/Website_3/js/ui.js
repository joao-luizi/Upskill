/*
Contains all functions with DOM manipulation or HTML elements
*/

function togglePswVisible(e){
     if (e.target.checked)
          inputPsw.type = "text";
     else
          inputPsw.type = "password";
}

function hideLogin() {
  loginContainer.style.display = "none";
  loginBackDrop.style.display = "none";
}


function showLogin(){
    
     loginFormReset();
     loginContainer.style.display = "block";
     loginBackDrop.style.display = "block";

}

function hideAddCurso(){
      containerAddCurso.style.display = "none"
       loginBackDrop.style.display = "none";
}
function showAddCurso(){
     //Formreset
     containerAddCurso.style.display = "block"
      loginBackDrop.style.display = "block";
}

function toggleLoginStatus(){
    const targetImg = loginBtn.querySelector('img');
    if (currentUser){
        targetImg.src = './img/Profile.png'
        if (currentUser.userrole === "admin"){
             loginWelcome.innerText = `Welcome ${currentUser.username} (admin)`
             adicionarCurso.classList = "button u-middle-width inserir-curso"
             adicionarCurso.style.display = "inline-block"
        }
        else{
          loginWelcome.innerText = `Welcome ${currentUser.username}`
          adicionarCurso.classList = ""
          adicionarCurso.style.display = "none"
        }
    }
    else{
        targetImg.src = './img/ProfileGuest.png'
        loginWelcome.innerText = `Welcome Guest`
        adicionarCurso.classList = ""
        adicionarCurso.style.display = "none"

    }
        
}
function loginFormReset(){
     inputPsw.value = "";
     inputUname.value = "";
     toggleShowPsw.checked = false;
     if (!currentUser)
        loginLogOutBtn.style.display = 'none';
    else
        loginLogOutBtn.style.display = 'block';
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

function paginacao(){
     const paginacaoContainer = document.getElementById("paginacao");
     paginacaoContainer.innerHTML = "";
     let bookDbSize = bookDb.length;
     const totalPages = Math.ceil(bookDbSize / pageSize);
     for (let i = 1; i <= totalPages; i++) {
    const btn = document.createElement("button");
    btn.textContent = i;
    btn.dataset.page = i;

    btn.addEventListener("click", function () {
        currentPage = Number(this.dataset.page);//melhor deixar explicito que é numero
        renderizarCursos();
    });
    paginacaoContainer.appendChild(btn);
}
}

function renderizarCursos() {
     // Reference to the container where the courses will be inserted
     const listaCursos = document.querySelector('#lista-cursos');

     const start = (currentPage - 1) * pageSize;
     const end = start + pageSize;

     let booksToShow = bookDb.slice(start, end);

     //introduzir outros filtros aquil um a um por exemplo
     if (showFavorites){
          booksToShow = booksToShow.filter((item) => currentUser.userfavs.some((element) => element === item.ISBN))
     }
     // Clear any hard-coded content from the container (optional, if content should be replaced)
     listaCursos.innerHTML = `
          <h1 id="cabecalho" class="cabecalho">Cursos Online</h1>
     `

     // Create a counter to track the number of items added to the current row
     let row;

     // Loop through the database (db) and create HTML for each course
     booksToShow.forEach((curso, index) => {
          // For every 3 items, create a new row
          if (index % 3 === 0) {
               row = document.createElement('div');
               row.classList.add('row');
               listaCursos.appendChild(row); // Append the row to the main container
          }
          // Create a new div for the course card
          const courseCard = document.createElement('div');
          courseCard.classList.add('four', 'columns');

          // Build the inner HTML for the course card using template literals
          let adminPrefix = "";
          if (currentUser && currentUser.userrole == "admin"){
               adminPrefix = `<a href="#" class="apagar-curso-card" data-id=${curso.ISBN}>Apagar Curso</a>`
          }
          let adminSuffix = "";
          if (currentUser && currentUser.userrole !== "admin"){
               adminSuffix = `<a href="#" class="u-full-width button-primary button input adicionar-carrinho" data-id='${curso.ISBN}'>Adicionar ao Carrinho</a>`
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
                <p class="preco">${curso.preco}€ <span class="u-pull-right">${curso.promocao ? '15€' : ''}</span></p>
                ${adminSuffix}
            </div>
        </div>
    `;
          // Append the course card to the current row
          row.appendChild(courseCard);
     });
    paginacao()
}

function showHeart() {
    if (showFavorites  === true)   {
        favoritosBtn.innerHTML = '❤️'; 
    } else {
        favoritosBtn.innerHTML = '🤍';
    }
}

function carrinhoHTML() {
     limparcarrinho();
     artigoscarrinho.forEach(curso => {
          const row = document.createElement('tr');
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