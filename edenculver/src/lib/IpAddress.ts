/**
 * IPv4 address
 */
export default class IpAddress {
	_address = 0;
	_subnetMask = 0;

	/**
	 * @param address
	 * Dotted decimal IPv4 address.
	 * Optionally followed by a CIDR (separated by /) or subnet or wildcard mask (separated by space).
	 */
	constructor(address: string) {
		this.address = address;
	}

	/** IPv4 address. */
	get address() {
		return IpAddress.int2addr(this._address);
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
			let newCidrString = regex.groups.cidr;
			let newMaskString = regex.groups.mask;

			// validate IP address
			newAddress.split(".").forEach((octet) => {
				let octetInt = parseInt(octet);
				if (octetInt < 0 || octetInt > 255) {
					throw new Error();
				}
			});
			this._address = IpAddress.addr2int(newAddress);

			// validate CIDR
			let newCidrInt = 0;
			if (newCidrString && newMaskString) {
				throw new Error();
			}
			else if (!newCidrString && !newMaskString) {
				newCidrInt = 32;
			}
			else if (newCidrString) {
				newCidrInt = parseInt(newCidrString.substring(1));
			}
			if (newCidrInt) {
				this.prefixLength = newCidrInt;
			}

			// validate mask
			if (newMaskString) {
				let newMaskInt = IpAddress.addr2int(newMaskString);
				let invertedMaskInt = ~newMaskInt >>> 0;

				// check if valid subnet mask
				if ((invertedMaskInt & (invertedMaskInt + 1)) === 0) {
					this._subnetMask = newMaskInt;
				}
				// check if valid wildcard mask
				else if ((newMaskInt & (newMaskInt + 1)) === 0) {
					this._subnetMask = invertedMaskInt;
				}
				else {
					throw new Error();
				}
			}
		} catch (error) {
			throw new Error("Error while parsing IP address.");
		}
	}

	/** Prefix length. */
	get prefixLength() {
		return Math.clz32(~this._subnetMask);
	}

	/**
	 * Prefix length.
	 * @param newPrefixLength 0-32.
	 */
	set prefixLength(newPrefixLength: number) {
		if (newPrefixLength < 0 || newPrefixLength > 32) {
			throw new Error("Invalid CIDR.");
		}
		this._subnetMask = newPrefixLength === 0 ? 0 : -1 << (32 - newPrefixLength);
	}

	/** Subnet mask. Ex: 255.255.255.0 */
	get subnetMask() {
		return IpAddress.int2addr(this._subnetMask);
	}

	/** Wildcard mask as integer. */
	get wildcardMaskInt() {
		return ~this._subnetMask >>> 0;
	}

	/* Wildcard mask. Ex: 0.0.0.255 */
	get wildcardMask() {
		return IpAddress.int2addr(this.wildcardMaskInt);
	}

	/** Network address as integer. */
	get networkInt() {
		return (this._address & this._subnetMask) >>> 0;
	}

	/** Network address. */
	get networkAddress() {
		return IpAddress.int2addr(this.networkInt);
	}

	/** Network prefix. */
	get networkPrefix() {
		return `${this.networkAddress}/${this.prefixLength}`;
	}

	/** Host bits as integer. */
	get hostInt() {
		return (this._address & this.wildcardMaskInt) >>> 0;
	}

	/** Last address of the network as integer. */
	get lastAddressInt() {
		return (this._address | this.wildcardMaskInt) >>> 0;
	}

	/**
	 * Broadcast address. Returns empty string if prefix length is 31 or 32.
	 */
	get broadcastAddress() {
		if (this.prefixLength > 30) {
			return "";
		}
		return IpAddress.int2addr(this._address | this.wildcardMaskInt);
	}

	get totalAddresses() {
		return 2 ** (32 - this.prefixLength);
	}

	get usableHosts() {
		if (this.prefixLength > 30) {
			return 0;
		}
		return 2 ** (32 - this.prefixLength) - 2;
	}

	/** First usable host in the network. */
	get firstHost() {
		if (this.prefixLength > 30) {
			return this.address;
		}
		return IpAddress.int2addr(this.networkInt + 1);
	}

	/** Last usable host in the network. */
	get lastHost() {
		if (this.prefixLength === 32) {
			return this.address;
		}
		if (this.prefixLength === 31) {
			return IpAddress.int2addr(this.networkInt + 1);
		}
		return IpAddress.int2addr((this._address | IpAddress.addr2int(this.wildcardMask)) - 1);
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
			{ start: "240.0.0.0", end: "255.255.255.255", type: "Reserved (240.0.0.0/4)" },
		];

		// check input against each range
		let thisStart = this.networkInt;
		let thisEnd = this.lastAddressInt;
		let types: string[] = [];
		ranges.forEach((range) => {
			let rangeStart = IpAddress.addr2int(range.start);
			let rangeEnd = IpAddress.addr2int(range.end);

			if (!types.includes(range.type) && thisStart <= rangeEnd && thisEnd >= rangeStart) {
				types.push(range.type);
			}
		});

		return types;
	}

	/**
	 * Convert a dotted decimal IP address to an integer.
	 * @param addr Dotted decimal IP address. Ex: "192.168.1.1"
	 * @returns Integer value of the IP address. Ex: 3232235777
	 */
	static addr2int(addr: string) {
		const octets = addr.split(".").map(octet => parseInt(octet));
		// concatenate octets and convert to unsigned integer
		return ((octets[0] << 24) | (octets[1] << 16) | (octets[2] << 8) | octets[3]) >>> 0;
	}

	/**
	 * Convert an integer to a dotted decimal IP address.
	 * @param int Integer. Ex: 3232235777
	 * @returns Dotted decimal IP address. Ex: "192.168.1.1"
	 */
	static int2addr(int: number) {
		// split octets
		const octets = [
			(int >>> 24) & 255,
			(int >>> 16) & 255,
			(int >>> 8) & 255,
			int & 255,
		];
		return octets.join(".");
	}
}
