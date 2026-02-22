-- Battle Packs

create table source (
	id uuid primary key default gen_random_uuid(),
	title varchar(100) not null unique,
	short_title varchar(10) not null unique
);

create table battle_pack (
	id uuid primary key default gen_random_uuid(),
	source uuid not null references source(id),
	msrp decimal (10,2),
	piece_count integer,
	release_year integer not null,
	set_name varchar(100) not null,
	set_number integer not null unique
);

create table minifig (
	id uuid primary key default gen_random_uuid(),
	bricklink_id varchar(10) not null unique,
	is_unique boolean not null default true,
	name varchar(100) not null,
	specification varchar(100)
);

create table minifig_in_battle_pack (
	battle_pack uuid references battle_pack(id),
	minifig uuid references minifig(id),
	count integer not null default 1,
	primary key (battle_pack, minifig)
);

-- Leitmotifs

create table game (
	id uuid primary key default gen_random_uuid(),
	number integer not null unique,
	title varchar(100) not null unique
);

create table song (
	id uuid primary key default gen_random_uuid(),
	game uuid not null references game(id),
	title varchar(100) not null,
	track_number integer not null,
	url varchar(100)
);

create table leitmotif (
	id uuid primary key default gen_random_uuid(),
	name varchar(100) not null unique
);

create table leitmotif_in_song (
	leitmotif uuid references leitmotif(id),
	song uuid references song(id),
	primary key (leitmotif, song)
);
