const containerSetup = document.getElementById("container-setup");
const containerPlay = document.getElementById("container-play");
let gridArr = undefined;
let direction = { x: -1, y: -1 };
//let foodPosition = { x: -1, y: -1 };
let snakeStartSize = 2;
let snakeArray = [];
let foodPosition = [];
let updateInterval = 1000;
let intervalId = -1;

function setSnake() {
  if (gridArr) {
    snakeInGrid();
    updateGridUI();
  }
}

function updateSnake() {
  for (let i = 0; i < snakeArray.length; i++) {
    snakeArray[i].x += snakeArray[i].dx;
    if (snakeArray[i].x < 0) snakeArray[i].x = gridArr.length - 1;
    if (snakeArray[i].x > gridArr.length - 1) snakeArray[i].x = 0;
    snakeArray[i].y += snakeArray[i].dy;
    if (snakeArray[i].y < 0) snakeArray[i].y = gridArr.length - 1;
    if (snakeArray[i].y > gridArr.length - 1) snakeArray[i].y = 0;
  }
}
function Tick() {
  if (gridArr && snakeArray.length > 0) {
    updateSnake();
    updateGridUI();
  }
}
function updateGridUI() {
  const arrTd = [...document.getElementsByTagName("td")];
  for (let i = 0; i < arrTd.length; i++) {
    arrTd[i].classList = "gridCellEmpty";
  }

  if (foodPosition.length > 0) {
    for (let i = 0; i < foodPosition.length; i++) {
      const target = arrTd.find(
        (item) =>
          Number(item.dataset.x) === foodPosition[i].x &&
          Number(item.dataset.y) === foodPosition[i].y
      );
      if (target) {
        target.classList.add("gridCellFood");
      }
    }
  }

  if (snakeArray.length > 0) {
    for (let i = 0; i < snakeArray.length; i++) {
      const target = arrTd.find(
        (item) =>
          Number(item.dataset.x) === snakeArray[i].x &&
          Number(item.dataset.y) === snakeArray[i].y
      );
      if (target) {
        if (i === 0) target.classList.add("gridCellHead");
        else target.classList.add("gridCellBody");
      }
    }
  }
}

function snakeInGrid() {
  let snakeSet = false;
  while (!snakeSet) {
    const row =
      Math.floor(Math.random() * (gridArr.length - snakeStartSize * 2)) +
      snakeStartSize;
    const col =
      Math.floor(Math.random() * (gridArr.length - snakeStartSize * 2)) +
      snakeStartSize;
    if (gridArr[row][col] === "") {
      snakeArray[0] = { x: col, y: row, dx: 0, dy: -1 };
      for (let i = 1; i <= snakeStartSize; i++) {
        snakeArray[i] = { x: col, y: row + i, dx: 0, dy: -1 };
      }
      snakeSet = true;
    }
  }
}
function foodInGrid() {
  let foodSet = false;
  while (!foodSet) {
    const row = Math.floor(Math.random() * gridArr.length);
    const col = Math.floor(Math.random() * gridArr.length);
    if (gridArr[row][col] === "") {
      console.log(`Puting food in ${col} ${row}`);
      if (foodPosition.length > 1) foodPosition.shift();
      foodPosition.push({ x: col, y: row });
      foodSet = true;
    }
  }
}

function setFood() {
  if (gridArr) {
    foodInGrid();
    updateGridUI();
  }
}
function setUpgrid() {
  containerSetup.style.display = "none";
  containerPlay.innerHTML = "";
  const gridSize = Number(document.getElementById("gridSize").value);
  gridArr = [];
  const grid = document.createElement("table");
  grid.classList.add("center");

  for (let i = 0; i < gridSize; i++) {
    const row = document.createElement("tr");
    gridArr[i] = [];
    for (let j = 0; j < gridSize; j++) {
      gridArr[i][j] = "";
      const cell = document.createElement("td");
      cell.dataset.y = `${i}`;
      cell.dataset.x = `${j}`;
      cell.classList.add("gridCellEmpty");
      row.appendChild(cell);
    }
    grid.appendChild(row);
  }
  containerPlay.appendChild(grid);
}
function initEventHandlers() {
  containerSetup.addEventListener("click", setUpgrid);
  window.addEventListener("keydown", function (e) {
    console.log(e);
    if (e.code === "ArrowLeft" || e.code === "KeyA") direction.x = -1;
    direction.y = 0;
    if (e.code === "ArrowRight" || e.code === "KeyD") direction.x = 1;
    direction.y = 0;
    if (e.code === "ArrowUp" || e.code === "KeyW") direction.x = 0;
    direction.y = -1;
    if (e.code === "ArrowDown" || e.code === "KeyS") direction.x = 0;
    direction.y = 1;
  });
}
function Init() {
  initEventHandlers();
}

Init();
