<script lang="ts">
	import IpAddress from "$lib/IpAddress";
	import NavBar from "$lib/components/NavBar.svelte";
	import { browser } from "$app/environment";

	const strictExplanation =
		"Strict: Summarize without including address space that isn't included in the input addresses. This usually results in multiple supernets.\nLoose: Summarize to one supernet.";

	// load states from sessionStorage (client-side only)
	let mode: string = $state(browser ? window.sessionStorage.getItem("mode") || "sub" : "sub");
	let strict: boolean = $state(browser ? window.sessionStorage.getItem("strict") === "true" : true);

	let invalidInput: boolean = $state(false);
	let ip = new IpAddress("192.168.0.1/24");

	let inputAddress: string = $state("192.168.0.1/24");
	let inputAddresses: string = $state("192.168.1.0/24\n192.168.2.0/24\n192.168.3.0 255.255.255.0");
	// output fields
	let address: string = $state("");
	let summaryPrefixes: string = $state("");
	let networkPrefixes: string[] = $state([]);
	let broadcastAddresses: string[] = $state([]);
	let totalAddresses: string[] = $state([]);
	let subnetMasks: string[] = $state([]);
	let wildcardMasks: string[] = $state([]);
	let addressSpaceTypes: string[] = $state([]);

	$effect(() => {
		// save states to sessionStorage (client-side only)
		if (browser) {
			window.sessionStorage.setItem("mode", mode);
			window.sessionStorage.setItem("strict", strict.toString());
		}

		try {
			let ips: IpAddress[];

			if (mode === "sub") {
				ip.address = inputAddress;
				ips = [ip];
			} else {
				ips = parseAddresses();
			}
			invalidInput = false;

			// output
			if (mode === "sub") {
				address = ip.address;
			} else {
				summaryPrefixes = ips
					.map((ip) => ip.networkPrefix)
					.toString()
					.replaceAll(",", "\n");
			}

			networkPrefixes = ips.map((ip) => ip.networkPrefix);
			broadcastAddresses = ips.map((ip) => (ip.cidr <= 30 ? ip.broadcastAddress : ""));
			totalAddresses = ips.map((ip) => ip.totalAddresses + (ip.usableHosts ? ` (${ip.usableHosts} usable)` : ""));
			subnetMasks = ips.map((ip) => ip.subnetMask);
			wildcardMasks = ips.map((ip) => ip.wildcardMask);
			addressSpaceTypes = ips.map((ip) => ip.addressSpaceType.toString().replaceAll(",", "\n"));
		} catch (error) {
			invalidInput = true;
		}
	});

	function nextSubnet() {
		let networkBits = IpAddress.dec2bin(ip.address).substring(0, ip.cidr);
		if (!networkBits.includes("0")) {
			// already highest
			return;
		}
		// increment network bits
		networkBits = (parseInt(networkBits, 2) + 1).toString(2).padStart(ip.cidr, "0");
		inputAddress = `${IpAddress.bin2dec(networkBits + IpAddress.dec2bin(ip.address).substring(ip.cidr))}/${ip.cidr}`;
	}

	function previousSubnet() {
		let networkBits = IpAddress.dec2bin(ip.address).substring(0, ip.cidr);
		if (!networkBits.includes("1")) {
			// already lowest
			return;
		}
		// decrement network bits
		networkBits = (parseInt(networkBits, 2) - 1).toString(2).padStart(ip.cidr, "0");
		inputAddress = `${IpAddress.bin2dec(networkBits + IpAddress.dec2bin(ip.address).substring(ip.cidr))}/${ip.cidr}`;
	}

	function incrementCidr() {
		if (ip.cidr < 32) {
			ip.cidr++;
			inputAddress = `${ip.address}/${ip.cidr}`;
		}
	}

	function decrementCidr() {
		if (ip.cidr > 0) {
			ip.cidr--;
			inputAddress = `${ip.address}/${ip.cidr}`;
		}
	}

	function parseAddresses() {
		// build list of IpAddresses
		let inputIps: IpAddress[] = [];
		inputAddresses
			.trim()
			.split("\n")
			.forEach((prefix) => {
				inputIps.push(new IpAddress(prefix));
			});

		// loose mode
		if (!strict) {
			// find first and last addresses
			let firstInt = parseInt(IpAddress.dec2bin("255.255.255.255"), 2);
			let lastInt = 0;
			inputIps.forEach((ip) => {
				let networkAddressInt = parseInt(IpAddress.dec2bin(ip.networkAddress), 2);
				let broadcastAddressInt = parseInt(IpAddress.dec2bin(ip.broadcastAddress), 2);
				if (networkAddressInt < firstInt) {
					firstInt = networkAddressInt;
				}
				if (broadcastAddressInt > lastInt) {
					lastInt = broadcastAddressInt;
				}
			});

			// find common prefix
			let firstBin = firstInt.toString(2).padStart(32, "0");
			let lastBin = lastInt.toString(2).padStart(32, "0");
			let summaryCidr = 0;
			while (summaryCidr < 32) {
				if (firstBin.charAt(summaryCidr) !== lastBin.charAt(summaryCidr)) {
					break;
				}
				summaryCidr++;
			}

			return [new IpAddress(`${IpAddress.bin2dec(firstBin)}/${summaryCidr}`)];
		}

		// strict mode
		// build list of ranges
		let ranges: number[][] = [];
		inputIps.forEach((ip) => {
			let rangeStart = parseInt(IpAddress.dec2bin(ip.networkAddress), 2);
			let rangeEnd = parseInt(IpAddress.dec2bin(ip.broadcastAddress), 2);
			ranges.push([rangeStart, rangeEnd]);
		});

		// sort ranges
		ranges.sort((a, b) => a[0] - b[0] || a[1] - b[1]);

		// merge contiguous/overlapping ranges
		let rangesMerged: number[][] = [];
		ranges.forEach((range) => {
			if (rangesMerged.length === 0 || rangesMerged[rangesMerged.length - 1][1] < range[0] - 1) {
				rangesMerged.push(range);
			} else {
				rangesMerged[rangesMerged.length - 1][1] = Math.max(rangesMerged[rangesMerged.length - 1][1], range[1]);
			}
		});

		// convert ranges to IpAddresses
		let outputIps: IpAddress[] = [];
		for (let i = 0; i < rangesMerged.length; i++) {
			// find largest possible network for this prefix
			let prefix = rangesMerged[i][0].toString(2).padStart(32, "0");
			let cidr = prefix.lastIndexOf("1") + 1;
			let ip = new IpAddress(`${IpAddress.bin2dec(prefix)}/${cidr}`);

			// increment CIDR until the network fits in the range
			while (parseInt(IpAddress.dec2bin(ip.broadcastAddress), 2) > rangesMerged[i][1]) {
				ip.cidr++;
			}

			// if we undershot the end of the range, move the start of the range to after the end of our result and do it again
			if (parseInt(IpAddress.dec2bin(ip.broadcastAddress), 2) < rangesMerged[i][1]) {
				rangesMerged[i][0] = parseInt(IpAddress.dec2bin(ip.broadcastAddress), 2) + 1;
				i--;
			}

			outputIps.push(ip);
		}

		return outputIps;
	}
