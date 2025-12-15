const currentYear = new Date().getFullYear()
	
function loadPage(page) {
	let p = document.getElementById("content");
	if (p != null && pages[page] != null && pages[page] != "") {
		p.innerHTML = head + pages[page] + foot;
		menuLinks();
	}
	else {
		document.body.innerHTML = "<h2>Página não encontrada</h2>";
	}
}

function menuLinks() {
    const links = document.querySelectorAll("nav a");
	for (let i=0; i < links.length; i++) {
		//console.log(links[i].attributes["data-page"].value)
        links[i].addEventListener("click", (e) => {
            e.preventDefault();
			//links[i].getAttribute("data-page")
            loadPage(links[i].attributes["data-page"].value);
        });
    }
}
