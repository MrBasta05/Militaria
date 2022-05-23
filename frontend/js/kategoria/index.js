import { categoryData } from "./kategoria.js";

const url = new URLSearchParams(document.location.search);
const id = url.get("kategoria");

categoryData(id).then((data) => console.log(data));
