<script lang="ts">
	import favicon from "$lib/assets/favicon.svg";
	import NavItem from "$lib/components/NavItem.svelte";

	interface Props {
		classes?: string;
	}

	let { classes = "flex overflow-x-auto" }: Props = $props();
</script>

<nav class={classes}>
	<NavItem title="Home" href="/" />
	<NavItem title="IP Calc" href="/ip-calculator" />
	<NavItem title="Battle Packs" href="/battle-packs" />
	<NavItem title="UT/DR Leitmotifs" href="/leitmotifs" />
	<NavItem title="VS Alloy Calc" href="/alloy-calculator" />
	<NavItem title="Signal Flags" href="/signal-flags" />
	<NavItem title="Create Steam Engine" href="/create-steam-engine" />
	<NavItem title="SV Fish" href="/sv-fish" />
	<NavItem title="Villager Quiz" href="/villager-quiz" />
	<NavItem title="Chords" href="/chord-builder" />
	<div class="border-b border-black dark:border-white min-w-10 flex-1"></div>
	<img
		class="border-b border-black dark:border-white w-8 pr-2"
		src={favicon}
		alt="Icon of two sandhill cranes on a blue hexagon."
	/>
</nav>
