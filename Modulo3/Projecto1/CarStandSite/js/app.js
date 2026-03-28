
function SetEventListeners()
{
    [profileimg, loginMessage].forEach(e => e.addEventListener("click", () =>{
        formLogin.classList.toggle("hidden");
    }));
    formLogin.addEventListener("submit", (e) =>{
        e.preventDefault();
        getUserToken(formLogin.username.value, formLogin.password.value, localhost + "/login");
    });
    btlogout.addEventListener("click", () =>{
        userObject.username = null;
        userObject.userToken = null;
        deleteToken();
        handleLogin();
    });
}


async function Init()
{
    SetEventListeners();
    await checkUserToken();
    preencherFiltros()
    alert("aqui")
}