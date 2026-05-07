<script lang="ts">
	import range from "$lib/range";
	import NavBar from "$lib/components/NavBar.svelte";
	import blaze_idle from "$lib/assets/blaze_idle.png";
	import blaze from "$lib/assets/blaze.png";
	import blaze_super from "$lib/assets/blaze_super.png";

	// size
	let width = $state(2);
	let height = $state(3);
	let volume = $derived(width * width * height);
	let sizeLvl = $derived(clampLvl(Math.floor(volume / 4)));

	// water
	let pumps = $state(1);
	let pumpSpeed = $state(32);
	let totalRpm = $derived(pumpSpeed * pumps);
	let waterLvl = $derived(clampLvl(Math.floor(totalRpm / 20)));

	// heat
	let blazes = $state([2, 1, 0, 1, 0, 0, 0, 0, 0]);
	const activeBlazeIndices: { [key: number]: number[][] } = {
		2: [
			[0, 1],
			[3, 4],
		],
		3: [
			[0, 1, 2],
			[3, 4, 5],
			[6, 7, 8],
		],
	};
	let heatLvl = $derived.by(() => {
		let sum = 0;
		for (let i of activeBlazeIndices[width].flat()) {
			sum += blazes[i];
		}
		return sum;
	});
	const blazeSprites = [blaze_idle, blaze, blaze_super];

	// status
	let boilerLvl = $derived(Math.min(sizeLvl, waterLvl, heatLvl));
	let boilerLvlReadable = $derived.by(() => {
		if (waterLvl == 0) {
			return "Idle";
		} else if (boilerLvl == 0) {
			return "Lvl 0 (Passive)";
		} else if (boilerLvl == 18) {
			return "Lvl 18 (Max)";
		}
		return `Lvl ${boilerLvl}`;
	});
	let stressCapacity = $derived.by(() => {
		if (waterLvl == 0) {
			return 0;
		} else if (boilerLvl == 0) {
			return 2048;
		}
		return boilerLvl * 16384;
	});
	let enginesRequired = $derived.by(() => {
		if (waterLvl == 0) {
			return 0;
		} else if (boilerLvl == 0) {
			return 1;
		}
		return boilerLvl;
	});
	let outputSpeed = $derived.by(() => {
		if (waterLvl == 0) {
			return 0;
		} else if (boilerLvl == 0) {
			return 16;
		}
		return 64;
	});
	const suboptimalLvls = [10, 12, 14, 16, 17];

	function clampLvl(lvl: number) {
		if (lvl > 18) {
			return 18;
		}
		return lvl;
	}

	function addHeat(blazeIndex: number) {
		if (blazes[blazeIndex] == 2) {
			blazes[blazeIndex] = 0;
		} else {
			blazes[blazeIndex]++;
		}
	}

	function setWater(lvl: number) {
		let targetRpm = lvl * 20;
		if (targetRpm <= 256) {
			pumps = 1;
			pumpSpeed = targetRpm;
		} else {
			pumps = 2;
			pumpSpeed = targetRpm / 2;
		}
	}

	function setHeat(lvl: number) {
		let targetHeat = lvl;
		// first pass
		for (let i of activeBlazeIndices[width].flat()) {
			if (targetHeat) {
				blazes[i] = 1;
				targetHeat--;
			} else {
				blazes[i] = 0;
			}
		}
		// second pass
		if (!targetHeat) {
			return;
		}
		for (let i of activeBlazeIndices[width].flat()) {
			if (targetHeat) {
				blazes[i] = 2;
				targetHeat--;
			}
		}
	}

	function optimizeForSize() {
		setWater(sizeLvl);
		setHeat(sizeLvl);
	}

	function optimizeForLvl(lvl: number) {
		// size
		if (lvl <= 8) {
			width = 2;
			height = lvl;
		} else {
			width = 3;
			height = Math.ceil((lvl * 4) / 9);
		}

		setWater(lvl);
		setHeat(lvl);
	}

	function getCellColor(i: number, lvl: number) {
		let maxLvl = Math.max(sizeLvl, waterLvl, heatLvl);

		if (i == boilerLvl) {
			return "bg-lime-500";
		} else if (i <= lvl) {
			return "bg-green-500";
		} else if (i <= maxLvl) {
			return "bg-red-500";
		}
		return "";
	}
</script>

