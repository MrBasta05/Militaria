export async function handleRemoveAll() {
	const res = await fetch("../backend/removeAllCartData.php");
	return await res.json();
}

export async function handleRemoveOne(id) {
	const res = await fetch(`../backend/removeOneCartData.php?id=${id}`);
	return true;
}

export async function handleChangeAmount(productName, amount) {
	const res = await fetch(
		`../backend/changeAmount.php?id=${productName}&amount=${amount}`
	);
	return true;
}

export async function handlePay() {
	return true;
}
