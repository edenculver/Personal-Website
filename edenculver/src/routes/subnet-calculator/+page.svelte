<script lang="ts">
	import IpAddress from "$lib/IpAddress";
	import NavBar from "$lib/components/NavBar.svelte";

	let mode: string = $state("sub");
	let invalidInput: boolean = $state(false);
	let ip = new IpAddress("192.168.0.1/24");

	let inputAddress: string = $state("192.168.0.1/24");
	// output fields
	let address = $state("");
	let networkPrefix = $state("");
	let broadcastAddress = $state("");
	let totalAddresses = $state("");
	let subnetMask = $state("");
	let wildcardMask = $state("");
	let addressSpaceType = $state("");

	$effect(() => {
		try {
			ip.address = inputAddress;
			invalidInput = false;

			// output
			address = ip.address;
			networkPrefix = ip.networkPrefix;
			broadcastAddress = ip.cidr <= 30 ? ip.broadcastAddress : "";
			totalAddresses =
				ip.totalAddresses +
				(ip.usableHosts ? ` (${ip.usableHosts} usable)` : "");
			subnetMask = ip.subnetMask;
			wildcardMask = ip.wildcardMask;
			addressSpaceType = ip.addressSpaceType
				.toString()
				.replaceAll(",", "\n");
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
		networkBits = (parseInt(networkBits, 2) + 1)
			.toString(2)
			.padStart(ip.cidr, "0");
		inputAddress = `${IpAddress.bin2dec(networkBits + IpAddress.dec2bin(ip.address).substring(ip.cidr))}/${ip.cidr}`;
	}

	function previousSubnet() {
		let networkBits = IpAddress.dec2bin(ip.address).substring(0, ip.cidr);
		if (!networkBits.includes("1")) {
			// already lowest
			return;
		}
		// decrement network bits
		networkBits = (parseInt(networkBits, 2) - 1)
			.toString(2)
			.padStart(ip.cidr, "0");
		inputAddress = `${IpAddress.bin2dec(networkBits + IpAddress.dec2bin(ip.address).substring(ip.cidr))}/${ip.cidr}`;
	}

	function incrementCidr() {
	if (ip.cidr === 32) {
		return;
	}
	ip.cidr = ip.cidr + 1;
	inputAddress = `${ip.address}/${ip.cidr}`;
}

function decrementCidr() {
	if (ip.cidr === 0) {
		return;
	}
	ip.cidr = ip.cidr - 1;
	inputAddress = `${ip.address}/${ip.cidr}`;
}
</script>

<NavBar />
<div class="main">
	<div class="toggle">
		<button
			class={"toggle" + (mode === "sub" ? " active" : "")}
			onclick={() => (mode = "sub")}>Subnet Mode</button
		>
		<button
			class={"toggle" + (mode === "super" ? " active" : "")}
			onclick={() => (mode = "super")}>Supernet Mode</button
		>
	</div>
	<div class="input">
		<label for="inputAddress">IP address with CIDR or mask:</label>
		<input
			id="inputAddress"
			class={invalidInput ? "warning" : ""}
			type="text"
			maxlength="100"
			bind:value={inputAddress}
		/>
	</div>
	<div class="buttons">
		<button class="wide" onclick={nextSubnet}>Next Subnet</button>
		<button class="skinny" onclick={incrementCidr}>CIDR +</button>
	</div>
	<div class="buttons">
		<button class="wide" onclick={previousSubnet}>Previous Subnet</button>
		<button class="skinny" onclick={decrementCidr}>CIDR -</button>
	</div>
	<table>
		<tbody>
			<tr>
				<td>IP Address:</td>
				<td>{address}</td>
			</tr>
			<tr>
				<td>Network Prefix:</td>
				<td>{networkPrefix}</td>
			</tr>
			<tr>
				<td>Broadcast Address:</td>
				<td>{broadcastAddress}</td>
			</tr>
			<tr>
				<td>Total Addresses:</td>
				<td>{totalAddresses}</td>
			</tr>
			<tr>
				<td>Subnet Mask:</td>
				<td>{subnetMask}</td>
			</tr>
			<tr>
				<td>Wildcard Mask:</td>
				<td>{wildcardMask}</td>
			</tr>
			<tr>
				<td>Subnet Type:</td>
				<td>{addressSpaceType}</td>
			</tr>
		</tbody>
	</table>
</div>

<style>
	.main {
		align-items: center;
		display: flex;
		flex-direction: column;
		margin: 10px;
		font-family: "Courier New", Courier, monospace;
	}
	div.toggle {
		display: flex;
		margin: 20px;
	}
	button.toggle {
		width: 200px;
		margin: 0px;
	}
	button {
		background-color: black;
		border: 1px solid lime;
		color: lime;
		font-family: "Courier New", Courier, monospace;
		font-size: 100%;
		margin-top: 10px;
		padding: 10px;
		margin: 5px;
	}
	.active,
	button:active,
	button:hover {
		background-color: lime;
		color: black;
	}
	.input {
		display: flex;
		flex-direction: column;
	}
	label {
		margin: 10px;
	}
	input {
		background-color: black;
		border: 1px solid white;
		color: magenta;
		font-family: "Courier New", Courier, monospace;
		font-size: 100%;
		padding: 10px;
		width: 400px;
		margin-bottom: 20px;
	}
	.warning {
		border: 1px solid red;
		color: red;
	}
	.buttons {
		display: flex;
	}
	.wide {
		width: 180px;
	}
	.skinny {
		width: 100px;
	}
	table {
		border-collapse: collapse;
		margin: 20px;
	}
	td,
	tr {
		border: 1px solid white;
		padding: 18px 20px;
		white-space: pre-line;
	}
</style>
