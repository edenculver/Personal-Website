/**
 * IPv4 address
 */
export default class IpAddress {
	_address = "0.0.0.0";
	_cidr = 0;

	/**
	 * @param address
	 * Dotted decimal IPv4 address.
	 * Optionally followed by a CIDR (separated by /) or subnet or wildcard mask (separated by space).
	 */
	constructor(address: string) {
		this.address = address;
	}

	get address() {
		return this._address;
	}

	/**
	 * @param input
	 * Dotted decimal IPv4 address.
	 * Optionally followed by a CIDR (separated by /) or subnet or wildcard mask (separated by space).
	 */
	set address(input: string) {
		try {
			let regex = input.trim().match(/^(?<address>\d{1,3}(\.\d{1,3}){3})(?<cidr>\/\d{1,2})?(?<mask> \d{1,3}(\.\d{1,3}){3})?$/);
			if (regex === null || regex.groups === undefined) {
				throw new Error();
			}
			let newAddress = regex.groups.address;
			let newCidrStr = regex.groups.cidr;
			let newMask = regex.groups.mask;

			// validate IP address
			newAddress.split(".").forEach((octet) => {
				let octetInt = parseInt(octet);
				if (octetInt < 0 || octetInt > 255) {
					throw new Error();
				}
			});

			// validate CIDR
			let newCidr = 0;
			if (newCidrStr && newMask) {
				throw new Error();
			}
			else if (!newCidrStr && !newMask) {
				newCidr = 32;
			}
			else if (newCidrStr) {
				newCidr = parseInt(newCidrStr.substring(1));
			}

			// validate mask
			if (newMask) {
				let binaryMask = IpAddress.dec2bin(newMask);

				// convert wildcard mask to subnet mask
				if (binaryMask.startsWith("0")) {
					let oldMask = binaryMask.split("");
					binaryMask = "";
					oldMask.forEach((digit) => {
						if (digit === "0") binaryMask += "1";
						else binaryMask += "0";
					});
				}

				// convert subnet mask to CIDR
				let countOf1 = 0;
				while (countOf1 < 32) {
					if (binaryMask.charAt(countOf1) !== "1") break;
					countOf1++;
				}

				let countOf0 = 31;
				while (countOf0 > -1) {
					if (binaryMask.charAt(countOf0) !== "0") break;
					countOf0--;
				}
				countOf0 = 31 - countOf0;

				if (countOf1 + countOf0 !== 32) throw new Error();
				newCidr = countOf1;
			}

			this._address = newAddress;
			this._cidr = newCidr;
		} catch (error) {
			throw new Error("Error while parsing IP address.");
		}
	}

	get cidr() {
		return this._cidr;
	}

	/**
	 * @param newCidr 0-32.
	 */
	set cidr(newCidr: number) {
		if (newCidr < 0 || newCidr > 32) {
			throw new Error("Invalid CIDR.");
		}
		this._cidr = newCidr;
	}

	get addressBin() {
		return IpAddress.dec2bin(this.address);
	}

	get networkAddress() {
		return IpAddress.bin2dec(this.addressBin.substring(0, this.cidr) + "0".repeat(32 - this.cidr));
	}

	get networkPrefix() {
		return `${this.networkAddress}/${this.cidr}`;
	}

	get broadcastAddress() {
		return IpAddress.bin2dec(this.addressBin.substring(0, this.cidr) + "1".repeat(32 - this.cidr));
	}

	get totalAddresses() {
		return 2 ** (32 - this.cidr);
	}

	get usableHosts() {
		if (this.cidr > 30) return 0;
		return 2 ** (32 - this.cidr) - 2;
	}

	get subnetMask() {
		return IpAddress.bin2dec("1".repeat(this.cidr) + "0".repeat(32 - this.cidr));
	}

	get wildcardMask() {
		return IpAddress.bin2dec("0".repeat(this.cidr) + "1".repeat(32 - this.cidr));
	}

