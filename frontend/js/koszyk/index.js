import { getCartData } from "./koszyk.js";
import {
	handleChangeAmount,
	handleRemoveAll,
	handleRemoveOne,
} from "./eventHandlers.js";

const initialState = {
	item: {},
};

const userId = 1;

getCartData(userId);

// Removes all cart items if data is successfully removed from database
const cartContainer = document.querySelector(".cart-container");
const removeAllButton = document.getElementById("removeAllButton");
const cartItemsElements = [];
[...cartContainer.children].forEach((element) => {
	if (element.className === "cart-items") {
		cartItemsElements.push(element);
	}
});
console.log(cartItemsElements);
removeAllButton.addEventListener("click", async () => {
	const isRemoved = await handleRemoveAll();
	if (isRemoved) {
		[...cartContainer.children].forEach((element) => {
			if (cartItemsElements.includes(element)) {
				cartContainer.removeChild(element);
			}
		});
	}
});

cartItemsElements.forEach((element) => {
	const itemName = element.querySelector(".title").innerText;
	const removeItemButton = element.querySelector(".remove");
	removeItemButton.addEventListener("click", async () => {
		const isRemoved = await handleRemoveOne(itemName);
		if (isRemoved) {
			cartContainer.removeChild(element);
		} else {
			console.error("Nie udało się usunąć produktu.");
		}
	});

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
});
