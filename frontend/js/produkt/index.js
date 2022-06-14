import createElement from "../helpers/createElement.js";

async function createProduct() {
	const url = new URLSearchParams(document.location.search);
	const id = url.get("id");
	const req = await fetch(`../backend/getProduct.php?id=${id}`);
	const res = await req.json();
	console.log(res);
	const productName = createElement("h2", {}, [res[0].nazwa]);
	const descr = createElement("p", {}, [res[0].opis]);
	const image = createElement("img", {
		src: `img/produkty/${id}.jpg`,
	});
	const btn = createElement("button", { class: "dodaj" }, ["Dodaj do koszyka"]);
	btn.addEventListener("click", async () => {
		const res = fetch(`../backend/insertToCart.php?id=${id}`);
		if (!(await res).json()) {
			console.error("nie dodalo sie");
		} else {
			alert("dodano do koszyka");
		}
	});
	const product = createElement("div", { class: "product" }, [
		productName,
		descr,
		image,
		btn,
	]);
	document.querySelector("nav").after(product);
}
createProduct();

async function searchBar() {
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
searchBar();
