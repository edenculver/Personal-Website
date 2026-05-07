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

	function getTotalMinifigs() {
		let totalMinifigs = 0;
		battlePack.minifigs.forEach((minifig) => {
			totalMinifigs += minifig.count;
		});
		return totalMinifigs;
	}
</script>

<div class="bg-white border border-gray-500 flex flex-col gap-5 p-7 rounded-2xl text-black">
	<h2 class="font-bold text-xl">{battlePack.set_number} {battlePack.set_name}</h2>
	<div class="flex flex-wrap gap-5">
		<div class="flex flex-col gap-3 m-2">
			<table class="m-2">
				<tbody>
					<tr>
						<td class="font-bold">Year</td>
						<td>{battlePack.release_year}</td>
					</tr>
					<tr>
						<td class="font-bold">Source</td>
						<td title={battlePack.source.title}>{battlePack.source.short_title}</td>
					</tr>
					<tr>
						<td class="font-bold">Pieces</td>
						<td>{battlePack.piece_count}</td>
					</tr>
					<tr>
						<td class="font-bold">Minfigs</td>
						<td>{getTotalMinifigs()}</td>
					</tr>
					<tr>
						<td title="Manufacturer's Suggested Retail Price" class="font-bold">MSRP</td>
						<td>${battlePack.msrp}</td>
					</tr>
					<tr>
						<td title="Price Per Piece" class="font-bold">PPP</td>
						<td>{Math.round((Number(battlePack.msrp) / Number(battlePack.piece_count)) * 1000) / 10}c</td>
					</tr>
				</tbody>
			</table>
			<div class="flex gap-5 justify-center">
				<a
					href="https://www.lego.com/en-us/product/{battlePack.set_name
						.toLowerCase()
						.replaceAll(' ', '-')}-{battlePack.set_number}"
					title="View on LEGO.com (not available for older sets)"
				>
					<img src="https://www.lego.com/favicon-32x32.png" alt="Favicon of LEGO.com." />
				</a>
				<a
					href="https://www.bricklink.com/v2/catalog/catalogitem.page?S={battlePack.set_number}-1"
					title="View on Bricklink"
				>
					<img
						src="https://static.bricklink.com/renovate/img/favicon/favicon-32x32.png"
						alt="Favicon of BrickLink.com."
					/>
				</a>
				<a
					href="https://brickset.com/sets/{battlePack.set_number}-1/{battlePack.set_name
						.replace('& ', '')
						.replace('.', '')
						.replaceAll(' ', '-')}"
					title="View on Brickset"
				>
					<img
						src="https://brickset.com/assets/images/icons/favicon-32x32.png"
						alt="Favicon of Brickset.com."
					/>
				</a>
			</div>
		</div>
		<img
			class="max-w-sm"
			src="https://img.bricklink.com/ItemImage/ON/0/{battlePack.set_number}-1.png"
			alt="Photograph of this set's box."
		/>
		<MinifigTable minifigs={battlePack.minifigs} />
	</div>
</div>

<style lang="postcss">
	@reference "../app.css";
	a {
		@apply no-underline text-center;
	}
	td {
		@apply px-4 py-1;
	}
	tr {
		@apply border border-gray-500;
	}
</style>
