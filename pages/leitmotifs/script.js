import * as d3 from "https://cdn.jsdelivr.net/npm/d3@7/+esm";

var nodes = [];
var links = [];

const alphaDecay = 0.01;
const borderWidth = 10;
const collideIterations = 2;
const linkDistance = 50;
const manyBodyStrength = -100;
const reheatAlpha = 0.5;
const songRadius = 6;
const xyStrength = 0.08;

window.addEventListener("DOMContentLoaded", () => {
	buildNodesAndLinks()
		.then(simulate);
});

[select_leitmotif, select_song].forEach(
	select => select.addEventListener("change", () => {
		const target_id = select.options[select.selectedIndex].dataset.option;

		if (target_id == "x") {
			// hide info panel and unhighlight nodes
			info_panel.setAttribute("hidden", true);
			Array.from(document.getElementsByClassName("highlighted")).forEach(e => e.classList.remove("highlighted"));
		} else {
			const target = document.getElementById(target_id);
			setSelectedNode(target);
		}
	})
);

async function buildNodesAndLinks() {
	// add song nodes
	const response1 = await fetch("https://edenculver.net/api/leitmotifs/songs");
	const data1 = await response1.json();
	data1.forEach(row => addSongNode(row));

	// add leitmotif nodes
	const response2 = await fetch("https://edenculver.net/api/leitmotifs/leitmotifs")
	const data2 = await response2.json();
	data2.forEach(row => addLeitmotifNode(row));

	// add links
	const response3 = await fetch("https://edenculver.net/api/leitmotifs/leitmotifs_in_songs")
	const data3 = await response3.json();
	data3.forEach(row => addLink(row));
}

function addSongNode(row) {
	const song_id = `${row.game_id}-${row.track_number}`;
	let new_node = {
		id: song_id,
		class: "song",
		r: songRadius,
		game_id: row.game_id,
		game_title: row.game_title,
		track_number: row.track_number,
		track_title: row.track_title,
		spotify_url: row.spotify_url
	}
	nodes.push(new_node);

	// add to dropdown
	let option = `<option data-option="${song_id}">${row.track_title}</option>`;
	select_song.innerHTML += option;
	// sort options
	let options = Array.from(select_song.children);
	options.sort((a, b) => a.textContent.localeCompare(b.textContent));
	options.forEach(option => select_song.appendChild(option));
}

function addLeitmotifNode(row) {
	const leitmotif_id = row.leitmotif_name.replaceAll(/[^\w]/g, "");
	let new_node = {
		id: leitmotif_id,
		class: "leitmotif",
		w: 1, // placeholder until sprite loads
		h: 1, // placeholder until sprite loads
		r: 1, // placeholder until sprite loads
		leitmotif_name: row.leitmotif_name
	}
	nodes.push(new_node);

	// add to dropdown
	let option = `<option data-option="${leitmotif_id}">${row.leitmotif_name}</option>`;
	select_leitmotif.innerHTML += option;
	// sort options
	let options = Array.from(select_leitmotif.children);
	options.sort((a, b) => a.textContent.localeCompare(b.textContent));
	options.forEach(option => select_leitmotif.appendChild(option));
}

function addLink(row) {
	const song_id = `${row.game_id}-${row.track_number}`;
	const leitmotif_id = row.leitmotif_name.replaceAll(/[^\w]/g, "");
	const new_link = {
		source: leitmotif_id,
		target: song_id
	}
	links.push(new_link);
}

