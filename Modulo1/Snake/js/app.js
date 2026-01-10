const containerSetup = document.getElementById("container-setup")
const containerPlay = document.getElementById("container-play")
let gridArr = undefined;
let direction = {x: -1, y:-1}
let updateInterval = 1000;
let intervalId = -1;


function setFood(){
    if (gridArr){
        let foodSet = false;
        while (!foodSet){

            const row = Math.floor(Math.random() * gridArr.length);
            console.log(row)
            const col = Math.floor(Math.random() * gridArr.length);
            if (gridArr[row][col] === ""){
                gridArr[row][col] === "X"
                foodSet = true;
            }
        }
    }
}
function setUpgrid(){
    containerSetup.style.display = "none";
    containerPlay.innerHTML = "";
    const gridSize = Number(document.getElementById("gridSize").value);
    gridArr = []
    const grid = document.createElement("table");
    grid.classList.add("center")

    for (let i = 0; i < gridSize; i++){
    const row = document.createElement("tr");
    gridArr[i] = [];
        for (let j = 0 ; j < gridSize; j++){
            gridArr[i][j] = "";
            const cell = document.createElement("td");
            cell.style.width = 10 + "px";
            cell.style.height = 10 + "px";
            cell.dataset.coord = `${i}${j}`;
            cell.classList.add("gridCell")
            row.appendChild(cell)
        }
        grid.appendChild(row);
    }
    containerPlay.appendChild(grid)  
    console.log(gridArr);
}
function initEventHandlers(){
    containerSetup.addEventListener('click', setUpgrid);
    window.addEventListener("keydown", function(e){
        console.log(e)
        if (e.code === "ArrowLeft" || e.code === "KeyA")
                direction.x = -1; direction.y = 0;
        if (e.code === "ArrowRight" || e.code === "KeyD")
                direction.x = 1; direction.y = 0;
        if (e.code === "ArrowUp" || e.code === "KeyW")
                direction.x = 0; direction.y = -1;
        if (e.code === "ArrowDown" || e.code === "KeyS")
                direction.x = 0; direction.y = 1;
    });
}
function Init(){
    initEventHandlers();
    
}

Init();