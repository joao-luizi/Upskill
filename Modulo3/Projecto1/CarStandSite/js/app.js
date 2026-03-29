
function triggerSearch()
{
    //collect all selected sortController.marca.selectEl select options
    //collect all selected sortController.ano.selectEl select options
    //collect all selected sortController.modelo.selectEl select options
    //collect 
}
function handleSelectLogic(e) {
    const select = e.target;
    const options = select.options;

    if (options[0].selected) {
        const shouldSelectAll = options[0].selected;

        for (let i = 1; i < options.length; i++) {
            options[i].selected = shouldSelectAll;
        }
        options[0].selected = false;
    }
}

function handleFilterChange(e) {
    handleSelectLogic(e);
    triggerSearch();
}

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
    [
        sortController.marca.selectEl, 
        sortController.ano.selectEl, 
        sortController.modelo.selectEl
    ].forEach(e => e.addEventListener("change", handleFilterChange));
   
}


async function Init()
{
    SetEventListeners();
    await checkUserToken();
    await preencherFiltros()
   
}