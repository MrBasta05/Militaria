import axios from "https://cdn.skypack.dev/axios";

export async function categoryData(id) {
	try {
		const { data } = await axios.get(
			`../backend/getCategoryData.php?category=${id}`
		);
		return data;
	} catch (err) {
		console.error(err.message);
	}
}
