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

let veiculos = []
/**
 *
 * @param {*} i
 */
function editar(i) {
  const v = veiculos[i];
  document.getElementById("editIndex").value = i;
  marca.value = v.marca;
  modelo.value = v.modelo;
  ano.value = v.ano;
  inspecao.value = toInputDateLocal(v.ultimaInspecao); // sem fusos horários envolvidos
  vendido.checked = v.vendido;
}

/**
 *
 */
function guardar() {
  localStorage.setItem("veiculos", JSON.stringify(veiculos));
}

/**
 *
 */
function carregar() {
  let storageVehicles = localStorage.getItem("veiculos")
  if (storageVehicles)
    veiculos = JSON.parse(storageVehicles);  
  else
    //copy db to veiculos
  {
    let i = 0;
    for (key in db){
      veiculos.push[db[key]];
    }
  }  
}
