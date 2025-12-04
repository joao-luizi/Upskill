function matrix2Vector(matrix) {
  let result = [];
  for (let i = 0; i < matrix.length; i++) {
    for (let j = 0; j < matrix[i].length; j++) {
      result.push(matrix[i][j]);
    }
  }
  return result;
}

function vector2Matrix(v, rows, cols){
  let result = []
  let veci = 0;
  for (let i = 0; i < rows; i++){
    let line = []
    for (let j = 0; j < cols; j++){
      line[j] = v[veci]
      veci++
    }
    result[i] = line
  }
  return result;
}

function shiftVector(v, n){
    
    let result = [v.length]
    for (i = 0; i < v.length - n; i++){
      result[i + n] = v[i]
    }
    return result
}
