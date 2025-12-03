let grd = [
  ["cat1.jfif", "", "cat2.jfif"],
  ["", "cat3.jfif", ""],
  ["cat4.jfif", "", "cat5.jfif"],
];

function mostrarSmurfs() {
  let v = matrix2Vector(grd);
  for (let i = 0; i < v.length; i++) {
    let p = document.getElementById("c" + i);
    p.innerHTML = '<img src="images/' + v[i] + '"/>';
  }
}
