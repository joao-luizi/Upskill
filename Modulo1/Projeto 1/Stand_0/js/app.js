const fMarca = document.getElementById("fMarca");
const fAno = document.getElementById("fAno");
const fVendido = document.getElementById("fVendido");
//const fMarcaSortOrder = document.getElementById("fMarcaSortOrder");
//const fAnoSortOrder = document.getElementById("fAnoSortOrder");
const sortController = {
  marca: {
    selectEl:  document.getElementById("fMarca"),
    sortEl: document.getElementById("fMarcaSortOrder"),
    sortAsc: true,
    sortf: sortStringArray,
    stringAll: "Todas as marcas",
  },
  ano: {
    selectEl:  document.getElementById("fAno"),
    sortEl: document.getElementById("fAnoSortOrder"),
    sortAsc: true,
    sortf: sortNumberArray,
    stringAll: "Todos os anos",
  },
};
const form = document.getElementById("formVeiculo");
const carregarLS = document.getElementById("carregarLS");
const limparLs = document.getElementById("limparLS");
const tabela = document.getElementById("tabela");


function preencherFiltros(dbObj, sortCtlName){
  let sortObj = sortController[sortCtlName];
  let fOptions = getUniques(dbObj, sortCtlName);
  let oldValue = sortObj.selectEl.selectedOptions[0].value;
  fOptions = sortObj.sortf(fOptions, sortObj.sortAsc);
  createNewOptions(sortObj, fOptions);
  setOldValue(sortObj.selectEl, oldValue);
}






function render(){
  let filterMarca = fMarca.value;
  let filterAno = fAno.value;
  let filterVendido = fVendido.value;
  let filteredData = veiculos.filter(
    (item) => {
      if ((filterMarca == "" || item["marca"] == filterMarca)
      && (filterAno == "" || item["ano"] == filterAno)
    && (filterVendido == "" || item["vendido"] == JSON.parse(filterVendido)))
      return item;
    }
  );
  fillTable(tabela, filteredData);
}

function Init() {
  [fMarca, fAno, fVendido].forEach((f) => f.addEventListener("change", render));
  fMarcaSortOrder.addEventListener("click", function(){
    let sortObj = sortController["marca"]
    sortObj.sortAsc = !sortObj.sortAsc
    updateSortElement(this, sortObj.sortAsc);
    preencherFiltros(veiculos, "marca");
    render();
  })
  fAnoSortOrder.addEventListener("click", function(){
    let sortObj = sortController["ano"]
    sortObj.sortAsc = !sortObj.sortAsc
    updateSortElement(this, sortObj.sortAsc);
    preencherFiltros(veiculos, "ano");
    render();
  })
  form.addEventListener("submit", (e) => {
    e.preventDefault()
    const form = e.target;
    let vIndex = form.editIndex.value;
    veiculos[vIndex].marca = form.marca.value
    veiculos[vIndex].modelo = form.modelo.value
    veiculos[vIndex].ano = form.ano.value
    veiculos[vIndex].ultimaInspecao = new Date(form.inspecao.value);
    veiculos[vIndex].vendido = form.vendido.checked ? true : false
    guardar("veiculos", veiculos);
    render()
  } )
  carregarLS.addEventListener("click", () => {reInicializar(); render()})
  carregar()
  preencherFiltros(veiculos, "marca")
  preencherFiltros(veiculos, "ano")
  render()
}
