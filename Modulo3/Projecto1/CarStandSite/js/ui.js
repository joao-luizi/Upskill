function handleLogin()
{
    formLogin.classList = ["hidden"]
    formLogin.username.value = "";
    formLogin.password.value = "";
    if (userObject.userToken == null)
    {
        profileimg.src = "./images/ProfileGuest.png";
        loginMessage.innerText = "Welcome Guest!";
        btlogout.style.display = "none";
    }
    else
    {
        profileimg.src = "./images/Profile.png";
        loginMessage.innerText = `Welcome ${userObject.username}!`;
        btlogout.style.display = "block";
    }
}