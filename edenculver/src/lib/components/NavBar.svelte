<script lang="ts">
	import Icon from "./Icon.svelte";
	import NavItem from "$lib/components/NavItem.svelte";
</script>

<nav class="flex overflow-x-auto">
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
	<div class="border-b border-midg min-w-10 flex-1"></div>
	<Icon classes="border-b border-midg w-8 pr-2" />
</nav>
