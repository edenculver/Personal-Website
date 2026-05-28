<script lang="ts">
	import type { PageProps } from "./$types";
	import { onMount } from "svelte";
	import * as d3 from "d3";
	import NavBar from "$lib/components/NavBar.svelte";
	import LeitmotifInfo from "$lib/components/LeitmotifInfo.svelte";
	import SongInfo from "$lib/components/SongInfo.svelte";

	let { data }: PageProps = $props();
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

	// simulation magic numbers
	const songRadius = 6;
	const alphaDecay = 0.02;
	const reheatAlpha = 0.5;
	const xStrength = 0.08;
	const yStrength = 0.08;
	const collideIterations = 2;
	const manyBodyStrength = -100;
	const linkDistance = 40;

	const gameColorsBG = [
		"bg-(--utdr-undertale)",
		"bg-(--utdr-ch1)",
		"bg-(--utdr-ch2)",
		"bg-(--utdr-ch3)",
		"bg-(--utdr-ch4)",
	];
	const gameColorsFill = [
		"fill-(--utdr-undertale)",
		"fill-(--utdr-ch1)",
		"fill-(--utdr-ch2)",
		"fill-(--utdr-ch3)",
		"fill-(--utdr-ch4)",
	];

	let dropdownSelectedLeitmotif = $state("x");
	let dropdownSelectedSong = $state("x");

	onMount(() => {
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
				subthemes: l.subthemes ?? "",
				description: l.description ?? "",
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
				r: songRadius,
			});
		});
		// create links
		data.links.forEach((l_s) => {
			links.push({
				source: l_s.leitmotif,
				target: l_s.song,
			});
		});

		// dynamic forces
		const collide = d3.forceCollide((d) => (d as any).r).iterations(collideIterations);
		const forceX = d3.forceX(svgElement.clientWidth / 2).strength(xStrength);
		const forceY = d3.forceY(svgElement.clientHeight / 2).strength(yStrength);

		// create simulation
		const simulation: d3.Simulation<any, any> = d3
			.forceSimulation(nodes)
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
		const vLinks = svg.append("g").selectAll().data(links).join("line").attr("class", "stroke-[1.2] stroke-white");

		// draw song nodes
		const vSongs = svg
			.append("g")
			.selectAll<SVGCircleElement, unknown>("circle")
			.data(nodes.filter((d) => d.type === "s"))
			.join("circle")
			.attr("id", (d) => d.id)
			.attr("class", (d) => `${gameColorsFill[d.gameNumber]} origin-center transform-fill`)
			.attr("r", (d) => d.r)
			.attr("gameNumber", (d) => d.gameNumber)
			.attr("gameTitle", (d) => d.gameTitle)
			.attr("trackNumber", (d) => d.trackNumber)
			.attr("title", (d) => d.title)
			.on("click", (event, d) => selectSong(d))
			.call(
				d3.drag<SVGCircleElement, unknown>().on("start", dragStarted).on("drag", dragged).on("end", dragEnded),
			);
		vSongs.append("title").text((d) => d.title);

		// draw leitmotif nodes
		const vLeitmotifs = svg
			.append("g")
			.selectAll<SVGImageElement, unknown>("image")
			.data(nodes.filter((d) => d.type === "l"))
			.join("image")
			.attr("id", (d) => d.id)
			.attr("class", "origin-center transform-fill")
			.attr("href", (d) => `/images/leitmotifs/${d.name.replace("?", "")}.png`)
			.attr("name", (d) => d.name)
			.attr("subthemes", (d) => d.subthemes)
			.attr("description", (d) => d.description)
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

		// update dynamic forces when the window resizes
		d3.select(window).on("resize", () => {
			forceX.x(svgElement.clientWidth / 2);
			forceY.y(svgElement.clientHeight / 2);
			simulation.alpha(reheatAlpha).restart();
		});

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
	});

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

	// once sprite loads, set its node's size and radius
	function setSpriteDimensions(target: SVGImageElement, d: any) {
		const rect = target.getBoundingClientRect();
		d.w = rect.width;
		d.h = rect.height;
		d.r = Math.hypot(d.w, d.h) / 2;
	}

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
		document.querySelectorAll(".animate-highlight").forEach((d) => {
			d.classList.remove("animate-highlight");
		});
		// highlight selected node
		if (selectedNodeType) {
			document.querySelector(`[id='${selectedNode.id}']`)?.classList.add("animate-highlight");
		}
	});
</script>

<div class="h-dvh flex flex-col">
	<NavBar />
	<h1 class="border-b-2 border-b-(--utdr-border) p-4 text-center text-2xl font-bold">
		Undertale/Deltarune Leitmotifs Graph
	</h1>
	<div class="min-h-0 flex-1 flex">
		<div class="w-[20vw] min-w-70 max-w-100 min-h-0 flex-1 flex flex-col gap-3">
			{#if selectedNodeType === "l"}
				<LeitmotifInfo
					name={selectedNode.name}
					subthemes={selectedNode.subthemes ? selectedNode.subthemes.split(",") : null}
					description={selectedNode.description}
				/>
				<p class="mx-4">Appearances:</p>
				<div class="ml-6 min-h-0 flex-1 flex flex-col gap-2 overflow-y-auto">
					{#each linkedNodes() as linkedSong}
						<button class="hover:underline text-left leading-tight" onclick={() => selectSong(linkedSong)}>
							{linkedSong.gameNumber ? linkedSong.gameNumber : "U"}-{linkedSong.trackNumber}. {linkedSong.title}
						</button>
					{/each}
				</div>
			{:else if selectedNodeType === "s"}
				<SongInfo
					gameTitle={selectedNode.gameTitle}
					title={selectedNode.gameTitle}
					trackNumber={selectedNode.trackNumber}
				/>
				<p class="mx-4">Leitmotifs:</p>
				<div class="ml-6 min-h-0 flex-1 flex flex-col gap-2 overflow-y-auto">
					{#each linkedNodes() as linkedLeitmotif}
						<button
							class="hover:underline text-left leading-tight"
							onclick={() => selectLeitmotif(linkedLeitmotif)}
						>
							{linkedLeitmotif.name}
						</button>
					{/each}
				</div>
			{/if}
			<table class="m-3 mt-auto">
				<tbody>
					<tr>
						<td>Leitmotif:</td>
						<td class="pl-2 py-1">
							<select class="p-2 w-full bg-gray-950" bind:value={dropdownSelectedLeitmotif}>
								<option value="x">---</option>
								{#each data.leitmotifs as leitmotif}
									<option value={leitmotif.id}>{leitmotif.name}</option>
								{/each}
							</select>
						</td>
					</tr>
					<tr>
						<td>Song:</td>
						<td class="pl-2 py-1">
							<select class="p-2 w-full bg-gray-950" bind:value={dropdownSelectedSong}>
								<option value="x">---</option>
								{#each data.songs as song}
									<option value={song.id}>{song.title}</option>
								{/each}
							</select>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<svg bind:this={svgElement} class="border-x-2 border-x-(--utdr-border) bg-gray-950 flex-1"></svg>
		<div class="m-3 mr-4 flex flex-col gap-1">
			{#each ["UT", "Ch. 1", "Ch. 2", "Ch. 3", "Ch. 4"] as game, i}
				<div class="text-xs flex gap-2 items-center">
					<div class="w-3 h-3 {gameColorsBG[i]}"></div>
					<p>{game}</p>
				</div>
			{/each}
		</div>
	</div>
</div>
