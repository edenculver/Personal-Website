<script lang="ts">
	import BigGrid from "$lib/components/BigGrid.svelte";
	import H2 from "$lib/components/H2.svelte";
	import LinkCard from "$lib/components/LinkCard.svelte";
	import Page from "$lib/components/Page.svelte";

	const allGreetings = [
		"Hi! I'm Eden (she/her).",
		"¡Hola! Me llamo Eden (ella).",
		"はじめまして。私はイデンです。",
		"toki! mi jan Iten.",
	];

	let selectedGreetingIndex = $state(0);
	let greeting = $derived(allGreetings[selectedGreetingIndex]);

	function randomGreeting() {
		if (allGreetings.length > 1) {
			let candidateIndex = selectedGreetingIndex;

			while (candidateIndex === selectedGreetingIndex) {
				candidateIndex = Math.floor(Math.random() * allGreetings.length);
			}

			selectedGreetingIndex = candidateIndex;
		}
	}
</script>

<Page title="EdenCulver.net">
	<div class="mx-auto lg:mx-16 my-4 lg:my-10 p-4 flex flex-col gap-4 flex-1">
		<H2>About</H2>
		<button class="text-left text-sm lg:text-base" onclick={() => randomGreeting()}>
			{greeting}
		</button>
		<p>Welcome to my website! I make things that I think are neat.</p>

		<H2 extraClasses="mt-8">Tools</H2>
		<BigGrid>
			<LinkCard
				title="IP Calculator"
				description="A handy calculator for IPv4 subnet and supernet math. Calculate address ranges, masks, total addresses, summary addresses, and more."
				href="/tools/ip-calculator"
				src="/images/home/router.svg"
				alt="Icon of a short blue cylinder with four white arrows on the top, representing a router."
			/>
			<LinkCard
				title="Vintage Story Alloy Calculator"
				description="Calculate how much of each metal you need to make the alloy you want in Vintage Story."
				href="/tools/vs-alloy-calculator"
				src="/images/vs-alloy-calculator/Brass ingot.png"
				alt="Brass ingot item from Vintage Story."
				pixelated={true}
			/>
			<LinkCard
				title="Signal Flags Translator"
				description="Translate messages into International Code of Signals (INTERCO) flags."
				href="/tools/signal-flags"
				src="/images/home/interco.png"
				alt="Four square signal flags: A yellow square with a black circle in the center; a 4x4 blue and white checkerboard; five horizontal stripes of blue, white, red, white, blue; and a square divided diagonally from top left to bottom right, with the top right half red and the bottom left half yellow. The message translates to IN CO."
			/>
			<LinkCard
				title="Chord Builder"
				description="Construct triads and 7th chords from a root note and stacked intervals."
				href="/tools/chord-builder"
				src="/images/home/triad.svg"
				alt="A whole note triad."
			/>
			<LinkCard
				title="Minecraft Create Mod Steam Engine Simulator"
				description="Simulate steam engines from the Minecraft Create mod to test optimal size/water/heat ratios."
				href="/tools/create-steam-engine"
				src="/images/home/steam_engine.png"
				alt="A stylized piston made of copper and brass."
			/>
		</BigGrid>

		<H2 extraClasses="mt-8">Reference</H2>
		<BigGrid>
			<LinkCard
				title="LEGO Star Wars Battle Packs Catalog"
				description="A complete catalog of every LEGO Star Wars Battle Pack."
				href="/reference/battle-packs"
				src="/images/home/legostarwars.png"
				alt="LEGO Star Wars logo."
			/>
			<LinkCard
				title="Undertale/Deltarune Leitmotifs Graph"
				description="An interactive node graph of how the Undertale and Deltarune's soundtracks are connected through leitmotifs."
				href="/reference/leitmotifs"
				src="/images/home/soul.png"
				alt="Pixel art of a red heart."
				pixelated={true}
			/>
			<LinkCard
				title="Stardew Valley Fish Cheat Sheet"
				description="A cheat sheet for where and when to find fish in Stardew Valley."
				href="/reference/sv-fish"
				src="/images/sv-fish/Bullhead.png"
				alt="Pixel art of a bullhead, a brown catfish with long whiskers."
				pixelated={true}
			/>
		</BigGrid>

		<H2 extraClasses="mt-8">Fun</H2>
		<BigGrid>
			<LinkCard
				title="Which Minecraft Villager Are You?"
				description="Take this personality quiz to find out which Minecraft villager you are!"
				href="/fun/villager-quiz"
				src="/images/home/emerald.png"
				alt="Pixel art of a bright green emerald."
				pixelated={true}
			/>
		</BigGrid>

		<H2 extraClasses="mt-8">Links</H2>
		<BigGrid>
			<LinkCard
				title="GitHub"
				href="https://github.com/edenculver"
				src="https://icon.horse/icon/github.com"
				alt="Favicon of github.com."
			/>
			<LinkCard
				title="LEGO MOCs @Avarice_Machine"
				href="https://www.instagram.com/avarice_machine/"
				src="https://icon.horse/icon/www.instagram.com"
				alt="Favicon of instragram.com."
			/>
			<LinkCard
				title="Email me!"
				href="mailto:edenculver27@gmail.com"
				src="https://icon.horse/icon/mail.google.com"
				alt="Favicon of gmail.com."
			/>
		</BigGrid>

		<H2 extraClasses="mt-8">Cool stuff other people have made</H2>
		<BigGrid>
			<LinkCard
				title="Flag Color Codes"
				description="A really cool site detailing the colors used in all sorts of official flags."
				href="https://www.flagcolorcodes.com/"
				src="https://icon.horse/icon/www.flagcolorcodes.com"
				alt="Favicon of flagcolorcodes.com."
			/>
			<LinkCard
				title="IPinfo"
				description="My go-to ASN and public IP address lookup resource."
				href="https://ipinfo.io/"
				src="https://icon.horse/icon/ipinfo.io"
				alt="Favicon of ipinfo.io."
			/>
			<LinkCard
				title="LEGO Color List"
				description="A spreadsheet of all LEGO colors."
				href="https://brickcolor.net/"
				src="https://icon.horse/icon/brickcolor.net"
				alt="Favicon of brickcolor.net."
			/>
			<LinkCard
				title="Regex101"
				description="This site is essential for writing and testing complex regular expressions."
				href="https://regex101.com/"
				src="https://icon.horse/icon/regex101.com"
				alt="Favicon of regex101.com."
			/>
			<LinkCard
				title="Toki Pona Dictionary"
				description="A dictionary of Toki Pona, a popular conlang."
				href="https://linku.la/"
				src="https://icon.horse/icon/linku.la"
				alt="Favicon of linku.la."
			/>
			<LinkCard
				title="US Flags Design Guide"
				description="Interesting information about every US state flag."
				href="https://usflags.design/"
				src="https://icon.horse/icon/usflags.design"
				alt="Favicon of usflags.design."
			/>
		</BigGrid>
	</div>
</Page>
