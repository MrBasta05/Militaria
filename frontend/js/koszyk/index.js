import { getCartData, removeAllCartElements } from "./koszyk.js";
import {
	handleChangeAmount,
	handlePay,
	handleRemoveAll,
	handleRemoveOne,
} from "./eventHandlers.js";
import createElement from "../helpers/createElement.js";
const username = "GIGACHAD";

const cartContainer = document.querySelector(".cart-container");
const cartItemsElements = [];
const idArray = [];
async function cartData() {
	const total = document.querySelector(".total-amount");
	const data = await getCartData(username);
	data.forEach((cartElem) => {
		const image = createElement("img", {
			src: `./img/produkty/${cartElem.id}.jpg`,
		});
		const imageBox = createElement("div", { class: "image-box" }, [image]);
		const title = createElement("h1", { class: "title" }, [cartElem.nazwa]);
		const product = createElement("div", { class: "product" }, [title]);
		const btnPlus = createElement("div", { class: "btn btn-incr" }, ["+"]);
		const btnMin = createElement("div", { class: "btn btn-decr" }, ["-"]);
		const count = createElement("div", { class: "count" }, [cartElem.ilosc]);
		const counter = createElement("div", { class: "counter" }, [
			btnPlus,
			count,
			btnMin,
		]);
		const amount = createElement("div", { class: "amount" }, [cartElem.koszt]);
		const remove = createElement("div", { class: "remove" }, ["Usuń"]);
		const prices = createElement("div", { class: "prices" }, [amount, remove]);
		const cartItems = createElement("div", { class: "cart-items" }, [
			imageBox,
			product,
			counter,
			prices,
		]);
		idArray[cartElem.nazwa] = cartElem.id;
		cartItemsElements.push(cartItems);
		document.querySelector(".checkout").before(cartItems);
		total.textContent = parseInt(total.textContent) + parseInt(cartElem.koszt);
	});
	total.textContent += "zł";
	cartItemsElements.forEach((element) => {
		const itemName = element.querySelector(".title").innerText;
		// guzik usuń w koszyku
		const removeItemButton = element.querySelector(".remove");
		removeItemButton.addEventListener("click", async () => {
			const isRemoved = await handleRemoveOne(itemName);
			if (isRemoved) {
				cartContainer.removeChild(element);
				total.textContent =
					parseInt(total.textContent) -
					parseInt(element.querySelector(".amount").textContent);
			} else {
				console.error("Nie udało się usunąć produktu.");
			}
		});

		// guziki + i - w koszyku
		const incrItemButton = element.querySelector(".btn-incr");
		incrItemButton.addEventListener("click", async () => {
			let amount = parseInt(element.querySelector(".count").innerText);
			const isChanged = await handleChangeAmount(idArray[itemName], amount + 1);
			if (isChanged) {
				element.querySelector(".count").innerText = amount + 1;
			} else {
				console.error("Błąd");
			}
		});
		const decrItemButton = element.querySelector(".btn-decr");
		decrItemButton.addEventListener("click", async () => {
			let amount = parseInt(element.querySelector(".count").innerText);
			if (amount === 1) {
				const isRemoved = await handleRemoveOne(itemName);
				total.textContent =
					parseInt(total.textContent) -
					parseInt(element.querySelector(".amount").textContent);

				if (isRemoved) {
					cartContainer.removeChild(element);
				} else {
					console.error("Nie udało się usunąć produktu.");
				}
			} else {
				const isChanged = await handleChangeAmount(
					idArray[itemName],
					amount - 1
				);
				if (isChanged) {
					element.querySelector(".count").innerText = amount - 1;
				} else {
					console.error("Błąd");
				}
			}
		});

		const payButton = document.getElementById("btn-pay");
		payButton.addEventListener("click", async () => {
			console.log("handle pay");
			const isPaid = await handlePay();
			if (isPaid) {
				const isRemoved = handleRemoveAll();
				if (isRemoved) {
					removeAllCartElements(
						[...cartContainer.children],
						cartItemsElements,
						cartContainer
					);
					console.log("payment successfull");
				}
			} else {
				console.error("Błąd z płatnością");
			}
		});
	});
}
cartData();
// Removes all cart items if data is successfully removed from database
const removeAllButton = document.getElementById("removeAllButton");

console.log(cartItemsElements);

removeAllButton.addEventListener("click", async () => {
	const isRemoved = await handleRemoveAll();
	if (isRemoved) {
		removeAllCartElements(
			[...cartContainer.children],
			cartItemsElements,
			cartContainer
		);
	}
});

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
