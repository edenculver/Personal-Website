<script lang="ts">
	import BattlePack from "$lib/components/BattlePack.svelte";
	import H1 from "$lib/components/H1.svelte";
	import StandardPageLayout from "$lib/components/StandardPageLayout.svelte";
	import type { PageProps } from "./$types";

	let { data }: PageProps = $props();
</script>

<StandardPageLayout>
	<H1 extraClasses="text-center">LEGO Star Wars Battle Packs Catalog</H1>

	{#each data.battlePacks as battlePack}
		<BattlePack {battlePack} />
	{/each}
</StandardPageLayout>
