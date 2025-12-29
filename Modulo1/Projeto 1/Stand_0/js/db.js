const db = [
  {
    marca: "Toyota",
    modelo: "Corolla",
    ano: 2020,
    ultimaInspecao: new Date(2025, 2, 10),
    vendido: false,
  },
  {
    marca: "Honda",
    modelo: "Civic",
    ano: 2019,
    ultimaInspecao: new Date(2023, 10, 5),
    vendido: true,
  },
  {
    marca: "Ford",
    modelo: "Focus",
    ano: 2021,
    ultimaInspecao: new Date(2024, 5, 12),
    vendido: false,
  },
  {
    marca: "BMW",
    modelo: "Serie 1",
    ano: 2018,
    ultimaInspecao: new Date(2023, 7, 22),
    vendido: true,
  },
  {
    marca: "Mercedes",
    modelo: "A180",
    ano: 2020,
    ultimaInspecao: new Date(2024, 0, 15),
    vendido: false,
  },
  {
    marca: "Volkswagen",
    modelo: "Golf",
    ano: 2017,
    ultimaInspecao: new Date(2022, 11, 30),
    vendido: true,
  },
  {
    marca: "Renault",
    modelo: "Clio",
    ano: 2022,
    ultimaInspecao: new Date(2025, 3, 8),
    vendido: false,
  },
  {
    marca: "Peugeot",
    modelo: "208",
    ano: 2021,
    ultimaInspecao: new Date(2024, 1, 19),
    vendido: false,
  },
  {
    marca: "Hyundai",
    modelo: "i20",
    ano: 2019,
    ultimaInspecao: new Date(2023, 9, 3),
    vendido: true,
  },
  {
    marca: "Kia",
    modelo: "Rio",
    ano: 2020,
    ultimaInspecao: new Date(2024, 4, 25),
    vendido: false,
  },
];

let veiculos = [];

function editar(i) {
  const v = veiculos[i];
  const form = document.getElementById("formVeiculo")
  form.editIndex.value = i;
  form.marca.value = v.marca;
  form.modelo.value = v.modelo;
  form.ano.value = v.ano;
  form.inspecao.value = toInputDateLocal(new Date(v.ultimaInspecao)); // sem fusos horários envolvidos
  form.vendido.checked = v.vendido;
}

function updateInsert(e){
  const form = e.target;
    let vIndex = form.editIndex.value;
    const dataObj = { 
      marca: form.marca.value,
      modelo: form.modelo.value,
      ano: form.ano.value * 1, //make it qualified number type
      ultimaInspecao: new Date(form.inspecao.value), //
      vendido:  form.vendido.checked ? true : false,
     }
    if (vIndex >= 0){
      dataObj["data-index"] = vIndex;
      veiculos[vIndex] = dataObj;
    }
    else{
      dataObj["data-index"] = veiculos.length;
      veiculos.push(dataObj)
    }
    guardar("veiculos", veiculos);
      preencherFiltros(veiculos, "marca")
  preencherFiltros(veiculos, "ano")
    render()
    resetForm()
}

function deleteRecord(i){
  let input = confirm("Tem a certeza que pretende remover o item selecionado?");
  if (input) {
    veiculos.splice(i, 1);
    getDataWithIndex(veiculos);
    guardar("veiculos", veiculos);
      preencherFiltros(veiculos, "marca")
  preencherFiltros(veiculos, "ano")
    render()
  }
}

/**
 *
 */
function guardar(storageKey, source) {
  let dataObj = source.map((item) => {
    const copy = { ...item };
    delete copy["data-index"];
    return copy;
  })

  localStorage.setItem(storageKey, JSON.stringify(dataObj));
}

/**
 *
 */
function carregar() {
  let veiculosDB = localStorage.getItem("veiculos");
  let dataObj;
  if (veiculosDB && veiculosDB != "") {
    try {
      dataObj = JSON.parse(veiculosDB);
      getDataWithIndex(dataObj);
    } catch {
      reInicializar(
        "Ocorreu um erro ao aceder à base de dados local.\nPretende (re)inicializar?"
      );
    }
  }
  
}

function reInicializar(
  msg = "Tem a certeza que pretende (re)inicializar todos os veiculos?"
) {
  let input = confirm(msg);
  if (input) {
    getDataWithIndex(db);
    guardar("veiculos", veiculos);
    carregar()
  }
}

function getDataWithIndex(source){
  let id = 0;
  veiculos = source.map((item)=>{
    item["data-index"] = id++;
    return item;
  })
}
