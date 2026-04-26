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
		msg = msg.replace(/\s+/g, " ");
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

<div class="background" style:background-color={background}>
	<div class="headerBackground">
		<NavBar />
		<div class="header flex">
			<div>
				<h1>
					Translate a message to <a href="https://en.wikipedia.org/wiki/International_Code_of_Signals">International Code of Signals (INTERCO)</a> flags
				</h1>
				<input type="text" size="80" autocomplete="off" placeholder="Message..." bind:value={message} />
			</div>
			<div class="flex column centered">
				<h2>Options</h2>
				<table>
					<tbody>
						<tr>
							<td>Width:</td>
							<td>
								<input type="number" bind:value={w} />
							</td>
						</tr>
						<tr>
							<td>Height:</td>
							<td>
								<input type="number" bind:value={h} />
							</td>
						</tr>
					</tbody>
				</table>
				<div class="useSubs flex">
					<input id="useSubs" type="checkbox" bind:checked={useSubs} />
					<label for="useSubs" title="Replaces repeated flags with substitutes.">Use substitutes?</label>
				</div>
			</div>
			<div class="flex column centered">
				<h2>Colors</h2>
				<div class="colors flex">
					<table>
						<tbody>
							<tr>
								<td>Background:</td>
								<td>
									<input type="color" bind:value={background} />
								</td>
							</tr>
							<tr>
								<td>Black:</td>
								<td>
									<input type="color" bind:value={black} />
								</td>
							</tr>
							<tr>
								<td>White:</td>
								<td>
									<input type="color" bind:value={white} />
								</td>
							</tr>
						</tbody>
					</table>
					<table>
						<tbody>
							<tr>
								<td>Red:</td>
								<td>
									<input type="color" bind:value={red} />
								</td>
							</tr>
							<tr>
								<td>Yellow:</td>
								<td>
									<input type="color" bind:value={yellow} />
								</td>
							</tr>
							<tr>
								<td>Blue:</td>
								<td>
									<input type="color" bind:value={blue} />
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="flags flex">
		{#each parseMessage() as word}
			<div class="flagsColumn flex column">
				{#each word as char}
					<SignalFlag {w} {h} {black} {white} {red} {yellow} {blue} {char} />
				{/each}
			</div>
		{/each}
	</div>
</div>

<style>
	.background {
		height: 100vh;
		width: 100vw;
	}
	.headerBackground {
		background-color: black;
		box-shadow: 0px 0px 5px black;
	}
	.header {
		gap: 20px;
		padding: 20px 20px 30px;
	}
	h1 {
		font-size: 125%;
	}
	input {
		font-family: Verdana, Tahoma, sans-serif;
		font-size: 100%;
	}
	input[type="text"] {
		max-width: 800px;
	}
	h2 {
		font-size: 100%;
	}
	input[type="number"] {
		max-width: 80px;
	}
	td {
		text-align: right;
	}
	.useSubs {
		gap: 10px;
		margin: 10px;
	}
	.colors {
		gap: 20px;
	}
	.flags {
		gap: 20px;
		height: 100%;
		margin: 40px;
	}
	.flagsColumn {
		gap: 20px;
	}
	@media (prefers-color-scheme: light) {
		.headerBackground {
			background-color: white;
		}
	}
</style>
