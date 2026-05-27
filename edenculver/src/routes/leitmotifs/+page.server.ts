import type { PageServerLoad } from "./$types";
import db from "$lib/db";

const leitmotifQuery = `
	select
		l.id,
		l.name,
		l.subthemes,
		l.description
	from leitmotif l
	order by l.name;
`;
const songQuery = `
	select
		s.id,
		g.number as game_number,
		g.title as game_title,
		s.track_number,
		s.title
	from song s
	join game g on s.game = g.id
	order by g.number, s.track_number;
`;
const linkQuery = `
	select
		l_s.leitmotif,
		l_s.song,
		l.name,
		g.number,
		s.track_number
	from leitmotif_in_song l_s
	join leitmotif l on l_s.leitmotif = l.id
	join song s on l_s.song = s.id
	join game g on s.game = g.id
	order by l.name, g.number, s.track_number;
`;

export const load: PageServerLoad = async () => {
	const leitmotifs = await query(leitmotifQuery);
	const songs = await query(songQuery);
	const links = await query(linkQuery);

	return {
		leitmotifs: leitmotifs,
		songs: songs,
		links: links,
	};
}

async function query(query: string) {
	try {
		const response = await db.query(query);
		return response.rows;
	} catch (error) {
		console.error(error);
		return [];
	}
}
