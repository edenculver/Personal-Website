import type { PageServerLoad } from "./$types";
import db from "$lib/db";

const leitmotifQuery = `
	SELECT
		l.id,
		l.name,
		l.subthemes,
		array_agg(sl.name ORDER BY sl.sort_order, sl.name)
			FILTER (WHERE sl.id IS NOT NULL)
			AS subleitmotifs,
		l.description
	FROM leitmotif l
	LEFT JOIN subleitmotif sl
		ON sl.leitmotif = l.id
	GROUP BY l.id
	ORDER BY l.name;
`;
const songQuery = `
	SELECT
		s.id,
		g.number AS game_number,
		g.title AS game_title,
		s.track_number,
		s.title
	FROM song s
	JOIN game g
		ON s.game = g.id
	ORDER BY g.number, s.track_number;
`;
const linkQuery = `
	SELECT
		l_s.leitmotif,
		l.name,
		array_agg(sl.name ORDER BY sl.sort_order, sl.name)
			FILTER (WHERE sl.id IS NOT NULL)
			AS subleitmotifs,
		l_s.song,
		g.number as game_number,
		s.track_number,
		s.title
	FROM leitmotif_in_song l_s
	LEFT JOIN subleitmotif_in_song sl_s
		ON sl_s.song = l_s.song
	LEFT JOIN subleitmotif sl
		ON sl_s.subleitmotif = sl.id AND sl.leitmotif = l_s.leitmotif
	JOIN leitmotif l
		ON l_s.leitmotif = l.id
	JOIN song s
		ON l_s.song = s.id
	JOIN game g
		ON s.game = g.id
	GROUP BY
		l_s.leitmotif,
		l.name,
		l_s.song,
		g.number,
		s.track_number,
		s.title
	ORDER BY l.name, g.number, s.track_number;
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
