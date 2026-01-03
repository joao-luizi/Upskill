const carrinho = document.querySelector('#carrinho');
const listaCursos = document.querySelector('#lista-cursos');
const divcarrinho = document.querySelector('#lista-carrinho tbody');
const limparcarrinhoBtn = document.querySelector('#limpar-carrinho');

let artigoscarrinho = [];

initEventListeners();

function initEventListeners() {
     listaCursos.addEventListener('click', adicionarCurso);
     carrinho.addEventListener('click', eliminarCurso);
     limparcarrinhoBtn.addEventListener('click', limparcarrinho);
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

function renderizarCursos() {
     // Reference to the container where the courses will be inserted
     const listaCursos = document.querySelector('#lista-cursos');

     // Clear any hard-coded content from the container (optional, if content should be replaced)
     listaCursos.innerHTML = `
          <h1 id="cabecalho" class="cabecalho">Cursos Online</h1>
     `

     // Create a counter to track the number of items added to the current row
     let row;

     // Loop through the database (db) and create HTML for each course
     db.forEach((curso, index) => {
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
          courseCard.innerHTML = `
        <div class="card">
            <img src="img/${curso.imagem}" class="imagen-curso u-full-width">
            <div class="info-card">
                <h4>${curso.titulo}</h4>
                <p>${curso.autor}</p>
                <img src="img/estrelas.png">
                <p class="preco">${curso.preco}€ <span class="u-pull-right">${curso.promocao ? '15€' : ''}</span></p>
                <a href="#" class="u-full-width button-primary button input adicionar-carrinho" data-id="${curso.ISBN}">Adicionar ao Carrinho</a>
            </div>
        </div>
    `;

          // Append the course card to the current row
          row.appendChild(courseCard);
     });
}

// Run the function to render the courses
renderizarCursos();