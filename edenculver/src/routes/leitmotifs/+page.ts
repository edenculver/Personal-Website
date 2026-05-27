import type { PageLoad } from "./$types";

export const load: PageLoad = async ({ data }) => {
	return {
		title: "Battle Packs Catalog",
		description: "A complete catalog of every LEGO Star Wars Battle Pack.",
		leitmotifs: data.leitmotifs,
		songs: data.songs,
		links: data.links,
	};
};
