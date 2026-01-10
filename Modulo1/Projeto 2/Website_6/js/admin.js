const containerAddCurso = document.getElementById("container-addcurso");
const AddCursoForm = document.getElementById("addCurso");
const adicionarCurso = document.getElementById("adicionar-curso");
const cancelarAddCurso = document.getElementById("addCurso-cancelbtn");

function submitAddCursoForm(e) {
  e.preventDefault();
  const form = e.target;
  let curso = {
    ISBN: form.ISBN.value,
    titulo: form.titulo.value,
    autor: form.autor.value,
    categoria: form.categoria.value,
    preco: Number(form.preco.value),
    promocao: form.promocao.value === "true",
    rating: Number(form.rating.value),
    imagem: form.imagem.value,
    info: form.info.value,
  };
  if (existsISBN(curso.ISBN)) {
    alert("Este ISBN j´s existe na base de dados");
  } else {
    bookDb.push(curso);
    saveLocalItem("books", bookDb);
    addCursoFormReset();
    hideAddCurso();
    renderizarCursos();
  }
}

function initAdminEventListeners() {
  adicionarCurso.addEventListener("click", inserirCurso);
  AddCursoForm.addEventListener("submit", submitAddCursoForm);
  cancelarAddCurso.addEventListener("click", hideAddCurso);
}
