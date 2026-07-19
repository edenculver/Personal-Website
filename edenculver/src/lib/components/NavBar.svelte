<script lang="ts">
	import favicon from "$lib/assets/favicon.svg";
	import NavItem from "$lib/components/NavItem.svelte";

	interface Props {
		classes?: string;
	}

	let { classes = "border-b border-black dark:border-white flex flex-wrap" }: Props = $props();
</script>

<nav class={classes}>
	<NavItem title="Home" href="/" />
	<NavItem title="IP Calc" href="/ip-calculator" />
	<NavItem title="Battle Packs" href="/battle-packs" />
	<NavItem title="UTDR Leitmotifs" href="/leitmotifs" />
	<NavItem title="Signal Flags" href="/signal-flags" />
	<NavItem title="Steam Engine Sim" href="/steam-engine" />
	<NavItem title="SV Fish" href="/fish" />
	<NavItem title="Villager Quiz" href="/villager-quiz" />
	<NavItem title="Chords" href="/chord-builder" />
	<img class="ml-auto mr-2 w-6" src={favicon} alt="Icon of two sandhill cranes on a blue hexagon." />
</nav>
