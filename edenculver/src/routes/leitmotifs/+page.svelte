<script lang="ts">
	import * as d3 from "d3";
	import config_active from "$lib/assets/config_active.png";
	import config_hover from "$lib/assets/config_hover.png";
	import config_inactive from "$lib/assets/config_inactive.png";
	import LeitmotifInfo from "$lib/components/LeitmotifInfo.svelte";
	import NavBar from "$lib/components/NavBar.svelte";
	import { onMount } from "svelte";
	import SongInfo from "$lib/components/SongInfo.svelte";
	import type { PageProps } from "./$types";

	let { data }: PageProps = $props();

	const legend = ["UT", "Ch 1", "Ch 2", "Ch 3", "Ch 4", "Ch 5"];
	const gameColorsBG = [
		"bg-utdrut",
		"bg-utdrch1",
		"bg-utdrch2",
		"bg-utdrch3",
		"bg-utdrch4",
		"bg-utdrch5",
		"bg-utdrch6",
		"bg-utdrch7",
	];
	const gameColorsFill = [
		"fill-utdrut",
		"fill-utdrch1",
		"fill-utdrch2",
		"fill-utdrch3",
		"fill-utdrch4",
		"fill-utdrch5",
		"fill-utdrch6",
		"fill-utdrch7",
	];

	let nodes: any[] = $state([]);
	let links: any[] = $state([]);
	let svgElement: SVGSVGElement;
	let selectedNodeIndex = $state(0);
	let selectedNode = $derived(nodes[selectedNodeIndex]);
	let selectedNodeType = $state("");
	let linkedNodes = $derived(() => {
		let linked: any[] = [];
		if (selectedNodeType === "l") {
			links
				.filter((link) => link.source.id === selectedNode.id)
				.forEach((link) => {
					linked.push(nodes.find((d) => d.id === link.target.id));
				});
		} else if (selectedNodeType === "s") {
			links
				.filter((link) => link.target.id === selectedNode.id)
				.forEach((link) => {
					linked.push(nodes.find((d) => d.id === link.source.id));
				});
		}
		return linked;
	});
	let dropdownSelectedLeitmotif = $state("x");
	let dropdownSelectedSong = $state("x");
	let menuHidden = $state(true);

	let simulation: d3.Simulation<any, any>;

	// simulation magic numbers
	let xStrength = $state(0.094);
	let yStrength = $state(0.162);
	const songRadius = 5;
	const alphaDecay = 0.02;
	const reheatAlpha = 0.5;
	const collideIterations = 1;
	const manyBodyStrength = -100;
	const linkDistance = 40;
	const holdTime = 1000; // how long to wait after load before alpha decay starts

	// empty dynamic forces
	const forceX = d3.forceX();
	const forceY = d3.forceY();

	onMount(async () => {
		// when an audio starts playing, pause the last audio
		let lastPlayedAudio: HTMLAudioElement;
		document.addEventListener(
			"play",
			(event) => {
				if (lastPlayedAudio && lastPlayedAudio !== event.target) {
					lastPlayedAudio.pause();
				}
				lastPlayedAudio = event.target as HTMLAudioElement;
			},
			true,
		);

		// create leitmotif nodes
		data.leitmotifs.forEach((l) => {
			nodes.push({
				type: "l",
				id: l.id,
				name: l.name,
				subleitmotifs: l.subleitmotifs,
				description: l.description,
				w: 1, // placeholder until sprite loads
				h: 1, // placeholder until sprite loads
				r: 1, // placeholder until sprite loads
			});
		});

		// create song nodes
		data.songs.forEach((s) => {
			nodes.push({
				type: "s",
				id: s.id,
				gameNumber: s.game_number,
				gameTitle: s.game_title,
				trackNumber: s.track_number,
				title: s.title,
				numberTitle: getNumberTitle(s),
				r: songRadius,
			});
		});

		// create links
		data.links.forEach((l_s) => {
			links.push({
				source: l_s.leitmotif,
				target: l_s.song,
				subleitmotifs: l_s.subleitmotifs,
			});
		});

		// console.log($state.snapshot(nodes));
		// console.log($state.snapshot(links));

		// initialize dynamic forces
		const collide = d3.forceCollide((d) => (d as any).r).iterations(collideIterations);
		forceX.x(svgElement.clientWidth / 2).strength(xStrength);
		forceY.y(svgElement.clientHeight / 2).strength(yStrength);

		// create simulation
		simulation = d3
			.forceSimulation(nodes)
			.alphaTarget(1)
			.alphaDecay(alphaDecay)
			.force(
				"link",
				d3
					.forceLink(links)
					.id((d) => (d as any).id)
					.distance(linkDistance),
			)
			.force("charge", d3.forceManyBody().strength(manyBodyStrength))
			.force("collide", collide)
			.force("x", forceX)
			.force("y", forceY);
		let svg = d3.select(svgElement);

		// draw links
		const vLinks = svg
			.append("g")
			.selectAll()
			.data(links)
			.join("line")
			.attr("class", "stroke-[1.2] stroke-utdrlink")
			.attr("data-source", (d) => d.source.id)
			.attr("data-target", (d) => d.target.id);

		// draw song nodes
		const vSongs = svg
			.append("g")
			.selectAll<SVGCircleElement, unknown>("circle")
			.data(nodes.filter((d) => d.type === "s"))
			.join("circle")
			.attr("id", (d) => d.id)
			.attr("class", (d) => `${gameColorsFill[d.gameNumber]} origin-center transform-fill`)
			.attr("r", (d) => d.r)
			.on("click", (event, d) => selectSong(d))
			.call(
				d3.drag<SVGCircleElement, unknown>().on("start", dragStarted).on("drag", dragged).on("end", dragEnded),
			);
		vSongs.append("title").text((d) => d.numberTitle);

		// draw leitmotif nodes
		const vLeitmotifs = svg
			.append("g")
			.selectAll<SVGImageElement, unknown>("image")
			.data(nodes.filter((d) => d.type === "l"))
			.join("image")
			.attr("id", (d) => d.id)
			.attr("class", "origin-center transform-fill [image-rendering:pixelated]")
			.attr("href", (d) => `/images/leitmotifs/${d.name.replace("?", "")}.png`)
			.on("load", (event, d) => setSpriteDimensions(event.target, d))
			.on("click", (event, d) => selectLeitmotif(d))
			.call(
				d3.drag<SVGImageElement, unknown>().on("start", dragStarted).on("drag", dragged).on("end", dragEnded),
			);
		vLeitmotifs.append("title").text((d) => d.name);

		// update positions each tick
		simulation.on("tick", () => {
			vLeitmotifs.attr("x", (d) => d.x - d.w / 2).attr("y", (d) => d.y - d.h / 2);
			vSongs.attr("cx", (d) => d.x).attr("cy", (d) => d.y);
			vLinks
				.attr("x1", (d) => d.source.x)
				.attr("y1", (d) => d.source.y)
				.attr("x2", (d) => d.target.x)
				.attr("y2", (d) => d.target.y);
			collide.initialize(nodes, Math.random);
		});

		// update dynamic forces when the window size changes
		d3.select(window).on("resize", () => {
			forceX.x(svgElement.clientWidth / 2);
			forceY.y(svgElement.clientHeight / 2);
			simulation.alpha(reheatAlpha).restart();
		});

		// start decaying after hold time
		await new Promise((f) => setTimeout(f, holdTime));
		simulation.alphaTarget(0);
	});

	// set selected leitmotif from dropdown
	$effect(() => {
		if (dropdownSelectedLeitmotif === "x") {
			if (dropdownSelectedSong === "x") {
				// deselect all
				selectedNodeType = "";
			}
			return;
		}
		selectedNodeIndex = nodes.find((d) => d.id === dropdownSelectedLeitmotif).index;
		selectedNodeType = "l";
		dropdownSelectedSong = "x";
	});

	// set selected song from dropdown
	$effect(() => {
		if (dropdownSelectedSong === "x") {
			if (dropdownSelectedLeitmotif === "x") {
				// deselect all
				selectedNodeType = "";
			}
			return;
		}
		selectedNodeIndex = nodes.find((d) => d.id === dropdownSelectedSong).index;
		selectedNodeType = "s";
		dropdownSelectedLeitmotif = "x";
	});

	$effect(() => {
		// remove highlights
		document.querySelectorAll(".animate-highlightnode, .animate-highlightlink").forEach((el) => {
			el.classList.remove("animate-highlightnode", "animate-highlightlink");
		});

		// highlight selected node and links
		if (selectedNodeType) {
			document.querySelector(`[id='${selectedNode.id}']`)?.classList.add("animate-highlightnode");
			document
				.querySelectorAll(`[data-source='${selectedNode.id}'], [data-target='${selectedNode.id}']`)
				?.forEach((el) => {
					el.classList.add("animate-highlightlink");
				});
		}
	});

	// reheat simulation when parameters are updated
	$effect(() => {
		forceX.strength(xStrength);
		forceY.strength(yStrength);
		simulation.alpha(reheatAlpha).restart();
	});

	// once sprite loads, set its node's size and radius
	function setSpriteDimensions(target: SVGImageElement, d: any) {
		const rect = target.getBoundingClientRect();
		d.w = rect.width;
		d.h = rect.height;
		d.r = Math.hypot(d.w, d.h) / 2;
	}

	// reheat the simulation when drag starts
	// fix the position of the subject (the node being dragged)
	function dragStarted(event: any) {
		if (!event.active) {
			simulation.alphaTarget(reheatAlpha).restart();
		}
		event.subject.fx = event.subject.x;
		event.subject.fy = event.subject.y;
	}

	// update the position of the subject
	function dragged(event: any) {
		event.subject.fx = event.x;
		event.subject.fy = event.y;
	}

	// allow the simulation to cool
	// unfix the position of the subject
	function dragEnded(event: any) {
		if (!event.active) {
			simulation.alphaTarget(0);
		}
		event.subject.fx = null;
		event.subject.fy = null;
	}

	function selectLeitmotif(d: any) {
		selectedNodeIndex = d.index;
		selectedNodeType = "l";
		dropdownSelectedLeitmotif = d.id;
		dropdownSelectedSong = "x";
	}

	function selectSong(d: any) {
		selectedNodeIndex = d.index;
		selectedNodeType = "s";
		dropdownSelectedLeitmotif = "x";
		dropdownSelectedSong = d.id;
	}

	function getNumberTitle(song: any) {
		return `${song.game_number ? song.game_number : "U"}-${song.track_number} ${song.title}`;
	}

	function getAudioSrc(dir: string, ...file: string[]) {
		return `/audio/leitmotifs/${dir}/${file.join(" ")}.mp3`.replaceAll('"', "-").replaceAll("?", "-");
	}

	function toggleMenu() {
		menuHidden = !menuHidden;
	}
