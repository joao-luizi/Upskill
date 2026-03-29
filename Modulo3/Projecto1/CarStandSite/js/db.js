const localhost = "https://localhost:44305";
const userObject = {
    "username" : null,
    "userToken": null
};

//Login
const formLogin = document.getElementById("formLogin");
const loginMessage = document.getElementById("loginMsg");
const profileimg = document.getElementById("profile-img");
const btlogout = document.getElementById("btlogout");
//End Login

//filters
const sortController = {
  marca: {
    selectEl: document.getElementById("fMarca"),
    sortEl: document.getElementById("fMarcaSortOrder"),
    sortAsc: true,
    stringAll: "Todas as marcas",
  },
  modelo: {
    selectEl: document.getElementById("fModelo"),
    sortEl: document.getElementById("fModeloSortOrder"),
    sortAsc: true,
    stringAll: "Todas as marcas",
  },
  ano: {
    selectEl: document.getElementById("fAno"),
    sortEl: document.getElementById("fAnoSortOrder"),
    sortAsc: true,
    stringAll: "Todos os anos",
  },
};
const fVendido = document.getElementById("fVendido");
//filters

async function GetFilter(endpoint)
{
    const response = fetch(localhost + endpoint, {
             method: "GET"
         });
    return response;
}

function syncOptions(selectElement, data)
{
    const existing = new Map(
        Array.from(selectElement.options).map(opt => [opt.value, opt])
    );

    Array.from(selectElement.options).forEach(option => {
        if (option.value !== "0" && !data.some(d => d.value === option.value))
        {
            option.remove();
        }
    });

    data.forEach(d => {
        if (!existing.has(d.value))
        {
            const opt = document.createElement("option");
            opt.value = d.value;
            opt.text = d.text;
            selectElement.appendChild(opt);
        }
    });
}

function sortSelect(selectElement, { ascending = true, numeric = false } = {})
{
    const options = Array.from(selectElement.options);

    const defaultOption = options.find(o => o.value === "0");
    const rest = options.filter(o => o.value !== "0");

    rest.sort((a, b) => {
        let valA = a.text;
        let valB = b.text;

        if (numeric)
        {
            return ascending
                ? Number(valA) - Number(valB)
                : Number(valB) - Number(valA);
        }

        return ascending
            ? valA.localeCompare(valB)
            : valB.localeCompare(valA);
    });

    selectElement.innerHTML = "";

    if (defaultOption)
        selectElement.appendChild(defaultOption);

    rest.forEach(o => selectElement.appendChild(o));
}


function fillFilter(filtersElement, uniqueFilters)
{
    const selectElement = filtersElement.selectEl;

    syncOptions(selectElement, uniqueFilters);

    sortSelect(selectElement, {
        ascending: filtersElement.sortAsc,
        numeric: false
    });
}

function nomalize(toMap, value, text)
{
    return toMap.map(f => ({
        value: String(f[value]),
        text: f[text]
    }));
}
async function preencherFiltros()
{
    const [resMarca, resModelo, resYears] = await Promise.all([
        GetFilter("\\filterMarca"),
        GetFilter("\\filterModelos"),
        GetFilter("\\filterYears")
    ]);

    if (!resMarca.ok) throw new Error("Promise Marca Return Error");
    if (!resModelo.ok) throw new Error("Promise Modelo Return Error");
    if (!resYears.ok) throw new Error("Promise Years Return Error");

    const [marcaData, modeloData, yearsData] = await Promise.all([
        resMarca.json(),
        resModelo.json(),
        resYears.json()
    ]);

    const normalizedMarca = nomalize(marcaData, "idMarca", "nome");
    const normalizedModelo = nomalize(modeloData, "idModelos", "modelo");
    const normalizedYears = nomalize(yearsData, "ano", "ano");

    fillFilter(sortController.marca, normalizedMarca);
    fillFilter(sortController.modelo, normalizedModelo);
    fillFilter(sortController.ano, normalizedYears);
}

async function checkUserToken()
{
    loadToken();
    if (userObject.userToken)
    {
        try {
            const response = await fetch(localhost + "/me", {
                method: "GET",
                headers: {
                    "Authorization": "Bearer " + userObject.userToken
                }
            });

            if (!response.ok)
                throw new Error("Invalid token");

            const data = await response.json();

            userObject.username = data.username;

        } catch {
            userObject.username = null;
            userObject.userToken = null;
            localStorage.removeItem("jwtToken");
        }
    }
    handleLogin();
    
}

async function getUserToken(user, pass, endpoint)
{
    if ([user, pass, endpoint].some(x => x == undefined || x == null))
        return;
    const userLogin = {
        "UserName": user, 
        "Password": pass
    };
    
    let response = await fetch(endpoint, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body : JSON.stringify(userLogin)
    });
    if (!response.ok) {
        alert("Invalid Login attempt!")
        userObject.username = null;
        userObject.userToken = null;
    }
    else
    {
        const data = await response.json();
        userObject.username = user;
        userObject.userToken = data.token;
        saveToken();
        console.log(userObject);
    }
    handleLogin();
}

function saveToken()
{
    localStorage.setItem("jwtToken", JSON.stringify(userObject));
}

function deleteToken()
{
    localStorage.removeItem("jwtToken");
}

function loadToken()
{
    const userLocalObject = localStorage.getItem("jwtToken");
    if (!userLocalObject)
    {
        userObject.username = null;
        userObject.userToken = null;
        return;
    }

    let userLocalJSON = null;
    try{
        userLocalJSON = JSON.parse(userLocalObject);
        userObject.username = userLocalJSON.username;
        userObject.userToken = userLocalJSON.userToken;
    }
    catch{
        userObject.username = null;
        userObject.userToken = null;
    }
}