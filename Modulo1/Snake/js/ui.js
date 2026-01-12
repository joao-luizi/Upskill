
function updateTimerUI(minutes, seconds){
  const hudTime =  document.getElementById("time");
  if (hudTime){
    hudTime.innerHTML = `${String(minutes).padStart(2, "0")}:${String(seconds).padStart(2, "0")}`
  }
}

function updateScoreUI(){
  const hudScore =  document.getElementById("score");
  if (hudScore){
    hudScore.innerHTML = `${String(GameState.foodEaten).padStart(4, "0")}`
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
      if (i === 0){
        target.classList = "gridCellHead";
        //target.style.backgroundImage = `url('./img/head.png')`
        if ( GameState.snakeArray[i].x < 0){
         
        }
      }
      else if (i === GameState.snakeArray.length - 1){
        target.classList = "gridCellTail";
        //target.style.backgroundImage = `url('./img/tail.png')`
      }
      else{
        target.classList = "gridCellBody";
        //target.style.backgroundImage = `url('./img/body.png')`
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

function StateSetDeathUI(){
  const h2 = document.getElementById("isWaitingPrompt")
  h2.id = "isDead"
  h2.innerText = "Morreste!";
  h2.style.color = "red";
  h2.style.display = "block"
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
