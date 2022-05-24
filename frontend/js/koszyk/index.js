import { getCartData } from "./koszyk.js";
import { handleRemoveAll } from "./eventHandlers.js";

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
	const removeItemButton = element.querySelector(".remove");
	removeItemButton.addEventListener("click", () => {
		console.log(element);
	});
});
