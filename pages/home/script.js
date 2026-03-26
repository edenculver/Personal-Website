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
	let section = document.createElement("div");
	section.className = "section";
	section.innerHTML = `<h2>${section_name}</h2>`;
	container.appendChild(section);
	
	let tree = document.createElement("div");
	tree.className = "tree";
	section.appendChild(tree);

	let tree_trunk = document.createElement("div");
	tree_trunk.className = "tree_trunk";
	tree.appendChild(tree_trunk);

	let tree_leaves = document.createElement("div");
	tree_leaves.className = "tree_leaves";
	tree.appendChild(tree_leaves);

	section_list.forEach(link => {
		// branch
		let tree_branch = document.createElement("div");
		tree_branch.className = "tree_branch";
		tree_trunk.appendChild(tree_branch);

		// leaf
		let tree_leaf = document.createElement("a");
		tree_leaf.setAttribute("href", link["link"]);
		let classes = "thumb";
		if (link.extra_classes) {
			classes += " " + link.extra_classes;
		}
		tree_leaf.innerHTML = `<img class="${classes}" src="${link.thumbnail}" alt="${link.alt_text}">`;
		tree_leaf.innerHTML += `<span>${link.name}</span>`;
		tree_leaves.appendChild(tree_leaf);
	});
}