</script>

<div class="h-dvh flex flex-col">
	<NavBar classes="border-b-2 border-utdrborder flex flex-wrap" />
	<div class="min-h-0 flex-1 flex">
		<div class="w-[20vw] min-w-70 max-w-100 min-h-0 flex-1 flex flex-col gap-3">
			{#if selectedNodeType === "l"}
				<LeitmotifInfo
					name={selectedNode.name}
					subleitmotifs={selectedNode.subleitmotifs}
					description={selectedNode.description}
				/>
				<div class="ml-6 mr-3 min-h-0 flex-1 flex flex-col gap-2 overflow-y-auto">
					{#each linkedNodes() as linkedSong}
						<button
							class="hover:underline text-left leading-tight cursor-pointer"
							onclick={() => selectSong(linkedSong)}
						>
							{linkedSong.numberTitle}
						</button>
					{/each}
				</div>
			{:else if selectedNodeType === "s"}
				<SongInfo
					title={selectedNode.title}
					gameTitle={selectedNode.gameTitle}
					trackNumber={selectedNode.trackNumber}
				/>
				<div class="min-h-0 p-4 bg-utdrbg flex flex-col gap-5 overflow-y-auto">
					{#if linkedNodes().length}
						{#each linkedNodes() as linkedLeitmotif}
							{#if linkedLeitmotif.subleitmotifs}
								{#each data.links.find((link) => link.leitmotif === linkedLeitmotif.id && link.song === selectedNode.id).subleitmotifs as linkedSubleitmotif}
									<div class="flex flex-col gap-1">
										<button
											class="mb-1 text-left font-bold leading-tight hover:underline cursor-pointer"
											onclick={() => selectLeitmotif(linkedLeitmotif)}
										>
											{linkedLeitmotif.name}
											{linkedSubleitmotif}
										</button>
										<div class="flex items-center">
											<p class="w-16 text-xs">Identity</p>
											{#key `${linkedLeitmotif.name} ${linkedSubleitmotif}`}
												<audio class="w-full" controls>
													<source
														src={getAudioSrc(
															linkedLeitmotif.name,
															linkedLeitmotif.name,
															linkedSubleitmotif,
														)}
													/>
												</audio>
											{/key}
										</div>
										<div class="flex items-center">
											<p class="w-16 text-xs">Snippet</p>
											{#key `${linkedLeitmotif.name} ${linkedSubleitmotif} ${selectedNode.numberTitle}`}
												<audio class="w-full" controls>
													<source
														src={getAudioSrc(
															linkedLeitmotif.name,
															linkedSubleitmotif,
															selectedNode.numberTitle,
														)}
													/>
												</audio>
											{/key}
										</div>
									</div>
								{/each}
							{:else}
								<div class="flex flex-col gap-1">
									<button
										class="mb-1 text-left font-bold leading-tight hover:underline cursor-pointer"
										onclick={() => selectLeitmotif(linkedLeitmotif)}
									>
										{linkedLeitmotif.name}
									</button>
									<div class="flex items-center">
										<p class="w-16 text-xs">Identity</p>
										{#key linkedLeitmotif.name}
											<audio class="w-full" controls>
												<source src={getAudioSrc(linkedLeitmotif.name, linkedLeitmotif.name)} />
											</audio>
										{/key}
									</div>
									<div class="flex items-center">
										<p class="w-16 text-xs">Snippet</p>
										{#key `${linkedLeitmotif.name} ${selectedNode.numberTitle}`}
											<audio class="w-full" controls>
												<source
													src={getAudioSrc(linkedLeitmotif.name, selectedNode.numberTitle)}
												/>
											</audio>
										{/key}
									</div>
								</div>
							{/if}
						{/each}
					{:else}
						<p>None</p>
					{/if}
				</div>
			{/if}
			<div class="m-3 mt-auto flex flex-col gap-2">
				<label class="flex items-center">
					<p class="w-28">Leitmotif:</p>
					<select
						class="border-2 border-utdrinactive hover:border-utdractive w-full p-2"
						bind:value={dropdownSelectedLeitmotif}
					>
						<option value="x">---</option>
						{#each data.leitmotifs as leitmotif}
							<option value={leitmotif.id}>{leitmotif.name}</option>
						{/each}
					</select>
				</label>
				<label class="flex items-center">
					<p class="w-28">Song:</p>
					<select
						class="border-2 border-utdrinactive hover:border-utdractive w-full p-2"
						bind:value={dropdownSelectedSong}
					>
						<option value="x">---</option>
						{#each data.songs as song}
							<option value={song.id}>{getNumberTitle(song)}</option>
						{/each}
					</select>
				</label>
			</div>
		</div>
		<svg bind:this={svgElement} class="border-x-2 border-utdrborder flex-1"></svg>
		<div class="m-3 flex flex-col gap-1 items-start">
			<div class="relative">
				<button
					class="[image-rendering:pixelated]"
					title="Simulation parameters"
					onclick={toggleMenu}
					style="background: url({config_hover});"
				>
					<img
						class="hover:opacity-0 [image-rendering:pixelated]"
						src={menuHidden ? config_inactive : config_active}
						alt="Config menu."
					/>
				</button>
				<div
					class={"absolute right-0 border-2 border-white p-3 bg-black flex flex-col gap-2 items-right" +
						(menuHidden ? " hidden" : "")}
				>
					<label class="flex items-center gap-2 whitespace-nowrap">
						X force strength:
						<input
							class="border-2 border-utdrinactive hover:border-utdractive px-2 py-1"
							type="number"
							min="0"
							max="1"
							step="0.001"
							bind:value={xStrength}
						/>
					</label>
					<label class="flex items-center gap-2 whitespace-nowrap">
						Y force strength:
						<input
							class="border-2 border-utdrinactive hover:border-utdractive px-2 py-1"
							type="number"
							min="0"
							max="1"
							step="0.001"
							bind:value={yStrength}
						/>
					</label>
				</div>
			</div>
			<div class="h-1"></div>
			{#each legend as game, i}
				<div class="text-xs flex gap-2 items-center">
					<div class="w-3 h-3 {gameColorsBG[i]}"></div>
					<p>{game}</p>
				</div>
			{/each}
		</div>
	</div>
</div>
