async function displayMainProducts() {
	const mainProducts = document.getElementsByClassName("product-main");
	const req = await fetch("getData.php");
	const res = await req.json();
	console.log(res);
	for (let i = 0; i < 6; i++) {
		console.log("test", mainProducts[i].childNodes, res[i]);
		mainProducts[i].childNodes[1].innerText = res[i].nazwa;
		mainProducts[i].childNodes[3].innerText = res[i].opis;
		mainProducts[i].childNodes[5].innerText = res[i].koszt;
	}
}
displayMainProducts();
