<script>
	import NavItem from "$lib/components/NavItem.svelte";
</script>

<nav>
	<NavItem title="Home" href="/" />
	<NavItem title="Subnet Calc" href="/subnet" />
	<NavItem title="Battle Packs" href="/battle_packs" />
	<NavItem title="Leitmotifs" href="/leitmotifs" />
	<NavItem title="Signal Flags" href="/interco" />
	<NavItem title="Steam Engine Sim" href="/steam_engine" />
	<NavItem title="SV Fish" href="/fish" />
	<NavItem title="Villager Quiz" href="/villager_quiz" />
	<NavItem title="Chords" href="/chords" />
</nav>

<style>
	nav {
		border-bottom: 1px solid white;
		display: flex;
		flex-wrap: wrap;
	}
</style>
