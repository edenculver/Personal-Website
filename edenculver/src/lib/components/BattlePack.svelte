<script lang="ts">
	import MinifigTable from "./MinifigTable.svelte";
	import type { Minifig } from "./MinifigTable.svelte";

	interface Source {
		title: string;
		short_title: string;
	}
	interface BattlePack {
		set_number: number;
		set_name: string;
		release_year: number;
		piece_count?: number;
		msrp?: string;
		source: Source;
		minifigs: Minifig[];
	}
	interface Props {
		battlePack: BattlePack;
	}

	let { battlePack }: Props = $props();

	// svelte-ignore non_reactive_update
	let totalMinifigs = 0;
	// svelte-ignore state_referenced_locally
	battlePack.minifigs.forEach((minifig) => {
		totalMinifigs += minifig.count;
	});
</script>

<div class="main">
	<h2>{battlePack.set_number} {battlePack.set_name}</h2>
	<div class="body flex">
		<div class="flex column">
			<table>
				<tbody>
					<tr>
						<td><b>Year</b></td>
						<td>{battlePack.release_year}</td>
					</tr>
					<tr>
						<td><b>Source</b></td>
						<td title={battlePack.source.title}>{battlePack.source.short_title}</td>
					</tr>
					<tr>
						<td><b>Pieces</b></td>
						<td>{battlePack.piece_count}</td>
					</tr>
					<tr>
						<td><b>Minfigs</b></td>
						<td>{totalMinifigs}</td>
					</tr>
					<tr>
						<td title="Manufacturer's Suggested Retail Price"><b>MSRP</b></td>
						<td>${battlePack.msrp}</td>
					</tr>
					<tr>
						<td title="Price Per Piece"><b>PPP</b></td>
						<td>{Math.round((Number(battlePack.msrp) / Number(battlePack.piece_count)) * 1000) / 10}c</td>
					</tr>
				</tbody>
			</table>
			<div class="links flex">
				<a
					href="https://www.lego.com/en-us/product/{battlePack.set_name.toLowerCase().replaceAll(' ', '-')}-{battlePack.set_number}"
					title="View on LEGO.com (not available for older sets)"
				>
					<img src="https://www.lego.com/favicon-32x32.png" alt="Favicon of LEGO.com." />
				</a>
				<a href="https://www.bricklink.com/v2/catalog/catalogitem.page?S={battlePack.set_number}-1" title="View on Bricklink">
					<img src="https://static.bricklink.com/renovate/img/favicon/favicon-32x32.png" alt="Favicon of BrickLink.com." />
				</a>
				<a
					href="https://brickset.com/sets/{battlePack.set_number}-1/{battlePack.set_name.replace('& ', '').replace('.', '').replaceAll(' ', '-')}"
					title="View on Brickset"
				>
					<img src="https://brickset.com/assets/images/icons/favicon-32x32.png" alt="Favicon of Brickset.com." />
				</a>
			</div>
		</div>
		<img class="setPic" src="https://img.bricklink.com/ItemImage/ON/0/{battlePack.set_number}-1.png" alt="Photograph of this set's box." />
		<MinifigTable minifigs={battlePack.minifigs} />
	</div>
</div>

<style>
	.main {
		background-color: white;
		border: 2px solid gray;
		border-radius: 10px;
		color: black;
	}
	h2 {
		font-size: 125%;
		margin: 20px;
	}
	.body {
		margin: 20px;
		flex-wrap: wrap;
	}
	table {
		border-collapse: collapse;
		margin: 20px;
	}
	tr {
		border: 1px solid gray;
	}
	td {
		padding: 7px 12px;
	}
	.links {
		gap: 20px;
		justify-content: center;
	}
	a {
		color: black;
		text-align: center;
		text-decoration: none;
	}
	.setPic {
		margin: 10px;
		max-width: 400px;
	}
</style>
