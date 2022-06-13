import { getCartData, removeAllCartElements } from "./koszyk.js";
import {
	handleChangeAmount,
	handlePay,
	handleRemoveAll,
	handleRemoveOne,
} from "./eventHandlers.js";
import createElement from "../helpers/createElement.js";

const initialState = {
	item: {},
};

const username = "GIGACHAD";

const cartContainer = document.querySelector(".cart-container");
const cartItemsElements = [];
async function cartData() {
	const data = await getCartData(username);
	data.forEach((cartElem) => {
		const image = createElement("img", {
			// src: `./img/produkty/${cartElem.id}.jpg`
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
		cartItemsElements.push(cartItems);
		document.querySelector(".checkout").before(cartItems);
	});

	cartItemsElements.forEach((element) => {
		const itemName = element.querySelector(".title").innerText;
		// guzik usuń w koszyku
		const removeItemButton = element.querySelector(".remove");
		removeItemButton.addEventListener("click", async () => {
			const isRemoved = await handleRemoveOne(itemName);
			if (isRemoved) {
				cartContainer.removeChild(element);
			} else {
				console.error("Nie udało się usunąć produktu.");
			}
		});

		// guziki + i - w koszyku
		const incrItemButton = element.querySelector(".btn-incr");
		incrItemButton.addEventListener("click", async () => {
			let amount = parseInt(element.querySelector(".count").innerText);
			const isChanged = await handleChangeAmount(itemName);
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
				if (isRemoved) {
					cartContainer.removeChild(element);
				} else {
					console.error("Nie udało się usunąć produktu.");
				}
			} else {
				const isChanged = await handleChangeAmount(itemName);
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
