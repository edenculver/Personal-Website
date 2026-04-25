<script lang="ts">
	import type { PageProps } from "./$types";
	import NavBar from "$lib/components/NavBar.svelte";
	import BattlePack from "$lib/components/BattlePack.svelte";

	let { data }: PageProps = $props();
</script>

<NavBar />
<div class="flex column">
	<h1>LEGO Star Wars Battle Packs Catalog</h1>
	{#each data.battlePacks as battlePack}
		<BattlePack {battlePack} />
	{/each}
</div>

<style>
	div {
		margin: 20px 50px;
		align-items: stretch;
		gap: 30px;
	}
	h1 {
		margin: 10px auto 0px;
	}	
</style>
