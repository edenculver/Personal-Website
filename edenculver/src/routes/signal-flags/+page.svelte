<script lang="ts">
	import NavBar from "$lib/components/NavBar.svelte";
	import SignalFlag from "$lib/components/SignalFlag.svelte";

	let message = $state("");
	let w = $state(100);
	let h = $state(100);
	let useSubs = $state(true);
	let background = $state("#b89869");
	let black = $state("#000000");
	let white = $state("#ffffff");
	let red = $state("#ff0000");
	let yellow = $state("#ffcc00");
	let blue = $state("#000080");

	function parseMessage() {
		let msg = message.toUpperCase();
		// remove everything except letters, numbers, #, and space
		msg = msg.replace(/[^A-Z0-9#\s]/g, "");
		// squish spaces
		msg = msg.trim().replace(/\s+/g, " ");
		let msgArray = msg.split(" ");

		// substitutes
		if (useSubs) {
			let newMsg: string[] = [];
			for (let word of msgArray) {
				let newWord = word;
				// first
				if (word.length > 1) {
					newWord = newWord[0] + newWord.substring(1).replaceAll(newWord[0], "a");
				}
				// second
				if (word.length > 2) {
					newWord = newWord.substring(0, 2) + newWord.substring(2).replaceAll(newWord[1], "b");
				}
				// third
				if (word.length > 3) {
					newWord = newWord.substring(0, 3) + newWord.substring(3).replaceAll(newWord[2], "c");
				}
				newMsg.push(newWord);
			}
			msgArray = newMsg;
		}

		// console.log(msgArray);
		return msgArray;
	}
</script>

<div class="h-dvh" style="background-color: {background};">
	<div class="bg-white dark:bg-black">
		<NavBar />
		<div class="flex flex-wrap gap-10 p-10">
			<div class="flex flex-col gap-5 mt-5">
				<h1 class="font-bold text-xl">
					Translate a message to
					<a
						class="text-blue-400 underline hover:no-underline visited:text-purple-400"
						href="https://en.wikipedia.org/wiki/International_Code_of_Signals"
					>
						International Code of Signals (INTERCO)
					</a>
					flags
				</h1>
				<input
					class="p-2 rounded-md w-200"
					type="text"
					size="80"
					placeholder="Message..."
					bind:value={message}
				/>
			</div>
			<div class="flex flex-col gap-2 items-center">
				<h2 class="font-bold text-lg">Options</h2>
				<table>
					<tbody>
						<tr>
							<td>Width:</td>
							<td>
								<input class="p-1 rounded-sm w-20" type="number" bind:value={w} />
							</td>
						</tr>
						<tr>
							<td>Height:</td>
							<td>
								<input class="p-1 rounded-sm w-20" type="number" bind:value={h} />
							</td>
						</tr>
					</tbody>
				</table>
				<label
					class="flex gap-3"
					title="Replaces repeated flags with substitutes. Allows any four letter or number combination to be sent using only one set of flags."
				>
					<input type="checkbox" bind:checked={useSubs} />
					Use substitutes?
				</label>
			</div>
			<div class="flex flex-col gap-2 items-center">
				<h2 class="font-bold text-lg">Colors</h2>
				<div class="flex gap-4">
					<table>
						<tbody>
							<tr>
								<td>Background:</td>
								<td>
									<input class="rounded-md" type="color" bind:value={background} />
								</td>
							</tr>
							<tr>
								<td>Black:</td>
								<td>
									<input class="rounded-md" type="color" bind:value={black} />
								</td>
							</tr>
							<tr>
								<td>White:</td>
								<td>
									<input class="rounded-md" type="color" bind:value={white} />
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td>Red:</td>
								<td>
									<input class="rounded-md" type="color" bind:value={red} />
								</td>
							</tr>
							<tr>
								<td>Yellow:</td>
								<td>
									<input class="rounded-md" type="color" bind:value={yellow} />
								</td>
							</tr>
							<tr>
								<td>Blue:</td>
								<td>
									<input class="rounded-md" type="color" bind:value={blue} />
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="flex gap-20 p-10" style="background-color: {background};">
		{#each parseMessage() as word}
			<div class="flex flex-col gap-5">
				{#each word as char}
					<SignalFlag {w} {h} {black} {white} {red} {yellow} {blue} {char} />
				{/each}
			</div>
		{/each}
	</div>
</div>

<style lang="postcss">
	@reference "../app.css";
	input {
		@apply bg-white border border-gray-500 text-black;
	}
	td {
		@apply px-1 text-right;
	}
</style>
