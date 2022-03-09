async function displayMainProducts() {
	const mainProducts = document.getElementsByClassName("product-main");
	const req = await fetch("getData.php");
	const res = await req.json();
	console.log(res);
	for (let i = 0; i < 6; i++) {
		console.log("test", mainProducts[i].children, res[i]);
		mainProducts[i].children[0].innerText = res[i].nazwa;
		mainProducts[i].children[1].innerText = res[i].opis;
		mainProducts[i].children[2].innerText = `${res[i].koszt}zł`;
		mainProducts[i].children[3].src = `${res[i].id || "placeholder"}.jpg`;
	}
}
displayMainProducts();
