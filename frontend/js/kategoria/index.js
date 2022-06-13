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
