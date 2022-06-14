import createElement from "./js/helpers/createElement.js";

async function displayMainProducts() {
	const mainProducts = document.getElementsByClassName("product-main");
	const req = await fetch("../backend/getData.php");
	const res = await req.json();
	console.log(res);
	for (let i = 0; i < 6; i++) {
		console.log("test", mainProducts[i].children, res[i]);
		mainProducts[i].setAttribute(
			"onclick",
			`location.href = 'produkt.html?id=${i + 1}'`
		);
		mainProducts[i].children[0].innerText = res[i].nazwa;
		// mainProducts[i].children[1].innerText = res[i].opis;
		mainProducts[i].children[2].innerText = `${res[i].koszt}zł`;
		mainProducts[i].children[3].src = `./img/produkty/${res[i].id}.jpg`;
	}
	searchBar();
}

export async function searchBar() {
	const req = await fetch("../backend/getData.php");
	const res = await req.json();
	const form = document.getElementById("search-bar");
	const input = form.querySelector("input");
	const names = res.map((product) => product.nazwa);
	const autocomplete = document.querySelector(".autocomplete");
	let prodId = 1;
	input.addEventListener("input", (e) => {
		autocomplete.innerHTML = "";
		names.forEach((element, index) => {
			if (
				element.toLowerCase().startsWith(e.target.value.toLowerCase()) &&
				e.target.value !== ""
			) {
				autocomplete.appendChild(
					createElement(
						"li",
						{ onclick: `location.href = 'produkt.html?id=${index + 1}'` },
						[element]
					)
				);
			}
			if (element.toLowerCase() === e.target.value.toLowerCase()) {
				prodId = index + 1;
			}
		});
	});
	form.addEventListener("submit", (e) => {
		e.preventDefault();
		document.location.href = `produkt.html?id=${prodId}`;
		console.log("xd");
	});
}
displayMainProducts();
