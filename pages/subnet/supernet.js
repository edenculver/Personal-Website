import IpAddress from "./IpAddress.js";

var ips;

window.addEventListener("DOMContentLoaded", () => {
	ips = [new IpAddress("192.168.0.0/22")];
	update();

	// input
	inputAddresses.addEventListener("input", () => {
		update();
	});
	checkboxStrict.addEventListener("input", () => {
		update();
	});
});

function update() {
	try {
		warning.setAttribute("hidden", true);
		ips = parseAddresses();
	} catch (e) {
		if (e.message !== "Error while parsing IP address.") throw e;
		warning.removeAttribute("hidden");
		return;
	}

	// clear output
	outputAddresses.textContent = "";
	Array.from(document.getElementsByTagName("tr")).forEach((tr) => {
		while (tr.childElementCount > 1) {
			tr.removeChild(tr.lastChild);
		}
	});

	// output
	ips.forEach((ip) => {
		outputAddresses.innerHTML += `${ip.networkAddress}/${ip.cidr}<br>`;

		trNetworkAddress.innerHTML += `<td>${ip.networkAddress}/${ip.cidr}</td>`;
		trUsableRange.innerHTML += ip.cidr === 32 ? `<td>${ip.address}</td>` : `<td>${ip.firstUsableHost} - ${ip.lastUsableHost}</td>`;
		trBroadcastAddress.innerHTML += ip.cidr <= 30 ? `<td>${ip.broadcastAddress}</td>` : "<td></td>";
		trTotalAddresses.innerHTML += `<td>${ip.totalAddresses}` + (ip.usableHosts ? ` (${ip.usableHosts} usable)</td>` : "</td>");
		trSubnetMask.innerHTML += `<td>${ip.subnetMask}</td>`;
		trWildcardMask.innerHTML += `<td>${ip.wildcardMask}</td>`;
		trSubnetType.innerHTML += `<td>${ip.subnetType.toString().replaceAll(",", "<br>")}</td>`;
	});
}

function parseAddresses() {
	// build list of IpAddresses
	let inputIps = [];
	inputAddresses.value.trim().split("\n").forEach((addressString) => {
		inputIps.push(new IpAddress(addressString));
	});

	// loose mode
	if (!checkboxStrict.checked) {
		// find first and last addresses
		let first = parseInt(IpAddress.dec2bin("255.255.255.255"), 2);
		let last = 0;
		inputIps.forEach((ip) => {
			let networkAddressInt = parseInt(IpAddress.dec2bin(ip.networkAddress), 2);
			let broadcastAddressInt = parseInt(IpAddress.dec2bin(ip.broadcastAddress), 2);
			if (networkAddressInt < first) first = networkAddressInt;
			if (broadcastAddressInt > last) last = broadcastAddressInt;
		});

		// find common prefix
		first = first.toString(2).padStart(32, "0");
		last = last.toString(2).padStart(32, "0");
		let summaryCidr = 0;
		while (summaryCidr < 32) {
			if (first.charAt(summaryCidr) !== last.charAt(summaryCidr)) break;
			summaryCidr++;
		}

		return [new IpAddress(`${IpAddress.bin2dec(first)}/${summaryCidr}`)];
	}

	// strict mode
	else {
		// build list of ranges
		let ranges = [];
		inputIps.forEach((ip) => {
			let rangeStart = parseInt(IpAddress.dec2bin(ip.networkAddress), 2);
			let rangeEnd = parseInt(IpAddress.dec2bin(ip.broadcastAddress), 2);
			ranges.push([rangeStart, rangeEnd]);
		});

		// sort ranges
		ranges.sort((a, b) => (a[0] - b[0]) || (a[1] - b[1]));

		// merge contiguous/overlapping ranges
		let rangesMerged = [];
		ranges.forEach((range) => {
			if (rangesMerged.length === 0 || rangesMerged[rangesMerged.length - 1][1] < range[0] - 1) {
				rangesMerged.push(range);
			} else {
				rangesMerged[rangesMerged.length - 1][1] = Math.max(rangesMerged[rangesMerged.length - 1][1], range[1]);
			}
		});

		// convert ranges to IpAddresses
		let outputIps = [];
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
}
