import type { PageLoad } from "./$types";

export const load: PageLoad = async ({ data }) => {
	return {
		title: "Battle Packs Catalog",
		battlePacks: data.battlePacks,
	};
};
