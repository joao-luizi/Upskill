


function isEqual(obj1, obj2){
  let keys1 = obj1.keys();
  let keys2 = obj2.keys();
  let areSame = true;

  if (keys1.length != keys2.length)
      areSame = false

  if (areSame){
    keys1 = sortStringArray(keys1)
    keys2 = sortStringArray(keys2)
    let i = 0;
    while (areSame && i < keys1.length){
      if ((keys1[i] != keys2[i]) || (obj1[keys1[i]] != obj2[keys2[i]]))
        areSame = false;
      i++;
    }
  }
  return areSame;
}
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
