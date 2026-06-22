<script lang="ts">
	import NavBar from "$lib/components/NavBar.svelte";
	import PrivacyPolicy from "$lib/components/PrivacyPolicy.svelte";
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

<div class="h-dvh flex flex-col">
	<NavBar />
	<div class="bg-white dark:bg-black">
		<div class="p-10 flex flex-wrap gap-10">
			<div class="mt-5 flex flex-col gap-5">
				<h1 class="text-xl font-bold">
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
					class="border border-gray-500 rounded-md w-200 p-2 bg-white text-black"
					type="text"
					size="80"
					placeholder="Message..."
					bind:value={message}
				/>
			</div>
			<div class="flex flex-col gap-2 items-center">
				<h2 class="text-lg font-bold">Options</h2>
				<div class="flex flex-col gap-1 items-end">
					<label class="flex gap-2 items-center justify-right">
						<p>Width:</p>
						<input
							class="border border-gray-500 rounded-sm w-20 p-1 bg-white text-black"
							type="number"
							bind:value={w}
						/>
					</label>
					<label class="flex gap-2 items-center justify-right">
						<p>Height:</p>
						<input
							class="border border-gray-500 rounded-sm w-20 p-1 bg-white text-black"
							type="number"
							bind:value={h}
						/>
					</label>
				</div>
				<label
					class="flex gap-3"
					title="Replaces repeated flags with substitutes. Allows any four letter or number combination to be sent using only one set of flags."
				>
					<input type="checkbox" bind:checked={useSubs} />
					Use substitutes?
				</label>
			</div>
			<div class="flex flex-col gap-2 items-center">
				<h2 class="text-lg font-bold">Colors</h2>
				<div class="flex gap-4">
					<div class="flex flex-col gap-1 items-end">
						<label class="flex gap-2 items-center justify-right">
							<p>Background:</p>
							<input
								class="border border-gray-500 rounded-md w-20"
								type="color"
								bind:value={background}
							/>
						</label>
						<label class="flex gap-2 items-center justify-right">
							<p>Black:</p>
							<input class="border border-gray-500 rounded-md w-20" type="color" bind:value={black} />
						</label>
						<label class="flex gap-2 items-center justify-right">
							<p>White:</p>
							<input class="border border-gray-500 rounded-md w-20" type="color" bind:value={white} />
						</label>
					</div>
					<div class="flex flex-col gap-1 items-end">
						<label class="flex gap-2 items-center justify-right">
							<p>Red:</p>
							<input class="border border-gray-500 rounded-md w-20" type="color" bind:value={red} />
						</label>
						<label class="flex gap-2 items-center justify-right">
							<p>Yellow:</p>
							<input class="border border-gray-500 rounded-md w-20" type="color" bind:value={yellow} />
						</label>
						<label class="flex gap-2 items-center justify-right">
							<p>Blue:</p>
							<input class="border border-gray-500 rounded-md w-20" type="color" bind:value={blue} />
						</label>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="p-10 flex gap-20 flex-1" style="background-color: {background};">
		{#each parseMessage() as word}
			<div class="flex flex-col gap-5">
				{#each word as char}
					<SignalFlag {w} {h} {black} {white} {red} {yellow} {blue} {char} />
				{/each}
			</div>
		{/each}
	</div>
	<PrivacyPolicy />
</div>
