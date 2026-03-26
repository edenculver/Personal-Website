export default class VisitLogger {
	/**
	 * POSTs to /api/ping
	 * @param {string} page Name of page to log a visit to.
	 */
	static log(page) {
		const options = {
			method: "POST",
			headers: {
				"Content-Type": "application/json"
			},
			body: JSON.stringify({
				page: page
			})
		}

		try {
			fetch("https://edenculver.net/api/ping", options);
			return true;
		} catch (error) {
			console.log("Failed to log visit: " + error.message);
			return false;
		}
	}
}
