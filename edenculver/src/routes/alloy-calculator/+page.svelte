<script lang="ts">
	import AlloyBar from "$lib/components/AlloyBar.svelte";
	import StandardPageLayout from "$lib/components/StandardPageLayout.svelte";
	import { clamp, range } from "$lib/util";
	import { untrack } from "svelte";

	const alloys = [
		{
			alloy: "Tin bronze",
			ingredients: [
				{ metal: "Copper", minPct: 88, maxPct: 92 },
				{ metal: "Tin", minPct: 8, maxPct: 12 },
			],
		},
		{
			alloy: "Bismuth bronze",
			ingredients: [
				{ metal: "Bismuth", minPct: 10, maxPct: 20 },
				{ metal: "Copper", minPct: 50, maxPct: 70 },
				{ metal: "Zinc", minPct: 20, maxPct: 30 },
			],
		},
		{
			alloy: "Black bronze",
			ingredients: [
				{ metal: "Copper", minPct: 68, maxPct: 84 },
				{ metal: "Gold", minPct: 8, maxPct: 16 },
				{ metal: "Silver", minPct: 8, maxPct: 16 },
			],
		},
		{
			alloy: "Brass",
			ingredients: [
				{ metal: "Copper", minPct: 60, maxPct: 70 },
				{ metal: "Zinc", minPct: 30, maxPct: 40 },
			],
		},
		{
			alloy: "Molybdochalkos",
			ingredients: [
				{ metal: "Copper", minPct: 8, maxPct: 12 },
				{ metal: "Lead", minPct: 88, maxPct: 92 },
			],
		},
		{
			alloy: "Lead solder",
			ingredients: [
				{ metal: "Lead", minPct: 45, maxPct: 55 },
				{ metal: "Tin", minPct: 45, maxPct: 55 },
			],
		},
		{
			alloy: "Silver solder",
			ingredients: [
				{ metal: "Silver", minPct: 40, maxPct: 50 },
				{ metal: "Tin", minPct: 50, maxPct: 60 },
			],
		},
		{
			alloy: "Electrum",
			ingredients: [
				{ metal: "Gold", minPct: 40, maxPct: 60 },
				{ metal: "Silver", minPct: 40, maxPct: 60 },
			],
		},
		{
			alloy: "Cupronickel",
			ingredients: [
				{ metal: "Copper", minPct: 65, maxPct: 75 },
				{ metal: "Nickel", minPct: 25, maxPct: 35 },
			],
		},
	];

	// inputs
	let selectedAlloyName = $state();
	let selectedAlloy = $derived(
		alloys.find((a) => a.alloy === selectedAlloyName) ?? { alloy: "DEFAULT", ingredients: [] },
	);
	let selectedAmount = $state<number>();
	let totalBits = $derived((selectedAmount ?? 0) * 20);
	let oldTotalBits = 0;

	let ingrAmounts = $state<number[]>([]);

	// reset ingredients when alloy is updated
	$effect(() => {
		const dependency = selectedAlloy;
		untrack(() => resetIngredients());
	});

	// update ingredients when amount is updated
	$effect(() => {
		const dependency = totalBits;
		untrack(() => changeIngrAmounts());
	});

	function getMinBits(minPct: number) {
		return Math.ceil((minPct / 100) * totalBits);
	}

	function getMaxBits(maxPct: number) {
		return Math.floor((maxPct / 100) * totalBits);
	}

	// reset to middle of range
	function resetIngredients() {
		ingrAmounts = selectedAlloy.ingredients.map((ingr) =>
			Math.round(((ingr.minPct + ingr.maxPct) * totalBits) / 200),
		);
		// rebalance to fix rounding errors
		balanceIngredients(ingrAmounts.length - 1);
	}

	// try to preserve percentages
	function changeIngrAmounts() {
		// failsafe to stop intial trigger
		if (oldTotalBits !== 0) {
			ingrAmounts = ingrAmounts.map((ingr) => Math.round((ingr / oldTotalBits) * totalBits));
			// rebalance to fix rounding errors
			balanceIngredients(ingrAmounts.length - 1);
		}
		// save old totalBits
		oldTotalBits = totalBits;
	}

	// set the amount of the other ingredient(s)
	function balanceIngredients(changedIndex: number) {
		if (selectedAlloy.ingredients.length === 2) {
			// change the other ingredient
			ingrAmounts[1 - changedIndex] = totalBits - ingrAmounts[changedIndex];
		} else {
			let otherIndices = [0, 1, 2];
			otherIndices.splice(otherIndices.indexOf(changedIndex), 1);

			// set 1st other ingredient
			let target1 = clamp(
				totalBits - ingrAmounts[changedIndex] - ingrAmounts[otherIndices[1]],
				getMinBits(selectedAlloy.ingredients[otherIndices[0]].minPct),
				getMaxBits(selectedAlloy.ingredients[otherIndices[0]].maxPct),
			);
			ingrAmounts[otherIndices[0]] = target1;

			// set 2nd other ingredient
			ingrAmounts[otherIndices[1]] = totalBits - ingrAmounts[changedIndex] - ingrAmounts[otherIndices[0]];
		}
	}
</script>

<StandardPageLayout>
	<div class="mx-16 my-10 flex flex-col gap-6 items-start">
		<h1 class="text-2xl font-bold">Vintage Story Alloy Calculator</h1>

		<div class="grid grid-cols-2 gap-6">
			<label>
				<p>Alloy</p>
				<select bind:value={selectedAlloyName}>
					{#each alloys as a}
						<option>{a.alloy}</option>
					{/each}
				</select>
			</label>
			<label>
				<p>Amount</p>
				<select bind:value={selectedAmount}>
					{#each range(1, 20) as i}
						<option value={i}>{i} ingots ({i * 20} bits)</option>
					{/each}
				</select>
			</label>
		</div>

		<p>Ratios</p>
		<div class="grid grid-cols-[auto_auto_auto_auto] gap-6">
			{#each selectedAlloy.ingredients as ingr, i}
				<img class="w-6" src="/images/alloy-calculator/{ingr.metal} bits.png" alt="{ingr.metal} bits." />
				<p>{ingr.metal} ({ingr.minPct}-{ingr.maxPct}%)</p>
				<input
					type="range"
					min={getMinBits(ingr.minPct)}
					max={getMaxBits(ingr.maxPct)}
					bind:value={ingrAmounts[i]}
					oninput={() => {
						balanceIngredients(i);
					}}
				/>
				<p>{ingrAmounts[i]} bits ({Math.round((ingrAmounts[i] / totalBits) * 1000) / 10}%)</p>
			{/each}
		</div>

		<h2>Crucible</h2>
		x x x x
	</div>
</StandardPageLayout>
