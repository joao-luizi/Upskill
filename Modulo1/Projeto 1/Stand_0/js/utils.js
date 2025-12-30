
/**
 * @brief Compara dois objetos simples para verificar igualdade superficial.
 *
 * Esta função verifica se dois objetos possuem o mesmo conjunto de propriedades
 * e se os valores correspondentes são estritamente iguais.
 * A comparação é superficial: objetos ou arrays aninhados não são comparados em profundidade.
 *
 * @param {Object} obj1 - Primeiro objecto a comparar.
 * @param {Object} obj2 - Segundo objecto a comparar.
 * @returns {boolean} Verdade se os dois objectos tiverem as mesmas propriedades e valores.
 */
function isEqual(obj1, obj2){
  const keys1 = Object.keys(obj1);
  const keys2 = Object.keys(obj2);
  let areSame = true;

  if (keys1.length != keys2.length)
      areSame = false

  if (areSame){
    const sortedKeys1 = sortStringArray(keys1);
  const sortedKeys2 = sortStringArray(keys2);
    let i = 0;
    while (areSame && i < sortedKeys1.length){
      const key1 = sortedKeys1[i];
    const key2 = sortedKeys2[i];
      if (key1 !== key2 || obj1[key1] !== obj2[key2])
        areSame = false;
      i++;
    }
  }
  return areSame;
}

/**

* @brief Extrai uma lista de valores únicos para uma determinada propriedade de um objeto.

*
* Esta implementação utiliza recursos modernos do JavaScript, como `map`,

* `Set` e o operador spread para coletar valores únicos de forma eficiente.

*
* A igualdade é determinada usando a comparação de conjuntos integrada do JavaScript,

* que é adequada para valores primitivos.

*
* @param {Object[]} arr - Array de objetos a serem processados.

* @param {string} key - Propriedade do objeto cujos valores serão coletados.

* @returns {Array} Array contendo os valores únicos da propriedade especificada.

*/
function getUniquesAlt(arr, key) {
  return [...new Set(arr.map((e) => e[key]))];
}

/**

* @brief Extrai uma lista de valores únicos para uma determinada propriedade de um objeto.

*

* Esta é uma implementação manual e imperativa que verifica explicitamente
* a existência de duplicatas iterando sobre os valores coletados anteriormente.

* É intencionalmente verbosa para fins pedagógicos.

*
* A complexidade de tempo é O(n²), tornando-a menos eficiente do que a
* implementação alternativa usando Set.

*

* @param {Object[]} arr - Array de objetos a serem processados.

* @param {string} key - Propriedade do objeto cujos valores serão coletados.

* @returns {Array} Array contendo os valores únicos da propriedade fornecida.

*/
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





function setDate(y, m, d) {
  let tmp = new Date(y, m, d);
  tmp.setMonth(tmp.getMonth() - 1);
  return tmp;
}


function toUnifiedDate(d, isTable){
  const pad = (n) => String(n).padStart(2, "0");
  if (isTable)
    return `${pad(d.getDate())}/${pad(d.getMonth() + 1)}/${d.getFullYear()}`;
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
