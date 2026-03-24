import VisitLogger from "/database/VisitLogger.js";

VisitLogger.log("home");

window.addEventListener("DOMContentLoaded", () => {
	fetch("links.json")
		.then((response) => response.json())
		.then((json) => {
			for (let section in json) {
				buildTree(section, json[section]);
			}
		});
});

function buildTree(section_name, section_list) {
	container.innerHTML += `<div id="${section_name}" class="container_column"></div>`;
	let section = document.getElementById(section_name);
	section.innerHTML = `<h2>${section_name}</h2>`;

	let tree_trunk = document.createElement("div");
	tree_trunk.className = "tree_trunk";

	let tree_leaves = document.createElement("div");
	tree_leaves.className = "tree_leaves";

	section_list.forEach(link => {
		let tree_branch = document.createElement("div");
		tree_branch.className = "tree_leaves";

		let tree_leaf = document.createElement("a");
		tree_leaf.setAttribute("href", link.link);

		
	});
}
