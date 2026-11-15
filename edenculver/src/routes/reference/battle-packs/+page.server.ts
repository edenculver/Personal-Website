import type { PageServerLoad } from "./$types";
import db from "$lib/db";

const battlePacksQuery = `
	select
		b.set_number,
		b.set_name,
		b.release_year,
		b.piece_count,
		b.msrp,
		json_build_object(
			'title', s.title,
			'short_title', s.short_title
		) as source,
		(
			select json_agg(
				json_build_object(
					'bricklink_id', m.bricklink_id,
					'name', m.name,
					'specification', m.specification,
					'count', m_b.count,
					'is_unique', m.is_unique
				)
			)
			from minifig_in_battle_pack m_b
			join minifig m on m_b.minifig = m.id
			where b.id = m_b.battle_pack
		) as minifigs
	from battle_pack b
	join source s on b.source = s.id
	order by release_year, set_number;
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
