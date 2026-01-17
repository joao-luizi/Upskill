const fname = [
  ["ex01", Testeex01],
  ["sum", Testesum],
  ["ex03", Testeex03],
  ["ex04", Testeex04],
  ["isOrdered", TesteisOrdered],
  ["inverted", Testeinverted],
  ["contains", Testecontains],
  ["count", Testecount],
  ["isPalindrome", TesteisPalindrome],
  ["areTheSame", TesteareTheSame],
  ["merge", Testemerge],
  ["subArray", TestesubArray],
  ["leftSide", TesteleftSide],
  ["rightSide", TesterightSide],
  ["alternatedBooleans", TestealternatedBooleans],
  ["invertedBooleans", TesteinvertedBooleans],
];

function Testeex01() {
  let numbers = [4, 3, 2, 1];
  const explain = document.getElementById("ex01Explain");
  if (explain) {
    explain.innerHTML = `numbers = [${numbers}] → sum = [${ex01(numbers)}]`;
  }
}
function Testesum() {
  let numbers = [];
  let l = Math.floor(Math.random() * 10) + 1;
  for (let i = 0; i < l; i++){
    numbers.push(Math.floor(Math.random() * 10) + 1)
  } 
  const explain = document.getElementById("sumExplain");
  if (explain) {
    explain.innerHTML = `numbers = [${numbers.sort()}] → sum = [${sum(numbers)}]`;
  }
}
function Testeex03() {
  
}
function Testeex04() {
  
}
function TesteisOrdered() {
 
}
function Testeinverted() {
  
}

function Testecontains() {
  
}

function Testecount() {
 
}

function TesteisPalindrome() {
  
}
function TesteareTheSame() {

}
function Testemerge() {

}
function TestesubArray() {

}
function TesteleftSide() {

}
function TesterightSide() {

}

function TestealternatedBooleans() {

}

function TesteinvertedBooleans() {

}