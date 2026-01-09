//{ "ISBN": "<ISBN>", "titulo": "<titulo>", "autor": "<autor>", "categoria": "< categoria 
//    >", "preco": <preco>, "promocao": <promocao>, "rating": <rating>, "imagem": 
//    "<ficheiro>" }
const db = [
    { "ISBN": "0001", "titulo": "HTML5, CSS3, JavaScript para Principiantes", "autor": "Zé dos Anzóis", "categoria": "Front End", "preco": 300, "promocao": true, "rating": 5, "imagem": "curso1.jpg", "info": "" },
    { "ISBN": "0002", "titulo": "Curso de Comida Vegetariana", "autor": "Zé dos Anzóis", "categoria": "Culinária", "preco": 200, "promocao": true, "rating": 4, "imagem": "curso2.jpg", "info": ""  },
    { "ISBN": "0003", "titulo": "Guitarra para Principiantes", "autor": "Zé dos Anzóis", "categoria": "Música", "preco": 200, "promocao": true, "rating": 4, "imagem": "curso3.jpg", "info": ""  },
    { "ISBN": "0004", "titulo": "A horta em casa", "autor": "Zé dos Anzóis", "categoria": "Jardinagem", "preco": 200, "promocao": true, "rating": 4, "imagem": "curso4.jpg", "info": ""  },
    { "ISBN": "0005", "titulo": "Decoração com produtos artesanais", "autor": "Zé dos Anzóis", "categoria": "Artes", "preco": 200, "promocao": true, "rating": 4, "imagem": "curso5.jpg", "info": ""  },
    { "ISBN": "0006", "titulo": "Concurrency in C# Cookbook", "autor": "O'Reilly", "categoria": "Parallel Programming", "preco": 300, "promocao": true, "rating": 5, "imagem": "curso1.jpg", "info": "Focado em programação paralela e assíncrona, fundamental para .NET moderno" },
        { "ISBN": "0007", "titulo": "Programação C# 12", "autor": "O'Reilly", "categoria": "C# Programming", "preco": 300, "promocao": true, "rating": 5, "imagem": "curso1.jpg", "info": " Um guia completo para a linguagem, cobrindo desde o básico até recursos avançados, ótimo para iniciantes e experientes" },
        { "ISBN": "0008", "titulo": "Criando Microsserviços, 2ª Edição", "autor": "O'Reilly", "categoria": "C# Programming", "preco": 300, "promocao": true, "rating": 5, "imagem": "curso1.jpg", "info": "Essencial para arquitetura de sistemas modernos com .NET" },
                { "ISBN": "0009", "titulo": "O Sistema de Tipos C#", "autor": "O'Reilly", "categoria": "C# Programming", "preco": 300, "promocao": true, "rating": 5, "imagem": "curso1.jpg", "info": "Detalha os tipos e o sistema de tipos, crucial para entender o C# profundamente" },
                { "ISBN": "0010", "titulo": "Tornando-se Funcional com C#", "autor": "O'Reilly", "categoria": "C# Programming", "preco": 300, "promocao": true, "rating": 5, "imagem": "curso1.jpg", "info": "Aborda programação funcional em C#, uma abordagem cada vez mais relevante." },
];

let bookDb = []
let currentUser = undefined;

function saveLocalItem(key, obj){
    localStorage.setItem(key, JSON.stringify(obj));
}

function getLocalItem(key){
    return localStorage.getItem(key)
}

function getLocalBookDb(){
    let localBooks = getLocalItem("books")
    let dbBooks = [];
    
    if (localBooks && localBooks !== "") {
    try {
      dbBooks = JSON.parse(localBooks);
    } catch {
      console.log("Unable to parse book data");
      dbBooks = [...db];
    }
  }
  if (dbBooks === "" || dbBooks.length === 0){
    const init = confirm("A base de dados de livros está vazia. Pretende (re)inicializar?");
    if (init)
        dbBooks = [...db]; 
  }
  bookDb = dbBooks;
  saveLocalItem("books", bookDb);
}

function existsISBN(isbn){
    return bookDb.some((item) => item.ISBN === isbn)
}

//#region dbUsersFunctions
function getLocalUsers(){
    let localUsers = getLocalItem("users")
    let dbUsers = [];
    
    if (localUsers && localUsers !== "") {
    try {
      dbUsers = JSON.parse(localUsers);
    } catch {
      console.log("Unable to parse user data");
    }
  }
  if (dbUsers === "" || dbUsers.length === 0){
    dbUsers = []  
     
    }
  return assureLocalAdmin(dbUsers);
}

function assureLocalAdmin(dbUsers){
    if (!getUser("upskill","upskill1234", dbUsers))
    {
      dbUsers.push({
      username: "upskill",
      userpass: "upskill1234",
      userfavs: [],
      userrole: "admin"} 
      )
      saveLocalItem("users", dbUsers)
    }
    return dbUsers
}

function saveNewUser(username, password){
    let localUsers = getLocalUsers();
    const newUser = {
        username: username,
        userpass: password,
        userfavs: [],
        userrole: "user"
    }
    localUsers.push(newUser);
    saveLocalItem("users", localUsers);
}

function getUser(username, password, localUsers){
    let userObj = localUsers.find((user) => 
        user.username === username && user.userpass === password
    );
    return userObj;
}

function getUserNameCount(username, localUsers){
    let userObj = localUsers.filter(user => user.username === username);
    return userObj.length;
}

function checkUserLogin(username, password) {
    let localUsers = getLocalUsers();
    const currUser = getUser(username, password, localUsers);
    let loginDone = true;
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
            loginDone = false
        }
    }
    return loginDone

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