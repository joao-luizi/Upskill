


function getUniquesAlt(arr, key) {
  return [...new Set(arr.map((e) => e[key]))];
}

function getUniques(arr, key) {
  let result = [];
  for (let i = 0; i < arr.length; i++) {
    let exists = false;
    let j = 0;
    while (!exists && j < result.length) {
      if (result[j] == arr[i][key]) exists = true;
      j++;
    }
    if (!exists) result.push(arr[i][key]);
  }
  return result;
}




function setOldValue(parentElement, oldValue){
  for (let i = 0; i < parentElement.options.length; i++){
    if (parentElement.options[i].value == oldValue){
      parentElement.selectedIndex = i
    }
  }
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
