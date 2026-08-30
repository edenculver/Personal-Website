<script lang="ts">
	import BattlePack from "$lib/components/BattlePack.svelte";
	import StandardPageLayout from "$lib/components/StandardPageLayout.svelte";
	import type { PageProps } from "./$types";

	let { data }: PageProps = $props();
</script>

<StandardPageLayout>
	<h1 class="mx-auto lg:mx-0 text-xl lg:text-2xl text-center font-bold">LEGO Star Wars Battle Packs Catalog</h1>

	{#each data.battlePacks as battlePack}
		<BattlePack {battlePack} />
	{/each}
</StandardPageLayout>