function simulate() {
	// dynamic forces
	const collide = d3.forceCollide(d => d.r).iterations(collideIterations);
	const forceX = d3.forceX(canvas.clientWidth / 2).strength(xyStrength);
	const forceY = d3.forceY(canvas.clientHeight / 2).strength(xyStrength);
	const boundary = forceBoundary(borderWidth, borderWidth, canvas.clientWidth - borderWidth, canvas.clientHeight - borderWidth);

	// create simulation
	const svg = d3.select("#canvas");
	const simulation = d3.forceSimulation(nodes)
		.alphaDecay(alphaDecay)
		.force("link", d3.forceLink(links).id(d => d.id).distance(linkDistance))
		.force("charge", d3.forceManyBody().strength(manyBodyStrength))
		.force("collide", collide)
		.force("x", forceX)
		.force("y", forceY)
		.force("boundary", boundary);

	// draw links
	const link = svg.append("g")
		.attr("id", "links")
		.selectAll()
		.data(links)
		.join("line")
		.attr("class", "link");

	// draw song nodes
	const song = svg.append("g")
		.attr("id", "songs")
		.selectAll()
		.data(nodes.filter(d => d.class === "song"))
		.join("circle")
		.attr("id", d => d.id)
		.attr("class", d => `song g${d.id.substring(0, 1)}`)
		.attr("r", d => d.r)
		.attr("game_id", d => d.game_id)
		.attr("game_title", d => d.game_title)
		.attr("track_number", d => d.track_number)
		.attr("track_title", d => d.track_title)
		.attr("spotify_url", d => d.spotify_url);
	song.append("title")
		.text(d => d.track_title);
	song.on("click", event => setSelectedNode(event.target));
	song.call(d3.drag()
		.on("start", dragStarted)
		.on("drag", dragged)
		.on("end", dragEnded));

	// draw leitmotif nodes
	const leitmotif = svg.append("g")
		.attr("id", "leitmotifs")
		.selectAll()
		.data(nodes.filter(d => d.class === "leitmotif"))
		.join("image")
		.attr("id", d => d.id)
		.attr("class", "leitmotif")
		.attr("href", d => `media/${d.leitmotif_name.replace("?", "")}.png`)
		.attr("leitmotif_name", d => d.leitmotif_name);
	leitmotif.append("title")
		.text(d => d.leitmotif_name);
	leitmotif.on("click", event => setSelectedNode(event.target));
	leitmotif.call(d3.drag()
		.on("start", dragStarted)
		.on("drag", dragged)
		.on("end", dragEnded));

	// update positions each tick
	simulation.on("tick", () => {
		link
			.attr("x1", d => d.source.x)
			.attr("y1", d => d.source.y)
			.attr("x2", d => d.target.x)
			.attr("y2", d => d.target.y);
		song
			.attr("cx", d => d.x)
			.attr("cy", d => d.y);
		leitmotif
			.attr("x", d => d.x - d.w / 2)
			.attr("y", d => d.y - d.h / 2);

		// console.log(nodes);
	});

	// update leitmotif size and radius once the sprites load
	leitmotif.each(function (d) {
		this.onload = () => {
			const rect = this.getBoundingClientRect();
			d.w = rect.width;
			d.h = rect.height;
			d.r = Math.hypot(d.w, d.h) / 2;
			collide.initialize(nodes);
		};
	});

	// reheat the simulation when drag starts
	// fix the position of the subject (the node being dragged)
	function dragStarted(event) {
		if (!event.active) simulation.alphaTarget(reheatAlpha).restart();
		event.subject.fx = event.subject.x;
		event.subject.fy = event.subject.y;
	}

	// update the position of the subject
	function dragged(event) {
		event.subject.fx = event.x;
		event.subject.fy = event.y;
	}

	// allow the simulation to cool
	// unfix the position of the subject
	function dragEnded(event) {
		if (!event.active) simulation.alphaTarget(0);
		event.subject.fx = null;
		event.subject.fy = null;
	}

	// update dynamic forces when the window resizes
	d3.select(window).on("resize", () => {
		forceX.x(canvas.clientWidth / 2);
		forceY.y(canvas.clientHeight / 2);
		boundary
			.x0(borderWidth)
			.y0(borderWidth)
			.x1(canvas.clientWidth - borderWidth)
			.y1(canvas.clientHeight - borderWidth);
		simulation.alpha(reheatAlpha).restart();
	});

	// failsafe
	// invalidation.then(() => simulation.stop());
}

function setSelectedNode(element) {
	// highlight node
	Array.from(document.getElementsByClassName("highlighted")).forEach(e => e.classList.remove("highlighted"));
	element.classList.add("highlighted");

	info_panel.removeAttribute("hidden");

	if (element.classList[0] === "leitmotif") {
		const leitmotif_name = element.attributes.leitmotif_name.value;

		// update dropdowns
		select_leitmotif.value = leitmotif_name;
		select_song.selectedIndex = 0;

		// update info panel
		selected_name.textContent = leitmotif_name;
		selected_caption.textContent = "Leitmotif";
		spotify_embed.setAttribute("hidden", true);
		selected_list_name.textContent = "Appears in:";

		// update sprite
		selected_sprite.src = `media/${leitmotif_name.replace("?", "")}.png`;
		const rect = document.getElementById(element.id).getBoundingClientRect();
		selected_sprite.width = rect.width * 2;
		selected_sprite.removeAttribute("hidden");

		// find connections
		let list = "";
		for (let link of links) {
			if (link.source.leitmotif_name === leitmotif_name) {
				list += `<p class="hyperlink" data-hyperlink="${link.target.id}">${link.target.id.replace("0-", "U-")}. ${link.target.track_title}</p>`;
			}
		}
		selected_list.innerHTML = list;
	} else if (element.classList[0] === "song") {
		const game_id = parseInt(element.attributes.game_id.value);
		const game_title = element.attributes.game_title.value;
		const track_number = parseInt(element.attributes.track_number.value);
		const track_title = element.attributes.track_title.value;
		const spotify_url = element.attributes.spotify_url.value.replace("track", "embed/track");

		// update dropdowns
		select_leitmotif.selectedIndex = 0;
		select_song.value = track_title;

		// update info panel
		selected_name.textContent = track_title;
		selected_caption.textContent = `${game_title.replace("Chapter", "Ch.")} OST #${track_number}`;
		selected_sprite.setAttribute("hidden", true);
		spotify_embed.removeAttribute("hidden");
		spotify_embed.src = spotify_url;
		selected_list_name.textContent = "Leitmotifs:"

		// find connections
		let list = "";
		for (let link of links) {
			if (link.target.game_id === game_id && link.target.track_number === track_number) {
				list += `<p class="hyperlink" data-hyperlink="${link.source.id}">${link.source.leitmotif_name}</p>`;
			}
		}
		if (list === "") {
			list = "<p>None</p>";
		}
		selected_list.innerHTML = list;
	}

	// add event listeners
	Array.from(document.getElementsByClassName("hyperlink")).forEach(
		e => e.addEventListener("click", () => {
			setSelectedNode(document.getElementById(e.dataset.hyperlink));
		})
	);
}
