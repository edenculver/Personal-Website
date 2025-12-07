import IpAddress from "./IpAddress.js";

var ip;

window.addEventListener("DOMContentLoaded", () => {
	ip = new IpAddress("192.168.0.1/24");
	update();

	// inputs
	inputAddress.addEventListener("input", () => {
		update();
	});
	buttonCidrIncr.addEventListener("click", () => {
		incrementCidr();
	});
	buttonCidrDecr.addEventListener("click", () => {
		decrementCidr();
	});
	buttonNext.addEventListener("click", () => {
		nextSubnet();
	});
	buttonPrevious.addEventListener("click", () => {
		previousSubnet();
	});
});

function update() {
	try {
		warning.setAttribute("hidden", true);
		ip.address = inputAddress.value;
	} catch (e) {
		if (e.message !== "Error while parsing IP address.") throw e;
		warning.removeAttribute("hidden");
		return;
	}

	// output
	tdIpAddress.textContent = ip.address;
	tdNetworkAddress.textContent = `${ip.networkAddress}/${ip.cidr}`;
	tdUsableRange.textContent = ip.cidr === 32 ? ip.address : `${ip.firstUsableHost} - ${ip.lastUsableHost}`;
	tdBroadcastAddress.textContent = ip.cidr <= 30 ? ip.broadcastAddress : "";
	tdTotalAddresses.textContent = ip.totalAddresses;
	if (ip.usableHosts) tdTotalAddresses.textContent += ` (${ip.usableHosts} usable)`;
	tdSubnetMask.textContent = ip.subnetMask;
	tdWildcardMask.textContent = ip.wildcardMask;
	tdSubnetType.innerHTML = ip.subnetType.toString().replaceAll(",", "<br>");
}

function incrementCidr() {
	if (ip.cidr === 32) return;
	ip.cidr = ip.cidr + 1;
	inputAddress.value = `${ip.address}/${ip.cidr}`;
	update();
}

function decrementCidr() {
	if (ip.cidr === 0) return;
	ip.cidr = ip.cidr - 1;
	inputAddress.value = `${ip.address}/${ip.cidr}`;
	update();
}

function nextSubnet() {
	let networkBits = IpAddress.dec2bin(ip.address).substring(0, ip.cidr);
	if (!networkBits.includes("0")) return; // already highest
	networkBits = (parseInt(networkBits, 2) + 1).toString(2).padStart(ip.cidr, "0"); // increment network bits
	inputAddress.value = `${IpAddress.bin2dec(networkBits + IpAddress.dec2bin(ip.address).substring(ip.cidr))}/${ip.cidr}`;
	update();
}

function previousSubnet() {
	let networkBits = IpAddress.dec2bin(ip.address).substring(0, ip.cidr);
	if (!networkBits.includes("1")) return; // already lowest
	networkBits = (parseInt(networkBits, 2) - 1).toString(2).padStart(ip.cidr, "0"); // decrement network bits
	inputAddress.value = `${IpAddress.bin2dec(networkBits + IpAddress.dec2bin(ip.address).substring(ip.cidr))}/${ip.cidr}`;
	update();
}
