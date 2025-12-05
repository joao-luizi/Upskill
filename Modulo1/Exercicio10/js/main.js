

function criarPagina(){
    
    const body = document.body
    const titulo = document.createElement("h1")
    titulo.textContent = "Smurfs Saltitantes"
    titulo.style.textAlign = "center"
    body.appendChild(titulo)

    const divButoes = document.createElement("div")
    divButoes.style.textAlign = "center"

    const botao = document.createElement("button")
    botao.textContent = "Mover Smurfs"

    divButoes.appendChild(botao)
    body.appendChild(divButoes)

    botao.addEventListener("click", mostrarSmurfs)

    // criar a table

    // mostrar smurfs
}