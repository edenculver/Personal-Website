import type { PageServerLoad } from "./$types";
import db from "$lib/db";

const battlePacksQuery = `
	SELECT
		b.set_number,
		b.set_name,
		b.release_year,
		b.piece_count,
		b.msrp,
		json_build_object(
			'title', s.title,
			'short_title', s.short_title
		) AS source,
		(
			SELECT json_agg(
				json_build_object(
					'bricklink_id', m.bricklink_id,
					'name', m.name,
					'count', m_b.count,
					'is_unique', m.is_unique
				)
				ORDER BY name, bricklink_id
			)
			FROM minifig_in_battle_pack m_b
			JOIN minifig m
				ON m_b.minifig = m.id
			WHERE b.id = m_b.battle_pack
		) AS minifigs
	FROM battle_pack b
	JOIN source s
		ON b.source = s.id
	ORDER BY release_year, set_number;
`;

export const load: PageServerLoad = async () => {
	const battlePacks = await query(battlePacksQuery);

	return { battlePacks: battlePacks };
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
