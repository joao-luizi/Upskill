

function inspecaoEstado(data) {
  const agora = new Date();
  const diffMeses = (agora - data) / (1000 * 60 * 60 * 24 * 30);
  if (diffMeses > 12) return '<span class="vendido">Expirada</span>';
  if (diffMeses > 10) return '<span class="aviso">A expirar</span>';
  return '<span class="ok">Válida</span>';
}

function fillTable(parentElement, arr){
  let i = 0;
  parentElement.innerHTML = "";
  arr.forEach(element => {
   
    let tr = document.createElement("tr");
    let td1 = document.createElement("td")
    let td2 = document.createElement("td")
    let td3 = document.createElement("td")
    let td4 = document.createElement("td")
    let td5 = document.createElement("td")
    let td6 = document.createElement("td")
    let bt1 = document.createElement("button")
    let bt2 = document.createElement("button")
    td1.innerText = element["marca"]
    td2.innerText = element["modelo"]
    td3.innerText = element["ano"]
    //console.log(typeof element["ultimaInspecao"])
    //console.log(toInputDateLocal(new Date(element["ultimaInspecao"])))
    let date = new Date(element["ultimaInspecao"]);
    td4.innerHTML = `${toInputDateLocal(date)} (${inspecaoEstado(date)})`
    td5.innerText = (element["vendido"] == true) ? "Vendido" : "Disponivel"
    td5.classList = (element["vendido"] == true) ? "vendido" : "ok"
    bt1.innerText = "Editar"
    bt1.setAttribute("data-index", element["data-index"])
    bt1.addEventListener("click", (e) => {
      console.log(e.target.getAttribute("data-index"));
      editar(e.target.getAttribute("data-index") - 1)

    } )
    bt2.innerText = "Remover"
    td6.appendChild(bt1)
    td6.appendChild(bt2)
    tr.appendChild(td1)
    tr.appendChild(td2)
    tr.appendChild(td3)
    tr.appendChild(td4)
    tr.appendChild(td5)
    tr.appendChild(td6)
    parentElement.appendChild(tr);
  });
}

function createNewOptions(sortObj, sortedOptions){
  
  let all = document.createElement("option");
  all.value = "";
  all.innerText = sortObj.stringAll;
  sortObj.selectEl.innerHTML = ""
  sortObj.selectEl.appendChild(all);
    sortedOptions.forEach(function (a) {
    let node = document.createElement("option");
    node.value = a;
    node.innerText = a;
    sortObj.selectEl.appendChild(node);
  });
}

function updateSortElement(element, IsAscending)
{
    if (IsAscending)
    {
      element.innerHTML = '↑'
      element.title = "Ordered by Ascending"

    }
    else
    {
      element.title = "Ordered by Descending"
      element.innerHTML = '↓'
    }

}