	get addressSpaceType() {
		const ranges = [
			{ start: "0.0.0.0", end: "0.255.255.255", type: 'RFC 1122 "this" network (0.0.0.0/8)' },
			{ start: "1.0.0.0", end: "9.255.255.255", type: "Public" },
			{ start: "10.0.0.0", end: "10.255.255.255", type: "Private (10.0.0.0/8)" },
			{ start: "11.0.0.0", end: "100.63.255.255", type: "Public" },
			{ start: "100.64.0.0", end: "100.127.255.255", type: "Carrier-Grade NAT (100.64.0.0/10)" },
			{ start: "100.128.0.0", end: "126.255.255.255", type: "Public" },
			{ start: "127.0.0.0", end: "127.255.255.255", type: "Localhost/loopback (127.0.0.0/8)" },
			{ start: "128.0.0.0", end: "169.253.255.255", type: "Public" },
			{ start: "169.254.0.0", end: "169.254.255.255", type: "Link-Local (169.254.0.0/16)" },
			{ start: "169.255.0.0", end: "172.15.255.255", type: "Public" },
			{ start: "172.16.0.0", end: "172.31.255.255", type: "Private (172.16.0.0/12)" },
			{ start: "172.32.0.0", end: "192.0.1.255", type: "Public" },
			{ start: "192.0.2.0", end: "192.0.2.255", type: "Documentation TEST-NET-1 (192.0.2.0/24)" },
			{ start: "192.0.3.0", end: "192.88.98.255", type: "Public" },
			{ start: "192.88.99.0", end: "192.88.99.255", type: "6to4 anycast (192.88.99.0/24)" },
			{ start: "192.88.100.0", end: "192.167.255.255", type: "Public" },
			{ start: "192.168.0.0", end: "192.168.255.255", type: "Private (192.168.0.0/16)" },
			{ start: "192.169.0.0", end: "198.17.255.255", type: "Public" },
			{ start: "198.18.0.0", end: "198.19.255.255", type: "Benchmarking (198.18.0.0/15)" },
			{ start: "198.20.0.0", end: "198.51.99.255", type: "Public" },
			{ start: "198.51.100.0", end: "198.51.100.255", type: "Documentation TEST-NET-2 (198.51.100.0/24)" },
			{ start: "198.51.101.0", end: "203.0.112.255", type: "Public" },
			{ start: "203.0.113.0", end: "203.0.113.255", type: "Documentation TEST-NET-3 (203.0.113.0/24)" },
			{ start: "203.0.114.0", end: "223.255.255.255", type: "Public" },
			{ start: "224.0.0.0", end: "233.251.255.255", type: "Multicast (224.0.0.0/4)" },
			{ start: "233.252.0.0", end: "233.252.0.255", type: "Documentation (233.252.0.0/24)" },
			{ start: "233.252.1.0", end: "239.255.255.255", type: "Multicast (224.0.0.0/4)" },
			{ start: "240.0.0.0", end: "255.255.255.255", type: "Reserved (240.0.0.0/4)" }
		]

		// check input against each range
		let thisStart = parseInt(IpAddress.dec2bin(this.networkAddress), 2);
		let thisEnd = parseInt(IpAddress.dec2bin(this.broadcastAddress), 2);
		let types: string[] = [];
		ranges.forEach((range) => {
			let rangeStart = parseInt(IpAddress.dec2bin(range.start), 2);
			let rangeEnd = parseInt(IpAddress.dec2bin(range.end), 2);

			if (!types.includes(range.type) && !(thisEnd < rangeStart || thisStart > rangeEnd)) {
				types.push(range.type);
			}
		});

		return types;
	}

	/**
	 * Convert a dotted decimal IP address to a binary string.
	 * @param dec Dotted decimal IP address. Ex: "192.168.1.1"
	 * @returns 32-bit binary string. Ex: "11000000101010000000000100000001"
	 */
	static dec2bin(dec: string) {
		let bin = "";
		dec.split(".").forEach((octet) => {
			bin += parseInt(octet).toString(2).padStart(8, "0");
		});
		return bin;
	}

	/**
	 * Convert a binary string to a dotted decimal IP address.
	 * @param bin 32-bit binary string. Ex: "11000000101010000000000100000001"
	 * @returns Dotted decimal IP address. Ex: "192.168.1.1"
	 */
	static bin2dec(bin: string) {
		return `${parseInt(bin.substring(0, 8), 2)}.${parseInt(bin.substring(8, 16), 2)}.${parseInt(bin.substring(16, 24), 2)}.${parseInt(bin.substring(24), 2)}`;
	}
}
