window.addEventListener("DOMContentLoaded", () => {
	buildTableOcean();
	buildTableForestPond();
	buildTableMountainLake();
	buildTableSecretWoodsPond();
	buildTableForestWaterfall();
	buildTableRiver();
	buildTableMines();
	buildTableGingerIsland();
	buildTableSpecial();
});

function buildTableOcean() {
	fetch("fish.json")
		.then((response) => response.json())
		.then((json) => {
			json["Ocean"].forEach(fish => {
				let tr = document.createElement("tr");

				// fish
				tr.innerHTML = `<td><img src="media/${fish.fish_name.replace(" ", "_")}.png"><span>${fish.fish_name}</span></td>`;
				// base price
				tr.innerHTML += `<td style="text-align: right;">${fish.base_price}g</td>`;
				// season
				if (!fish.season) tr.innerHTML += "<td>Any</td>";
				else tr.innerHTML += `<td>${fish.season}</td>`;
				// weather
				if (!fish.weather) tr.innerHTML += "<td>Any</td>";
				else tr.innerHTML += `<td>${fish.weather}</td>`;
				// time
				if (!fish.time) tr.innerHTML += "<td>Any</td>";
				else tr.innerHTML += `<td>${fish.time}</td>`;
				// bundle
				if (fish.bundle) tr.innerHTML += `<td class="centered"><img src="media/${fish.bundle.replaceAll(" ", "_")}.png" title="${fish.bundle}"></td>`;
				else tr.innerHTML += "<td></td>";

				tableOcean.appendChild(tr);
			});
		});
}

function buildTableForestPond() {
	fetch("fish.json")
		.then((response) => response.json())
		.then((json) => {
			json["Forest Pond"].forEach(fish => {
				let tr = document.createElement("tr");

				// fish
				tr.innerHTML = `<td><img src="media/${fish.fish_name.replace(" ", "_")}.png"><span>${fish.fish_name}</span></td>`;
				// base price
				tr.innerHTML += `<td style="text-align: right;">${fish.base_price}g</td>`;
				// season
				if (!fish.season) tr.innerHTML += "<td>Any</td>";
				else tr.innerHTML += `<td>${fish.season}</td>`;
				// weather
				if (!fish.weather) tr.innerHTML += "<td>Any</td>";
				else tr.innerHTML += `<td>${fish.weather}</td>`;
				// time
				if (!fish.time) tr.innerHTML += "<td>Any</td>";
				else tr.innerHTML += `<td>${fish.time}</td>`;
				// bundle
				if (fish.bundle) tr.innerHTML += `<td class="centered"><img src="media/${fish.bundle.replaceAll(" ", "_")}.png" title="${fish.bundle}"></td>`;
				else tr.innerHTML += "<td></td>";

				tableForestPond.appendChild(tr);
			});
		});
}

function buildTableMountainLake() {
	fetch("fish.json")
		.then((response) => response.json())
		.then((json) => {
			json["Mountain Lake"].forEach(fish => {
				let tr = document.createElement("tr");

				// fish
				tr.innerHTML = `<td><img src="media/${fish.fish_name.replace(" ", "_")}.png"><span>${fish.fish_name}</span></td>`;
				// base price
				tr.innerHTML += `<td style="text-align: right;">${fish.base_price}g</td>`;
				// season
				if (!fish.season) tr.innerHTML += "<td>Any</td>";
				else tr.innerHTML += `<td>${fish.season}</td>`;
				// weather
				if (!fish.weather) tr.innerHTML += "<td>Any</td>";
				else tr.innerHTML += `<td>${fish.weather}</td>`;
				// time
				if (!fish.time) tr.innerHTML += "<td>Any</td>";
				else tr.innerHTML += `<td>${fish.time}</td>`;
				// bundle
				if (fish.bundle) tr.innerHTML += `<td class="centered"><img src="media/${fish.bundle.replaceAll(" ", "_")}.png" title="${fish.bundle}"></td>`;
				else tr.innerHTML += "<td></td>";

				tableMountainLake.appendChild(tr);
			});
		});
}

function buildTableSecretWoodsPond() {
	fetch("fish.json")
		.then((response) => response.json())
		.then((json) => {
			json["Secret Woods Pond"].forEach(fish => {
				let tr = document.createElement("tr");

				// fish
				tr.innerHTML = `<td><img src="media/${fish.fish_name.replace(" ", "_")}.png"><span>${fish.fish_name}</span></td>`;
				// base price
				tr.innerHTML += `<td style="text-align: right;">${fish.base_price}g</td>`;
				// season
				if (!fish.season) tr.innerHTML += "<td>Any</td>";
				else tr.innerHTML += `<td>${fish.season}</td>`;
				// weather
				if (!fish.weather) tr.innerHTML += "<td>Any</td>";
				else tr.innerHTML += `<td>${fish.weather}</td>`;
				// time
				if (!fish.time) tr.innerHTML += "<td>Any</td>";
				else tr.innerHTML += `<td>${fish.time}</td>`;
				// bundle
				if (fish.bundle) tr.innerHTML += `<td class="centered"><img src="media/${fish.bundle.replaceAll(" ", "_")}.png" title="${fish.bundle}"></td>`;
				else tr.innerHTML += "<td></td>";

				tableSecretWoodsPond.appendChild(tr);
			});
		});
}

