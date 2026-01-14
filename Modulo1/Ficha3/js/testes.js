const fname = [
  ["randomUntil", TesterandomUntil],
  ["max", Testemax],
  ["randomWithin", TesterandomWithin],
  ["randomEven", TesterandomEven],
  ["randomOdd", TesterandomOdd],
  ["sqrt", Testesqrt],
  ["firstDigit", TestefirstDigit],
  ["sumMax", TestesumMax],
  ["powerOfTwo", TestepowerOfTwo],
  ["isMultiple", TesteisMultiple],
  ["intDivision", TesteintDivision],
  ["sumEvenBetween", TestesumEvenBetween],
  ["nextLetter", TestenextLetter],
  ["euclides", Testeeuclides],
  ["invertNumber", TesteinvertNumber],
  ["fib", Testefib],
];

function randomUntil(x) {
  let result = x + 1;
  while (result > x) result = Math.random() * x;
  return result;
}
function randomWithin(min, max) {
  let result = max + 1;
  while (result < min || result > max) {
    result = Math.random() * (max - min + 1) + min;
  }
  return result;
}
function randomEven(max) {
  result = max + 1;
  while (result > max || result % 2 != 0) {
    result = Math.floor(randomUntil(max));
  }
  result = result.toFixed(1);
  return parseFloat(result);
}
function randomOdd(max) {
  result = max + 1;
  while (result > max || result % 2 == 0) {
    result = Math.floor(randomUntil(max));
  }
  result = result.toFixed(1);
  return parseFloat(result);
}
function sqrt(x) {
  let result = Math.sqrt(x);
  return result == Math.floor(result) ? true : false;
}

function largestPrimeDiff() {}

function testEx4() {
  let a = new ex4();
  console.log(a.isPrime(7));
}
function testEx5() {
  let a = new ex5();
  console.log(a.existsPrimeBetween(0, 1));
}
function testEx6() {
  let a = new ex6();
  console.log(a.countPerfectNumbers(30));
}
