


function getOptionsAlt(arr, key) {
  return [...new Set(arr.map((e) => e[key]))];
}

function getOptions(arr, key) {
  let result = [];
  for (let i = 0; i < db.length; i++) {
    let exists = false;
    let j = 0;
    while (!exists && j < result.length) {
      if (result[j] == db[i][key]) exists = true;
      j++;
    }
    if (!exists) result.push(db[i][key]);
  }
  return result;
}


/**
 * 
 * @param {HTMLElement} element 
 * @param {boolean} IsAscending 
 */
function toggleSortOrder(sortOrders, sortKey){
    sortOrders[sortKey] = !sortOrders[sortKey];
}

function getAllStr(sortKey){
  let result = "";
  switch (sortKey)
  {
    case "ano":
      result = "Todos os anos"
      break;
    case "marca":
      result = "Todas as marcas"
      break;
    default:
        result = "Todos os registos"
  }
  return result;
}
function setDate(y, m, d) {
  let tmp = new Date(y, m, d);
  tmp.setMonth(tmp.getMonth() - 1);
  return tmp;
}

function toInputDateLocal(d) {
  const pad = (n) => String(n).padStart(2, "0");
  return `${d.getFullYear()}-${pad(d.getMonth() + 1)}-${pad(d.getDate())}`;
}

function sortStringArray(arr, IsAscending){
    let result = [];
    if (IsAscending)
        result = arr.sort(function(a, b) { return b.localeCompare(a);})
    else
        result = arr.sort(function(a, b) { return a.localeCompare(b);})
    return result
}

function sortNumberArray(arr, IsAscending){
    let result = []
  
    if (IsAscending)
            result = arr.sort(function(a, b) {return b - a;});
    else
            result = arr.sort(function(a, b) {return a - b;})
    return result;
}