<NavBar />
<div class="flex-col gap-6 items-center m-6">
	<h1 class="font-bold text-2xl">Minecraft Create Mod Steam Engine Simulator</h1>
	<div class="gap-6">
		<div class="flex-col gap-6">
			<div class="card">
				<h2>Size</h2>
				<div class="gap-8">
					<div class="flex-col">
						<p>Footprint</p>
						<label class="flex gap-2">
							<input type="radio" value={2} bind:group={width} />
							<p>2x2</p>
						</label>
						<label class="flex gap-2">
							<input type="radio" value={3} bind:group={width} />
							<p>3x3</p>
						</label>
					</div>
					<div class="flex-col gap-3">
						<p>Height: {height} blocks</p>
						<div class="gap-2">
							<p>1</p>
							<input class="w-80" type="range" min="1" max="16" bind:value={height} />
							<p>16</p>
						</div>
					</div>
					<div class="flex-col gap-3">
						<p>Volume: {volume} blocks</p>
						<button onclick={optimizeForSize}>Optimize for this size</button>
					</div>
				</div>
			</div>
			<div class="card">
				<h2>Water</h2>
				<div class="gap-8">
					<div class="flex-col">
						<p>Pumps</p>
						<label class="flex gap-2">
							<input type="radio" value={1} bind:group={pumps} />
							<p>1</p>
						</label>
						<label class="flex gap-2">
							<input type="radio" value={2} bind:group={pumps} />
							<p>2</p>
						</label>
					</div>
					<div class="flex-col gap-3">
						<p>Pump speed: {pumpSpeed} RPM</p>
						<div class="gap-2">
							<p>0</p>
							<input class="w-100" type="range" min="0" max="256" bind:value={pumpSpeed} />
							<p>256</p>
						</div>
					</div>
					<p>Total RPM: {totalRpm}</p>
				</div>
			</div>
		</div>
		<div class="card">
			<h2>Heat</h2>
			<div class="gap-6">
				<table>
					<tbody>
						{#each activeBlazeIndices[width as keyof typeof activeBlazeIndices] as row}
							<tr>
								{#each row as blaze}
									<td>
										<button onclick={() => addHeat(blaze)}>
											<img src={blazeSprites[blazes[blaze]]} alt="Blaze Burner." />
										</button>
									</td>
								{/each}
							</tr>
						{/each}
					</tbody>
				</table>
				<div class="flex-col gap-3">
					<p>Blaze Burners</p>
					<p>Total heat: {heatLvl}</p>
				</div>
			</div>
		</div>
	</div>
	<div class="gap-6">
		<div class="border border-black dark:border-white gap-8 p-6 rounded-md">
			<div class="flex-col gap-6">
				<h2>Boiler Status: {boilerLvlReadable}</h2>
				<table class="border border-black dark:border-white">
					<tbody>
						{#each [{ name: "Size", lvl: sizeLvl }, { name: "Water", lvl: waterLvl }, { name: "Heat", lvl: heatLvl }] as row}
							<tr title="Lvl {row.lvl}">
								<td class="p-3">{row.name}</td>
								{#each range(1, 18) as i}
									<td class="w-3 {getCellColor(i, row.lvl)}"></td>
								{/each}
							</tr>
						{/each}
					</tbody>
				</table>
			</div>
			<div class="flex-col gap-3">
				<p>Stress capacity: {stressCapacity.toLocaleString()} su</p>
				<p>Engines required: {enginesRequired}</p>
				<p>Output speed: {outputSpeed} RPM</p>
			</div>
		</div>
		<div class="card">
			<h3 class="font-bold">Optimize for Lvl</h3>
			<table>
				<tbody>
					{#each [range(1, 6), range(7, 12), range(13, 18)] as row}
						<tr>
							{#each row as lvl}
								<td>
									<button
										class={"w-2" + (suboptimalLvls.includes(lvl) ? " suboptimal" : "")}
										title={suboptimalLvls.includes(lvl)
											? "This boiler level cannot be perfectly optimized."
											: undefined}
										onclick={() => optimizeForLvl(lvl)}
									>
										{lvl}
									</button>
								</td>
							{/each}
						</tr>
					{/each}
				</tbody>
			</table>
		</div>
	</div>
</div>

<style lang="postcss">
	@reference "../app.css";
	button {
		@apply bg-black dark:bg-white hover:bg-gray-500 p-2 rounded-md text-white dark:text-black w-full;
	}
	.card {
		@apply border border-black dark:border-white flex-col gap-6 p-6 rounded-md;
	}
	div {
		@apply flex;
	}
	h2 {
		@apply font-bold text-xl;
	}
	img {
		@apply [image-rendering:pixelated] w-16;
	}
	.suboptimal {
		@apply text-red-500;
	}
	table {
		@apply border-separate;
	}
</style>
