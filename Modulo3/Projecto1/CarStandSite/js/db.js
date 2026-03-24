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