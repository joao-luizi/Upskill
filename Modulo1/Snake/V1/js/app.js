const container = document.getElementById("container");
const gridOptions = [15, 20, 25];
const snakeStartSize = 4;
let intervalStartValue = 800;
const GameState = {
  gridSize: gridOptions[0],
  gridArr: [],
  foodPosition: [],
  firstFood: true,
  foodEaten: 0,
  snakeArray: [],
  lastInput: { x: 0, y: -1 },
  isWaitingInput: true,
  startTime: Date.now(),
  tickCount: 0,
};
let intervalId = -1;
let isTickRunning = false;

function increaseSpeed() {
  if (GameState.foodEaten % 2){
    intervalStartValue = Math.max(80, intervalStartValue - 50);
    let newTick = setInterval(Tick, intervalStartValue);
    clearInterval(intervalId);
    intervalId = newTick;
  }
}

function checkGrowth() {
  if (GameState.foodEaten % 2 == 0) {
    const last = GameState.snakeArray[GameState.snakeArray.length - 1];
    const newSnakeNode = { x: last.x, y: last.y, dx: last.dx, dy: last.dy };
    if (last.dx !== 0) {
      newSnakeNode.x = last.x + last.dx * -1;
    }
    if (last.dy !== 0) {
      newSnakeNode.y = last.y + last.dy * -1;
    }

    GameState.snakeArray.push(newSnakeNode);
  }
}
function checkEating() {
  const notEatenFood = GameState.foodPosition.filter(
    (food) =>
      !GameState.snakeArray.some(
        (segment) => segment.x === food.x && segment.y === food.y
      )
  );
  if (notEatenFood.length !== GameState.foodPosition.length) {
    GameState.foodPosition = notEatenFood;
    GameState.foodEaten++;
    increaseSpeed();
    checkGrowth();
  }
}
function isDeadSnake() {
  for (let i = 1; i < GameState.snakeArray.length; i++) {
    if (
      GameState.snakeArray[i].x ===
        GameState.snakeArray[0].x + GameState.snakeArray[0].dx &&
      GameState.snakeArray[i].y ===
        GameState.snakeArray[0].y + GameState.snakeArray[0].dy
    ) {
      return true;
    }
  }
  return false;
}

function Tick() {
  if (isTickRunning) return;
  isTickRunning = true;
  GameState.tickCount++;
  let elapsed = Date.now() - GameState.startTime;
  let minutes = Math.floor((elapsed % (1000 * 60 * 60)) / (1000 * 60));
  let seconds = Math.floor((elapsed % (1000 * 60)) / 1000);

  if (GameState.firstFood || GameState.tickCount % 10 == 0) {
    GameState.firstFood = false;
    placeFood();
  }
  GameState.snakeArray[0].dx = GameState.lastInput.x;
  GameState.snakeArray[0].dy = GameState.lastInput.y;
  if (!isDeadSnake()) {
    updateSnake();
    updateSnakeDirection();
    StateRenderLoopUI();
    updateTimerUI(minutes, seconds);
    updateScoreUI();
    checkEating();
  } else {
    clearInterval(intervalId);
    intervalId = -1;
    StateSetDeathUI();
  }
  isTickRunning = false;
}

function placeFood() {
  let foodSet = false;
  while (!foodSet) {
    const row = Math.floor(Math.random() * GameState.gridSize);
    const col = Math.floor(Math.random() * GameState.gridSize);
    if (GameState.gridArr[row][col] === "") {
      console.log(`Puting food in ${col} ${row}`);
      if (GameState.foodPosition.length > 1) GameState.foodPosition.shift();
      GameState.foodPosition.push({ x: col, y: row });
      foodSet = true;
    }
  }
}

function initEventHandlers() {
  window.addEventListener("keydown", function (e) {
    if (GameState.isRunning) {
      if (GameState.isWaitingInput) {
        GameState.isWaitingInput = false;
        const isWaitingPrompt = this.document.getElementById("isWaitingPrompt");
        if (isWaitingPrompt) isWaitingPrompt.style.display = "none";
        intervalId = this.setInterval(Tick, intervalStartValue);
      } else {
        if (e.code === "Escape") {
          GameState.isWaitingInput = true;
          const isWaitingPrompt =
            this.document.getElementById("isWaitingPrompt");
          if (isWaitingPrompt) isWaitingPrompt.style.display = "block";
          clearInterval(intervalId);
          intervalId = -1;
        }

        if (GameState.snakeArray.length > 0) {
          if (e.code === "ArrowLeft" || e.code === "KeyA") {
            if (GameState.snakeArray[0].dx !== 1) {
              GameState.lastInput.x = -1;
              GameState.lastInput.y = 0;
            }
          }
          if (e.code === "ArrowRight" || e.code === "KeyD") {
            if (GameState.snakeArray[0].dx !== -1) {
              GameState.lastInput.x = 1;
              GameState.lastInput.y = 0;
            }
          }
          if (e.code === "ArrowUp" || e.code === "KeyW") {
            if (GameState.snakeArray[0].dy !== 1) {
              GameState.lastInput.x = 0;
              GameState.lastInput.y = -1;
            }
          }

          if (e.code === "ArrowDown" || e.code === "KeyS") {
            if (GameState.snakeArray[0].dy !== -1) {
              GameState.lastInput.x = 0;
              GameState.lastInput.y = 1;
            }
          }
        }
      }
    }
  });
}
function Init() {
  initEventHandlers();
  SetStateSetUp();
}
