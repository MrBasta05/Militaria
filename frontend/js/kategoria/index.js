import { categoryData } from "./kategoria.js";
import createElement from "../helpers/createElement.js";

const url = new URLSearchParams(document.location.search);
const id = url.get("kategoria");

categoryData(id).then((data) => {
	const main = document.querySelector("main");
	main.append(createElement("h1", {}, [data[0]]));
	data.forEach((product, index) => {
		if (index > 0) {
			const h3 = createElement("h3", {}, [product.nazwa]);
			const koszt = createElement("div", {}, [`${product.koszt}zł`]);
			const opis = createElement("div", {}, [product.opis]);
			const zdjecie = createElement("img", {
				src: `./img/produkty/${product.id}.jpg`,
			});
			const productMain = createElement(
				"div",
				{
					class: "product-main",
					onclick: `location.href = 'produkt.html?id=${product.id}'`,
				},
				[h3, koszt, opis, zdjecie]
			);
			main.append(productMain);
		}
	});
});

export async function searchBar() {
	const req = await fetch("../backend/getData.php");
	const res = await req.json();
	const form = document.getElementById("search-bar");
	const input = form.querySelector("input");
	const names = res.map((product) => product.nazwa);
	const autocomplete = document.querySelector(".autocomplete");
	let prodId = 1;
	input.addEventListener("input", (e) => {
		console.log(autocomplete);
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
searchBar();
