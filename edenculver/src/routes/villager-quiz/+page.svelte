<script lang="ts">
	import bank from "$lib/villager_quiz.json";
	import click_stereo from "$lib/assets/click_stereo.ogg";
	import McButton from "$lib/components/McButton.svelte";
	import StandardPageLayout from "$lib/components/StandardPageLayout.svelte";

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

<StandardPageLayout classes="bg-[url('/images/villager-quiz/darkdirt.png')] text-sm lg:text-base flex flex-col flex-1">
	<div class="mx-auto w-full max-w-5xl bg-white text-center flex-1">
		<h1 class="p-8 bg-black text-xl lg:text-2xl text-white font-bold">Which Minecraft Villager Are You?</h1>

		<div class="mt-4 p-8 text-black flex flex-col gap-4 items-center">
			{#if qIndex === -1}
				<McButton onclick={start}>Start</McButton>
			{:else if qIndex === 12}
				<p class="text-base lg:text-lg">You are:</p>
				<p class="text-xl lg:text-2xl font-bold">{biome} {profession}</p>
				<img class="h-100" {src} alt="Minecraft Villager." />
				<McButton onclick={share}>Share (copy to clipboard)</McButton>
				<McButton onclick={restart}>Take the quiz again!</McButton>
			{:else}
				<p class="mb-4 text-base lg:text-lg">{qIndex + 1}. {bank[qIndex].text}</p>
				<McButton onclick={() => answer(bank[qIndex].a.score)}>{bank[qIndex].a.text}</McButton>
				<McButton onclick={() => answer(bank[qIndex].b.score)}>{bank[qIndex].b.text}</McButton>
				<McButton onclick={() => answer(bank[qIndex].c.score)}>{bank[qIndex].c.text}</McButton>
				<McButton onclick={() => answer(bank[qIndex].d.score)}>{bank[qIndex].d.text}</McButton>
			{/if}
		</div>
	</div>
</StandardPageLayout>
