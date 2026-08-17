<script lang="ts">
	import Card from "$lib/components/Card.svelte";
	import StandardPageLayout from "$lib/components/StandardPageLayout.svelte";

	/*
	Terms used:

		noteSpelling
		   ┌┴─┐
			F#
	noteName┘└accidental
	
	pitch =  number of half steps from middle C
	*/

	const pianoKeys = ["C", "C#", "D", "D#", "E", "F", "F#", "G", "G#", "A", "A#", "B"];
	const noteNames = ["C", "D", "E", "F", "G", "A", "B"];
	const accidentals = ["𝄫", "♭", "♮", "♯", "𝄪"];
	const qualities = {
		// 5th
		6: "diminished",
		7: "perfect",
		8: "augmented",
		// 7th
		9: "diminished",
		10: "minor",
		11: "major",
		12: "augmented",
	};
	const chordNames = {
		// R = root note
		"33": "R diminished (R°)",
		"34": "R minor (Rm)",
		"43": "R major (R)",
		"44": "R augmented (R+)",
		"333": "R fully-diminished 7th (R°7)",
		"334": "R half-diminished 7th (Rø7)",
		"343": "R minor 7th (Rm7)",
		"344": "R minor major 7th (RmM7)",
		"433": "R dominant 7th (R7)",
		"434": "R major 7th (RM7)",
		"443": "R augmented major 7th (R+M7)",
		"444": "R augmented (R+)",
	};

	let root = $state("C♮");
	let rootPitch = $derived(getPitch(root));
	// half steps between root and three
	let third1Quality = $state(4);
	let threePitch = $derived(rootPitch + third1Quality);
	let three = $derived(getNoteSpelling(traverseNoteNames(root.charAt(0), 2), threePitch));
	// half steps between third and fifth
	let third2Quality = $state(3);
	let fivePitch = $derived(threePitch + third2Quality);
	let five = $derived(getNoteSpelling(traverseNoteNames(root.charAt(0), 4), fivePitch));
	// half steps between fifth and seventh
	let third3Quality = $state(3);
	let sevenPitch = $derived(fivePitch + third3Quality);
	let seven = $derived(getNoteSpelling(traverseNoteNames(root.charAt(0), 6), sevenPitch));
	let useSeventh = $state(true);
	let chordStack = $derived(third1Quality.toString() + third2Quality.toString() + (useSeventh ? third3Quality : ""));
	let pitches = $derived([rootPitch, threePitch, fivePitch, useSeventh ? sevenPitch : -1]);

	function getPitch(noteSpelling: string) {
		let naturalPitch = pianoKeys.indexOf(noteSpelling.charAt(0));
		let offset = accidentals.indexOf(noteSpelling.substring(1)) - 2;
		return naturalPitch + offset;
	}

	function wrapPitch(pitch: number) {
		return ((pitch % 12) + 12) % 12;
	}

	function getNoteSpelling(noteName: string, pitch: number) {
		let diff = pitch - getPitch(noteName + "♮");

		// if more than half an octave away, wrap
		if (diff > 6) {
			diff -= 12;
		} else if (diff < -6) {
			diff += 12;
		}

		if (diff < -2 || diff > 2) {
			return noteName + "?";
		}
		return noteName + accidentals[diff + 2];
	}

	function traverseNoteNames(start: string, move: number) {
		let startIndex = noteNames.indexOf(start);
		let newIndex = (((startIndex + move) % noteNames.length) + noteNames.length) % noteNames.length;
		return noteNames[newIndex];
	}
</script>

