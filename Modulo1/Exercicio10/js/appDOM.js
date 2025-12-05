let grd = [
  ["cat1.jfif", "", "cat2.jfif"],
  ["", "cat3.jfif", ""],
  ["cat4.jfif", "", "cat5.jfif"],
];

const CST_passos = 2;

function mostrarSmurfs() {
  //correcao de dia 5/12
  let s = ""
  let p = document.getElementById("table-img")
  let tot = 0
  for (let i = 0; i < grd.length; i++){
    s = s + "<tr>"
    for (let j = 0; j < grd[i].length; j++){
      s = s + `<td id="c${tot}" style="text-align: center;"></td>"`
      tot++
    }
    s = s + "</tr>"
    alert(s)
    p.innerHTML = s
  }
  //correcao de dia 5/12
  let v = matrix2Vector(grd);
  for (let i = 0; i < v.length; i++) {
    let p = document.getElementById("c" + i);
    if (v[i] == ""){
      p.innerHTML = ""
    } else{
      p.innerHTML = '<img src="images/' + v[i] + '"/>';
    }
  }
}

function rodarSmurfs() {
  let v = matrix2Vector(grd);
  let v1 = shiftVector(v, CST_passos);
  let n = Math.abs(CST_passos)
  let i = n - 1;
  if (CST_passos > 0){
    while (i >= 0){
      v1[i] = v[v.length - n];
      i--
      n--
    }
  }
  else{
    while (i >= 0){
      v1[v1.length - n] = v[i]
      i--
      n--
    }
  }
  grd = vector2Matrix(v1, grd.length, grd[0].length);
}



function fazerTabela() {
  let table_element = document.createElement("table");
  table_element.innerHTML = "";
  let cellId = 0;
  for (let i = 0; i < grd.length; i++) {
    let tablerow = document.createElement("tr");
    for (let j = 0; j < grd[i].length; j++) {
      let tablecell = document.createElement("td");
      tablecell.id = "c" + cellId;
      tablecell.classList.add("contorno");
      tablecell.classList.add("centrar");
      tablerow.appendChild(tablecell);
      cellId++;
    }
    table_element.appendChild(tablerow);
  }
}


