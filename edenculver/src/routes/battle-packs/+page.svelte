<script lang="ts">
	import type { PageProps } from "./$types";
	import NavBar from "$lib/components/NavBar.svelte";
	import BattlePack from "$lib/components/BattlePack.svelte";

	let { data }: PageProps = $props();
</script>

<NavBar />
<div class="flex flex-col gap-8 items-stretch mx-10 my-5">
	<h1 class="font-bold mx-auto text-3xl">LEGO Star Wars Battle Packs Catalog</h1>
	{#each data.battlePacks as battlePack}
		<BattlePack {battlePack} />
	{/each}
</div>
