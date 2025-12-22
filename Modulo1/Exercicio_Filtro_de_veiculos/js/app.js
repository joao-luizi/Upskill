function getBrands(){
    let arr = []
    for (let i in veiculos){
        let brand = veiculos[i].marca
        if (!arr.includes(brand))
            arr.push(veiculos[i].marca)
    }
    return arr.sort()
}

function getYears(){
    let arr = []
    for (let i in veiculos){
        let year = veiculos[i].ano
        if (!arr.includes(year))
            arr.push(veiculos[i].ano)
    }
    return arr.sort()
}
function brandCombo(arrBrands)
{
    let cb = document.getElementById("marca")
    for (let i in arrBrands){
        let option = document.createElement("option")
        option.innerHTML = arrBrands[i]
        option.value =  arrBrands[i]
        cb.appendChild(option)
    }
}

function yearsCombo(arrYears)
{
    let cb = document.getElementById("ano")
    for (let i in arrYears){
        let option = document.createElement("option")
        option.innerHTML = arrYears[i]
        option.value = arrYears[i]
        cb.appendChild(option)
    }
}

function getFilteredList(cbMarca, cbAno){
    let selection = []
    for(let i in veiculos){
        let {marca, modelo, ano} = veiculos[i]
        if ((marca == cbMarca || cbMarca == "Todas" || cbMarca == undefined || cbMarca == "")
        && (ano == cbAno || cbAno == "Todos" || cbAno == undefined || cbAno == ""))
            selection.push(veiculos[i])
    }
    return selection
}
function getFilters()
{
    let filtros = {}
    let marcaValue = document.getElementById("marca")
    let anoValue = document.getElementById("ano")
    filtros.marca = marcaValue.value
    filtros.ano = anoValue.value
    return filtros
    
}

function makeUl(){
    let filtros = getFilters()
    let filteredList = getFilteredList(filtros["marca"], filtros["ano"])
    let list = document.getElementById("lista")
    list.innerHTML = "";
    console.log(filteredList)
    for (let i in filteredList){
        let item = document.createElement("li")
        item.innerText = filteredList[i].marca + " " + filteredList[i].modelo + " (" + filteredList[i].ano + ")"
        list.appendChild(item)
    }
}
function init(){
    let cbMarca = document.getElementById("marca")
    cbMarca.addEventListener("change", () => { makeUl()})
    let cbAno = document.getElementById("ano")
    cbAno.addEventListener("change", () => { makeUl()})
    let brands = getBrands();
    let years = getYears();
    
    brandCombo(brands)
    yearsCombo(years)
    makeUl();

}