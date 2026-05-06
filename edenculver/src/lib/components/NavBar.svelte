<script>
	import NavItem from "$lib/components/NavItem.svelte";
	import favicon from "$lib/assets/favicon.svg";
</script>

<nav class="border-b border-black dark:border-white flex flex-wrap">
	<NavItem title="Home" href="/" />
	<NavItem title="IP Calc" href="/ip-calculator" />
	<NavItem title="Battle Packs" href="/battle-packs" />
	<NavItem title="Leitmotifs" href="/leitmotifs" />
	<NavItem title="Signal Flags" href="/signal-flags" />
	<NavItem title="Steam Engine Sim" href="/steam-engine" />
	<NavItem title="SV Fish" href="/fish" />
	<NavItem title="Villager Quiz" href="/villager-quiz" />
	<NavItem title="Chords" href="/chords" />
	<img class="ml-auto mr-2 w-6" src={favicon} alt="Icon of two sandhill cranes on a blue hexagon." />
</nav>
