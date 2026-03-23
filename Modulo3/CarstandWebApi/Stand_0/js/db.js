async function getUserToken(user, pass, endpoint)
{
    console.log("getUserToken: " + user + " " + pass + " " + endpoint);
    if ([user, pass, endpoint].some(x => x == undefined || x == null))
        return;
    const userLogin = {
        "UserName": user, 
        "PassWord":pass
    };
    
    let token = await fetch(endpoint, {
        method: "POST",
        body : JSON.stringify(userLogin)
    });
    console.log(token);
}