function updateSnakeDirection() {
  for (let i = GameState.snakeArray.length - 1; i > 0; i--) {
    GameState.snakeArray[i].dx = GameState.snakeArray[i - 1].dx;
    GameState.snakeArray[i].dy = GameState.snakeArray[i - 1].dy;
  }
}
function updateSnake() {
  const sn = GameState.snakeArray;
  const arr = GameState.gridArr;
  
  for (let i = 0; i < sn.length; i++) {
    sn[i].x += sn[i].dx;
    if (sn[i].x < 0) sn[i].x = arr.length - 1;
    if (sn[i].x > arr.length - 1) sn[i].x = 0;
    sn[i].y += sn[i].dy;
    if (sn[i].y < 0) sn[i].y = arr.length - 1;
    if (sn[i].y > arr.length - 1) sn[i].y = 0;
  }
}

function placeSnake() {
  const col = Math.floor(GameState.gridSize / 2);
  const row = col;
  GameState.snakeArray[0] = { x: col, y: row, dx: 0, dy: -1 };
  for (let i = 1; i <= snakeStartSize; i++) {
    GameState.snakeArray[i] = { x: col, y: row + i, dx: 0, dy: -1 };
  }
}
