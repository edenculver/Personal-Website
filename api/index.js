// leitmotifs/songs endpoint
app.get("/api/leitmotifs/songs", async (req, res) => {
	const query = `
		select
			g.number as game_number,
			g.title as game_title,
			g.title,
			s.track_number,
			s.title,
			s.url
		from song s
		join game g on s.game = g.id
		order by g.number, s.track_number;
	`;
	const result = await db.query(query);
	res.json(result.rows);
});

// leitmotifs/leitmotifs endpoint
app.get("/api/leitmotifs/leitmotifs", async (req, res) => {
	const query = `
		select
			l.name,
			l.subthemes,
			l.description
		from leitmotif l
		order by l.name;
	`;
	const result = await db.query(query);
	res.json(result.rows);
});

// leitmotifs/leitmotifs_in_songs endpoint
app.get("/api/leitmotifs/leitmotifs_in_songs", async (req, res) => {
	const query = `
		select
			l.name,
			g.number as game_number,
			s.track_number,
			s.title
		from song s
		join game g on s.game = g.id
		join leitmotif_in_song l_s on l_s.song = s.id
		join leitmotif l on l_s.leitmotif = l.id
		order by l.name, g.number, s.track_number;
	`;
	const result = await db.query(query);
	res.json(result.rows);
});
