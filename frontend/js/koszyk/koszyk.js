import axios from "https://cdn.skypack.dev/axios";

export async function getCartData(userId) {
	try {
		const { data } = await axios.get(
			`../backend/getCartData.php?user=${userId}`
		);
		return data;
	} catch (err) {
		console.error(err.message);
	}
}

export function removeAllCartElements(
	arrayOfElem,
	cartItemsElements,
	cartContainer
) {
	arrayOfElem.forEach((element) => {
		if (cartItemsElements.includes(element)) {
			cartContainer.removeChild(element);
		}
	});
}
