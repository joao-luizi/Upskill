const api = "https://localhost:44366";

let produtos = [];

async function carregarProdutos() {

    const res = await fetch(api+"/products");

    produtos = await res.json();

    renderTabela();
}

function renderTabela() {

    const tbody = document.querySelector("#tabelaProdutos");

    tbody.innerHTML = "";

    produtos.forEach(p => {

        const tr = document.createElement("tr");

        tr.innerHTML = `
            <td>${p.productID}</td>
            <td>${p.productName}</td>
            <td>${p.unitPrice ?? ""}</td>

            <td>
                <button onclick="editarProduto(${p.productID})">Editar</button>
                <button onclick="apagarProduto(${p.productID})">Apagar</button>
            </td>
        `;

        tbody.appendChild(tr);

    });

}

async function salvarProduto(e) {

    e.preventDefault();

    const id = document.getElementById("productID").value;

    const produto = {
        productName: document.getElementById("productName").value,
        unitPrice: parseFloat(document.getElementById("unitPrice").value)
    };

    if (id) {

        await fetch(`${api}/products/${id}`, {
            method: "PUT",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(produto)
        });

    } else {

        await fetch(`${api}/products`, {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(produto)
        });

    }

    limparForm();

    carregarProdutos();

}

function editarProduto(id) {

    const p = produtos.find(x => x.productID === id);

    document.getElementById("productID").value = p.productID;
    document.getElementById("productName").value = p.productName;
    document.getElementById("unitPrice").value = p.unitPrice;

}

async function apagarProduto(id) {

    if (!confirm("Apagar produto?")) return;

    await fetch(`${api}/products/${id}`, {
        method: "DELETE"
    });

    carregarProdutos();
}

function limparForm() {

    document.getElementById("productID").value = "";
    document.getElementById("productName").value = "";
    document.getElementById("unitPrice").value = "";

}