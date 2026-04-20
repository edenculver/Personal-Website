<script>
	import NavItem from "$lib/components/NavItem.svelte";
	import favicon from "$lib/assets/favicon.svg";
</script>

<nav>
	<NavItem title="Home" href="/" />
	<NavItem title="Subnet Calc" href="/subnet-calculator" />
	<NavItem title="Battle Packs" href="/battle-packs" />
	<NavItem title="Leitmotifs" href="/leitmotifs" />
	<NavItem title="Signal Flags" href="/signal-flags" />
	<NavItem title="Steam Engine Sim" href="/steam-engine" />
	<NavItem title="SV Fish" href="/fish" />
	<NavItem title="Villager Quiz" href="/villager-quiz" />
	<NavItem title="Chords" href="/chords" />
	<img
		class="icon"
		src={favicon}
		alt="Icon of two sandhill cranes on a blue hexagon."
	/>
</nav>

<style>
	nav {
		border-bottom: 1px solid white;
		display: flex;
		flex-wrap: wrap;
	}
	img {
		margin-left: auto;
		margin-right: 10px;
		width: 24px;
	}
</style>