</script>

<NavBar />
<div class="main flex column">
	<h1>IP Calculator</h1>
	<div class="toggle">
		<button class={"toggle" + (mode === "sub" ? " active" : "")} onclick={() => (mode = "sub")}>Subnet Mode</button>
		<button class={"toggle" + (mode === "super" ? " active" : "")} onclick={() => (mode = "super")}>Supernet Mode</button>
	</div>
	{#if mode === "sub"}
		<div class="flex column">
			<label for="inputAddress">IP address with CIDR or mask:</label>
			<input id="inputAddress" class={invalidInput ? "warning" : ""} type="text" maxlength="100" bind:value={inputAddress} />
		</div>
		<div class="flex">
			<button class="wide" onclick={nextSubnet}>Next Subnet</button>
			<button class="skinny" onclick={incrementCidr}>CIDR +</button>
		</div>
		<div class="flex">
			<button class="wide" onclick={previousSubnet}>Previous Subnet</button>
			<button class="skinny" onclick={decrementCidr}>CIDR -</button>
		</div>
	{:else}
		<div class="flex column">
			<label for="inputAddresses">IP addresses with CIDR or mask:</label>
			<textarea id="inputAddresses" class={invalidInput ? "warning" : ""} rows="5" bind:value={inputAddresses}></textarea>
			<div class="flex">
				<label for="checkboxStrict" title={strictExplanation}>Strict?</label>
				<input id="checkboxStrict" type="checkbox" bind:checked={strict} />
			</div>
			<div class="output">Summary prefix(es):</div>
			<div class="output summary">{summaryPrefixes}</div>
		</div>
	{/if}
	<table>
		<tbody>
			{#if mode === "sub"}
				<tr>
					<td>IP Address:</td>
					<td>{address}</td>
				</tr>
			{/if}
			<tr>
				<td>Network Prefix:</td>
				{#each networkPrefixes as networkPrefix}
					<td>{networkPrefix}</td>
				{/each}
			</tr>
			<tr>
				<td>Broadcast Address:</td>
				{#each broadcastAddresses as broadcastAddress}
					<td>{broadcastAddress}</td>
				{/each}
			</tr>
			<tr>
				<td>Total Addresses:</td>
				{#each totalAddresses as totalAddress}
					<td>{totalAddress}</td>
				{/each}
			</tr>
			<tr>
				<td>Subnet Mask:</td>
				{#each subnetMasks as subnetMask}
					<td>{subnetMask}</td>
				{/each}
			</tr>
			<tr>
				<td>Wildcard Mask:</td>
				{#each wildcardMasks as wildcardMask}
					<td>{wildcardMask}</td>
				{/each}
			</tr>
			<tr>
				<td>Subnet Type:</td>
				{#each addressSpaceTypes as addressSpaceType}
					<td>{addressSpaceType}</td>
				{/each}
			</tr>
		</tbody>
	</table>
</div>

<style>
	.main {
		align-items: center;
		font-family: "Courier New", Courier, monospace;
		margin: 10px;
	}
	h1 {
		font-size: 150%;
		margin: 20px 20px 0px;
	}
	div.toggle {
		display: flex;
		margin: 20px;
	}
	button.toggle {
		margin: 0px;
		width: 200px;
	}
	button {
		background-color: black;
		border: 1px solid lime;
		color: lime;
		font-family: "Courier New", Courier, monospace;
		font-size: 100%;
		margin: 5px;
		padding: 10px;
	}
	.active,
	button:active,
	button:hover {
		background-color: lime;
		color: black;
	}
	label {
		margin: 10px;
	}
	#inputAddress,
	textarea {
		background-color: black;
		border: 1px solid white;
		color: lime;
		font-family: "Courier New", Courier, monospace;
		font-size: 100%;
		margin: 0px 0px 20px 0px;
		padding: 10px;
		width: 400px;
	}
	textarea {
		white-space: pre-line;
	}
	#checkboxStrict {
		accent-color: lime;
		margin: 10px;
	}
	.warning {
		border: 1px solid red;
		color: red;
	}
	.wide {
		width: 180px;
	}
	.skinny {
		width: 100px;
	}
	.output {
		margin: 10px;
	}
	.summary {
		color: lime;
		margin-left: 20px;
		white-space: pre-line;
	}
	table {
		border-collapse: collapse;
		margin: 20px;
	}
	td,
	tr {
		border: 1px solid gray;
		padding: 18px 20px;
		white-space: pre-line;
	}
	@media (prefers-color-scheme: light) {
		.main {
			background-color: black;
			color: white;
		}
	}
</style>
