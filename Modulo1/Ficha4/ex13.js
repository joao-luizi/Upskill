
function min(arr){
    return Math.min(...arr)
}

function max(arr){
    return Math.max(...array)
}

function sum(arr) {
        let initialValue = 0;
        let sum = x.reduce((acc, num) => {
          const last = acc.length ? acc[acc.length - 1] : 0;
          acc += num;
          return acc;
        }, initialValue);
        return sum;
      }

function average(arr){
    return sum(arr) / arr.length
}