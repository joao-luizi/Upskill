function StateRenderLoop() {
  if (!GameState.IsWaitingInput) {

  }
  StateRenderLoopUI();
}

function StateSetBoard() {
  GameState.isWaitingInput = true;
  GameState.isRunning = true;
  GameState.startTime = Date.now();
  GameState.firstFood = true;
  GameState.foodEaten = 0;
  GameState.tickCount = 0;
  intervalStartValue = 800;
  isTickRunning = false
  StateSetBoardUI();
  placeSnake();
  StateRenderLoopUI();
}

function SetStateSetUp() {
  GameState.gridSize = gridOptions[0];
  GameState.gridArr = [];
  GameState.foodPosition = [];
  GameState.snakeArray = [];
  GameState.lastInput = { x: 0, y: -1 };
  GameState.isWaitingInput = false;
  GameState.isRunning = false;
  updateInterval = intervalStartValue;
  clearInterval(intervalId);
  intervalId = -1;
  StateSetUpUI();
}