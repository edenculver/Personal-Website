<script lang="ts">
	import NavBar from "$lib/components/NavBar.svelte";
	import click_stereo from "$lib/assets/click_stereo.ogg";
	import bank from "$lib/villager_quiz.json";

	let audioPlayer: HTMLAudioElement;
	let qIndex = $state(-1);
	let results = $state({
		// biomes
		bDesert: 0,
		bJungle: 0,
		bPlains: 0,
		bSavanna: 0,
		bSnowy: 0,
		bSwamp: 0,
		bTaiga: 0,
		// professions
		pArmorer: 0,
		pButcher: 0,
		pCartographer: 0,
		pCleric: 0,
		pFarmer: 0,
		pFisherman: 0,
		pFletcher: 0,
		pLeatherworker: 0,
		pLibrarian: 0,
		pNitwit: 0,
		pStoneMason: 0,
		pShepherd: 0,
		pToolsmith: 0,
		pUnemployed: 0,
		pWeaponsmith: 0,
	});
	let biome = $derived(findWinner("b").substring(1));
	let profession = $derived(findWinner("p").substring(1).replace("StoneMason", "Stone Mason"));
	let src = $derived(`https://minecraft.wiki/images/${biome}_${profession.replace("Stone Mason", "Mason")}.png`);

	function click() {
		audioPlayer.volume = 0.5;
		if (audioPlayer.paused) {
			audioPlayer.play();
		} else {
			audioPlayer.currentTime = 0;
		}
	}

	function start() {
		click();
		qIndex++;
	}

	function answer(score: string[]) {
		click();
		score.forEach((key) => {
			results[key as keyof typeof results]++;
		});
		qIndex++;
	}

	function findWinner(keyPrefix: string) {
		// find highest score
		let maxScore = 0;
		for (let key in results) {
			if (!key.startsWith(keyPrefix)) {
				continue;
			}
			if (results[key as keyof typeof results] > maxScore) {
				maxScore = results[key as keyof typeof results];
			}
		}

		// find all keys tied for first place
		let firstPlaceKeys = [];
		for (let key in results) {
			if (!key.startsWith(keyPrefix)) {
				continue;
			}
			if (results[key as keyof typeof results] == maxScore) {
				firstPlaceKeys.push(key);
			}
		}

		// randomly select one of the top keys
		return firstPlaceKeys[Math.floor(Math.random() * firstPlaceKeys.length)];
	}

	function share() {
		click();
		let copyText = `I'm a ${biome} ${profession}!\n${src}\nTake the quiz: https://edenculver.net/villager-quiz`;
		navigator.clipboard.writeText(copyText);
	}

	function restart() {
		click();
		qIndex = 0;
	}
</script>

<audio bind:this={audioPlayer} src={click_stereo}></audio>
<div class="min-h-dvh bg-[url('/images/villager-quiz/darkdirt.png')] flex flex-col">
	<div class="bg-white dark:bg-black">
		<NavBar />
	</div>
	<div class="w-5xl bg-white mx-auto text-center flex-1">
		<h1 class="bg-black font-bold text-2xl p-10 text-white">Which Minecraft Villager Are You?</h1>
		<div class="flex flex-col gap-5 items-center p-10 text-black">
			{#if qIndex === -1}
				<button class="mt-5" onclick={start}>Start</button>
			{:else if qIndex === 12}
				<p class="text-lg mt-5">You are:</p>
				<p class="font-bold text-2xl">{biome} {profession}</p>
				<img class="h-[50vh]" {src} alt="Minecraft Villager." />
				<button onclick={share}>Share (copy to clipboard)</button>
				<button onclick={restart}>Take the quiz again!</button>
			{:else}
				<p class="text-xl m-5">{qIndex + 1}. {bank[qIndex].text}</p>
				<button onclick={() => answer(bank[qIndex].a.score)}>{bank[qIndex].a.text}</button>
				<button onclick={() => answer(bank[qIndex].b.score)}>{bank[qIndex].b.text}</button>
				<button onclick={() => answer(bank[qIndex].c.score)}>{bank[qIndex].c.text}</button>
				<button onclick={() => answer(bank[qIndex].d.score)}>{bank[qIndex].d.text}</button>
			{/if}
		</div>
	</div>
</div>

<style lang="postcss">
	@reference "../app.css";
	button {
		@apply bg-(--mc-lightgray) hover:bg-(--mc-green) border-10 [border-image:url(/images/villager-quiz/mcbutton_gray.png)_10_stretch] hover:[border-image:url(/images/villager-quiz/mcbutton_green.png)_10_stretch] max-w-2xl p-5 text-(--mc-darkgray) hover:text-white w-[80vw];
	}
</style>
