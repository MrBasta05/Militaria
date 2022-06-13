async function displayMainProducts() {
	const mainProducts = document.getElementsByClassName("product-main");
	const req = await fetch("../backend/getData.php");
	const res = await req.json();
	console.log(res);
	for (let i = 0; i < 6; i++) {
		console.log("test", mainProducts[i].children, res[i]);
		mainProducts[i].setAttribute("onclick", "location.html = produkt.html");
		mainProducts[i].children[0].innerText = res[i].nazwa;
		// mainProducts[i].children[1].innerText = res[i].opis;
		mainProducts[i].children[2].innerText = `${res[i].koszt}zł`;
		mainProducts[i].children[3].src = `./img/produkty/${res[i].id}.jpg`;
	}
	function searchBar() {
		const form = document.getElementById("search-bar");
		const input = form.querySelector("input");
		const names = res.map((product) => product.nazwa);
		input.addEventListener("change", (e) => {
			console.log(names.includes(e.target.value));
		});
		form.addEventListener("submit", (e) => {
			e.preventDefault();
			document.location.href = `${e.target.value}.html`;
			console.log("xd");
		});
	}
	searchBar();
}
displayMainProducts();
