const btn = document.querySelector(".register");
const haslo = document.getElementById("haslo");
const nazwa = document.getElementById("nazwa");

btn.addEventListener("click", async () => {
	const id = await fetch(
		`../backend/insertUser.php?nazwa=${nazwa.value.trim()}&haslo=${haslo.value.trim()}`
	);
	console.log(id.json());
});
