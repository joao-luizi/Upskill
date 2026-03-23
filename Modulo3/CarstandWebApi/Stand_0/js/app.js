const localhost = "https://localhost:44311";
let userToken = null;
//Login
const formLogin = document.getElementById("formLogin");
const loginMessage = document.getElementById("loginMsg");
const profileimg = document.getElementById("profile-img");
const btlogout = document.getElementById("btlogout");
//End Login

function SetEventListeners()
{
    [profileimg, loginMessage].forEach(e => e.addEventListener("click", () =>{
        formLogin.classList.toggle("hidden");
    }));
    formLogin.addEventListener("submit", (e) =>{
        e.preventDefault();
        getUserToken(formLogin.username.value, formLogin.password.value, localhost + "/login");
    });
}
function Init()
{
    SetEventListeners();
}