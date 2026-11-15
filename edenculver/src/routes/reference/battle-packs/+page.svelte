<script lang="ts">
	import BattlePack from "$lib/components/BattlePack.svelte";
	import Page from "$lib/components/Page.svelte";
	import type { PageProps } from "./$types";

	let { data }: PageProps = $props();
</script>

<Page title="EdenCulver.net > Reference > LEGO Star Wars Battle Packs Catalog">
	<div class="p-5 flex flex-col gap-5">
		{#each data.battlePacks as battlePack}
			<BattlePack {battlePack} />
		{/each}
	</div>
</Page>
