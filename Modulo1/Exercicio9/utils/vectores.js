/*Devolve um vector com iterios de min (inclusive) e max (inclusive)*/
function getRandomInts(x, min, max) {
  let vec = [];
  let counter = x;
  while (counter > 0) {
    let number = randomNumber(min, max);
    vec[vec.length] = number;
    counter--;
  }
  return vec;
}