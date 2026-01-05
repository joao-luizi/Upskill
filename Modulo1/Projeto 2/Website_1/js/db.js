//{ "ISBN": "<ISBN>", "titulo": "<titulo>", "autor": "<autor>", "categoria": "< categoria 
//    >", "preco": <preco>, "promocao": <promocao>, "rating": <rating>, "imagem": 
//    "<ficheiro>" }
const db = [
    { "ISBN": "0001", "titulo": "HTML5, CSS3, JavaScript para Principiantes", "autor": "Zé dos Anzóis", "categoria": "Front End", "preco": 300, "promocao": true, "rating": 5, "imagem": "curso1.jpg" },
    { "ISBN": "0002", "titulo": "Curso de Comida Vegetariana", "autor": "Zé dos Anzóis", "categoria": "Culinária", "preco": 200, "promocao": true, "rating": 4, "imagem": "curso2.jpg" },
    { "ISBN": "0003", "titulo": "Guitarra para Principiantes", "autor": "Zé dos Anzóis", "categoria": "Música", "preco": 200, "promocao": true, "rating": 4, "imagem": "curso3.jpg" },
    { "ISBN": "0004", "titulo": "A horta em casa", "autor": "Zé dos Anzóis", "categoria": "Jardinagem", "preco": 200, "promocao": true, "rating": 4, "imagem": "curso4.jpg" },
    { "ISBN": "0005", "titulo": "Decoração com produtos artesanais", "autor": "Zé dos Anzóis", "categoria": "Artes", "preco": 200, "promocao": true, "rating": 4, "imagem": "curso5.jpg" },
];

let bookDb = {}
/*This will simulate a user database where we keep new users and the user favorites. It will also store the username and password for authentication porpuses for 5) Operação de conclusão da compra, mediante autenticação
Example UserObject 
{
username: "Name"
userpass: "Pass"
userfavs: [] // a list of ISBN that represent the favorites
}
*/
let currentUser = undefined;

//#region dbUsersFunctions
function getLocalUsers(){
    let localUsers = localStorage.getItem("users");
    let dbUsers = [];
    
    if (localUsers && localUsers !== "") {
    try {
      dbUsers = JSON.parse(localUsers);
    } catch {
      console.log("Unable to parse user data");
    }
  }
  if (dbUsers === "")
    dbUsers = []  
  return dbUsers;
}

function saveLocalUsers(arrUsers){
    localStorage.setItem("users", JSON.stringify(arrUsers));
}
function saveNewUser(username, password){
    let localUsers = getLocalUsers();
    const newUser = {
        username: username,
        userpass: password,
        userfavs: []
    }
    localUsers.push(newUser);
    saveLocalUsers(localUsers);
}
function getUser(username, password, localUsers){
    let userObj = localUsers.find((user) => { 
        user.username === username && user.userpass === password
    });
    return userObj;
}

function getUserNameCount(username, localUsers){
    let userObj = localUsers.filter(user => user.username === username);
    return userObj.length;
}

function checkUserLogin(username, password) {
    let localUsers = getLocalUsers();
    const currUser = getUser(username, password, localUsers);

    if (currUser) {
        currentUser = currUser;
    } else{
        const userExists = getUserNameCount(username, localUsers) > 0;
    
        if (!userExists) {
            const create = confirm("Utilizador não existe. Pretende criar este utilizador?");
            if (create) {
                saveNewUser(username, password);
                localUsers = getLocalUsers();
                currentUser = getUser(username, password, localUsers);
            }
        } else {
            alert("Wrong Password!");
        }
    }

}
//#endregion dbUsersFunctions
/*this simulates a store database were we could put localion, adress, employees, store type (online / physical) etc for the purpose of this project it will only track sales to give us the TOP Five sales (7) Apresentação dos cinco cursos mais vendidos)
Example StoreObject
{
storeid: 1
storessales: [] an array of store sales each with ISBN: and salecount:
}
*/
let dbStores = []

//#region dbStoresFunctions
function resetStoreInfo(){
    dbStores =[
        {
            storeid: 1,
            storesales: []
        }
    ]
}
function saveLocalStoreInfo(){
    localStorage.setItem("stores", JSON.stringify(dbStores));
}
function getLocalStoreInfo(){
    let localStore = localStorage.getItem("stores");
    if (localStore && localStore != "") {
    try {
      dbStores = JSON.parse(localStore);
    } catch {
      console.log("Unable to parse store data");
      resetStoreInfo();
      saveLocalStoreInfo()
    }
  }
  else {
    resetStoreInfo();
    saveLocalStoreInfo()
  }
}
//#endregion dbStoresFunctions