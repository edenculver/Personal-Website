<script lang="ts">
	interface Ingredient {
		metal: string;
		minPct: number;
		maxPct: number;
	}
	interface Props {
		alloy: string;
		ingredients: Ingredient[];
	}

	let { alloy, ingredients }: Props = $props();
</script>

<img class="w-6" src="/images/alloy-calculator/{alloy} ingot.png" alt="{alloy} ingot." />
<p>{alloy}</p>
<div class="grid grid-cols-3 gap-4">
	{#each ingredients as ingr}
		<img class="w-6" src="/images/alloy-calculator/{ingr.metal} bits.png" alt="{ingr.metal} bits." />
		<p>{ingr.metal}</p>
		<p>{ingr.minPct}-{ingr.maxPct}%</p>
	{/each}
</div>
