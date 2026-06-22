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

	let tableRows = $derived([
		{
			label: "Year",
			value: battlePack.release_year,
		},
		{
			label: "Source",
			title: battlePack.source.title,
			value: battlePack.source.short_title,
		},
		{
			label: "Pieces",
			value: battlePack.piece_count,
		},
		{
			label: "Minfigs",
			value: getTotalMinifigs(),
		},
		{
			label: "MSRP",
			title: "Manufacturer's Suggested Retail Price",
			value: `$${battlePack.msrp}`,
		},
		{
			label: "PPP",
			title: "Price Per Piece",
			value: `${Math.round((Number(battlePack.msrp) / Number(battlePack.piece_count)) * 1000) / 10}c`,
		},
	]);
	let links = $derived([
		{
			href: `https://www.lego.com/en-us/product/${battlePack.set_name.toLowerCase().replaceAll(" ", "-")}-${battlePack.set_number}`,
			title: "View on LEGO.com (not available for older sets)",
			src: "https://www.lego.com/favicon-32x32.png",
			alt: "Favicon of LEGO.com.",
		},
		{
			href: `https://www.bricklink.com/v2/catalog/catalogitem.page?S=${battlePack.set_number}-1`,
			title: "View on Bricklink",
			src: "https://static.bricklink.com/renovate/img/favicon/favicon-32x32.png",
			alt: "Favicon of BrickLink.com.",
		},
		{
			href: `https://brickset.com/sets/{battlePack.set_number}-1/${battlePack.set_name.replace("& ", "").replace(".", "").replaceAll(" ", "-")}`,
			title: "View on Brickset",
			src: "https://brickset.com/assets/images/icons/favicon-32x32.png",
			alt: "Favicon of Brickset.com.",
		},
	]);

	function getTotalMinifigs() {
		let totalMinifigs = 0;
		battlePack.minifigs.forEach((minifig) => {
			totalMinifigs += minifig.count;
		});
		return totalMinifigs;
	}
</script>

<div class="border border-gray-500 rounded-2xl p-6 bg-white text-black flex flex-col gap-4">
	<h2 class="text-xl font-bold">{battlePack.set_number} {battlePack.set_name}</h2>
	<div class="flex flex-wrap gap-5">
		<div class="m-2 flex flex-col gap-3">
			<table class="m-2">
				<tbody>
					{#each tableRows as row}
						<tr class="border border-gray-500">
							<td class="px-4 py-1 font-bold">{row.label}</td>
							<td class="px-4 py-1" title={row.title ? row.title : undefined}>{row.value}</td>
						</tr>
					{/each}
				</tbody>
			</table>
			<div class="flex gap-4 justify-center">
				{#each links as link}
					<a class="text-center no-underline" href={link.href} title={link.title}>
						<img src={link.src} alt={link.alt} />
					</a>
				{/each}
			</div>
		</div>
		<img
			class="max-w-100"
			src="https://img.bricklink.com/ItemImage/ON/0/{battlePack.set_number}-1.png"
			alt="Photograph of this set's box."
		/>
		<MinifigTable minifigs={battlePack.minifigs} />
	</div>
</div>
