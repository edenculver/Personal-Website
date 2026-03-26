require("dotenv").config();
const cors = require("cors");
const express = require("express");
const fs = require("fs");
const https = require("https");
const { Client } = require("pg");

// env vars
const db_host = process.env.DB_HOST || "localhost";
const db_name = process.env.DB_NAME || "edenculverdb";
const db_username = process.env.DB_USERNAME;
const db_password = process.env.DB_PASSWORD;
const cert_path = process.env.CERT_PATH || "ssl/edenculver_net.crt";
const key_path = process.env.KEY_PATH || "ssl/culverpi.key";
const port = process.env.PORT || 3000;

startAPI();

async function startAPI() {
	// connect to DB
	const db = await connectToDB();

	// initialize app
	const app = express();
	app.use(express.json());
	app.set("trust proxy", true);
	
	// CORS
	const cors_options = {
		allowed_headers: ["Content-Type"]
	}
	app.use(cors(cors_options));

	// initialize server
	const options = {
		cert: fs.readFileSync(cert_path, "utf8"),
		key: fs.readFileSync(key_path, "utf8")
	};
	const server = https.createServer(options, app);
	server.listen(port, () => {
		log(`App listening on https://localhost:${port}`);
	});

	// status endpoint
	app.get("/api", (req, res) => {
		const status = {
			"status": "Running",
			"endpoints": {
				"GET": [
					"https://edenculver.net/api/battle_packs",
					"https://edenculver.net/api/leitmotifs/songs",
					"https://edenculver.net/api/leitmotifs/leitmotifs",
					"https://edenculver.net/api/leitmotifs/leitmotifs_in_songs"
				],
				"POST": [
					"https://edenculver.net/api/ping"
				]
			}
		};
		res.send(status);
	});

	// ping endpoint
	app.post("/api/ping", (req, res) => {
		const visiting_page = req.body && "page" in req.body ? req.body["page"] : "Unknown";
		const client_ip = req.ip;
		const user_agent = req.get("User-Agent");
		const languages = req.acceptsLanguages();
		
		log(`${visiting_page} visited by ${client_ip}, user-agent: "${user_agent}", languages: "${languages}"`);

		res.send("pong");
	});

	// battle packs endpoint
	app.get("/api/battle_packs", async (req, res) => {
		const query = `
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
		const result = await db.query(query);
		res.json(result.rows);
	});

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
}

async function connectToDB() {
	while (true) {
		const db = new Client({
			user: db_username,
			password: db_password,
			host: db_host,
			database: db_name
		});

		try {
			await new Promise((resolve, reject) => {
				db.connect(err => {
					if (err) reject(err);
					else resolve();
				});
			});

			log("Connected to database.");
			return db;
		} catch (err) {
			log(`Failed to connect to database. Error message:\n${err.message}`);
			log("Waiting 5 seconds before retrying...");
			await sleep(5000);
		}
	}
}

function log(msg) {
	console.log(`[${new Date().toISOString()}] ${msg}`);
}

function sleep(ms) {
	return new Promise(resolve => setTimeout(resolve, ms));
}
