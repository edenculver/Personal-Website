import type { PageLoad } from "./$types";

export const load: PageLoad = async ({ data }) => {
	return {
		title: "Undertale/Deltarune Leitmotifs",
		description: "An interactive node graph of how the Undertale and Deltarune's soundtracks are connected through leitmotifs.",
		leitmotifs: data.leitmotifs,
		songs: data.songs,
		links: data.links,
	};
};
