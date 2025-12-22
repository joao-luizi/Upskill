let board = [
  ["", "", ""],
  ["", "", ""],
  ["", "", ""],
];

let arrayWin = [
  [
    [0, 0],
    [0, 1],
    [0, 2],
  ],
  [
    [1, 0],
    [1, 1],
    [1, 2],
  ],
  [
    [2, 0],
    [2, 1],
    [2, 2],
  ],
  [
    [0, 0],
    [1, 0],
    [2, 0],
  ],
  [
    [0, 1],
    [1, 1],
    [2, 1],
  ],
  [
    [0, 2],
    [1, 2],
    [2, 2],
  ],
  [
    [0, 0],
    [1, 1],
    [2, 2],
  ],
  [
    [0, 2],
    [1, 1],
    [2, 0],
  ],
];

let playerToken = "X";
let gameOn = false;

function clearBoard() {
  for (let i = 0; i < board.length; i++) {
    for (let j = 0; j < board[i].length; j++) {
      board[i][j] = "";
    }
  }
  console.log("Board was cleared");
}

function divClick(e) {
  if (gameOn) {
    let y = e.target.id[0];
    let x = e.target.id[1];
    if (board[y][x] == "") {
      e.target.innerText = playerToken;
      board[y][x] = playerToken;
      if (checkGameOver()) handleGameOver();
      else if (checkTie()) handleTie();
      else handlePlayerToken();

    }
  }
}
function handleGameOver() {
  let status = document.getElementById("status");
  status.innerText = "Ganhou o Jogador : " + playerToken;
  gameOn = false;
}
function handleTie() {
  let status = document.getElementById("status");
  status.innerText = "Empate";
  gameOn = false;
}
function checkTie() {
  for (let i = 0; i < board.length; i++) {
    for (let j = 0; j < board[i].length; j++) {
      if ((board[i][j] == "")) return false;
    }
  }
  return true;
}
function checkGameOver() {
  for (let i = 0; i < arrayWin.length; i++) {
    let pos0 = arrayWin[i][0];
    let pos1 = arrayWin[i][1];
    let pos2 = arrayWin[i][2];
    if (
      board[pos0[0]][pos0[1]] == playerToken &&
      board[pos1[0]][pos1[1]] == playerToken &&
      board[pos2[0]][pos2[1]] == playerToken
    )
      return true;
  }
  return false;
}
function handlePlayerToken() {
  if (gameOn) {
    let status = document.getElementById("status");
    if (playerToken == "X") playerToken = "O";
    else playerToken = "X";
    status.innerHTML = "Jogador atual: " + playerToken;
  }
}
function newGame() {
  clearBoard();
  gameOn = true;
  let grid = document.getElementById("board");
  grid.innerHTML = "";
  for (let i = 0; i < board.length; i++) {
    for (let j = 0; j < board[i].length; j++) {
      let cell = document.createElement("div");
      cell.classList.add("cell");
      cell.id = i + "" + j;
      cell.innerText = board[i][j];
      cell.addEventListener("click", (e) => {
        divClick(e);
      });
      grid.appendChild(cell);
    }
  }
}