function buildTableForestWaterfall() {
	fetch("fish.json")
		.then((response) => response.json())
		.then((json) => {
			json["Forest Waterfall"].forEach(fish => {
				let tr = document.createElement("tr");

				// fish
				tr.innerHTML = `<td><img src="media/${fish.fish_name.replace(" ", "_")}.png"><span>${fish.fish_name}</span></td>`;
				// base price
				tr.innerHTML += `<td style="text-align: right;">${fish.base_price}g</td>`;
				// season
				if (!fish.season) tr.innerHTML += "<td>Any</td>";
				else tr.innerHTML += `<td>${fish.season}</td>`;

				tableForestWaterfall.appendChild(tr);
			});
		});
}

function buildTableRiver() {
	fetch("fish.json")
		.then((response) => response.json())
		.then((json) => {
			json["River"].forEach(fish => {
				let tr = document.createElement("tr");

				// fish
				tr.innerHTML = `<td><img src="media/${fish.fish_name.replace(" ", "_")}.png"><span>${fish.fish_name}</span></td>`;
				// base price
				tr.innerHTML += `<td style="text-align: right;">${fish.base_price}g</td>`;
				// season
				if (!fish.season) tr.innerHTML += "<td>Any</td>";
				else tr.innerHTML += `<td>${fish.season}</td>`;
				// weather
				if (!fish.weather) tr.innerHTML += "<td>Any</td>";
				else tr.innerHTML += `<td>${fish.weather}</td>`;
				// time
				if (!fish.time) tr.innerHTML += "<td>Any</td>";
				else tr.innerHTML += `<td>${fish.time}</td>`;
				// location
				tr.innerHTML += `<td>${fish.location}</td>`;
				// bundle
				if (fish.bundle) tr.innerHTML += `<td class="centered"><img src="media/${fish.bundle.replaceAll(" ", "_")}.png" title="${fish.bundle}"></td>`;
				else tr.innerHTML += "<td></td>";

				tableRiver.appendChild(tr);
			});
		});
}

function buildTableMines() {
	fetch("fish.json")
		.then((response) => response.json())
		.then((json) => {
			json["Mines"].forEach(fish => {
				let tr = document.createElement("tr");

				// fish
				tr.innerHTML = `<td><img src="media/${fish.fish_name.replace(" ", "_")}.png"><span>${fish.fish_name}</span></td>`;
				// base price
				tr.innerHTML += `<td style="text-align: right;">${fish.base_price}g</td>`;
				// level
				tr.innerHTML += `<td>${fish.level}</td>`;
				// bundle
				if (fish.bundle) tr.innerHTML += `<td class="centered"><img src="media/${fish.bundle.replaceAll(" ", "_")}.png" title="${fish.bundle}"></td>`;
				else tr.innerHTML += "<td></td>";

				tableMines.appendChild(tr);
			});
		});
}

function buildTableGingerIsland() {
	fetch("fish.json")
		.then((response) => response.json())
		.then((json) => {
			json["Ginger Island"].forEach(fish => {
				let tr = document.createElement("tr");

				// fish
				tr.innerHTML = `<td><img src="media/${fish.fish_name.replace(" ", "_")}.png"><span>${fish.fish_name}</span></td>`;
				// base price
				tr.innerHTML += `<td style="text-align: right;">${fish.base_price}g</td>`;
				// weather
				if (!fish.weather) tr.innerHTML += "<td>Any</td>";
				else tr.innerHTML += `<td>${fish.weather}</td>`;
				// time
				if (!fish.time) tr.innerHTML += "<td>Any</td>";
				else tr.innerHTML += `<td>${fish.time}</td>`;
				// location
				tr.innerHTML += `<td>${fish.location}</td>`;
				// bundle
				if (fish.bundle) tr.innerHTML += `<td class="centered"><img src="media/${fish.bundle.replaceAll(" ", "_")}.png" title="${fish.bundle}"></td>`;
				else tr.innerHTML += "<td></td>";

				tableGingerIsland.appendChild(tr);
			});
		});
}

function buildTableSpecial() {
	fetch("fish.json")
		.then((response) => response.json())
		.then((json) => {
			json["Special"].forEach(fish => {
				let tr = document.createElement("tr");

				// fish
				tr.innerHTML = `<td><img src="media/${fish.fish_name.replace(" ", "_")}.png"><span>${fish.fish_name}</span></td>`;
				// base price
				tr.innerHTML += `<td style="text-align: right;">${fish.base_price}g</td>`;
				// weather
				if (!fish.weather) tr.innerHTML += "<td>Any</td>";
				else tr.innerHTML += `<td>${fish.weather}</td>`;
				// time
				if (!fish.time) tr.innerHTML += "<td>Any</td>";
				else tr.innerHTML += `<td>${fish.time}</td>`;
				// location
				tr.innerHTML += `<td>${fish.location}</td>`;
				// bundle
				if (fish.bundle) tr.innerHTML += `<td class="centered"><img src="media/${fish.bundle.replaceAll(" ", "_")}.png" title="${fish.bundle}"></td>`;
				else tr.innerHTML += "<td></td>";

				tableSpecial.appendChild(tr);
			});
		});
}
