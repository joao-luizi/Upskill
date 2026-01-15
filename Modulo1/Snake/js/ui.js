function updateTimerUI(minutes, seconds) {
  const hudTime = document.getElementById("time");
  if (hudTime) {
    hudTime.innerHTML = `${String(minutes).padStart(2, "0")}:${String(
      seconds
    ).padStart(2, "0")}`;
  }
}

function updateScoreUI() {
  const hudScore = document.getElementById("score");
  if (hudScore) {
    hudScore.innerHTML = `${String(GameState.foodEaten).padStart(4, "0")}`;
  }
}

function renderFood(arrTd) {
  for (let i = 0; i < GameState.foodPosition.length; i++) {
    const target = arrTd.find(
      (item) =>
        Number(item.dataset.x) === GameState.foodPosition[i].x &&
        Number(item.dataset.y) === GameState.foodPosition[i].y
    );
    if (target) {
      target.classList.add("gridCellFood");
    }
  }
}

function renderSnake(arrTd) {
  for (let i = 0; i < GameState.snakeArray.length; i++) {
    const target = arrTd.find(
      (item) =>
        Number(item.dataset.x) === GameState.snakeArray[i].x &&
        Number(item.dataset.y) === GameState.snakeArray[i].y
    );
    if (target) {
      if (i === 0) {
        if (GameState.snakeArray[i].dx > 0) {
          target.classList = "gridCellHeadHR";
        }
        if (GameState.snakeArray[i].dx < 0) {
          target.classList = "gridCellHeadHL";
        }
        if (GameState.snakeArray[i].dy < 0) {
          target.classList = "gridCellHeadVU";
        }
        if (GameState.snakeArray[i].dy > 0) {
          target.classList = "gridCellHeadVD";
        }
      } else if (i === GameState.snakeArray.length - 1) {
        target.classList = "gridCellTail";
        if (GameState.snakeArray[i].dx > 0) {
          target.classList = "gridCellTailHR";
        }
        if (GameState.snakeArray[i].dx < 0) {
          target.classList = "gridCellTailHL";
        }
        if (GameState.snakeArray[i].dy < 0) {
          target.classList = "gridCellTailVU";
        }
        if (GameState.snakeArray[i].dy > 0) {
          target.classList = "gridCellTailVD";
        }
      } else {
        if (GameState.snakeArray[i - 1].x === GameState.snakeArray[i + 1].x){
          target.classList = "gridCellBodyV";
           
        }else if (GameState.snakeArray[i - 1].y === GameState.snakeArray[i + 1].y){
          target.classList = "gridCellBodyH";
        }
        else if(GameState.snakeArray[i - 1].x < GameState.snakeArray[i + 1].x){
          if (GameState.snakeArray[i - 1].y <  GameState.snakeArray[i + 1].y){
            //esquerda liga com cima
            target.classList = "gridCellBodyLU";
          }
          else{
            //esquerda liga com baixo
            target.classList = "gridCellBodyLD";
          }
        }
        else{
          if (GameState.snakeArray[i - 1].y <  GameState.snakeArray[i + 1].y){
            //direita liga com cima
            target.classList = "gridCellBodyRD";
          }
          else{
            //direita liga com baixo
            target.classList = "gridCellBodyRU";
          }
        }
      }
    }
  }
}
function StateRenderLoopUI() {
  const arrTd = [...document.getElementsByTagName("td")];
  for (let i = 0; i < arrTd.length; i++) {
    arrTd[i].classList = "gridCellEmpty";
  }
  renderFood(arrTd);
  renderSnake(arrTd);
}

function StateSetDeathUI() {
  const h2 = document.getElementById("isWaitingPrompt");
  h2.id = "isDead";
  h2.innerText = "Morreste!";
  h2.style.color = "red";
  h2.style.display = "block";
}

function StateSetBoardUI() {
  container.innerHTML = "";

  const innerDiv = document.createElement("div");
  innerDiv.style.textAlign = "center";

  const h2 = document.createElement("h2");
  h2.innerText = "Pressiona para começar!";
  h2.id = "isWaitingPrompt";

  const grid = document.createElement("table");
  grid.classList.add("center", "table");

  for (let i = 0; i < GameState.gridSize; i++) {
    const row = document.createElement("tr");
    GameState.gridArr[i] = [];
    for (let j = 0; j < GameState.gridSize; j++) {
      GameState.gridArr[i][j] = "";
      const cell = document.createElement("td");
      cell.dataset.y = `${i}`;
      cell.dataset.x = `${j}`;
      cell.classList.add("gridCellEmpty");
      row.appendChild(cell);
    }
    grid.appendChild(row);
  }

  const scoreDiv = document.createElement("div");
  scoreDiv.classList.add("hud");
  const pScore = document.createElement("p");
  pScore.innerHTML = `<strong>Score: </strong> <span id="score">0000</span>`;
  const pTimer = document.createElement("p");
  pTimer.innerHTML = `<strong>Time: </strong><span id="time">00:00</span>`;
  scoreDiv.append(pScore, pTimer);

  const button = document.createElement("button");
  button.innerText = "Novo Jogo";
  button.style.marginTop = "10px";
  button.addEventListener("click", SetStateSetUp);

  innerDiv.append(h2, grid, scoreDiv, button);
  container.append(innerDiv);
}

function StateSetUpUI() {
  container.innerHTML = "";
  const innerDiv = document.createElement("div");
  innerDiv.style.textAlign = "center";

  const select = document.createElement("select");
  select.name = "gridSize";
  select.id = "gridSize";
  select.style.marginLeft = "5px";
  select.addEventListener("change", () => {
    GameState.gridSize = Number(select.value);
  });

  const label = document.createElement("label");
  label.for = "gridSize";
  label.innerText = `Grid Size`;

  gridOptions.forEach((i) => {
    const option = document.createElement("option");
    option.value = i;
    option.innerText = `${i}x${i}`;
    select.appendChild(option);
  });

  const button = document.createElement("button");
  button.innerText = "Set Game";
  button.id = "setGridBtn";
  button.style.marginTop = "10px";
  button.addEventListener("click", () => {
    StateSetBoard();
  });

  const br = document.createElement("br");
  innerDiv.append(label, select, br, button);
  container.append(innerDiv);
}
