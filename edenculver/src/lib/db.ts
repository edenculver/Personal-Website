import { Pool } from "pg";
import { DB_USERNAME } from "$env/static/private";
import { DB_PASSWORD } from "$env/static/private";
import { env } from "$env/dynamic/private";


const db = new Pool({
	user: DB_USERNAME,
	password: DB_PASSWORD,
	host: env.DB_HOST || "localhost",
	port: Number(env.DB_PORT) || 5432,
	database: env.DB_NAME || "edenculverdb",
});

export default db;
