window.addEventListener("DOMContentLoaded", () => {
	fetch("https://edenculver.net/api/battle_packs")
		.then((response) => response.json())
		.then((json) => {
			json.forEach(set => {
				buildListing(set);
			});
		});
});

function buildListing(set) {
	let listing = `
		<hr>
		<div class="listing">
			<h3>${set.set_number} ${set.set_name}</h3>
			<div class="info">
				<table>
					<tr>
						<td>Year:</td>
						<td>${set.release_year}</td>
					</tr>
					<tr>
						<td>Source:</td>
						<td title="${set.source.title}">${set.source.short_title}</td>
					</tr>
					<tr>
						<td>Pieces:</td>
						<td>${set.piece_count}</td>
					</tr>
					<tr>
						<td>Minifigs:</td>
						<td>${getMinifigTotal(set.minifigs)}</td>
					</tr>
					<tr>
						<td title="Manufacturer's Suggested Retail Price">MSRP:</td>
						<td>$${set.msrp}</td>
					</tr>
					<tr>
						<td title="Price Per Piece">PPP:</td>
						<td>${Math.round(set.msrp / set.piece_count * 1000) / 10}c</td>
					</tr>
				</table>
				<br>
				<a href="https://www.lego.com/en-us/product/${set.set_name.toLowerCase().replaceAll(" ", "-")}-${set.set_number}" title="View on LEGO.com (not available for older sets)">
					<img src="https://www.lego.com/favicon-32x32.png" alt="LEGO.com">
				</a>
				<span class="spacer"></span>
				<a href="https://www.bricklink.com/v2/catalog/catalogitem.page?S=${set.set_number}-1" title="View on Bricklink">
					<img src="https://static.bricklink.com/renovate/img/favicon/favicon-32x32.png" alt="Bricklink">
				</a>
				<span class="spacer"></span>
				<a href="https://brickset.com/sets/${set.set_number}-1/${set.set_name.replace("& ", "").replace(".", "").replaceAll(" ", "-")}" title="View on Brickset">
					<img src="https://brickset.com/assets/images/icons/favicon-32x32.png" alt="Brickset">
				</a>
			</div>
			<div class="set">
				<img class="set-pic" src="https://img.bricklink.com/ItemImage/ON/0/${set.set_number}-1.png" alt="Box">
			</div>
			<div class="minifig">
				<table>
					${buildMinifigTable(set)}
				</table>
			</div>
		</div>
	`;
	catalog.innerHTML += listing;
}

function buildMinifigTable(set) {
	if (!set.minifigs) return "";

	let picsRow = "<tr>";
	let namesRow = "<tr>";

	set.minifigs.forEach(minifig => {
		for (let i = 0; i < minifig.count; i++) {
			picsRow += `
				<td class="minifig-pic-cell">
					<img class="minifig-pic" src="https://www.bricklink.com/ML/${minifig.bl_id}.jpg" alt="${minifig.minifig_name}">
				</td>
			`;
		}

		let multiplier = minifig.count > 1 ? ` (x${minifig.count})` : "";
		namesRow += `
			<td class="minifig-name" colspan="${minifig.count}" style="max-width: ${200 * minifig.count}px;">
				<p${minifig.is_unique ? ' class="unique" title="Unique to this set!"' : ""}>${minifig.minifig_name}${multiplier}</p>
				<p>
					<i>${minifig.specification ? minifig.specification : ""}</i>
				</p>
				<p>
					<i>
						<a class="blid" href="https://www.bricklink.com/v2/catalog/catalogitem.page?M=${minifig.bl_id}">${minifig.bl_id}</a>
					</i>
				</p>
			</td>
		`;
	});

	picsRow, namesRow += "</tr>";
	return picsRow + namesRow;
}

function getMinifigTotal(minifigs) {
	if (!minifigs) return 0;
	let minifigTotal = 0;
	minifigs.forEach(minifig => {
		minifigTotal += minifig.count;
	});
	return minifigTotal;
}
