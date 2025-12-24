const fMarca = document.getElementById("fMarca");
const fAno = document.getElementById("fAno");
const fVendido = document.getElementById("fVendido");
const fMarcaSortOrder = document.getElementById("fMarcaSortOrder");
const fAnoSortOrder = document.getElementById("fAnoSortOrder");
const sortOrders = { marca: true, ano: true };
const carregarLS = document.getElementById("carregarLS");
const limparLs = document.getElementById("limparLS");
const tabela = document.getElementById("tabela");


function preencherFiltrosMarca() {
  let fMarcaOptions = getOptions(db, "marca")
  fMarcaOptions = sortStringArray(fMarcaOptions, sortOrders["marca"])
  preencherFiltros(fMarca, "Todas as marcas", fMarcaOptions)
}


function preencherFiltrosAno() {
  let fAnoOptions = getOptions(db, "ano")
  fAnoOptions = sortNumberArray(fAnoOptions, sortOrders["ano"])
  preencherFiltros(fAno, "Todos os anos", fAnoOptions)
}

function preencherFiltros(parentElement, strAll, sortedOptions) {
  parentElement.innerHTML = ""
  let all = document.createElement("option")
  all.value = ""
  all.innerText = strAll
  parentElement.appendChild(all)
  sortedOptions.forEach(function (a) {
    let node = document.createElement("option")
    node.value = a
    node.innerText = a
    parentElement.appendChild(node)
  });
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
  console.log("Filterred Data:")
  console.log(filteredData)
  fillTable(tabela, filteredData);
}

function Init() {
  [fMarca, fAno, fVendido].forEach((f) => f.addEventListener("change", render));
  fMarcaSortOrder.addEventListener("click", function(){
    toggleSortOrder(sortOrders, "marca")
    updateSortElement(this, sortOrders["marca"])
    preencherFiltrosMarca();
    render();
  })
  fAnoSortOrder.addEventListener("click", function(){
    toggleSortOrder(sortOrders, "ano")
    updateSortElement(this, sortOrders["ano"])
    preencherFiltrosAno();
    render();
  })
  carregarLS.addEventListener("click", () => {reInicializar(); render()})
  preencherFiltrosAno()
  preencherFiltrosMarca()
  carregar()
  render()
}
