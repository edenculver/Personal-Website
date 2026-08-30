<script lang="ts">
	import { browser } from "$app/environment";
	import IpAddress from "$lib/IpAddress";
	import StandardPageLayout from "$lib/components/StandardPageLayout.svelte";

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
	let addressRanges: string[] = $state([]);
	let broadcastAddresses: string[] = $state([]);
	let totalAddresses: string[] = $state([]);
	let subnetMasks: string[] = $state([]);
	let wildcardMasks: string[] = $state([]);
	let addressSpaceTypes: string[] = $state([]);

	let tableRows = $derived([
		{
			label: "Network Prefix",
			cols: networkPrefixes,
		},
		{
			label: "Host Address Range",
			cols: addressRanges,
		},
		{
			label: "Broadcast Address",
			cols: broadcastAddresses,
		},
		{
			label: "Total Addresses",
			cols: totalAddresses,
		},
		{
			label: "Subnet Mask",
			cols: subnetMasks,
		},
		{
			label: "Wildcard Mask",
			cols: wildcardMasks,
		},
		{
			label: "Subnet Type",
			cols: addressSpaceTypes,
		},
	]);

	// save states to sessionStorage (client-side only)
	$effect(() => {
		if (browser) {
			window.sessionStorage.setItem("mode", mode);
			window.sessionStorage.setItem("strict", strict.toString());
		}
	});

	$effect(() => {
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
			broadcastAddresses = ips.map((ip) => ip.broadcastAddress);
			addressRanges = ips.map((ip) => `${ip.firstHost} - ${ip.lastHost}`);
			totalAddresses = ips.map(
				(ip) => ip.totalAddresses + (ip.usableHosts ? ` (${ip.usableHosts} usable hosts)` : ""),
			);
			subnetMasks = ips.map((ip) => ip.subnetMask);
			wildcardMasks = ips.map((ip) => ip.wildcardMask);
			addressSpaceTypes = ips.map((ip) => ip.addressSpaceType.toString().replaceAll(",", "\n"));
		} catch (error) {
			invalidInput = true;
		}
	});

	function nextSubnet() {
		let newNetworkInt = ip.networkInt + (1 << (32 - ip.prefixLength));
		inputAddress = `${IpAddress.int2addr(newNetworkInt | ip.hostInt)}/${ip.prefixLength}`;
	}

	function previousSubnet() {
		let newNetworkInt = ip.networkInt - (1 << (32 - ip.prefixLength));
		inputAddress = `${IpAddress.int2addr(newNetworkInt | ip.hostInt)}/${ip.prefixLength}`;
	}

	function incrementCidr() {
		if (ip.prefixLength < 32) {
			ip.prefixLength++;
			inputAddress = `${ip.address}/${ip.prefixLength}`;
		}
	}

	function decrementCidr() {
		if (ip.prefixLength > 0) {
			ip.prefixLength--;
			inputAddress = `${ip.address}/${ip.prefixLength}`;
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
			let firstInt = 2 ** 255;
			let lastInt = 0;
			inputIps.forEach((ip) => {
				if (ip.networkInt < firstInt) {
					firstInt = ip.networkInt;
				}
				if (ip.lastAddressInt > lastInt) {
					lastInt = ip.lastAddressInt;
				}
			});

			// bitwise diff, where 1 means the bits differ in that position
			let diff = firstInt ^ lastInt;

			// fill all bits after the first 1 with 1s
			diff |= diff >> 1;
			diff |= diff >> 2;
			diff |= diff >> 4;
			diff |= diff >> 8;
			diff |= diff >> 16;

			// invert to create subnet mask
			let subnetMask = ~diff;

			return [new IpAddress(`${IpAddress.int2addr(firstInt)} ${IpAddress.int2addr(subnetMask)}`)];
		}

		// strict mode

		// buid list of ranges
		let ranges = inputIps.map((ip) => [ip.networkInt, ip.lastAddressInt]);
		ranges.sort((a, b) => a[0] - b[0] || a[1] - b[1]);

		// merge contiguous/overlapping ranges
		let rangesMerged: number[][] = [];
		ranges.forEach((range) => {
			if (rangesMerged.length === 0 || rangesMerged[rangesMerged.length - 1][1] + 1 < range[0]) {
				// if this is the first range,
				// or if the start of this range is more than 1 higher than the end of the last range
				// (meaning they are not contiguous or overlapping),
				// add the new range
				rangesMerged.push(range);
			} else {
				// if the ranges are contiguous or overlapping,
				// set the end of the last range to the end of this range
				rangesMerged[rangesMerged.length - 1][1] = range[1];
			}
		});

		// convert ranges to IpAddresses
		let outputIps: IpAddress[] = [];
		for (let i = 0; i < rangesMerged.length; i++) {
			let first = rangesMerged[i][0];
			let last = rangesMerged[i][1];

			// find shortest possible prefix for this address
			let prefixLength = first ? Math.clz32(first & -first) + 1 : 0;
			let ip = new IpAddress(`${IpAddress.int2addr(first)}/${prefixLength}`);

			// increase prefix length until network fits in the range
			while (ip.lastAddressInt > last) {
				ip.prefixLength++;
			}

			// if we undershot the end of the range,
			// move the start of the range to after the end of our result and do it again
			if (ip.lastAddressInt < last) {
				rangesMerged[i][0] = ip.lastAddressInt + 1;
				i--;
			}

			outputIps.push(ip);
		}

		return outputIps;
	}
