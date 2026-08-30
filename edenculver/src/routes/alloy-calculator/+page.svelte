<script lang="ts">
	import { clamp, range } from "$lib/util";
	import StandardPageLayout from "$lib/components/StandardPageLayout.svelte";
	import { untrack } from "svelte";
	import VsItemSlot from "$lib/components/VsItemSlot.svelte";

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
	let selectedAlloy = $derived(alloys.find((a) => a.alloy === selectedAlloyName) ?? alloys[0]);
	let selectedAmount = $state<number>();
	let totalBits = $derived((selectedAmount ?? 0) * 20);
	let oldTotalBits = 0;

	let ingrAmounts = $state<number[]>([]);
	let stacks = $derived(getStacks());

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

	function getStacks() {
		let stacks = [];
		for (let i = 0; i < selectedAlloy.ingredients.length; i++) {
			let amount = ingrAmounts[i];

			// add full stacks
			while (amount >= 128) {
				stacks.push({ metal: selectedAlloy.ingredients[i].metal, size: 128 });
				amount -= 128;
			}

			// add remainder
			if (amount > 0) {
				stacks.push({ metal: selectedAlloy.ingredients[i].metal, size: ingrAmounts[i] % 128 });
			}
		}
		return stacks;
	}

	// reset to middle of range
	function resetIngredients() {
		ingrAmounts = selectedAlloy.ingredients.map((ingr) =>
			Math.round(((ingr.minPct + ingr.maxPct) * totalBits) / 200),
		);
		// rebalance to fix rounding errors
		balanceIngredients(0);
	}

	// try to preserve percentages
	function changeIngrAmounts() {
		// failsafe to stop intial trigger
		if (oldTotalBits !== 0) {
			ingrAmounts = ingrAmounts.map((amt) => Math.round((amt / oldTotalBits) * totalBits));
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

<StandardPageLayout extraClasses="lg:items-start">
	<h1 class="mx-auto lg:mx-0 text-xl lg:text-2xl text-center font-bold">Vintage Story Alloy Calculator</h1>

	<div class="border dark:border-white rounded-sm p-6 flex flex-wrap gap-6">
		<img
			class="w-8 lg:w-12 my-auto object-contain [image-rendering:pixelated]"
			src="/images/alloy-calculator/{selectedAlloy.alloy} ingot.png"
			alt="{selectedAlloy.alloy} ingot."
		/>

		<label class="flex flex-col gap-2">
			<p class="font-bold">Target alloy</p>
			<select
				class="border dark:border-white rounded-sm px-2 py-1 text-sm lg:text-base"
				bind:value={selectedAlloyName}
			>
				{#each alloys as a}
					<option>{a.alloy}</option>
				{/each}
			</select>
		</label>

		<label class="flex flex-col gap-2">
			<p class="font-bold">Amount</p>
			<select class="border dark:border-white rounded-sm px-2 py-1" bind:value={selectedAmount}>
				{#each range(1, 25) as i}
					<option value={i}>{i} ingots ({i * 20} bits)</option>
				{/each}
			</select>
		</label>
	</div>

	<div class="border dark:border-white rounded-sm p-6 flex flex-col gap-4 lg:items-start">
		<p class="font-bold">Ingredient ratios</p>

		<div class="flex sm:hidden flex-col gap-3">
			{#each selectedAlloy.ingredients as ingr, i}
				<div class="flex flex-wrap gap-2">
					<img
						class="w-6 lg:w-8 object-contain [image-rendering:pixelated]"
						src="/images/alloy-calculator/{ingr.metal} bits.png"
						alt="{ingr.metal} bits."
					/>
					<p>{ingr.metal} ({ingr.minPct}-{ingr.maxPct}%)</p>
					<p class="ml-auto text-right">
						{ingrAmounts[i]} bits ({Math.round((ingrAmounts[i] / totalBits) * 1000) / 10}%)
					</p>
				</div>
				<input
					class="mb-4"
					type="range"
					min={getMinBits(ingr.minPct)}
					max={getMaxBits(ingr.maxPct)}
					bind:value={ingrAmounts[i]}
					oninput={() => {
						balanceIngredients(i);
					}}
				/>
			{/each}
		</div>

		<div class="hidden sm:block">
			<table>
				<tbody>
					{#each selectedAlloy.ingredients as ingr, i}
						<tr>
							<td class="p-2">
								<img
									class="w-6 lg:w-8 object-contain [image-rendering:pixelated]"
									src="/images/alloy-calculator/{ingr.metal} bits.png"
									alt="{ingr.metal} bits."
								/>
							</td>
							<td class="p-2">
								<p>{ingr.metal}</p>
							</td>
							<td class="p-2">
								<p class="text-right">({ingr.minPct}-{ingr.maxPct}%)</p>
							</td>
							<td class="p-2">
								<input
									class="align-middle"
									type="range"
									min={getMinBits(ingr.minPct)}
									max={getMaxBits(ingr.maxPct)}
									bind:value={ingrAmounts[i]}
									oninput={() => {
										balanceIngredients(i);
									}}
								/>
							</td>
							<td class="p-2">
								<p class="text-right">
									{ingrAmounts[i]} bits
								</p>
							</td>
							<td class="p-2">
								<p class="text-right">({Math.round((ingrAmounts[i] / totalBits) * 1000) / 10}%)</p>
							</td>
						</tr>
					{/each}
				</tbody>
			</table>
		</div>
	</div>

	<div class="border dark:border-white rounded-sm p-6 flex flex-col gap-6">
		<p class="font-bold">Crucible inputs required</p>

		<div class="flex flex-wrap gap-4">
			{#each stacks as s, i}
				<VsItemSlot item="{s.metal} nugget" itemName={s.metal} quantity={s.size} red={i > 3} />
			{/each}
			{#if stacks.length < 4}
				{#each range(stacks.length, 3)}
					<VsItemSlot item="" quantity={0} />
				{/each}
			{/if}
		</div>

		{#if stacks.length > 4}
			<p class="text-red-500">Crucibles only have 4 slots.</p>
		{/if}
	</div>
</StandardPageLayout>
