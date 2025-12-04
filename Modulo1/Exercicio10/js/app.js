let grd = [
  ["cat1.jfif", "", "cat2.jfif"],
  ["", "cat3.jfif", ""],
  ["cat4.jfif", "", "cat5.jfif"],
];

const CST_passos = 2

function mostrarSmurfs() {
  let v = matrix2Vector(grd);
  for (let i = 0; i < v.length; i++) {
    let p = document.getElementById("c" + i);
    if (v[i] != "")
        p.innerHTML = '<img src="images/' + v[i] + '"/>';
  }
}

function rodarSmurfs(){
  let v = matrix2Vector(grd)
  let v1 = shiftVector(v, CST_passos)
  v1[0] = v[v.length-1];
  v1[1] = "";
  grd = vector2Matrix(v1, grd.length, grd[0].length);
}
