<script lang="ts">
	import favicon from "$lib/assets/favicon.svg";
	import NavBar from "$lib/components/NavBar.svelte";
	import Card from "$lib/components/Card.svelte";
</script>

<header class="bg-black dark:bg-white flex items-center gap-4 p-4 text-white dark:text-black">
	<img class="w-16" src={favicon} alt="Icon of two sandhill cranes on a blue hexagon." />
	<h1 class="font-bold text-3xl">EdenCulver.net</h1>
</header>
<NavBar />
<h2>About</h2>
<p class="m-6">bio</p>
<hr />
<h2>Pages</h2>
<div class="flex flex-wrap gap-6 m-6">
	<Card
		title="Subnet/Supernet Calculator"
		description="A handy calculator for IPv4 subnet and supernet math. Calculate address ranges, masks, total addresses, summary addresses, and more."
		href="/ip-calculator"
		src="/images/home/router.svg"
		alt="Icon of a short blue cylinder with four white arrows on the top, representing a router."
	/>
	<Card
		title="Battle Packs Catalog"
		description="A complete catalog of every LEGO Star Wars Battle Pack."
		href="/battle-packs"
		src="/images/home/legostarwars.png"
		alt="LEGO Star Wars logo."
	/>
	<Card
		title="Undertale/Deltarune Leitmotifs Graph"
		description="An interactive node graph of how the Undertale and Deltarune's soundtracks are connected through leitmotifs."
		href="/leitmotifs"
		src="/images/home/soul.png"
		alt="Pixel art of a red heart."
		pixelated={true}
	/>
	<Card
		title="Signal Flags Translator"
		description="Translate messages into International Code of Signals (INTERCO) flags."
		href="/signal-flags"
		src="/images/home/interco.png"
		alt="Four square signal flags: A yellow square with a black circle in the center; a 4x4 blue and white checkerboard; five horizontal stripes of blue, white, red, white, blue; and a square divided diagonally from top left to bottom right, with the top right half red and the bottom left half yellow. The message translates to IN CO."
	/>
	<Card
		title="Create Steam Engine Simulator"
		description="Simulate steam engines from the Minecraft Create mod to test optimal size/water/heat ratios."
		href="/steam-engine"
		src="/images/home/steam_engine.png"
		alt="A stylized piston made of copper and brass."
	/>
	<Card
		title="Stardew Valley Fish Cheat Sheet"
		description="A cheat sheet for where and when to find fish in Stardew Valley."
		href="/fish"
		src="/images/home/Bullhead.png"
		alt="Pixel art of a bullhead, a brown catfish with long whiskers."
		pixelated={true}
	/>
	<Card
		title="Which Minecraft Villager Are You?"
		description="Take this personality quiz to find out which Minecraft villager you are!"
		href="/villager-quiz"
		src="/images/home/emerald.png"
		alt="Pixel art of a bright green emerald."
		pixelated={true}
	/>
	<Card
		title="Chord Builder (WIP)"
		description="Construct triads and 7th chords from a root note and stacked intervals."
		href="/chords"
		src=""
		alt="WIP"
	/>
</div>
<hr />
<h2>Links</h2>
<div class="flex flex-wrap gap-6 m-6">
	<Card
		title="GitHub"
		href="https://github.com/edenculver"
		src="https://icon.horse/icon/github.com"
		alt="Favicon of github.com."
	/>
	<Card
		title="LinkedIn"
		href="https://www.linkedin.com/in/edenculver/"
		src="https://icon.horse/icon/www.linkedin.com"
		alt="Favicon of linkedin.com."
	/>
	<Card
		title="Email me!"
		href="mailto:edenculver27@gmail.com"
		src="https://icon.horse/icon/mail.google.com"
		alt="Favicon of gmail.com."
	/>
</div>
<hr />
<h2>Cool stuff other people have made</h2>
<div class="flex flex-wrap gap-6 m-6">
	<Card
		title="BGP Tools"
		description="hello world"
		href="https://bgp.tools/"
		src="https://icon.horse/icon/bgp.tools"
		alt="Favicon of bgp.tools."
	/>
	<Card
		title="Flag Color Codes"
		description="hello world"
		href="https://www.flagcolorcodes.com/"
		src="https://icon.horse/icon/www.flagcolorcodes.com"
		alt="Favicon of flagcolorcodes.com."
	/>
	<Card
		title="LEGO Color List"
		description="hello world"
		href="https://brickcolor.net/"
		src="https://icon.horse/icon/brickcolor.net"
		alt="Favicon of brickcolor.net."
	/>
	<Card
		title="Regex101"
		description="hello world"
		href="https://regex101.com/"
		src="https://icon.horse/icon/regex101.com"
		alt="Favicon of regex101.com."
	/>
	<Card
		title="Toki Pona Dictionary"
		description="hello world"
		href="https://linku.la/"
		src="https://icon.horse/icon/linku.la"
		alt="Favicon of linku.la."
	/>
	<Card
		title="US Flags Design Guide"
		description="hello world"
		href="https://usflags.design/"
		src="https://icon.horse/icon/usflags.design"
		alt="Favicon of usflags.design."
	/>
</div>

<style lang="postcss">
	@reference "../app.css";
	h2 {
		@apply font-bold m-6 text-xl;
	}
</style>
