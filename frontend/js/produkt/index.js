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
	const btn = createElement("button", {}, ["Dodaj do koszyka"]);
	btn.addEventListener("click", async () => {
		const res = fetch(`../backend/insertToCart.php?id=${id}`);
		if (!(await res).json()) {
			console.error("nie dodalo sie");
		} else {
			console.log("dodano");
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
