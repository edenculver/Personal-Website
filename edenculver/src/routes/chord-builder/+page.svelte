<script lang="ts">
	import Card from "$lib/components/Card.svelte";
	import StandardPageLayout from "$lib/components/StandardPageLayout.svelte";
	import { range } from "$lib/util";

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

	const whiteKeyPitches = [0, 2, 4, 5, 7, 9, 11, 12, 14, 16, 17, 19, 21, 23];
	const blackKeyPitches = [1, 3, 6, 8, 10, 13, 15, 18, 20, 22];
	const blackKeyPositions = [1, 2, 4, 5, 6, 8, 9, 11, 12, 13];
	const whiteKeyW = 50;
	const whiteKeyH = 200;
	const blackKeyW = 33;
	const blackKeyH = 125;

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

<StandardPageLayout extraClasses="lg:items-start">
	<h1 class="mx-auto lg:mx-0 text-xl lg:text-2xl text-center font-bold">Chord Builder</h1>

	<div class="grid lg:grid-cols-[auto_auto] gap-8">
		<Card>
			<h2 class="text-lg lg:text-xl font-bold">Root</h2>

			<table>
				<tbody>
					{#each accidentals as accidental}
						<tr>
							{#each noteNames as noteName}
								<td class="border border-black dark:border-white">
									<button
										class="w-full p-3 {root === noteName + accidental
											? 'bg-blue-500'
											: wrapPitch(getPitch(root)) === wrapPitch(getPitch(noteName + accidental))
												? 'bg-sky-300 hover:bg-sky-700'
												: 'hover:bg-gray-500'}"
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
			<h2 class="text-lg lg:text-xl font-bold">Interval Qualities</h2>

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
									class={"w-full p-3 " + (third3Quality === 3 ? "bg-blue-500" : "hover:bg-gray-500")}
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
									class={"w-full p-3 " + (third3Quality === 4 ? "bg-blue-500" : "hover:bg-gray-500")}
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
				<p class="text-lg lg:text-xl font-bold">
					{chordNames[chordStack as keyof typeof chordNames].replaceAll("R", root.replace("♮", ""))}
				</p>

				<svg class="border border-black bg-black" width={(whiteKeyW + 1) * 14 - 1} height={whiteKeyH}>
					{#each whiteKeyPitches as p, i}
						<rect
							class={pitches.includes(p) ? "fill-blue-500" : "fill-white"}
							x={(whiteKeyW + 1) * i}
							y={0}
							width={whiteKeyW}
							height={whiteKeyH}
						></rect>
					{/each}
					{#each blackKeyPitches as p, i}
						<rect
							class={pitches.includes(p) ? "fill-blue-500" : "fill-black"}
							x={blackKeyPositions[i] * (whiteKeyW + 1) - blackKeyW / 2 - 1}
							y={0}
							width={blackKeyW}
							height={blackKeyH}
						></rect>
					{/each}
				</svg>
			</Card>
		</div>
	</div>
</StandardPageLayout>