</script>

<StandardPageLayout extraClasses="font-mono lg:items-start">
	<h1 class="mx-auto lg:mx-0 text-xl lg:text-2xl text-center font-bold">IP Calculator</h1>

	<div class="mx-auto lg:mx-0 grid grid-cols-2">
		<button
			class="bg-black border border-terminalgreen px-4 py-2 hover:bg-terminalgreen hover:text-black {mode ===
			'sub'
				? 'bg-terminalgreen text-black'
				: 'text-terminalgreen'}"
			onclick={() => (mode = "sub")}
		>
			Subnet Mode
		</button>
		<button
			class="bg-black border border-terminalgreen px-4 py-2 hover:bg-terminalgreen hover:text-black {mode ===
			'super'
				? 'bg-terminalgreen text-black'
				: 'text-terminalgreen'}"
			onclick={() => (mode = "super")}
		>
			Supernet Mode
		</button>
	</div>

	{#if mode === "sub"}
		<label class="flex flex-col gap-1">
			<p>IP address with CIDR or mask:</p>
			<input
				class="border w-full lg:w-100 p-3 {invalidInput
					? 'border-terminalred text-terminalred'
					: 'border-white text-terminalgreen'}"
				type="text"
				maxlength="100"
				bind:value={inputAddress}
			/>
		</label>

		<div class="grid grid-cols-[auto_auto] gap-4">
			<button
				class="bg-black border border-terminalgreen px-4 py-2 hover:bg-terminalgreen text-terminalgreen hover:text-black"
				onclick={nextSubnet}
			>
				Next Subnet
			</button>
			<button
				class="bg-black border border-terminalgreen px-4 py-2 hover:bg-terminalgreen text-terminalgreen hover:text-black"
				onclick={incrementCidr}
			>
				CIDR +
			</button>
			<button
				class="bg-black border border-terminalgreen px-4 py-2 hover:bg-terminalgreen text-terminalgreen hover:text-black"
				onclick={previousSubnet}
			>
				Previous Subnet
			</button>
			<button
				class="bg-black border border-terminalgreen px-4 py-2 hover:bg-terminalgreen text-terminalgreen hover:text-black"
				onclick={decrementCidr}
			>
				CIDR -
			</button>
		</div>
	{:else}
		<div class="flex flex-col gap-4">
			<label class="flex flex-col gap-1">
				<p>IP addresses with CIDR or mask:</p>
				<textarea
					id="inputAddresses"
					class="border w-full lg:w-100 p-3 {invalidInput
						? 'border-terminalred text-terminalred'
						: 'border-white + text-terminalgreen'}"
					rows="4"
					bind:value={inputAddresses}
				></textarea>
			</label>
			<label class="flex gap-3 mt-3" title={strictExplanation}>
				Strict?
				<input class="accent-terminalgreen" type="checkbox" bind:checked={strict} />
			</label>
			<div>Summary prefix{strict ? "(es)" : ""}:</div>
			<div class="text-terminalgreen ml-3 whitespace-pre-line">{summaryPrefixes}</div>
		</div>
	{/if}

	<div class="overflow-x-auto">
		<table>
			<tbody>
				{#if mode === "sub"}
					<tr>
						<td class="border border-gray-500 px-4 py-3 font-bold">IP Address</td>
						<td class="border border-gray-500 px-4 py-3">{address}</td>
					</tr>
				{/if}
				{#each tableRows as row}
					<tr>
						<td class="border border-gray-500 px-4 py-3 font-bold">{row.label}</td>
						{#each row.cols as col}
							<td class="border border-gray-500 px-4 py-3 whitespace-pre-line">{col}</td>
						{/each}
					</tr>
				{/each}
			</tbody>
		</table>
	</div>
</StandardPageLayout>
