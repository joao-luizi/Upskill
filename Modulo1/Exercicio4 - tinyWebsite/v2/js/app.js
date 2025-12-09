const pages = [];
const pageTitles = [
  ["Homepage", "Welcome to My Website"],
  ["Blog", "My Blog"],
  ["Gallery", "My Gallery"],
  ["Students Data", "Students Report"],
  ["Application Form", "Application Form"],
  ["Contact", "Contacte-Nos / Informações de Contacto"],
  ["Resources", "Recursos Importantes"],
];
let currentIndex = -1;
let footer;

let header;

function loadPage(pageIndex) {
  if (currentIndex != pageIndex) {
    currentIndex = pageIndex;
    document.title = pageTitles[pageIndex][0];
    let h1title = document.getElementById("pageTitle");
    h1title.innerText = pageTitles[pageIndex][1];
    let main = document.getElementsByTagName("main");
    main[0].innerHTML = "";
    switch (pageIndex) {
      case 1:
        main[0].innerHTML = getBlog();
        break;
      case 2:
        main[0].innerHTML = getGallery();
        break;
      case 3:
        main[0].innerHTML = getReport();
        break;
      case 4:
        main[0].innerHTML = getApplication();
        break;
      case 5:
        main[0].innerHTML = getContacts();
        break;
      case 6:
        main[0].innerHTML = getResources();
        break;
      default:
        break;
    }
  }
}
function makeHeader() {
  header = document.createElement("div");
  header.id = "Top";
  let pref = document.createElement("p");
  pref.style.textAlign = "center";
  for (let i = 0; i < pageTitles.length; i++) {
    let anchor = document.createElement("a");
    anchor.innerText = pageTitles[i][0];
    anchor.href = "#";
    anchor.addEventListener("click", (ev) => {
      ev.preventDefault();
      loadPage(i);
    });
    pref.appendChild(anchor);
    if (i != pageTitles.length - 1) pref.append(" | ");
  }
  header.appendChild(pref);
  let htitle = document.createElement("h1");
  htitle.id = "pageTitle";
  htitle.innerText = "";
  htitle.style.textAlign = "center";
  header.appendChild(htitle);
}

function makeFooter() {
  footer = document.createElement("div");
  let hr = document.createElement("hr");
  let pref = document.createElement("p");
  pref.style.textAlign = "center";
  pref.innerHTML = `&copy; Copyright ${new Date().getFullYear()}. www.&ltabc&gt.com`;
  footer.appendChild(hr);
  footer.appendChild(pref);
}
function init() {
  let root = document.body;
  let main = document.createElement("main");
  makeHeader();
  makeFooter();
  root.appendChild(header);
  root.appendChild(main);
  root.appendChild(footer);
  loadPage(0);
}
