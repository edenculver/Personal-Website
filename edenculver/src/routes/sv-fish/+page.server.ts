import { redirect } from "@sveltejs/kit";

export function load() {
	redirect(308, "/reference/sv-fish");
}
