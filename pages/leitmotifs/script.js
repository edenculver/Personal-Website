import * as d3 from "https://cdn.jsdelivr.net/npm/d3@7/+esm";

var nodes = [];
var links = [];

window.addEventListener("DOMContentLoaded", () => {
	buildNodesAndLinks()
		.then(simulate);

	// close info panel
	canvas.addEventListener("click", (event) => {
		if (event.target.id === "canvas") info_panel.setAttribute("hidden", true);
	});
});

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
		game_id: row.game_id,
		game_title: row.game_title,
		track_number: row.track_number,
		track_title: row.track_title,
		spotify_url: row.spotify_url
	}
	nodes.push(new_node);
}

function addLeitmotifNode(row) {
	const leitmotif_id = row.leitmotif_name.replaceAll(/[^\w]/g, "");
	let new_node = {
		id: leitmotif_id,
		class: "leitmotif",
		leitmotif_name: row.leitmotif_name
	}
	nodes.push(new_node);
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
	// initialize simulation
	const svg = d3.select("#canvas");
	const simulation = d3.forceSimulation(nodes)
		.alphaDecay(0.01)
		.force("link", d3.forceLink(links).id(d => d.id).distance(50))
		.force("charge", d3.forceManyBody().strength(-100));

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
		.attr("r", 6)
		.attr("game_id", d => d.game_id)
		.attr("game_title", d => d.game_title)
		.attr("track_number", d => d.track_number)
		.attr("track_title", d => d.track_title)
		.attr("spotify_url", d => d.spotify_url);
	song.append("title")
		.text(d => d.track_title);
	song.on("click", event => updateInfoPanel(event));
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
	leitmotif.on("click", event => updateInfoPanel(event));
	leitmotif.call(d3.drag()
		.on("start", dragStarted)
		.on("drag", dragged)
		.on("end", dragEnded));

	// update positions each tick
	simulation.on("tick", () => {
		// update centering forces
		const xyStrength = 0.1;
		const borderMoat = 10;
		simulation
			.force("x", d3.forceX(canvas.clientWidth / 2).strength(xyStrength))
			.force("y", d3.forceY(canvas.clientHeight / 2).strength(xyStrength))
			.force("boundary", forceBoundary(borderMoat, borderMoat, canvas.clientWidth - borderMoat, canvas.clientHeight - borderMoat));
		link
			.attr("x1", d => d.source.x)
			.attr("y1", d => d.source.y)
			.attr("x2", d => d.target.x)
			.attr("y2", d => d.target.y);
		song
			.attr("cx", d => d.x)
			.attr("cy", d => d.y);
		leitmotif
			.attr("x", d => getSpriteOffset(d)[0])
			.attr("y", d => getSpriteOffset(d)[1]);
	});

	// reheat the simulation when drag starts
	// fix the position of the subject (the node being dragged)
	function dragStarted(event) {
		if (!event.active) simulation.alphaTarget(0.3).restart();
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

	// failsafe
	// invalidation.then(() => simulation.stop());
}

function getSpriteOffset(node) {
	const sprite = document.getElementById(node.id);
	const rect = sprite.getBoundingClientRect();
	const x = node.x - (rect.width / 2);
	const y = node.y - (rect.height / 2);
	return [x, y];
}

function updateInfoPanel(event) {
	info_panel.removeAttribute("hidden");
	if (event.target.classList[0] === "leitmotif") {
		// update info panel
		const leitmotif_name = event.target.attributes.leitmotif_name.value;
		selected_name.textContent = leitmotif_name;
		selected_caption.textContent = "Leitmotif";
		spotify_embed.setAttribute("hidden", true);
		selected_list_name.textContent = "Appears in:";

		// update sprite
		selected_sprite.src = `media/${leitmotif_name.replace("?", "")}.png`;
		const rect = document.getElementById(event.target.id).getBoundingClientRect();
		selected_sprite.width = rect.width * 2;
		selected_sprite.removeAttribute("hidden");

		// find connections
		let list = "";
		for (let link of links) {
			if (link.source.leitmotif_name === leitmotif_name) {
				list += `<p>${link.target.game_id.toString().replace("0", "U")}-${link.target.track_number}. ${link.target.track_title}</p>`;
			}
		}
		selected_list.innerHTML = list;
	} else if (event.target.classList[0] === "song") {
		// update info panel
		const game_id = parseInt(event.target.attributes.game_id.value);
		const game_title = event.target.attributes.game_title.value;
		const track_number = parseInt(event.target.attributes.track_number.value);
		const track_title = event.target.attributes.track_title.value;
		const spotify_url = event.target.attributes.spotify_url.value.replace("track", "embed/track");

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
				list += `<p>${link.source.leitmotif_name}</p>`;
			}
		}
		if (list === "") {
			list = "<p>None</p>";
		}
		selected_list.innerHTML = list;
	}
}