<StandardPageLayout>
	<div class="mx-16 my-10 flex flex-col gap-8 items-start">
		<h1 class="text-2xl font-bold">Chord Builder</h1>
		<div class="grid lg:grid-cols-[auto_auto] gap-8">
			<Card>
				<h2 class="text-xl font-bold">Root</h2>
				<table>
					<tbody>
						{#each accidentals as accidental}
							<tr>
								{#each noteNames as noteName}
									<td class="border border-black dark:border-white">
										<button
											class={"w-full p-3 " +
												(root === noteName + accidental
													? "bg-blue-500"
													: wrapPitch(getPitch(root)) ===
														  wrapPitch(getPitch(noteName + accidental))
														? "bg-sky-300 hover:bg-sky-700"
														: "hover:bg-gray-500")}
											onclick={() => (root = noteName + accidental)}
										>
											{noteName}{accidental}
										</button>
									</td>
								{/each}
							</tr>
						{/each}
					</tbody>
				</table>
			</Card>
			<Card>
				<h2 class="font-bold text-xl">Interval Qualities</h2>
				<table class="border border-black dark:border-white">
					<tbody>
						<tr>
							<th class="border border-black dark:border-white p-3">1</th>
							<th class="border border-black dark:border-white p-3">third</th>
							<th class="border border-black dark:border-white p-3">3</th>
							<th class="border border-black dark:border-white p-3">third</th>
							<th class="border border-black dark:border-white p-3">5</th>
							{#if useSeventh}
								<th class="border border-black dark:border-white p-3">third</th>
								<th class="border border-black dark:border-white p-3">7</th>
							{/if}
						</tr>
						<tr>
							<td class="border border-black dark:border-white text-center w-20" rowspan="2">
								{root.replace("♮", "")}
							</td>
							<td class="border border-black dark:border-white">
								<button
									class={"w-full p-3 " + (third1Quality === 3 ? "bg-blue-500" : "hover:bg-gray-500")}
									onclick={() => (third1Quality = 3)}
								>
									minor
								</button>
							</td>
							<td
								class={"border border-black dark:border-white text-center w-20" +
									(three.includes("?") ? " text-red-500" : "")}
								rowspan="2"
							>
								{three.replace("♮", "")}
							</td>
							<td class="border border-black dark:border-white">
								<button
									class={"w-full p-3 " + (third2Quality === 3 ? "bg-blue-500" : "hover:bg-gray-500")}
									onclick={() => (third2Quality = 3)}
								>
									minor
								</button>
							</td>
							<td
								class={"border border-black dark:border-white text-center w-20" +
									(five.includes("?") ? " text-red-500" : "")}
								rowspan="2"
							>
								{five.replace("♮", "")}
							</td>
							{#if useSeventh}
								<td class="border border-black dark:border-white">
									<button
										class={"w-full p-3 " +
											(third3Quality === 3 ? "bg-blue-500" : "hover:bg-gray-500")}
										onclick={() => (third3Quality = 3)}
									>
										minor
									</button>
								</td>
								<td
									class={"border border-black dark:border-white text-center w-20" +
										(seven.includes("?") ? " text-red-500" : "")}
									rowspan="2"
								>
									{seven.replace("♮", "")}
								</td>
							{/if}
						</tr>
						<tr>
							<td class="border border-black dark:border-white">
								<button
									class={"w-full p-3 " + (third1Quality === 4 ? "bg-blue-500" : "hover:bg-gray-500")}
									onclick={() => (third1Quality = 4)}
								>
									major
								</button>
							</td>
							<td class="border border-black dark:border-white">
								<button
									class={"w-full p-3 " + (third2Quality === 4 ? "bg-blue-500" : "hover:bg-gray-500")}
									onclick={() => (third2Quality = 4)}
								>
									major
								</button>
							</td>
							{#if useSeventh}
								<td class="border border-black dark:border-white">
									<button
										class={"w-full p-3 " +
											(third3Quality === 4 ? "bg-blue-500" : "hover:bg-gray-500")}
										onclick={() => (third3Quality = 4)}
									>
										major
									</button>
								</td>
							{/if}
						</tr>
						<tr>
							<th class="border border-black dark:border-white p-3" colspan="5">
								{qualities[(fivePitch - rootPitch) as keyof typeof qualities]} fifth
							</th>
						</tr>
						{#if useSeventh}
							<tr>
								<th class="p-3" colspan="7">
									{qualities[(sevenPitch - rootPitch) as keyof typeof qualities]} seventh
								</th>
							</tr>
						{/if}
					</tbody>
				</table>
				<label class="flex gap-2">
					<input type="checkbox" bind:checked={useSeventh} />
					Seventh?
				</label>
				{#if three.includes("?") || five.includes("?") || (useSeventh && seven.includes("?"))}
					<div class="text-red-500">
						<p>This chord is impossible! The notes in red do not exist.</p>
						<p>Try an enharmonic root note (light blue).</p>
					</div>
				{/if}
			</Card>
			<div class="lg:col-span-2">
				<Card>
					<p class="text-xl font-bold">
						{chordNames[chordStack as keyof typeof chordNames].replaceAll("R", root.replace("♮", ""))}
					</p>
					<svg width="715px" height="202px">
						<rect width="715" height="202" fill="black"></rect>
						<rect x="1" y="1" width="50" height="200" fill={pitches.includes(0) ? "blue" : "white"}></rect>
						<rect x="52" y="1" width="50" height="200" fill={pitches.includes(2) ? "blue" : "white"}></rect>
						<rect x="103" y="1" width="50" height="200" fill={pitches.includes(4) ? "blue" : "white"}
						></rect>
						<rect x="154" y="1" width="50" height="200" fill={pitches.includes(5) ? "blue" : "white"}
						></rect>
						<rect x="205" y="1" width="50" height="200" fill={pitches.includes(7) ? "blue" : "white"}
						></rect>
						<rect x="256" y="1" width="50" height="200" fill={pitches.includes(9) ? "blue" : "white"}
						></rect>
						<rect x="307" y="1" width="50" height="200" fill={pitches.includes(11) ? "blue" : "white"}
						></rect>
						<rect x="358" y="1" width="50" height="200" fill={pitches.includes(12) ? "blue" : "white"}
						></rect>
						<rect x="409" y="1" width="50" height="200" fill={pitches.includes(14) ? "blue" : "white"}
						></rect>
						<rect x="460" y="1" width="50" height="200" fill={pitches.includes(16) ? "blue" : "white"}
						></rect>
						<rect x="511" y="1" width="50" height="200" fill={pitches.includes(17) ? "blue" : "white"}
						></rect>
						<rect x="562" y="1" width="50" height="200" fill={pitches.includes(19) ? "blue" : "white"}
						></rect>
						<rect x="613" y="1" width="50" height="200" fill={pitches.includes(21) ? "blue" : "white"}
						></rect>
						<rect x="664" y="1" width="50" height="200" fill={pitches.includes(23) ? "blue" : "white"}
						></rect>
						<rect x="34" y="1" width="35" height="126" fill="black"></rect>
						<rect x="85" y="1" width="35" height="126" fill="black"></rect>
						<rect x="187" y="1" width="35" height="126" fill="black"></rect>
						<rect x="238" y="1" width="35" height="126" fill="black"></rect>
						<rect x="289" y="1" width="35" height="126" fill="black"></rect>
						<rect x="391" y="1" width="35" height="126" fill="black"></rect>
						<rect x="442" y="1" width="35" height="126" fill="black"></rect>
						<rect x="442" y="1" width="35" height="126" fill="black"></rect>
						<rect x="544" y="1" width="35" height="126" fill="black"></rect>
						<rect x="595" y="1" width="35" height="126" fill="black"></rect>
						<rect x="646" y="1" width="35" height="126" fill="black"></rect>
						<rect x="35" y="1" width="33" height="125" fill={pitches.includes(1) ? "blue" : "black"}></rect>
						<rect x="86" y="1" width="33" height="125" fill={pitches.includes(3) ? "blue" : "black"}></rect>
						<rect x="188" y="1" width="33" height="125" fill={pitches.includes(6) ? "blue" : "black"}
						></rect>
						<rect x="239" y="1" width="33" height="125" fill={pitches.includes(8) ? "blue" : "black"}
						></rect>
						<rect x="290" y="1" width="33" height="125" fill={pitches.includes(10) ? "blue" : "black"}
						></rect>
						<rect x="392" y="1" width="33" height="125" fill={pitches.includes(13) ? "blue" : "black"}
						></rect>
						<rect x="443" y="1" width="33" height="125" fill={pitches.includes(15) ? "blue" : "black"}
						></rect>
						<rect x="443" y="1" width="33" height="125" fill={pitches.includes(15) ? "blue" : "black"}
						></rect>
						<rect x="545" y="1" width="33" height="125" fill={pitches.includes(18) ? "blue" : "black"}
						></rect>
						<rect x="596" y="1" width="33" height="125" fill={pitches.includes(20) ? "blue" : "black"}
						></rect>
						<rect x="647" y="1" width="33" height="125" fill={pitches.includes(22) ? "blue" : "black"}
						></rect>
					</svg>
				</Card>
			</div>
		</div>
	</div>
</StandardPageLayout>
