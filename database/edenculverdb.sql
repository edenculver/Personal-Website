--
-- PostgreSQL database dump
--

\restrict o3QsV6ETwniaqnu7tb780n6sMQXwcvMm3NaKxwZoNyaRTKNYFYosYAnXeEjPez0

-- Dumped from database version 13.23 (Raspbian 13.23-0+deb11u1)
-- Dumped by pg_dump version 13.23 (Raspbian 13.23-0+deb11u1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: battle_pack; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.battle_pack (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    source uuid NOT NULL,
    msrp numeric(10,2),
    piece_count integer,
    release_year integer NOT NULL,
    set_name character varying(100) NOT NULL,
    set_number integer NOT NULL
);


ALTER TABLE public.battle_pack OWNER TO postgres;

--
-- Name: game; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    number integer NOT NULL,
    title character varying(100) NOT NULL
);


ALTER TABLE public.game OWNER TO postgres;

--
-- Name: leitmotif; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.leitmotif (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(300)
);


ALTER TABLE public.leitmotif OWNER TO postgres;

--
-- Name: leitmotif_in_song; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.leitmotif_in_song (
    leitmotif uuid NOT NULL,
    song uuid NOT NULL
);


ALTER TABLE public.leitmotif_in_song OWNER TO postgres;

--
-- Name: minifig; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.minifig (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    bricklink_id character varying(10) NOT NULL,
    is_unique boolean DEFAULT true NOT NULL,
    name character varying(100) NOT NULL,
    specification character varying(100)
);


ALTER TABLE public.minifig OWNER TO postgres;

--
-- Name: minifig_in_battle_pack; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.minifig_in_battle_pack (
    battle_pack uuid NOT NULL,
    minifig uuid NOT NULL,
    count integer DEFAULT 1 NOT NULL
);


ALTER TABLE public.minifig_in_battle_pack OWNER TO postgres;

--
-- Name: song; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.song (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    game uuid NOT NULL,
    title character varying(100) NOT NULL,
    track_number integer NOT NULL
);


ALTER TABLE public.song OWNER TO postgres;

--
-- Name: source; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.source (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    title character varying(100) NOT NULL,
    short_title character varying(10) NOT NULL
);


ALTER TABLE public.source OWNER TO postgres;

--
-- Name: subleitmotif; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subleitmotif (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    leitmotif uuid NOT NULL,
    name character varying(100) NOT NULL,
    sort_order integer
);


ALTER TABLE public.subleitmotif OWNER TO postgres;

--
-- Name: subleitmotif_in_song; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subleitmotif_in_song (
    subleitmotif uuid NOT NULL,
    song uuid NOT NULL
);


ALTER TABLE public.subleitmotif_in_song OWNER TO postgres;

--
-- Data for Name: battle_pack; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.battle_pack (id, source, msrp, piece_count, release_year, set_name, set_number) FROM stdin;
dd3ee736-3bd6-4e6b-a013-365d6704453f	8017ffe2-04d4-4ed6-b6aa-acd7b308b50d	9.99	102	2007	Droids Battle Pack	7654
6bc6a3e5-7b1b-4a01-becd-18927d8f4b7e	8017ffe2-04d4-4ed6-b6aa-acd7b308b50d	9.99	58	2007	Clone Troopers Battle Pack	7655
6db3941a-a3da-41ae-a10f-2f7e4fb39dcf	d3956f87-96a1-4d58-bc20-424958476ae5	9.99	81	2008	Imperial Dropship	7667
889ab099-a163-4959-9697-5edeadf6df63	bb7cf9ce-7142-4c9a-affd-76182c0a9f13	9.99	82	2008	Rebel Scout Speeder	7668
c06f9620-2c6e-433e-a868-6e0ae704ea04	efc2bb2f-50ef-4c3d-9c92-1acb0dee893a	12.99	85	2011	Clone Trooper Battle Pack	7913
d3220f0f-1fe7-4784-8b97-38773c4c5f43	efc2bb2f-50ef-4c3d-9c92-1acb0dee893a	12.99	68	2011	Mandalorian Battle Pack	7914
4a93e7f1-81c3-4d62-b1a7-83b4cdc8d17d	efc2bb2f-50ef-4c3d-9c92-1acb0dee893a	11.99	72	2009	Clone Walker Battle Pack	8014
cf65b1a6-7367-4afc-a005-f434f26e98e3	efc2bb2f-50ef-4c3d-9c92-1acb0dee893a	11.99	94	2009	Assassin Droids Battle Pack	8015
94ba12dc-9e19-47da-b840-aa8316f773c5	df33b025-935f-4a1b-9658-9bf6bc8a3cab	11.99	79	2010	Rebel Trooper Battle Pack	8083
c4a6da9b-5e81-4a80-853e-4144fd811287	df33b025-935f-4a1b-9658-9bf6bc8a3cab	11.99	74	2010	Snowtrooper Battle Pack	8084
380c7c06-5e33-413e-87cf-3367a666e1e9	efc2bb2f-50ef-4c3d-9c92-1acb0dee893a	12.99	98	2012	Elite Clone Trooper & Commando Droid Battle Pack	9488
2dbdf344-eabe-4bd7-82b8-199a39229139	2f4a15df-b1e0-4f3f-bcf6-005a460a2535	12.99	77	2012	Endor Rebel Trooper & Imperial Trooper Battle Pack	9489
c3b0f6a3-adcf-403d-9a9e-640161558fdc	a7c14ee6-241c-4f62-a75a-48c962721731	12.99	124	2013	Clone Troopers vs. Droidekas	75000
dd27163e-0852-4e3f-89db-761937f622e7	f6fa9122-599b-4619-9d7c-5d1f41391448	12.99	63	2013	Republic Troopers vs. Sith Troopers	75001
a60458df-6e98-408b-8af1-9e2b8c39da51	2f4a15df-b1e0-4f3f-bcf6-005a460a2535	12.99	102	2014	Death Star Troopers	75034
24f0c54e-c9d5-4ab6-bde7-039beb4055e6	8017ffe2-04d4-4ed6-b6aa-acd7b308b50d	12.99	99	2014	Kashyyyk Troopers	75035
21d10f79-eedf-4d3b-9d8a-a518ca24135a	8017ffe2-04d4-4ed6-b6aa-acd7b308b50d	12.99	83	2014	Utapau Troopers	75036
7f70e24d-4c81-417d-a450-096c90bba071	8017ffe2-04d4-4ed6-b6aa-acd7b308b50d	14.99	183	2014	Battle on Saleucami	75037
49f030a9-2b8b-43ab-8784-83f6f5288421	9f161292-a4b7-4126-9e42-9251419c7f00	12.99	141	2015	Imperial Trooper Transport	75078
9809d0a2-0303-4cab-8130-be250d00b732	b615fe65-6993-423f-a247-cd3176bee174	12.99	95	2015	Shadow Troopers	75079
4154439c-f3ac-4178-809c-22cd06224f5c	efc2bb2f-50ef-4c3d-9c92-1acb0dee893a	12.99	106	2015	Senate Commando Troops	75088
d65ae804-a9f6-41cc-a3d5-6f61604b0e38	d3956f87-96a1-4d58-bc20-424958476ae5	12.99	105	2015	Geonosis Troopers	75089
058e91b0-0b88-4233-ac4a-74396516283f	84ea70c4-ddef-469f-87d3-8fc90b163e4a	12.99	112	2016	Resistance Trooper Battle Pack	75131
0302c8e9-c158-44e0-aa3d-4c02a4c7fcaf	84ea70c4-ddef-469f-87d3-8fc90b163e4a	12.99	88	2016	First Order Battle Pack	75132
413c11d7-73d6-4447-bedc-ad7f721403b4	d3f0bac4-4f32-4a48-a31e-fc6f090d429c	12.99	101	2016	Rebel Alliance Battle Pack	75133
883da909-2f02-4622-a883-407ca930f24e	d3f0bac4-4f32-4a48-a31e-fc6f090d429c	12.99	109	2016	Galactic Empire Battle Pack	75134
b8eb7c47-f56b-4803-a2d5-2c37c04d6368	0494681e-a897-4fad-a537-dc4c6f14a22c	14.99	120	2017	Rebel Trooper Battle Pack	75164
99a6a114-5d75-474b-9a2a-7aa669a3fc62	0494681e-a897-4fad-a537-dc4c6f14a22c	14.99	112	2017	Imperial Trooper Battle Pack	75165
0b41d1a1-f844-4d14-9274-60bfc05cdde4	84ea70c4-ddef-469f-87d3-8fc90b163e4a	14.99	117	2017	First Order Transport Speeder Battle Pack	75166
e67ea8dd-08a5-4156-9711-d83049ef2676	df33b025-935f-4a1b-9658-9bf6bc8a3cab	14.99	125	2017	Bounty Hunter Speeder Bike Battle Pack	75167
4dc4e39c-b4c3-4056-9ff4-e8873384a820	db3f0f4c-b754-4759-831e-7ca13dd22772	14.99	108	2018	First Order Specialists Battle Pack	75197
959662bb-ba18-4d45-b3f9-cb79b346a2aa	bb7cf9ce-7142-4c9a-affd-76182c0a9f13	14.99	97	2018	Tatooine Battle Pack	75198
dfe27f2a-32bc-4a3c-880f-d52e7570e3ec	a7c14ee6-241c-4f62-a75a-48c962721731	14.99	102	2018	Jedi and Clone Troopers Battle Pack	75206
b3e3dda5-a622-45e8-8719-cda773ef65c1	491425b1-453a-4d44-a50b-8dbab49a1b35	14.99	99	2018	Imperial Patrol Battle Pack	75207
559374e0-b45d-4985-84e3-b955391cc06c	db3f0f4c-b754-4759-831e-7ca13dd22772	14.99	109	2019	Elite Praetorian Guard Battle Pack	75225
f8865ec0-66dc-4901-93d4-498fd7478db2	d3f0bac4-4f32-4a48-a31e-fc6f090d429c	14.99	118	2019	Inferno Squad Battle Pack	75226
2c873a09-cecf-4969-826b-9a4bd9a63c39	d3956f87-96a1-4d58-bc20-424958476ae5	19.99	125	2019	Imperial Dropship – 20th Anniversary Edition	75262
2b117eaa-b131-4b7c-8bf0-c3d3e2b37411	f4c288d7-4866-4a42-accb-e95532b44c18	14.99	105	2020	Sith Troopers Battle Pack	75266
d94192c0-2500-4b80-9059-fecbfa3732f2	6049e287-86a6-4551-8c63-574d6f02bd7a	14.99	102	2020	Mandalorian Battle Pack	75267
c263193f-a7e3-43f4-8df3-fd108287286b	efc2bb2f-50ef-4c3d-9c92-1acb0dee893a	29.99	285	2020	501st Legion Clone Troopers	75280
b0fb314c-15b9-4e90-b8e0-7c67336d0c74	df33b025-935f-4a1b-9658-9bf6bc8a3cab	19.99	105	2022	Snowtrooper Battle Pack	75320
0279e9fb-bd6f-4fa6-9230-4840495824e9	efc2bb2f-50ef-4c3d-9c92-1acb0dee893a	19.99	119	2023	501st Clone Troopers Battle Pack	75345
1fa5fd99-3c4b-411e-848c-d84856150719	efc2bb2f-50ef-4c3d-9c92-1acb0dee893a	19.99	108	2023	332nd Ahsoka's Clone Trooper Battle Pack	75359
5947f2da-12ad-4f1b-a29f-6eb02fdad37f	efc2bb2f-50ef-4c3d-9c92-1acb0dee893a	29.99	215	2024	Clone Trooper & Battle Droid Battle Pack	75372
b704356b-0483-49a9-94a6-c9d114084b15	6049e287-86a6-4551-8c63-574d6f02bd7a	19.99	109	2024	Ambush on Mandalore Battle Pack	75373
094fac7a-d456-436d-9102-9a5bbb724a03	8017ffe2-04d4-4ed6-b6aa-acd7b308b50d	44.99	258	2025	327th Star Corps Clone Troopers Battle Pack	75431
ab64eb59-7a4a-4118-9a26-151d7b5e83cd	efc2bb2f-50ef-4c3d-9c92-1acb0dee893a	22.99	116	2026	Siege of Mandalore Battle Pack	75449
15f102e6-6560-476c-85f5-1203e1ba9a3d	3bd7dc2f-360c-43d1-9a25-e69cb30b501a	22.99	119	2025	Death Trooper & Night Trooper Battle Pack	75412
\.


--
-- Data for Name: game; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.game (id, number, title) FROM stdin;
182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	0	UNDERTALE
edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	1	DELTARUNE Chapter 1
9eecc3c4-0c95-448e-9735-19b6055b5260	2	DELTARUNE Chapter 2
a507f978-3614-497c-b1fc-9481c0e63181	3	DELTARUNE Chapter 3
e5abb674-39be-4e7f-ad99-82070d669db0	4	DELTARUNE Chapter 4
25ba7daa-308e-40e3-b25a-b429c273a277	5	DELTARUNE Chapter 5
17b5b3b7-b848-4658-8435-399103be1a47	6	DELTARUNE Chapter 6
876682b2-715d-4176-994d-df7603cca3b3	7	DELTARUNE Chapter 7
\.


--
-- Data for Name: leitmotif; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.leitmotif (id, name, description) FROM stdin;
9cb9fc9f-68d9-4074-b562-24862c25c325	Flowey	\N
333767bc-8ead-434a-b52d-a0227c1ef298	Toriel	\N
ebc21989-3760-4635-9270-56c52e751774	Sans	\N
4235fc4a-8da4-445d-8cd8-afd53a4d1b53	Papyrus	\N
06ac8438-b9c2-4f66-877b-e8e045909813	Asriel	\N
21bef96f-d0b5-4d3f-9127-1afa70406246	It's Raining Somewhere Else	\N
eee7dc83-0ec1-4cc2-b2c9-80c8601fb7a7	Asgore	\N
b6aefb29-e9fd-45e7-91d2-c8fa277bf49b	Hometown	\N
6d973751-8f11-4db8-81b4-ce8a8c873aa3	Susie	\N
c8cfb9c9-e343-4b3e-b787-519f6dd71835	Field of Hopes and Dreams	\N
945febbc-7473-49db-9d95-5f9b5c35b390	Quiet Autumn	\N
a2e97c67-9a48-43d4-99f8-c72fa60f1e89	King	\N
bba34e6a-b2e4-4a07-a437-75f1b29eeb94	Rouxls Kaard	\N
3bf9c862-b120-4427-a9b0-51e8bd945904	Hip Shop	\N
e4476218-b7fb-46fc-8c7e-01141726b14d	Flashback	\N
70ff26b7-9c25-4297-bb7d-830e99fea883	Doom Board	\N
7d9e38a5-6bc4-437a-ade3-f531f0f76c5c	Titan	\N
adcccd92-790f-41ec-bda8-b5639dd6e964	Mike	\N
a4791f74-6026-4b03-b0c3-2689d7b428ef	TV Time (HEY EVERY !)	This leitmotif is the theme song of the TV Time game show. It's associated with Spamton and Tenna.
1f465eb3-0bf3-4b70-bb2c-e9f21b922ec7	Mettaton	\N
27bec2ba-e975-475c-9f3f-31c990f6682e	Don't Forget	This is the main theme of Deltarune. It appears in 35 tracks as of Chapter 5, making it by far the most widespread leitmotif.
a0049164-1ac1-4d83-b388-f3dae95f0c32	Gerson	Interestingly, all songs that contain Gerson's leitmotif also contain Undyne's. Their battles also share a SOUL mode.
e3ce99a4-f6ed-44e7-947b-a18de33fe682	Battle Against a True Hero	This leitmotif is associated with boss fights in violent routes: Undertale's Genocide Route, Chapter 2's Weird Route, and Chapter 3's Sword Route.
d26f0150-4332-40b9-9cef-362609586701	Lancer	\N
c64e5087-6838-4c4e-92b1-07081503b2b6	The Legend	This leitmotif is associated with the prophecy and Castle Town.
0d19f646-5bea-4735-bf98-ae091d489dfd	Sweet Cap'n Cakes	\N
36236ea7-314f-4c8f-bc59-e137f9112344	Spamton	\N
1944a25c-6f22-486c-864f-8772ea91e1f9	Cyber World	This leitmotif contains a snippet of Sweet Cap'n Cakes A.
b192681b-2815-49ee-9db8-c80af49dd56d	Oh! One True Love	The music of Mettaton's opera.
1c00ff55-2b09-4074-a063-bb7c6103c96c	Darkness Falls	Deltarune's game over theme.
295aca21-7594-4512-b156-15c3cc25dd91	Determination (Ruins)	I believe this leitmotif represents Determination. It usually is heard when characters display a lot of Determination. It appears in many of Undyne and Gerson's tracks.
eff2beef-104c-4a1d-aac6-08689486ef62	Uwa!!	This leitmotif is associated with...weather, I guess?
7adf7534-6d47-47d7-b98f-b8d7a981b39f	Ghost Fight	This leitmotif is associated with ghost monsters, but it's basically a miniboss leitmotif.
084d659f-b990-4083-b82b-8d614df11a72	Dark Sanctuary	\N
6580a8a0-4d50-4042-aac0-f27dda52cc99	Heartache	Toriel's battle theme.
6f737841-8385-4be2-98ad-11777c1deb7a	Berdly	\N
0e425191-a40d-42e7-bb29-50abb10fec07	Home	The leitmotif of Toriel's house.
1e0c01ed-3940-4cd6-bdac-d83848dfb883	Enemy Approaching	Undertale's battle theme.
4c8d2893-e3e6-4f38-8750-3b98cc386f07	Once Upon a Time	This is the main theme of Undertale. It appears in 17 tracks from Undertale, and is the most widespread leitmotif in the game.
4b5ed6ed-0ff4-4e2a-932c-9ac5001e4f1f	Queen	\N
29346f17-7569-48cd-a290-184746526cb5	Alphys	It's not known why Alphys' leitmotif appears in "Bird That Carries You Over A Disproportionately Small Gap". The bird doesn't seem to be related to Alphys at all.
5cfedc63-a2d0-4686-97ce-abac8e62f02d	Another Medium	I would call this the Hotland leitmotif if it didn't also appear in Waterfall.
f8575489-195e-44f1-89f1-9bb1033ebf69	Dess	I believe that this leitmotif, which is commonly known as Lost Girl, will turn out to be Dess' theme.
6873ec98-400d-4391-910f-62fd2715edfc	Your Best Nightmare	This leitmotif is used when Flowey and later Susie are being intimidating.
0aef2ab8-a3e8-4fe8-913b-9c2bc7497d46	Dummy Coda	This isn't really a leitmotif, but BIG SHOT samples it.
ef4f3b91-afcb-4c1a-9a51-a439f75a51cf	Game Over (Determination)	Undertale's game over theme.
392f6198-ddd9-49cd-9b57-58e9989ee4b7	Hotel	The leitmotif of Mettaton's cooking show and the MTT Resort.
feedb901-15f2-4966-aa43-adbe815d20aa	Powers Combined	The leitmotif of the battle against GIGA Queen.
f7dcf7fd-4d37-4b8b-b655-b8faedd1ecfd	Gaster	This leitmotif first appears in Gaster's Theme, which is not on the official Undertale soundtrack. Due to how simple the theme is, it's very easy to hear it in places where it probably wasn't intended.
e2431100-5cf6-4370-86ca-bfade3a678bc	Rude Buster	Deltarune's battle theme.
b0fa7f8f-ee10-4487-8f56-d6002db4d5ea	Monster (Snowdin)	I believe this leitmotif represents all monsters. It first appears in Snowdin, and returns in many emotional moments throughout Undertale.
e2be06db-6028-42f5-97df-a228dccbd30c	Noelle	\N
09f67641-9722-4e82-bb8b-ef9d41231715	The Roaring Knight	\N
fe306722-253b-481c-b615-5488f6d51925	Undyne	Undyne's theme. In Deltarune, this theme is also associated with Gerson. This leitmotif is often syncopated, such as in the intro of Spear of Justice.
924e21ae-2e24-4959-86ba-497bc1839e44	Second Sanctuary	\N
68bc9b3e-d442-48f3-bf5f-bd0b1895e068	Spooktune	Napstablook's masterpiece.
3a975d33-87d5-498d-8375-481f082c0f20	Tenna	This leitmotif has the most appearances after Once Upon a Time and Don't Forget.
80a87b09-030a-401c-8f37-a5f303aed044	The Holy	\N
60af1344-d7ac-4a91-bfb9-4bb5c1d8a3e2	Freedom (The World Revolving)	This leitmotif is mainly associated with Shadow Crystal bosses. It's known as the Freedom leitmotif because freedom is mentioned in many of these bosses' flavor text.
b404c069-0951-4cc2-acec-857b108b6110	Roots	\N
73271dd7-fb45-4b11-ad67-8aa551d8b54a	The Dark Truth	This leitmotif is associated with darkness and the Roaring.
58ad50fd-0227-49b1-9637-07b75050fc4e	Checker Dance	\N
205ded5d-f571-45c2-9450-b56757ad32d8	Weird Birds	\N
398aadf4-f85e-499d-819c-dbe985b25c04	Flowery	\N
ce616089-4d35-43a1-a982-0f0f334e99d7	Pink	\N
48393850-3546-41b1-b865-5d363ec09f70	Flower Foyer	\N
bd27c47f-c38f-4dfc-9cf0-dcd779e6ac71	Friends	\N
8b2c113b-af84-4e03-a99c-32ff3a788237	Jingle Bells	\N
a0959249-99f1-46f7-be02-0593629e8bc0	Death by Glamour	\N
ace9a60b-60ce-43f8-8329-b87edbc66d9e	Flowers	The leitmotif of the six colored flowers (not including Flowery, who has his own leitmotif). The Chapter 5 whistle jingle is a snippet of Flowers B.
\.


--
-- Data for Name: leitmotif_in_song; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.leitmotif_in_song (leitmotif, song) FROM stdin;
4c8d2893-e3e6-4f38-8750-3b98cc386f07	c6b65c62-0f0c-4224-b13c-97c066e375f3
4c8d2893-e3e6-4f38-8750-3b98cc386f07	fd3f83fd-0f4b-45c6-b45f-571d32225901
4c8d2893-e3e6-4f38-8750-3b98cc386f07	e4eea6fd-8fd8-4d0e-a6c6-e5457fd68d0b
4c8d2893-e3e6-4f38-8750-3b98cc386f07	e8d747a0-1b94-4c3a-b147-61c6998b2391
4c8d2893-e3e6-4f38-8750-3b98cc386f07	cb477238-c3e8-470c-bb03-00edcc896f4a
4c8d2893-e3e6-4f38-8750-3b98cc386f07	01141db6-7276-48a2-aac7-1d2064b3a473
4c8d2893-e3e6-4f38-8750-3b98cc386f07	667f33a6-1547-40db-bb54-0b035bbb4cf4
4c8d2893-e3e6-4f38-8750-3b98cc386f07	85adfe66-5c12-48dc-96c2-25c45cd52c39
4c8d2893-e3e6-4f38-8750-3b98cc386f07	cf9065f2-5178-4dd7-a619-5a3286d5980c
4c8d2893-e3e6-4f38-8750-3b98cc386f07	d25ff546-1a1c-42d5-a56e-444a76700784
4c8d2893-e3e6-4f38-8750-3b98cc386f07	d2a1ea9f-6e49-4db5-a078-d145b23ac48c
4c8d2893-e3e6-4f38-8750-3b98cc386f07	0419d875-feee-452f-b659-3944e27d7f99
4c8d2893-e3e6-4f38-8750-3b98cc386f07	b4d6b844-52de-4062-9fc0-0e1169f95a30
4c8d2893-e3e6-4f38-8750-3b98cc386f07	4f297de4-9cac-4369-bdcb-3b6ce8579c41
4c8d2893-e3e6-4f38-8750-3b98cc386f07	c8a155be-ba30-4135-81f8-fe8d32eb31f0
4c8d2893-e3e6-4f38-8750-3b98cc386f07	682cb61e-29e3-42ac-9711-40ea21156b17
4c8d2893-e3e6-4f38-8750-3b98cc386f07	11685976-052b-4375-a929-fec5c80567dd
4c8d2893-e3e6-4f38-8750-3b98cc386f07	697fc3e9-902d-4efa-b0b5-30763bda2f26
4c8d2893-e3e6-4f38-8750-3b98cc386f07	675ec961-ba98-4cec-893a-3ffd92e9960f
4c8d2893-e3e6-4f38-8750-3b98cc386f07	534f3357-817e-4b0f-9771-e7a6d619dab0
4c8d2893-e3e6-4f38-8750-3b98cc386f07	32f417c5-5021-4a7c-8c9c-be850d2b458e
9cb9fc9f-68d9-4074-b562-24862c25c325	6658eb0c-6774-4ae1-afe3-b07bc733239b
9cb9fc9f-68d9-4074-b562-24862c25c325	750c2d4f-8c8b-4c68-98d1-28b3a9c51feb
9cb9fc9f-68d9-4074-b562-24862c25c325	242a8a16-d598-4c3f-9ad1-8113fe87bc0f
9cb9fc9f-68d9-4074-b562-24862c25c325	d25ff546-1a1c-42d5-a56e-444a76700784
9cb9fc9f-68d9-4074-b562-24862c25c325	d2a1ea9f-6e49-4db5-a078-d145b23ac48c
9cb9fc9f-68d9-4074-b562-24862c25c325	c8a155be-ba30-4135-81f8-fe8d32eb31f0
333767bc-8ead-434a-b52d-a0227c1ef298	7349d962-8ca3-4a7d-971d-3c26b080f94b
333767bc-8ead-434a-b52d-a0227c1ef298	cf9065f2-5178-4dd7-a619-5a3286d5980c
333767bc-8ead-434a-b52d-a0227c1ef298	4f297de4-9cac-4369-bdcb-3b6ce8579c41
295aca21-7594-4512-b156-15c3cc25dd91	175b6be6-1377-452b-a29a-dd19b090bafb
295aca21-7594-4512-b156-15c3cc25dd91	c984d4d8-e48f-4454-9fe7-bbacb62ded6b
295aca21-7594-4512-b156-15c3cc25dd91	bc1c9e34-464f-40c7-b213-0bd9030a6630
295aca21-7594-4512-b156-15c3cc25dd91	3bf2f291-3c78-4544-af1e-6c5622f2f84c
295aca21-7594-4512-b156-15c3cc25dd91	dbeb5fbd-c27d-469a-9de5-3ed37e6b5fef
295aca21-7594-4512-b156-15c3cc25dd91	d7190c3b-b8e5-46a3-b3cb-b25ecce78546
295aca21-7594-4512-b156-15c3cc25dd91	ab893906-2030-4295-a624-06ef410d5c44
295aca21-7594-4512-b156-15c3cc25dd91	68eb1cb3-33ec-4056-b929-7b102f81bce7
295aca21-7594-4512-b156-15c3cc25dd91	4f297de4-9cac-4369-bdcb-3b6ce8579c41
295aca21-7594-4512-b156-15c3cc25dd91	47b89fc4-120f-49e4-a3bb-b1182938b50e
295aca21-7594-4512-b156-15c3cc25dd91	4d07332c-d388-4c30-a8a4-bf5cedaba82f
295aca21-7594-4512-b156-15c3cc25dd91	c6d5b01a-2306-4dbb-abc4-56922804fdb0
295aca21-7594-4512-b156-15c3cc25dd91	bc493144-b958-4cb0-bc33-f5639626dff2
295aca21-7594-4512-b156-15c3cc25dd91	43575626-d21b-4142-b0bc-14beef352722
295aca21-7594-4512-b156-15c3cc25dd91	1ccbf6a3-9b6c-4e50-855a-d727191314e4
eff2beef-104c-4a1d-aac6-08689486ef62	bf4cf56c-6ca1-444d-ab07-2354fc738c30
eff2beef-104c-4a1d-aac6-08689486ef62	7de74813-0cff-467d-9431-be9b820bfb77
eff2beef-104c-4a1d-aac6-08689486ef62	d22d8f91-24e7-48b1-b715-2da25ea540cc
eff2beef-104c-4a1d-aac6-08689486ef62	df55f2bf-f0bc-4aac-b88d-c4250bc27299
1e0c01ed-3940-4cd6-bdac-d83848dfb883	93ad3587-5057-4b59-9657-78fe2ef28532
1e0c01ed-3940-4cd6-bdac-d83848dfb883	cb822319-01e2-477a-8f93-6faa915d07ee
1e0c01ed-3940-4cd6-bdac-d83848dfb883	c2e6e756-11ad-4753-9325-b6bc9943dbde
1e0c01ed-3940-4cd6-bdac-d83848dfb883	f46274c4-591b-4b31-8230-5ab7904e3577
1e0c01ed-3940-4cd6-bdac-d83848dfb883	8151823e-267e-4e21-bac1-24ceb6d72078
1e0c01ed-3940-4cd6-bdac-d83848dfb883	4f297de4-9cac-4369-bdcb-3b6ce8579c41
7adf7534-6d47-47d7-b98f-b8d7a981b39f	684d7582-fa77-45f0-abd9-8cbf33f5e70d
7adf7534-6d47-47d7-b98f-b8d7a981b39f	ead26c60-2210-4c39-8b98-58ffedbb2c29
7adf7534-6d47-47d7-b98f-b8d7a981b39f	318b2889-5188-4fef-b8f0-239434a6b621
7adf7534-6d47-47d7-b98f-b8d7a981b39f	0cb593cd-2f53-4da5-aa0f-417d733e4e11
7adf7534-6d47-47d7-b98f-b8d7a981b39f	7ffc5f69-a0cf-4da1-beff-34ef004ea5ad
7adf7534-6d47-47d7-b98f-b8d7a981b39f	1a00e312-4488-402a-b496-69a9e14ae595
7adf7534-6d47-47d7-b98f-b8d7a981b39f	2cd4116c-3692-4eef-ac85-ca5db59c8988
ef4f3b91-afcb-4c1a-9a51-a439f75a51cf	c802a0bc-39c8-4480-ad19-2fd632027eea
ef4f3b91-afcb-4c1a-9a51-a439f75a51cf	b0d78ce0-3472-466d-95a0-05899d26e5f7
ef4f3b91-afcb-4c1a-9a51-a439f75a51cf	1ae3f34c-e2b4-424a-b267-da19a9cc199d
ef4f3b91-afcb-4c1a-9a51-a439f75a51cf	d21effb4-29a8-46f9-8b9a-91990e1e31be
ef4f3b91-afcb-4c1a-9a51-a439f75a51cf	0ffbc125-53aa-40de-8274-677f26724305
0e425191-a40d-42e7-bb29-50abb10fec07	e4eea6fd-8fd8-4d0e-a6c6-e5457fd68d0b
0e425191-a40d-42e7-bb29-50abb10fec07	e8d747a0-1b94-4c3a-b147-61c6998b2391
0e425191-a40d-42e7-bb29-50abb10fec07	697fc3e9-902d-4efa-b0b5-30763bda2f26
0e425191-a40d-42e7-bb29-50abb10fec07	534f3357-817e-4b0f-9771-e7a6d619dab0
6580a8a0-4d50-4042-aac0-f27dda52cc99	eb0a2f89-96df-4d29-abeb-33bbf63a7fc9
6580a8a0-4d50-4042-aac0-f27dda52cc99	b0d78ce0-3472-466d-95a0-05899d26e5f7
ebc21989-3760-4635-9270-56c52e751774	6d0fadff-b109-4200-89b7-29802b65bd22
ebc21989-3760-4635-9270-56c52e751774	5eceb84c-61dd-4497-afb7-0978dcffe4cd
ebc21989-3760-4635-9270-56c52e751774	79a76e25-0582-465f-8286-a987cc9a35a6
ebc21989-3760-4635-9270-56c52e751774	86750b57-b4db-4b1f-9a45-65f68bc6ef79
4235fc4a-8da4-445d-8cd8-afd53a4d1b53	2a6dca3b-ccd8-4da8-85e0-4757ac0b4596
4235fc4a-8da4-445d-8cd8-afd53a4d1b53	169a9bb1-4fae-41b5-ae01-0092aa49fa96
4235fc4a-8da4-445d-8cd8-afd53a4d1b53	79a76e25-0582-465f-8286-a987cc9a35a6
4235fc4a-8da4-445d-8cd8-afd53a4d1b53	4f297de4-9cac-4369-bdcb-3b6ce8579c41
b0fa7f8f-ee10-4487-8f56-d6002db4d5ea	5204cb2e-d256-4140-91c5-c9a3a4a66cf4
b0fa7f8f-ee10-4487-8f56-d6002db4d5ea	f3b3e854-4f82-485e-96d0-5502ee951c56
b0fa7f8f-ee10-4487-8f56-d6002db4d5ea	bacf938f-723d-4838-a581-68c13d619b4e
b0fa7f8f-ee10-4487-8f56-d6002db4d5ea	64d9ce6a-0070-46b4-8f97-f266bc1d0bed
b0fa7f8f-ee10-4487-8f56-d6002db4d5ea	e8cceef5-9e02-4df9-8dd8-124fed49b3dc
b0fa7f8f-ee10-4487-8f56-d6002db4d5ea	fadcb4fc-44e9-4723-9dcb-c8f74553ca63
b0fa7f8f-ee10-4487-8f56-d6002db4d5ea	d25ff546-1a1c-42d5-a56e-444a76700784
b0fa7f8f-ee10-4487-8f56-d6002db4d5ea	8fda3b80-c743-4dcb-b898-df6d1bd4e298
b0fa7f8f-ee10-4487-8f56-d6002db4d5ea	4f297de4-9cac-4369-bdcb-3b6ce8579c41
b0fa7f8f-ee10-4487-8f56-d6002db4d5ea	93adb015-b2f5-4572-8f8a-d66a633356ca
b0fa7f8f-ee10-4487-8f56-d6002db4d5ea	45f2b6ea-7086-4d71-a971-144a5a1c844e
fe306722-253b-481c-b615-5488f6d51925	efedd64a-881d-4377-9bca-0159f1097a35
fe306722-253b-481c-b615-5488f6d51925	154090e9-0b1b-4af9-9081-c613adec7df4
fe306722-253b-481c-b615-5488f6d51925	8df3cdcd-df7e-427c-b03e-97dce7e4e77b
fe306722-253b-481c-b615-5488f6d51925	3bf2f291-3c78-4544-af1e-6c5622f2f84c
fe306722-253b-481c-b615-5488f6d51925	dbeb5fbd-c27d-469a-9de5-3ed37e6b5fef
fe306722-253b-481c-b615-5488f6d51925	b0d78ce0-3472-466d-95a0-05899d26e5f7
fe306722-253b-481c-b615-5488f6d51925	4f297de4-9cac-4369-bdcb-3b6ce8579c41
fe306722-253b-481c-b615-5488f6d51925	c6d5b01a-2306-4dbb-abc4-56922804fdb0
fe306722-253b-481c-b615-5488f6d51925	bc493144-b958-4cb0-bc33-f5639626dff2
fe306722-253b-481c-b615-5488f6d51925	2a9c6130-34b0-41ae-87f4-1a52c77a4a58
fe306722-253b-481c-b615-5488f6d51925	43575626-d21b-4142-b0bc-14beef352722
fe306722-253b-481c-b615-5488f6d51925	1ccbf6a3-9b6c-4e50-855a-d727191314e4
5cfedc63-a2d0-4686-97ce-abac8e62f02d	c984d4d8-e48f-4454-9fe7-bbacb62ded6b
5cfedc63-a2d0-4686-97ce-abac8e62f02d	1af1546f-496a-4919-ad33-1161af5f7a66
5cfedc63-a2d0-4686-97ce-abac8e62f02d	48a29ce4-fdc9-4c2b-941d-5ea25c6cf221
5cfedc63-a2d0-4686-97ce-abac8e62f02d	1a540624-ebb5-460e-b9ca-57d408f4023b
5cfedc63-a2d0-4686-97ce-abac8e62f02d	4f297de4-9cac-4369-bdcb-3b6ce8579c41
06ac8438-b9c2-4f66-877b-e8e045909813	fc0d55d5-7f6c-4e03-b421-54a8661d7293
06ac8438-b9c2-4f66-877b-e8e045909813	667f33a6-1547-40db-bb54-0b035bbb4cf4
06ac8438-b9c2-4f66-877b-e8e045909813	85adfe66-5c12-48dc-96c2-25c45cd52c39
06ac8438-b9c2-4f66-877b-e8e045909813	242a8a16-d598-4c3f-9ad1-8113fe87bc0f
06ac8438-b9c2-4f66-877b-e8e045909813	846ebe2d-3cf4-4a98-9f68-f1dd7e019c57
29346f17-7569-48cd-a290-184746526cb5	2770c2c0-ace8-4ee2-b898-55711da5d163
29346f17-7569-48cd-a290-184746526cb5	37cc8403-1aa6-4856-895c-7fce711a1689
29346f17-7569-48cd-a290-184746526cb5	f7f6db77-e665-4433-96ca-a5a62a8a4ba2
29346f17-7569-48cd-a290-184746526cb5	a43b8ff9-4caf-4105-b24a-38d4816da010
0aef2ab8-a3e8-4fe8-913b-9c2bc7497d46	318b2889-5188-4fef-b8f0-239434a6b621
0aef2ab8-a3e8-4fe8-913b-9c2bc7497d46	120daa30-58b1-4450-a1ab-a29186f8837e
68bc9b3e-d442-48f3-bf5f-bd0b1895e068	77ebb8e4-0bab-46d5-983b-72327f9003d5
68bc9b3e-d442-48f3-bf5f-bd0b1895e068	f50f4dbd-6dd4-4a22-b15f-dd5b67bf784a
68bc9b3e-d442-48f3-bf5f-bd0b1895e068	f3197e54-27af-4899-85cd-09f0ed83ef37
392f6198-ddd9-49cd-9b57-58e9989ee4b7	cb477238-c3e8-470c-bb03-00edcc896f4a
392f6198-ddd9-49cd-9b57-58e9989ee4b7	01141db6-7276-48a2-aac7-1d2064b3a473
392f6198-ddd9-49cd-9b57-58e9989ee4b7	9ecc4b2f-5c67-4989-840e-63f76da0d17d
1f465eb3-0bf3-4b70-bb2c-e9f21b922ec7	f27fa242-a186-4748-97a6-437a496e3db9
1f465eb3-0bf3-4b70-bb2c-e9f21b922ec7	346b2845-d746-4c46-af07-860d35213bc0
1f465eb3-0bf3-4b70-bb2c-e9f21b922ec7	1a540624-ebb5-460e-b9ca-57d408f4023b
b192681b-2815-49ee-9db8-c80af49dd56d	88ededcb-3ad2-47bd-9ba0-0d4a3152696c
b192681b-2815-49ee-9db8-c80af49dd56d	8b53692a-1dfb-4e57-8a8a-0cb3eceefcad
b192681b-2815-49ee-9db8-c80af49dd56d	a22ab1b5-4709-4d31-bb4c-4252f1a51e77
21bef96f-d0b5-4d3f-9127-1afa70406246	5eceb84c-61dd-4497-afb7-0978dcffe4cd
21bef96f-d0b5-4d3f-9127-1afa70406246	56142794-7b91-442f-a12c-8f73b39d79cd
eee7dc83-0ec1-4cc2-b2c9-80c8601fb7a7	5eb59bef-6df7-4c4c-bdf9-4fbd83335647
eee7dc83-0ec1-4cc2-b2c9-80c8601fb7a7	b0d78ce0-3472-466d-95a0-05899d26e5f7
eee7dc83-0ec1-4cc2-b2c9-80c8601fb7a7	4f297de4-9cac-4369-bdcb-3b6ce8579c41
6873ec98-400d-4391-910f-62fd2715edfc	c196a9dc-1614-415f-a1d1-8002bc5883c8
6873ec98-400d-4391-910f-62fd2715edfc	750c2d4f-8c8b-4c68-98d1-28b3a9c51feb
6873ec98-400d-4391-910f-62fd2715edfc	78b4a517-d283-4cca-9e30-e92c770cb656
6873ec98-400d-4391-910f-62fd2715edfc	5c9bde91-ec2b-404e-a675-e47bc509e9d2
6873ec98-400d-4391-910f-62fd2715edfc	b4639bfd-be77-47e6-9557-11411f541dc4
e3ce99a4-f6ed-44e7-947b-a18de33fe682	4d07332c-d388-4c30-a8a4-bf5cedaba82f
e3ce99a4-f6ed-44e7-947b-a18de33fe682	6aac8c7d-ca34-4c82-82c0-0340a8d2db3b
e3ce99a4-f6ed-44e7-947b-a18de33fe682	120daa30-58b1-4450-a1ab-a29186f8837e
f7dcf7fd-4d37-4b8b-b655-b8faedd1ecfd	51005ec2-405a-49ab-9485-a5a9948048ea
27bec2ba-e975-475c-9f3f-31c990f6682e	11685976-052b-4375-a929-fec5c80567dd
27bec2ba-e975-475c-9f3f-31c990f6682e	93adb015-b2f5-4572-8f8a-d66a633356ca
27bec2ba-e975-475c-9f3f-31c990f6682e	234a2874-379e-4c45-8d7c-37d14f1ac068
27bec2ba-e975-475c-9f3f-31c990f6682e	4992fcfa-fd9b-4385-a2c2-27bea74a35ef
27bec2ba-e975-475c-9f3f-31c990f6682e	b4aa6877-63e3-4088-8e12-cf93547edf1c
27bec2ba-e975-475c-9f3f-31c990f6682e	5f038d42-8434-4360-b6c7-7959d5607d1e
27bec2ba-e975-475c-9f3f-31c990f6682e	c268a54b-7fbf-4b27-b8fc-e58ab1a52f0b
27bec2ba-e975-475c-9f3f-31c990f6682e	697fc3e9-902d-4efa-b0b5-30763bda2f26
27bec2ba-e975-475c-9f3f-31c990f6682e	d64a2787-2915-4393-8439-0e3fc0c08976
27bec2ba-e975-475c-9f3f-31c990f6682e	df724baf-5e3c-4e54-af7d-df0c18e737dd
27bec2ba-e975-475c-9f3f-31c990f6682e	343a74f5-394f-445f-b1f8-8c09a766fd55
27bec2ba-e975-475c-9f3f-31c990f6682e	534f3357-817e-4b0f-9771-e7a6d619dab0
27bec2ba-e975-475c-9f3f-31c990f6682e	296144fc-ed59-4048-b226-c869c8b7fa49
27bec2ba-e975-475c-9f3f-31c990f6682e	d55ad71d-5eb0-4fbb-86cf-c01f5045a053
27bec2ba-e975-475c-9f3f-31c990f6682e	45f2b6ea-7086-4d71-a971-144a5a1c844e
27bec2ba-e975-475c-9f3f-31c990f6682e	b6a26697-8ae9-491b-84b5-e77aec15571b
27bec2ba-e975-475c-9f3f-31c990f6682e	736fa897-5a24-49db-a402-de1233f4fd6d
27bec2ba-e975-475c-9f3f-31c990f6682e	960b6af5-1def-46dc-aca1-e890b0941378
27bec2ba-e975-475c-9f3f-31c990f6682e	0b072a9e-25e8-43b1-b673-8fd53617eeac
27bec2ba-e975-475c-9f3f-31c990f6682e	a623e667-3d3f-4181-841d-66a5833dbc2b
27bec2ba-e975-475c-9f3f-31c990f6682e	2ca14d4f-10dc-480f-bbff-1b37fb443de9
27bec2ba-e975-475c-9f3f-31c990f6682e	176003b1-33ed-43a7-84c0-88265ba7015b
27bec2ba-e975-475c-9f3f-31c990f6682e	9617aecb-d3ea-4996-b0ba-02eae5c72b72
b6aefb29-e9fd-45e7-91d2-c8fa277bf49b	93adb015-b2f5-4572-8f8a-d66a633356ca
b6aefb29-e9fd-45e7-91d2-c8fa277bf49b	45f2b6ea-7086-4d71-a971-144a5a1c844e
6d973751-8f11-4db8-81b4-ce8a8c873aa3	ecc818c2-ae97-4311-9814-a5317c620718
6d973751-8f11-4db8-81b4-ce8a8c873aa3	b4639bfd-be77-47e6-9557-11411f541dc4
09f67641-9722-4e82-bb8b-ef9d41231715	ed38cca5-3c86-4f46-970f-f30ecd41a98d
09f67641-9722-4e82-bb8b-ef9d41231715	1e6ca18b-abb8-477e-9d43-d20244ea2aee
09f67641-9722-4e82-bb8b-ef9d41231715	b4aa6877-63e3-4088-8e12-cf93547edf1c
09f67641-9722-4e82-bb8b-ef9d41231715	30d8ae7c-171d-48ce-aa48-34b88ded8d14
c64e5087-6838-4c4e-92b1-07081503b2b6	8bb46c52-024c-4850-881f-fb2223c66948
c64e5087-6838-4c4e-92b1-07081503b2b6	cb4167e9-9b1d-4453-a7d2-b27cda31267f
c64e5087-6838-4c4e-92b1-07081503b2b6	981f9891-b037-4c75-82e9-8906e1e81aea
c64e5087-6838-4c4e-92b1-07081503b2b6	c8dc8dd7-79d4-4bf8-b901-4bc8f2dc3b42
c64e5087-6838-4c4e-92b1-07081503b2b6	cf111277-24d2-4469-9c23-7d743484e740
c64e5087-6838-4c4e-92b1-07081503b2b6	b6a26697-8ae9-491b-84b5-e77aec15571b
c64e5087-6838-4c4e-92b1-07081503b2b6	736fa897-5a24-49db-a402-de1233f4fd6d
c64e5087-6838-4c4e-92b1-07081503b2b6	1b7ee751-ff61-49d6-b7cc-e312f7832f00
c64e5087-6838-4c4e-92b1-07081503b2b6	157e37cb-1858-4afc-b258-108e562bbfda
c64e5087-6838-4c4e-92b1-07081503b2b6	fb6e9e3c-1cc1-4bb2-ba2f-2fff72afd55f
d26f0150-4332-40b9-9cef-362609586701	eb37f156-034a-4f51-a1aa-f5c5fae13288
d26f0150-4332-40b9-9cef-362609586701	457d0f0d-cd4b-4c80-8758-cd45354844c2
d26f0150-4332-40b9-9cef-362609586701	9cdaedcb-552a-460c-8cf8-9a63a6c8c6f5
d26f0150-4332-40b9-9cef-362609586701	1d11eb02-51c9-46ff-8068-26292dbac45f
d26f0150-4332-40b9-9cef-362609586701	4bc7cb4f-f5fa-4893-91c7-9333ea13b92d
d26f0150-4332-40b9-9cef-362609586701	981f9891-b037-4c75-82e9-8906e1e81aea
d26f0150-4332-40b9-9cef-362609586701	356b2f82-41c7-42e5-95de-583a180bf82b
d26f0150-4332-40b9-9cef-362609586701	6fb34278-b184-42e6-8c3b-9e19f51d90cd
d26f0150-4332-40b9-9cef-362609586701	180383f5-0f60-4442-967b-ad0a260c0606
e2431100-5cf6-4370-86ca-bfade3a678bc	1ae3f34c-e2b4-424a-b267-da19a9cc199d
e2431100-5cf6-4370-86ca-bfade3a678bc	d21effb4-29a8-46f9-8b9a-91990e1e31be
e2431100-5cf6-4370-86ca-bfade3a678bc	bd643605-d78d-4224-ac81-ab6927439260
e2431100-5cf6-4370-86ca-bfade3a678bc	0ffbc125-53aa-40de-8274-677f26724305
c8cfb9c9-e343-4b3e-b787-519f6dd71835	234a2874-379e-4c45-8d7c-37d14f1ac068
c8cfb9c9-e343-4b3e-b787-519f6dd71835	4992fcfa-fd9b-4385-a2c2-27bea74a35ef
945febbc-7473-49db-9d95-5f9b5c35b390	f296a458-f47e-4e98-8f0e-81d4c2325de7
945febbc-7473-49db-9d95-5f9b5c35b390	4992fcfa-fd9b-4385-a2c2-27bea74a35ef
a2e97c67-9a48-43d4-99f8-c72fa60f1e89	696a3530-ed93-4b23-be9f-4d1a19b2bfd8
a2e97c67-9a48-43d4-99f8-c72fa60f1e89	4bc7cb4f-f5fa-4893-91c7-9333ea13b92d
a2e97c67-9a48-43d4-99f8-c72fa60f1e89	981f9891-b037-4c75-82e9-8906e1e81aea
bba34e6a-b2e4-4a07-a437-75f1b29eeb94	c4e2d49e-0f3b-472b-903f-5940524f0a77
bba34e6a-b2e4-4a07-a437-75f1b29eeb94	6fb34278-b184-42e6-8c3b-9e19f51d90cd
3bf9c862-b120-4427-a9b0-51e8bd945904	29b06b39-b75a-4ded-bc36-5b7a713fa625
3bf9c862-b120-4427-a9b0-51e8bd945904	159e9c50-f815-453a-8671-8cc3c6621db0
3bf9c862-b120-4427-a9b0-51e8bd945904	2e843edf-2d51-458a-be15-bb890cb13809
3bf9c862-b120-4427-a9b0-51e8bd945904	395537f6-897f-4248-a848-06d9b78b57c2
1c00ff55-2b09-4074-a063-bb7c6103c96c	83b3ccd3-5f4a-4717-b9b3-b15c82509107
1c00ff55-2b09-4074-a063-bb7c6103c96c	69cb3136-550a-46c0-9707-4b3f714bdbbb
60af1344-d7ac-4a91-bfb9-4bb5c1d8a3e2	db729160-cbc2-4977-976c-2e773f7d7bae
60af1344-d7ac-4a91-bfb9-4bb5c1d8a3e2	b4aa6877-63e3-4088-8e12-cf93547edf1c
60af1344-d7ac-4a91-bfb9-4bb5c1d8a3e2	120daa30-58b1-4450-a1ab-a29186f8837e
60af1344-d7ac-4a91-bfb9-4bb5c1d8a3e2	0e6b6138-cc03-47d5-8ed5-a956f19babd2
60af1344-d7ac-4a91-bfb9-4bb5c1d8a3e2	43575626-d21b-4142-b0bc-14beef352722
60af1344-d7ac-4a91-bfb9-4bb5c1d8a3e2	39d24d4b-e09f-4c1a-b7d1-37f7032e5a0e
80a87b09-030a-401c-8f37-a5f303aed044	fcb68884-77a1-4526-b46a-68a99bf1dde8
80a87b09-030a-401c-8f37-a5f303aed044	395537f6-897f-4248-a848-06d9b78b57c2
80a87b09-030a-401c-8f37-a5f303aed044	1a747669-38af-47fd-9be2-05bc1db8f26d
e2be06db-6028-42f5-97df-a228dccbd30c	72d2879e-679f-4e8b-8d3e-86735176f449
e2be06db-6028-42f5-97df-a228dccbd30c	7184857d-1385-4fad-a5c4-abb359657287
e2be06db-6028-42f5-97df-a228dccbd30c	2e877ab4-6045-4134-829c-f4cc302616a3
4b5ed6ed-0ff4-4e2a-932c-9ac5001e4f1f	900e400f-a92c-456e-8c90-f608f17e183c
4b5ed6ed-0ff4-4e2a-932c-9ac5001e4f1f	29b1f57a-db9f-4280-8c78-dc176dd723ea
4b5ed6ed-0ff4-4e2a-932c-9ac5001e4f1f	559cf5b9-d390-43fb-b4a1-e9b02b06a179
4b5ed6ed-0ff4-4e2a-932c-9ac5001e4f1f	c9ef2f9a-25c6-4ed9-b27c-fe547fc4fed7
4b5ed6ed-0ff4-4e2a-932c-9ac5001e4f1f	303b2e5c-f728-48ea-a610-4ad818f4fc55
4b5ed6ed-0ff4-4e2a-932c-9ac5001e4f1f	4de9fbd1-9824-4700-8f27-af95d8f7df7e
4b5ed6ed-0ff4-4e2a-932c-9ac5001e4f1f	a849b106-f405-46db-9bc1-9b5a64229025
4b5ed6ed-0ff4-4e2a-932c-9ac5001e4f1f	3707347d-3ba4-4396-b5c6-5a60767527b5
4b5ed6ed-0ff4-4e2a-932c-9ac5001e4f1f	5dd51ed8-f52b-4d32-88f3-4cdcbc04e6f8
4b5ed6ed-0ff4-4e2a-932c-9ac5001e4f1f	63438837-ecc8-4ea3-bf10-081cf1f19a81
1944a25c-6f22-486c-864f-8772ea91e1f9	18263566-6943-425a-9604-c4a386945480
1944a25c-6f22-486c-864f-8772ea91e1f9	ab7d6c7f-4af8-4c9d-a0fa-0dbedb2c605a
0d19f646-5bea-4735-bf98-ae091d489dfd	bfc9f82a-fc44-477f-a172-49ba361656d1
0d19f646-5bea-4735-bf98-ae091d489dfd	012dc67c-ad8e-4170-9dfa-b09a9982c2ba
0d19f646-5bea-4735-bf98-ae091d489dfd	832fd404-e0b7-4218-a6d6-d4313daaa0c5
0d19f646-5bea-4735-bf98-ae091d489dfd	8d6db041-7637-4419-8efb-af71f9110c14
0d19f646-5bea-4735-bf98-ae091d489dfd	2243e8a9-2fb0-4bf7-87bd-44f607aa155c
0d19f646-5bea-4735-bf98-ae091d489dfd	ab7d6c7f-4af8-4c9d-a0fa-0dbedb2c605a
0d19f646-5bea-4735-bf98-ae091d489dfd	5bfdb631-b853-4de3-91fe-e9220701f2b7
0d19f646-5bea-4735-bf98-ae091d489dfd	0a385dd4-aff3-47f8-ade3-cb81958a62b9
6f737841-8385-4be2-98ad-11777c1deb7a	233c6e03-3d1f-429e-bf4f-e27f61e88a37
6f737841-8385-4be2-98ad-11777c1deb7a	559cf5b9-d390-43fb-b4a1-e9b02b06a179
6f737841-8385-4be2-98ad-11777c1deb7a	b9dc3f51-9983-4182-8eea-a3eea9d809e2
f8575489-195e-44f1-89f1-9bb1033ebf69	94882a77-829b-45f4-9367-44b1759cfce7
adcccd92-790f-41ec-bda8-b5639dd6e964	94882a77-829b-45f4-9367-44b1759cfce7
73271dd7-fb45-4b11-ad67-8aa551d8b54a	343a74f5-394f-445f-b1f8-8c09a766fd55
73271dd7-fb45-4b11-ad67-8aa551d8b54a	a623e667-3d3f-4181-841d-66a5833dbc2b
b404c069-0951-4cc2-acec-857b108b6110	b87799d7-d58a-4dfe-a222-b45f630d448d
b404c069-0951-4cc2-acec-857b108b6110	fede205f-5a9d-4207-8cfe-0d259a27950d
e3ce99a4-f6ed-44e7-947b-a18de33fe682	a262e2d2-9626-4212-ba17-b4e5e074c76a
6f737841-8385-4be2-98ad-11777c1deb7a	a849b106-f405-46db-9bc1-9b5a64229025
a4791f74-6026-4b03-b0c3-2689d7b428ef	349aa9c0-5536-44b9-899a-ddb224c647b6
a4791f74-6026-4b03-b0c3-2689d7b428ef	cf3a758b-faf9-4623-83d1-33af2b7aa929
a4791f74-6026-4b03-b0c3-2689d7b428ef	3084a496-3ce3-46e3-b3d1-ee1d6c01904b
a4791f74-6026-4b03-b0c3-2689d7b428ef	1bdd69e0-30db-4c84-9ef7-f972d05b97d8
a4791f74-6026-4b03-b0c3-2689d7b428ef	2e843edf-2d51-458a-be15-bb890cb13809
a4791f74-6026-4b03-b0c3-2689d7b428ef	80ad01ca-8d08-4b0a-a746-35993d2de5a2
a4791f74-6026-4b03-b0c3-2689d7b428ef	5ca8f9a8-090d-4b6e-8676-23a82fa6bbaa
a4791f74-6026-4b03-b0c3-2689d7b428ef	395537f6-897f-4248-a848-06d9b78b57c2
a4791f74-6026-4b03-b0c3-2689d7b428ef	15e51479-8510-4143-bc4a-8d129f36b155
36236ea7-314f-4c8f-bc59-e137f9112344	6c8ed503-3d5a-41bc-a7c4-78b50ed60996
36236ea7-314f-4c8f-bc59-e137f9112344	552c63d3-f52b-4447-974a-fcb925e51a90
36236ea7-314f-4c8f-bc59-e137f9112344	8e581acc-ba7f-4a67-a429-4a9f81645f35
36236ea7-314f-4c8f-bc59-e137f9112344	120daa30-58b1-4450-a1ab-a29186f8837e
36236ea7-314f-4c8f-bc59-e137f9112344	15e51479-8510-4143-bc4a-8d129f36b155
36236ea7-314f-4c8f-bc59-e137f9112344	39d24d4b-e09f-4c1a-b7d1-37f7032e5a0e
feedb901-15f2-4966-aa43-adbe815d20aa	eca67e53-76b4-4f68-830b-5bc6eb346edd
feedb901-15f2-4966-aa43-adbe815d20aa	5dd51ed8-f52b-4d32-88f3-4cdcbc04e6f8
feedb901-15f2-4966-aa43-adbe815d20aa	63438837-ecc8-4ea3-bf10-081cf1f19a81
e4476218-b7fb-46fc-8c7e-01141726b14d	74137671-c2bf-4398-8196-ed319975ebb3
e4476218-b7fb-46fc-8c7e-01141726b14d	1ef40bfa-9584-408a-8609-7530f5e5a9a7
3a975d33-87d5-498d-8375-481f082c0f20	3084a496-3ce3-46e3-b3d1-ee1d6c01904b
3a975d33-87d5-498d-8375-481f082c0f20	643adc13-ea24-4cbb-9b46-867a94dcea05
3a975d33-87d5-498d-8375-481f082c0f20	f03fed85-fd38-4ce1-b4f0-f2d7ae85e046
3a975d33-87d5-498d-8375-481f082c0f20	3744cde6-d9d6-4d68-b98b-061f3d8ec5d2
3a975d33-87d5-498d-8375-481f082c0f20	e7cfecb7-6a36-40ae-be93-792895dbc60a
3a975d33-87d5-498d-8375-481f082c0f20	4206f7b1-3c84-4fe4-991d-2cd8099297cf
3a975d33-87d5-498d-8375-481f082c0f20	1e29b7db-8c4e-4d87-9e13-221032898177
3a975d33-87d5-498d-8375-481f082c0f20	eab50732-0a61-4540-a2b3-6cc102183dd0
3a975d33-87d5-498d-8375-481f082c0f20	bf749da3-c47f-405b-816b-ea41793a348e
3a975d33-87d5-498d-8375-481f082c0f20	a3dd97ff-b37c-45ff-9b07-c0013922671b
3a975d33-87d5-498d-8375-481f082c0f20	3d0a7634-3f27-4aa3-b219-7b9b379f11f6
3a975d33-87d5-498d-8375-481f082c0f20	c883faca-5f6f-48de-a373-3ceea8d35b04
3a975d33-87d5-498d-8375-481f082c0f20	513718f1-a56c-4152-854b-6d44bb3e2197
3a975d33-87d5-498d-8375-481f082c0f20	2e843edf-2d51-458a-be15-bb890cb13809
3a975d33-87d5-498d-8375-481f082c0f20	80ad01ca-8d08-4b0a-a746-35993d2de5a2
3a975d33-87d5-498d-8375-481f082c0f20	1a747669-38af-47fd-9be2-05bc1db8f26d
3a975d33-87d5-498d-8375-481f082c0f20	15e51479-8510-4143-bc4a-8d129f36b155
70ff26b7-9c25-4297-bb7d-830e99fea883	c883faca-5f6f-48de-a373-3ceea8d35b04
70ff26b7-9c25-4297-bb7d-830e99fea883	513718f1-a56c-4152-854b-6d44bb3e2197
70ff26b7-9c25-4297-bb7d-830e99fea883	80ad01ca-8d08-4b0a-a746-35993d2de5a2
084d659f-b990-4083-b82b-8d614df11a72	736fa897-5a24-49db-a402-de1233f4fd6d
084d659f-b990-4083-b82b-8d614df11a72	960b6af5-1def-46dc-aca1-e890b0941378
084d659f-b990-4083-b82b-8d614df11a72	e55934a3-c4ef-45a3-b49a-bc69c6110137
084d659f-b990-4083-b82b-8d614df11a72	2ca14d4f-10dc-480f-bbff-1b37fb443de9
084d659f-b990-4083-b82b-8d614df11a72	8e1dab23-5305-4017-8d1a-23e6d1a04142
084d659f-b990-4083-b82b-8d614df11a72	176003b1-33ed-43a7-84c0-88265ba7015b
084d659f-b990-4083-b82b-8d614df11a72	f12f54be-7899-47d8-bde8-7cb2384fde3c
a0049164-1ac1-4d83-b388-f3dae95f0c32	c6d5b01a-2306-4dbb-abc4-56922804fdb0
a0049164-1ac1-4d83-b388-f3dae95f0c32	2a9c6130-34b0-41ae-87f4-1a52c77a4a58
a0049164-1ac1-4d83-b388-f3dae95f0c32	43575626-d21b-4142-b0bc-14beef352722
a0049164-1ac1-4d83-b388-f3dae95f0c32	1ccbf6a3-9b6c-4e50-855a-d727191314e4
924e21ae-2e24-4959-86ba-497bc1839e44	1b7ee751-ff61-49d6-b7cc-e312f7832f00
924e21ae-2e24-4959-86ba-497bc1839e44	157e37cb-1858-4afc-b258-108e562bbfda
7d9e38a5-6bc4-437a-ade3-f531f0f76c5c	e3e7f909-c7d5-4380-aafb-6d791895f500
7d9e38a5-6bc4-437a-ade3-f531f0f76c5c	2ca14d4f-10dc-480f-bbff-1b37fb443de9
7d9e38a5-6bc4-437a-ade3-f531f0f76c5c	8e1dab23-5305-4017-8d1a-23e6d1a04142
7d9e38a5-6bc4-437a-ade3-f531f0f76c5c	176003b1-33ed-43a7-84c0-88265ba7015b
adcccd92-790f-41ec-bda8-b5639dd6e964	e90201a2-4293-4e2e-99ae-9190236792bb
adcccd92-790f-41ec-bda8-b5639dd6e964	15e51479-8510-4143-bc4a-8d129f36b155
b0fa7f8f-ee10-4487-8f56-d6002db4d5ea	affc356b-21d5-4883-967d-4e6673abe424
27bec2ba-e975-475c-9f3f-31c990f6682e	affc356b-21d5-4883-967d-4e6673abe424
b6aefb29-e9fd-45e7-91d2-c8fa277bf49b	affc356b-21d5-4883-967d-4e6673abe424
27bec2ba-e975-475c-9f3f-31c990f6682e	7184857d-1385-4fad-a5c4-abb359657287
f8575489-195e-44f1-89f1-9bb1033ebf69	72d2879e-679f-4e8b-8d3e-86735176f449
f8575489-195e-44f1-89f1-9bb1033ebf69	5bae394a-7047-4e18-948e-f86e8f73b30e
f8575489-195e-44f1-89f1-9bb1033ebf69	52c37015-86cd-40da-be44-ba68b182b128
f8575489-195e-44f1-89f1-9bb1033ebf69	c51f6b0b-7679-4c7e-9790-c8c32b03f99c
1f465eb3-0bf3-4b70-bb2c-e9f21b922ec7	ba4a3357-52ff-4016-a579-68d0d03fd473
1f465eb3-0bf3-4b70-bb2c-e9f21b922ec7	5a7385f5-270a-4e08-a486-907831505b8d
1f465eb3-0bf3-4b70-bb2c-e9f21b922ec7	82716eeb-cb50-4f69-9ffc-dd159b69d0c8
4b5ed6ed-0ff4-4e2a-932c-9ac5001e4f1f	15e51479-8510-4143-bc4a-8d129f36b155
27bec2ba-e975-475c-9f3f-31c990f6682e	e55934a3-c4ef-45a3-b49a-bc69c6110137
27bec2ba-e975-475c-9f3f-31c990f6682e	1b7ee751-ff61-49d6-b7cc-e312f7832f00
73271dd7-fb45-4b11-ad67-8aa551d8b54a	f12f54be-7899-47d8-bde8-7cb2384fde3c
4c8d2893-e3e6-4f38-8750-3b98cc386f07	8fda3b80-c743-4dcb-b898-df6d1bd4e298
0d19f646-5bea-4735-bf98-ae091d489dfd	18263566-6943-425a-9604-c4a386945480
73271dd7-fb45-4b11-ad67-8aa551d8b54a	a877fa36-425a-4009-a1f6-04c5492a8fec
58ad50fd-0227-49b1-9637-07b75050fc4e	543f02d1-16cd-4507-b8ff-e444ba5c10a5
58ad50fd-0227-49b1-9637-07b75050fc4e	fb8b7ea6-8275-4251-98e5-7e1eed9f9f09
205ded5d-f571-45c2-9450-b56757ad32d8	c6d11230-5751-4093-ab7d-1accc0672e64
205ded5d-f571-45c2-9450-b56757ad32d8	3fef7c7c-a1cd-4a98-9f63-cde0c5ee8a49
60af1344-d7ac-4a91-bfb9-4bb5c1d8a3e2	fb8b7ea6-8275-4251-98e5-7e1eed9f9f09
924e21ae-2e24-4959-86ba-497bc1839e44	c9ca8b28-7467-4740-8387-db5d7bd4e44f
c64e5087-6838-4c4e-92b1-07081503b2b6	c9ca8b28-7467-4740-8387-db5d7bd4e44f
e2be06db-6028-42f5-97df-a228dccbd30c	4cc6ce1f-2e77-48b9-9f11-bbd672443edc
27bec2ba-e975-475c-9f3f-31c990f6682e	4cc6ce1f-2e77-48b9-9f11-bbd672443edc
b0fa7f8f-ee10-4487-8f56-d6002db4d5ea	a8a7bac4-b467-4ac3-8669-8696e01a7c2d
b0fa7f8f-ee10-4487-8f56-d6002db4d5ea	e94d8fa0-524a-4df5-98e0-277fcc0c20e4
e2be06db-6028-42f5-97df-a228dccbd30c	90aebae7-a1b5-4f98-a988-0e884a9e3f61
27bec2ba-e975-475c-9f3f-31c990f6682e	90aebae7-a1b5-4f98-a988-0e884a9e3f61
398aadf4-f85e-499d-819c-dbe985b25c04	7c4c5d8f-a867-4919-b723-5de63575877a
4c8d2893-e3e6-4f38-8750-3b98cc386f07	36f2e643-53cc-4194-a9a1-f693ecca8950
c8cfb9c9-e343-4b3e-b787-519f6dd71835	36f2e643-53cc-4194-a9a1-f693ecca8950
27bec2ba-e975-475c-9f3f-31c990f6682e	36f2e643-53cc-4194-a9a1-f693ecca8950
e2431100-5cf6-4370-86ca-bfade3a678bc	4446abad-40ce-443e-ae32-72c1557d7346
ef4f3b91-afcb-4c1a-9a51-a439f75a51cf	4446abad-40ce-443e-ae32-72c1557d7346
27bec2ba-e975-475c-9f3f-31c990f6682e	748e67d1-e513-45ef-84fd-7b72825e3572
e2be06db-6028-42f5-97df-a228dccbd30c	748e67d1-e513-45ef-84fd-7b72825e3572
ace9a60b-60ce-43f8-8329-b87edbc66d9e	3d038c7a-b03f-404b-9a47-2d2328ba6242
ace9a60b-60ce-43f8-8329-b87edbc66d9e	d22b807b-a066-49ee-b653-6a6cb9df8279
ace9a60b-60ce-43f8-8329-b87edbc66d9e	45918706-7867-4838-bc3f-461590da8ac6
398aadf4-f85e-499d-819c-dbe985b25c04	45918706-7867-4838-bc3f-461590da8ac6
48393850-3546-41b1-b865-5d363ec09f70	4cad9b21-440e-48b7-87e8-3912ea10c3ca
eee7dc83-0ec1-4cc2-b2c9-80c8601fb7a7	ff41ef1b-ad99-4c8d-9720-6334ec172ec3
48393850-3546-41b1-b865-5d363ec09f70	dc87916a-e5d6-4d33-b448-abb79c6f4344
ace9a60b-60ce-43f8-8329-b87edbc66d9e	d970bc12-059d-4eb3-9e33-1a49b26f23a2
ace9a60b-60ce-43f8-8329-b87edbc66d9e	0f3c9387-afb2-45fb-a30a-9a29dceb4f06
ce616089-4d35-43a1-a982-0f0f334e99d7	0f3c9387-afb2-45fb-a30a-9a29dceb4f06
ace9a60b-60ce-43f8-8329-b87edbc66d9e	8983d1e7-3fbd-4a86-8653-66d50b98168e
398aadf4-f85e-499d-819c-dbe985b25c04	ebb233f0-4783-4d8d-8b39-86398eab5ddb
ace9a60b-60ce-43f8-8329-b87edbc66d9e	09a12576-c631-4148-a01a-b0e4dad69852
ce616089-4d35-43a1-a982-0f0f334e99d7	f86ccf98-d528-4cd2-bfe8-27796e9aa65f
ce616089-4d35-43a1-a982-0f0f334e99d7	6dd5ee9c-2bf0-4970-938e-07865e4cb04f
27bec2ba-e975-475c-9f3f-31c990f6682e	6dd5ee9c-2bf0-4970-938e-07865e4cb04f
60af1344-d7ac-4a91-bfb9-4bb5c1d8a3e2	6dd5ee9c-2bf0-4970-938e-07865e4cb04f
68bc9b3e-d442-48f3-bf5f-bd0b1895e068	6dd5ee9c-2bf0-4970-938e-07865e4cb04f
398aadf4-f85e-499d-819c-dbe985b25c04	7d06d273-5260-401e-a91d-4132e855687a
ace9a60b-60ce-43f8-8329-b87edbc66d9e	7d06d273-5260-401e-a91d-4132e855687a
27bec2ba-e975-475c-9f3f-31c990f6682e	7d06d273-5260-401e-a91d-4132e855687a
9cb9fc9f-68d9-4074-b562-24862c25c325	7d06d273-5260-401e-a91d-4132e855687a
eee7dc83-0ec1-4cc2-b2c9-80c8601fb7a7	46e9484b-a996-486c-90af-1244af7665e8
398aadf4-f85e-499d-819c-dbe985b25c04	fe736301-a72d-4bd8-a7f9-2e3e5cb31763
398aadf4-f85e-499d-819c-dbe985b25c04	cd1b745c-1c9c-439c-870e-ea6ea574baa8
e2be06db-6028-42f5-97df-a228dccbd30c	2abefa9d-cf23-4672-8f29-216bba94ae7b
c8cfb9c9-e343-4b3e-b787-519f6dd71835	9c56008a-85da-445d-9fb5-d31d892a73e9
398aadf4-f85e-499d-819c-dbe985b25c04	c4483568-1502-4fe1-8570-2a7326aa64e1
398aadf4-f85e-499d-819c-dbe985b25c04	d22b807b-a066-49ee-b653-6a6cb9df8279
27bec2ba-e975-475c-9f3f-31c990f6682e	fcc36e8a-101e-47af-a780-98aebbb717fb
27bec2ba-e975-475c-9f3f-31c990f6682e	9c56008a-85da-445d-9fb5-d31d892a73e9
a0959249-99f1-46f7-be02-0593629e8bc0	48a29ce4-fdc9-4c2b-941d-5ea25c6cf221
a0959249-99f1-46f7-be02-0593629e8bc0	1a540624-ebb5-460e-b9ca-57d408f4023b
a0959249-99f1-46f7-be02-0593629e8bc0	4f297de4-9cac-4369-bdcb-3b6ce8579c41
8b2c113b-af84-4e03-a99c-32ff3a788237	5fbc991b-40a7-470c-a36b-4672d5df23ae
8b2c113b-af84-4e03-a99c-32ff3a788237	0a385dd4-aff3-47f8-ade3-cb81958a62b9
bd27c47f-c38f-4dfc-9cf0-dcd779e6ac71	7184857d-1385-4fad-a5c4-abb359657287
bd27c47f-c38f-4dfc-9cf0-dcd779e6ac71	4cc6ce1f-2e77-48b9-9f11-bbd672443edc
bd27c47f-c38f-4dfc-9cf0-dcd779e6ac71	90aebae7-a1b5-4f98-a988-0e884a9e3f61
bd27c47f-c38f-4dfc-9cf0-dcd779e6ac71	748e67d1-e513-45ef-84fd-7b72825e3572
bd27c47f-c38f-4dfc-9cf0-dcd779e6ac71	2abefa9d-cf23-4672-8f29-216bba94ae7b
f7dcf7fd-4d37-4b8b-b655-b8faedd1ecfd	83b3ccd3-5f4a-4717-b9b3-b15c82509107
\.


--
-- Data for Name: minifig; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.minifig (id, bricklink_id, is_unique, name, specification) FROM stdin;
57efe7c0-d46b-4f7c-a1d7-3c3f86730a93	sw0001b	f	Battle Droid	\N
e27423d1-29e3-43b1-9a9e-44a44287a1af	sw0001c	f	Battle Droid	\N
3df9faad-0341-41f5-adfa-9aa266c18e56	sw0001d	f	Battle Droid	\N
9223f0e0-dfa4-4bc7-bd52-1b6f6f304611	sw0005b	t	Scout Trooper	\N
c141be21-8603-43cd-ad5e-d30b2266bb64	sw0091	t	Clone Shock Trooper	Coruscant Guard
8b42d2ce-bdd0-413e-bfb8-611d951df6cd	sw0092	f	Super Battle Droid	\N
44aafdd7-da67-4638-8701-f886a3ea96ae	sw0115	f	Snowtrooper	\N
f92064d2-fcf3-411e-bb3a-4328641d0e1a	sw0126	f	Clone Trooper	Phase II
47c4d362-3e4c-444e-b7ac-0f0a22840f9a	sw0128a	t	Clone Trooper	327th Star Corps
81e887de-50b3-40d7-9668-a0f440e85fd0	sw0166a	f	Shadow Trooper	\N
054b3e50-64ff-4fcf-9706-483cf0d0c280	sw0187	f	Rebel Trooper	Fleet Trooper
d08f1560-7c9e-4724-b424-e20ffa0eab71	sw0188	f	Stormtrooper	\N
af61591c-fd98-4359-80fe-67bfa183b9a9	sw0201	f	Clone Trooper	Phase I
d67c9622-a8af-4a29-b09a-e5491aab8b1c	sw0221	f	Clone Gunner	\N
8aeacb43-cec2-4a76-ace3-744cb077af8e	sw0222	f	Elite Assassin Droid	\N
4b8f353b-bb22-485e-a690-208a913cf610	sw0223	t	Clone Commander	\N
a969b666-e946-4aa5-93fa-7fe6759278cb	sw0229	t	Assassin Droid	\N
d73961e3-acf2-44ce-8205-bdc33bb802ec	sw0258	t	Hoth Officer	\N
2e1b17ef-7180-4bdd-8c48-39c76acb827e	sw0259	t	Hoth Rebel Trooper	\N
205cc8b3-3bc1-4a8b-916e-04059eceac4a	sw0260	f	Zev Senesca	\N
d356b15a-d078-456f-9472-4aea1dcd12c2	sw0261	t	Imperial Officer	Battle Armor
38689b63-0b73-4d65-8bd8-aa852d091521	sw0262	f	AT-AT Driver	\N
a749535f-9d4d-4a8d-829b-a580184298de	sw0296	f	Mandalorian Death Watch Warrior	\N
76d3d200-8047-4320-8524-085a1842f37b	sw0297	t	ARF Trooper	91st Mobile Reconnaissance Corps, Lightning Squadron
1185eeec-47bb-4ac4-8dce-529cd876abcc	sw0298	t	Clone Trooper	Horn Company
74e42fee-8999-4912-8753-ba31a7b4a962	sw0299	t	Bomb Squad Trooper	\N
ca0574fe-ea57-4e9a-812e-de7da8086c89	sw0359	f	Commando Droid	\N
d59654cd-b6cd-4ce8-928e-b5dfb8a202f6	sw0366	f	Stormtrooper	\N
b06c0ca8-62fc-40ac-8ee2-04281b1432ea	sw0367	f	Endor Rebel Trooper	\N
76664924-785b-4542-9dda-fddcdaae1e86	sw0368	t	Endor Rebel Trooper	\N
96f078cb-88fd-4f7d-b84d-e4f8bf8283f0	sw0377	t	ARC Trooper Hammer	Rancor Battalion
d55eef40-84ce-4658-a45c-5d03ca527087	sw0378	t	ARF Trooper	Rancor Battalion
57c69098-b571-4aad-80b3-b0398a820444	sw0436	t	Sith Trooper	Red Armor
a75b1e50-8abb-4187-9b61-21764ace5b75	sw0438	t	Clone Sergeant	\N
38c54525-ec68-4a0d-834e-198970619d0f	sw0440	t	Republic Trooper	\N
c0901aad-8142-470b-9c95-96c7eacac646	sw0441	t	Droideka	\N
15da757b-91a9-456f-a245-443a2c9d3efe	sw0442	f	Clone Trooper	Phase I
75c7b1e9-d9ba-44bb-b3ca-9fd727018f72	sw0443	f	Sith Trooper	Black Armor
c3b0bb2d-b4d9-4d2d-aca4-09c870bbf154	sw0444	t	Republic Trooper	\N
cd43dc72-b478-4a2a-ab23-98952d47a90e	sw0518	f	Clone Scout Trooper	41st Elite Corps, Kashyyyk Camo
57d4b717-f0ef-4b1b-a6d0-5f06b38a681d	sw0519	f	Clone Trooper	41st Elite Corps, Kashyyyk Camo
04d82cfb-7e4f-4ad0-8859-205db1108a36	sw0520	t	Imperial Gunner	\N
83e07a35-1893-45fe-91fa-f064fe90e941	sw0521	f	Royal Guard	\N
b5274fe5-06cb-409f-adea-2337f3aab43d	sw0522	t	Clone Trooper	212th Attack Battalion
2e0231a5-6290-4769-af14-7bbde7312827	sw0523	t	Airborne Trooper	212th Attack Battalion
3113b138-8091-44d5-8129-883309e26a7a	sw0524	t	BARC Trooper	91st Mobile Reconnaissance Corps
01108317-5306-45b6-8325-06d5935c723a	sw0529	f	Imperial Gunner	\N
d0dedb31-1ff3-481c-8a89-fb9347e721ae	sw0578	f	Stormtrooper	\N
b4cd07e5-520c-4d57-8cb1-5fb1d37181d9	sw0585	f	Stormtrooper	\N
07a993ba-9da2-4a15-8fe6-ac42624cdb47	sw0603	t	Shadow Stormtrooper	\N
3b7e084b-3bb7-427a-9594-fbc3e19de57a	sw0604	t	Shadow Guard	\N
ae47c990-4315-485e-897e-c391bdab0d63	sw0605	t	Airborne Trooper	Geonosis Camo
9386f936-8c14-47cf-a227-c1b56fa3d1b6	sw0606	t	Clone Trooper	Geonosis Camo
1477bde3-04d7-46e1-9445-1d3dec11cea9	sw0613	t	Senate Commando Captain	\N
1f77a3f6-aa26-4b79-966a-eadbe6ee9321	sw0614	t	Senate Commando	\N
42c20cc2-64c9-4eb7-a337-38974e46c66c	sw0617	t	Stormtrooper	\N
bcfba03d-bec7-487d-9a1d-d19913a5c621	sw0620	f	Tusken Raider	\N
9c53a560-0f40-4eea-a521-1ac316e99874	sw0666	f	First Order Flametrooper	\N
7e7b1258-bdbc-4181-977d-b3f3b8e8f496	sw0667	f	First Order Stormtrooper	\N
25eeb88f-a190-411f-8268-4cf5b17426a0	sw0671	f	First Order Fleet Engineer	\N
cd958cfb-07d5-4246-896a-b5b1c17c2113	sw0687	t	Rodian Alliance Fighter	\N
03ce51a2-1ca4-4861-ada1-9baef324e2f4	sw0688	t	Rebel Trooper	\N
bbb13e6b-fda0-4b0b-83ba-0478c8dc5a1f	sw0689	t	Duros Alliance Fighter	\N
693808c1-f912-473f-a16e-ab497a79f1f5	sw0690	t	Rebel Trooper	\N
3398913d-4216-473d-ab9f-39e64762f49b	sw0691	t	Jump Trooper	\N
20fa3fb0-39ba-48b0-985b-fbafcdc28230	sw0692	t	Imperial Shock Trooper	\N
52813816-020d-44d4-90c4-04f4bf16fac9	sw0693	t	Imperial Crewman	\N
17ce1a97-c5c5-4a2c-9cd7-4118c6e4c8f9	sw0694	t	First Order Crewman	\N
4f696b42-5b29-457a-891e-a84c43614426	sw0695	t	First Order Heavy Assault Stormtrooper	\N
4fb5deb0-b9a1-4401-971d-6bf0fa118135	sw0696	t	Resistance Trooper	\N
c83af5c1-352c-4892-b478-b260c422ca24	sw0697	t	Resistance Trooper	\N
29dfe928-eabe-4a85-b861-5d553726a06f	sw0698	t	Resistance Trooper	\N
7d583ecb-c2dd-48bf-8e20-86039ca901c4	sw0699	t	Resistance Officer	\N
1c501a0a-7d72-4375-997e-9a59d897bf09	sw0751	f	Dengar	\N
cf126b82-a0e2-4900-92a0-9a46860fd1f8	sw0803	t	Private Kappehl	Rebel Trooper
3e202688-f4c8-41fc-b3d3-a039c4127ec2	sw0804	t	Corporal Rostok	Rebel Trooper
d9dcd97b-94a3-4243-bdeb-15eb90d4f156	sw0805	t	Private Calfor	Rebel Trooper
bb95d42e-daa3-46d1-bed0-3839d65f710a	sw0806	t	Corporal Tonc	Rebel Trooper
764b11a4-d59b-4601-927d-f6ce889a7760	sw0807	f	Death Trooper	\N
8fef5471-02fb-4fb9-afdd-c5eb72499e36	sw0828	t	Bossk	\N
8d3a332b-1c90-4224-ad33-968611498ea8	sw0830	f	4-LOM	\N
2e165b79-a9a0-40ee-8cc7-4e4395cd32b4	sw0831a	f	IG-88	\N
41cd2384-f974-4c08-9990-93cd32a1d754	sw0832	t	Colonel Datoo	First Order Officer
44d5352e-24c8-45d9-a5a4-4c7011691c82	sw0871	f	First Order Shuttle Pilot	\N
34aacf94-8481-420c-90ce-0da684531ca1	sw0886	t	First Order Stormtrooper Executioner	\N
3448d868-0eb7-4142-af74-70c3a65373aa	sw0895	t	R3-T2	\N
134334c9-bc8d-4460-8a0e-7c708dc043cb	sw0896	f	Jawa	\N
952c7d41-ffea-4a66-bd8a-1940ff945fc7	sw0897	f	Jawa	\N
32fab6ac-8c74-4d98-9601-2151681baea6	sw0905	f	First Order Stormtrooper	\N
644110df-cab5-4219-b191-a8e164a04310	sw0909	t	Barriss Offee	\N
fe81b0a2-ecfd-4425-b4d0-37fa50f2d690	sw0910	t	Clone Trooper	Phase I
8bbe0c43-343f-4104-8f31-cd77d03d3155	sw0911	t	Ki-Adi-Mundi	\N
3e63d73f-ac12-4f36-84aa-7658eb71e5b9	sw0912	t	Corporal Latt	Imperial Emigration Officer
78c9838f-96d4-4eff-a4e1-3a0f2ce85ac3	sw0913	t	Imperial Recruitment Officer	\N
ac205021-c570-4a77-ba63-467015568067	sw0914	t	Imperial Patrol Trooper	\N
ec99ad93-5d55-4e31-b2ea-6cb12aa63a0f	sw0986	t	Inferno Squad Agent	\N
f302ff7a-deae-406b-aeee-a54a896c2fdc	sw0987	t	Inferno Squad Agent	\N
cd642e4a-20cf-4d2b-b250-ae6ac49f5f6b	sw0988	t	Inferno Squad Agent	\N
9bcd6567-35b4-4cff-9c97-b4c7cb04f46f	sw0989	t	Elite Praetorian Guard	\N
4e3ca8b6-34aa-4991-966f-1f3d820bd447	sw0990	f	Elite Praetorian Guard	\N
218d5413-5093-407c-8fa8-d4967f3500b1	sw0997b	f	Stormtrooper	\N
667cdfa3-c106-4b42-86dc-212ed4066cb9	sw0998	t	Praetorian Training Droid	\N
5fdab380-b6e5-4695-a828-066d169c8821	sw1000	t	Iden Versio	Inferno Squad Commander
a14f4178-806c-4a7c-8a8d-dacd8001466a	sw1031	t	Shadow Trooper	\N
1fc60e0a-01da-4baf-8bc3-c95c3355fb96	sw1032	t	Han Solo	20th Anniversary
cd1a1e28-2319-4d40-a61c-83d0f6bda247	sw1065	f	Sith Trooper	\N
18eb514a-3acd-4c46-8a87-9d5ae805bb5d	sw1075	t	Sith Jet Trooper	\N
50ce0acc-35da-4b4b-82f2-b0b59a432db6	sw1076	t	Sith Fleet Officer	\N
233ef2f6-92c4-4692-9c42-1bc530832afa	sw1077	t	Mandalorian Tribe Warrior	\N
340a93a4-0974-40f0-a4cc-43a324f26a50	sw1078	f	Mandalorian Tribe Warrior	\N
2a9f3756-f1f6-4a70-a76d-a6185b6b3c69	sw1079	t	Mandalorian Tribe Warrior	\N
a6597bfb-ea32-4d61-8cc9-674fe9c4d672	sw1080	t	Mandalorian Tribe Warrior	\N
bc415a01-36f2-4acc-a0c7-111fe67d8d1d	sw1093	t	Clone Jet Trooper	501st Legion
41fb3a58-fee7-4811-b261-ec74e4ddd2e3	sw1094	f	Clone Trooper	501st Legion
695cd895-89e4-4e89-bf66-c8eed56b7772	sw1178	f	Snowtrooper	\N
fec90fa0-f610-410d-a01a-2af0074f86ed	sw1179	f	Snowtrooper	\N
1ce37d3f-8932-4447-9e69-da4b74092683	sw1181	f	Snowtrooper	\N
a8c6e733-7575-4488-bee0-bc9525ffbe40	sw1182	t	Scout Trooper	Hoth
edd9b15e-e32b-430d-80ce-d09106d494da	sw1246	t	Clone Officer	501st Legion
56d0dca5-cc0b-4a71-b9a6-f89eb56701c7	sw1247	t	Clone Heavy Trooper	501st Legion
82ff8c2d-3a2d-4d2d-8e3c-af8a0fa552af	sw1248	t	Clone Specialist	501st Legion
f299b2fa-7c81-4dcd-a173-d4b85b6538d0	sw1276	t	Clone Trooper	501st Legion, 332nd Company
0dad5e59-f9db-428d-9975-7bfc62994ac8	sw1277	t	Captain Vaughn	501st Legion, 332nd Company
80939592-9d3c-43da-a52d-8d9ec57aff2d	sw1305	t	Clone Shock Trooper	Coruscant Guard
fc62c3e3-6c9b-4b78-951b-769b8eb1bf1b	sw1319	t	Clone Trooper	Phase II
d8a4c98b-8f95-4b2c-b7dc-7ad579bc0ae3	sw1320	t	Battle Droid	\N
e9e1754c-e8d3-483a-a423-df7ea9cd01e6	sw1321	f	Super Battle Droid	\N
f5bf9f4c-bffa-4aa2-9e82-66e2a4368cf7	sw1344	t	Mandalorian Nite Owl	\N
e7751bbb-ceb5-4fc2-a9bc-15cecd457250	sw1345	t	Mandalorian Warrior	\N
44c7039f-774e-400b-98be-c40d82c4aa7f	sw1346	t	Imperial Commando	\N
3876bccc-4ba1-4082-bfa8-2e14bc2789aa	sw1358	t	Night Trooper	\N
bf22aa6c-6c8e-4e76-adbe-a7d51c50b3f1	sw1416	t	Death Trooper	Thrawn
2a978cdb-c4b2-4a25-9f21-1eb1c4b8d97b	sw1417	t	Night Trooper	\N
53767b5f-3dc7-4371-b81f-3f400f2ac46b	sw1422	t	Clone Trooper	327th Star Corps
323d3c51-3697-498d-941f-68b206a6c3d4	sw1423	t	Clone Trooper	327th Star Corps
0f93d61b-d703-4726-aea0-d9e43b0f0ad1	sw1487	t	Mandalorian Super Commando	\N
f5a3c67b-1ea6-4481-9de6-66a9ee3bfdbb	sw1486	t	Mandalorian Super Commando	\N
b1806865-42e7-4bfd-bef6-d721f9e2ce1c	sw1278	f	Clone Trooper	501st Legion, 332nd Company
\.


--
-- Data for Name: minifig_in_battle_pack; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.minifig_in_battle_pack (battle_pack, minifig, count) FROM stdin;
dd3ee736-3bd6-4e6b-a013-365d6704453f	57efe7c0-d46b-4f7c-a1d7-3c3f86730a93	4
dd3ee736-3bd6-4e6b-a013-365d6704453f	8b42d2ce-bdd0-413e-bfb8-611d951df6cd	3
6bc6a3e5-7b1b-4a01-becd-18927d8f4b7e	c141be21-8603-43cd-ad5e-d30b2266bb64	1
6bc6a3e5-7b1b-4a01-becd-18927d8f4b7e	f92064d2-fcf3-411e-bb3a-4328641d0e1a	2
6bc6a3e5-7b1b-4a01-becd-18927d8f4b7e	47c4d362-3e4c-444e-b7ac-0f0a22840f9a	1
6db3941a-a3da-41ae-a10f-2f7e4fb39dcf	81e887de-50b3-40d7-9668-a0f440e85fd0	1
6db3941a-a3da-41ae-a10f-2f7e4fb39dcf	d08f1560-7c9e-4724-b424-e20ffa0eab71	3
889ab099-a163-4959-9697-5edeadf6df63	054b3e50-64ff-4fcf-9706-483cf0d0c280	4
c06f9620-2c6e-433e-a868-6e0ae704ea04	76d3d200-8047-4320-8524-085a1842f37b	1
c06f9620-2c6e-433e-a868-6e0ae704ea04	1185eeec-47bb-4ac4-8dce-529cd876abcc	1
c06f9620-2c6e-433e-a868-6e0ae704ea04	74e42fee-8999-4912-8753-ba31a7b4a962	2
d3220f0f-1fe7-4784-8b97-38773c4c5f43	a749535f-9d4d-4a8d-829b-a580184298de	4
4a93e7f1-81c3-4d62-b1a7-83b4cdc8d17d	af61591c-fd98-4359-80fe-67bfa183b9a9	2
4a93e7f1-81c3-4d62-b1a7-83b4cdc8d17d	d67c9622-a8af-4a29-b09a-e5491aab8b1c	1
4a93e7f1-81c3-4d62-b1a7-83b4cdc8d17d	4b8f353b-bb22-485e-a690-208a913cf610	1
cf65b1a6-7367-4afc-a005-f434f26e98e3	8aeacb43-cec2-4a76-ace3-744cb077af8e	2
cf65b1a6-7367-4afc-a005-f434f26e98e3	a969b666-e946-4aa5-93fa-7fe6759278cb	3
94ba12dc-9e19-47da-b840-aa8316f773c5	d73961e3-acf2-44ce-8205-bdc33bb802ec	1
94ba12dc-9e19-47da-b840-aa8316f773c5	2e1b17ef-7180-4bdd-8c48-39c76acb827e	2
94ba12dc-9e19-47da-b840-aa8316f773c5	205cc8b3-3bc1-4a8b-916e-04059eceac4a	1
c4a6da9b-5e81-4a80-853e-4144fd811287	44aafdd7-da67-4638-8701-f886a3ea96ae	2
c4a6da9b-5e81-4a80-853e-4144fd811287	d356b15a-d078-456f-9472-4aea1dcd12c2	1
c4a6da9b-5e81-4a80-853e-4144fd811287	38689b63-0b73-4d65-8bd8-aa852d091521	1
380c7c06-5e33-413e-87cf-3367a666e1e9	ca0574fe-ea57-4e9a-812e-de7da8086c89	2
380c7c06-5e33-413e-87cf-3367a666e1e9	96f078cb-88fd-4f7d-b84d-e4f8bf8283f0	1
380c7c06-5e33-413e-87cf-3367a666e1e9	d55eef40-84ce-4658-a45c-5d03ca527087	1
2dbdf344-eabe-4bd7-82b8-199a39229139	9223f0e0-dfa4-4bc7-bd52-1b6f6f304611	1
2dbdf344-eabe-4bd7-82b8-199a39229139	d59654cd-b6cd-4ce8-928e-b5dfb8a202f6	1
2dbdf344-eabe-4bd7-82b8-199a39229139	b06c0ca8-62fc-40ac-8ee2-04281b1432ea	1
2dbdf344-eabe-4bd7-82b8-199a39229139	76664924-785b-4542-9dda-fddcdaae1e86	1
c3b0f6a3-adcf-403d-9a9e-640161558fdc	a75b1e50-8abb-4187-9b61-21764ace5b75	1
c3b0f6a3-adcf-403d-9a9e-640161558fdc	c0901aad-8142-470b-9c95-96c7eacac646	2
c3b0f6a3-adcf-403d-9a9e-640161558fdc	15da757b-91a9-456f-a245-443a2c9d3efe	1
dd27163e-0852-4e3f-89db-761937f622e7	57c69098-b571-4aad-80b3-b0398a820444	1
dd27163e-0852-4e3f-89db-761937f622e7	38c54525-ec68-4a0d-834e-198970619d0f	1
dd27163e-0852-4e3f-89db-761937f622e7	75c7b1e9-d9ba-44bb-b3ca-9fd727018f72	1
dd27163e-0852-4e3f-89db-761937f622e7	c3b0bb2d-b4d9-4d2d-aca4-09c870bbf154	1
a60458df-6e98-408b-8af1-9e2b8c39da51	04d82cfb-7e4f-4ad0-8859-205db1108a36	1
a60458df-6e98-408b-8af1-9e2b8c39da51	83e07a35-1893-45fe-91fa-f064fe90e941	2
a60458df-6e98-408b-8af1-9e2b8c39da51	01108317-5306-45b6-8325-06d5935c723a	1
24f0c54e-c9d5-4ab6-bde7-039beb4055e6	cd43dc72-b478-4a2a-ab23-98952d47a90e	2
24f0c54e-c9d5-4ab6-bde7-039beb4055e6	57d4b717-f0ef-4b1b-a6d0-5f06b38a681d	2
21d10f79-eedf-4d3b-9d8a-a518ca24135a	b5274fe5-06cb-409f-adea-2337f3aab43d	2
21d10f79-eedf-4d3b-9d8a-a518ca24135a	2e0231a5-6290-4769-af14-7bbde7312827	2
7f70e24d-4c81-417d-a450-096c90bba071	57efe7c0-d46b-4f7c-a1d7-3c3f86730a93	1
7f70e24d-4c81-417d-a450-096c90bba071	e27423d1-29e3-43b1-9a9e-44a44287a1af	1
7f70e24d-4c81-417d-a450-096c90bba071	8b42d2ce-bdd0-413e-bfb8-611d951df6cd	2
7f70e24d-4c81-417d-a450-096c90bba071	3113b138-8091-44d5-8129-883309e26a7a	1
49f030a9-2b8b-43ab-8784-83f6f5288421	d0dedb31-1ff3-481c-8a89-fb9347e721ae	2
49f030a9-2b8b-43ab-8784-83f6f5288421	42c20cc2-64c9-4eb7-a337-38974e46c66c	2
9809d0a2-0303-4cab-8130-be250d00b732	07a993ba-9da2-4a15-8fe6-ac42624cdb47	2
9809d0a2-0303-4cab-8130-be250d00b732	3b7e084b-3bb7-427a-9594-fbc3e19de57a	2
4154439c-f3ac-4178-809c-22cd06224f5c	1477bde3-04d7-46e1-9445-1d3dec11cea9	1
4154439c-f3ac-4178-809c-22cd06224f5c	1f77a3f6-aa26-4b79-966a-eadbe6ee9321	3
d65ae804-a9f6-41cc-a3d5-6f61604b0e38	ae47c990-4315-485e-897e-c391bdab0d63	2
d65ae804-a9f6-41cc-a3d5-6f61604b0e38	9386f936-8c14-47cf-a227-c1b56fa3d1b6	2
058e91b0-0b88-4233-ac4a-74396516283f	4fb5deb0-b9a1-4401-971d-6bf0fa118135	1
058e91b0-0b88-4233-ac4a-74396516283f	c83af5c1-352c-4892-b478-b260c422ca24	1
058e91b0-0b88-4233-ac4a-74396516283f	29dfe928-eabe-4a85-b861-5d553726a06f	1
058e91b0-0b88-4233-ac4a-74396516283f	7d583ecb-c2dd-48bf-8e20-86039ca901c4	1
0302c8e9-c158-44e0-aa3d-4c02a4c7fcaf	7e7b1258-bdbc-4181-977d-b3f3b8e8f496	1
0302c8e9-c158-44e0-aa3d-4c02a4c7fcaf	25eeb88f-a190-411f-8268-4cf5b17426a0	1
0302c8e9-c158-44e0-aa3d-4c02a4c7fcaf	17ce1a97-c5c5-4a2c-9cd7-4118c6e4c8f9	1
0302c8e9-c158-44e0-aa3d-4c02a4c7fcaf	4f696b42-5b29-457a-891e-a84c43614426	1
413c11d7-73d6-4447-bedc-ad7f721403b4	cd958cfb-07d5-4246-896a-b5b1c17c2113	1
413c11d7-73d6-4447-bedc-ad7f721403b4	03ce51a2-1ca4-4861-ada1-9baef324e2f4	1
413c11d7-73d6-4447-bedc-ad7f721403b4	bbb13e6b-fda0-4b0b-83ba-0478c8dc5a1f	1
413c11d7-73d6-4447-bedc-ad7f721403b4	693808c1-f912-473f-a16e-ab497a79f1f5	1
883da909-2f02-4622-a883-407ca930f24e	3398913d-4216-473d-ab9f-39e64762f49b	2
883da909-2f02-4622-a883-407ca930f24e	20fa3fb0-39ba-48b0-985b-fbafcdc28230	1
883da909-2f02-4622-a883-407ca930f24e	52813816-020d-44d4-90c4-04f4bf16fac9	1
b8eb7c47-f56b-4803-a2d5-2c37c04d6368	cf126b82-a0e2-4900-92a0-9a46860fd1f8	1
b8eb7c47-f56b-4803-a2d5-2c37c04d6368	3e202688-f4c8-41fc-b3d3-a039c4127ec2	1
b8eb7c47-f56b-4803-a2d5-2c37c04d6368	d9dcd97b-94a3-4243-bdeb-15eb90d4f156	1
b8eb7c47-f56b-4803-a2d5-2c37c04d6368	bb95d42e-daa3-46d1-bed0-3839d65f710a	1
99a6a114-5d75-474b-9a2a-7aa669a3fc62	b4cd07e5-520c-4d57-8cb1-5fb1d37181d9	2
99a6a114-5d75-474b-9a2a-7aa669a3fc62	764b11a4-d59b-4601-927d-f6ce889a7760	2
0b41d1a1-f844-4d14-9274-60bfc05cdde4	9c53a560-0f40-4eea-a521-1ac316e99874	1
0b41d1a1-f844-4d14-9274-60bfc05cdde4	7e7b1258-bdbc-4181-977d-b3f3b8e8f496	2
0b41d1a1-f844-4d14-9274-60bfc05cdde4	41cd2384-f974-4c08-9990-93cd32a1d754	1
e67ea8dd-08a5-4156-9711-d83049ef2676	1c501a0a-7d72-4375-997e-9a59d897bf09	1
e67ea8dd-08a5-4156-9711-d83049ef2676	8fef5471-02fb-4fb9-afdd-c5eb72499e36	1
e67ea8dd-08a5-4156-9711-d83049ef2676	8d3a332b-1c90-4224-ad33-968611498ea8	1
e67ea8dd-08a5-4156-9711-d83049ef2676	2e165b79-a9a0-40ee-8cc7-4e4395cd32b4	1
4dc4e39c-b4c3-4056-9ff4-e8873384a820	25eeb88f-a190-411f-8268-4cf5b17426a0	1
4dc4e39c-b4c3-4056-9ff4-e8873384a820	44d5352e-24c8-45d9-a5a4-4c7011691c82	1
4dc4e39c-b4c3-4056-9ff4-e8873384a820	34aacf94-8481-420c-90ce-0da684531ca1	2
959662bb-ba18-4d45-b3f9-cb79b346a2aa	bcfba03d-bec7-487d-9a1d-d19913a5c621	1
959662bb-ba18-4d45-b3f9-cb79b346a2aa	3448d868-0eb7-4142-af74-70c3a65373aa	1
959662bb-ba18-4d45-b3f9-cb79b346a2aa	134334c9-bc8d-4460-8a0e-7c708dc043cb	1
959662bb-ba18-4d45-b3f9-cb79b346a2aa	952c7d41-ffea-4a66-bd8a-1940ff945fc7	1
dfe27f2a-32bc-4a3c-880f-d52e7570e3ec	644110df-cab5-4219-b191-a8e164a04310	1
dfe27f2a-32bc-4a3c-880f-d52e7570e3ec	fe81b0a2-ecfd-4425-b4d0-37fa50f2d690	2
dfe27f2a-32bc-4a3c-880f-d52e7570e3ec	8bbe0c43-343f-4104-8f31-cd77d03d3155	1
b3e3dda5-a622-45e8-8719-cda773ef65c1	3e63d73f-ac12-4f36-84aa-7658eb71e5b9	1
b3e3dda5-a622-45e8-8719-cda773ef65c1	78c9838f-96d4-4eff-a4e1-3a0f2ce85ac3	1
b3e3dda5-a622-45e8-8719-cda773ef65c1	ac205021-c570-4a77-ba63-467015568067	2
559374e0-b45d-4985-84e3-b955391cc06c	32fab6ac-8c74-4d98-9601-2151681baea6	1
559374e0-b45d-4985-84e3-b955391cc06c	9bcd6567-35b4-4cff-9c97-b4c7cb04f46f	2
559374e0-b45d-4985-84e3-b955391cc06c	4e3ca8b6-34aa-4991-966f-1f3d820bd447	1
559374e0-b45d-4985-84e3-b955391cc06c	667cdfa3-c106-4b42-86dc-212ed4066cb9	1
f8865ec0-66dc-4901-93d4-498fd7478db2	ec99ad93-5d55-4e31-b2ea-6cb12aa63a0f	1
f8865ec0-66dc-4901-93d4-498fd7478db2	f302ff7a-deae-406b-aeee-a54a896c2fdc	1
f8865ec0-66dc-4901-93d4-498fd7478db2	cd642e4a-20cf-4d2b-b250-ae6ac49f5f6b	1
f8865ec0-66dc-4901-93d4-498fd7478db2	5fdab380-b6e5-4695-a828-066d169c8821	1
2c873a09-cecf-4969-826b-9a4bd9a63c39	218d5413-5093-407c-8fa8-d4967f3500b1	3
2c873a09-cecf-4969-826b-9a4bd9a63c39	a14f4178-806c-4a7c-8a8d-dacd8001466a	1
2c873a09-cecf-4969-826b-9a4bd9a63c39	1fc60e0a-01da-4baf-8bc3-c95c3355fb96	1
2b117eaa-b131-4b7c-8bf0-c3d3e2b37411	cd1a1e28-2319-4d40-a61c-83d0f6bda247	1
2b117eaa-b131-4b7c-8bf0-c3d3e2b37411	18eb514a-3acd-4c46-8a87-9d5ae805bb5d	2
2b117eaa-b131-4b7c-8bf0-c3d3e2b37411	50ce0acc-35da-4b4b-82f2-b0b59a432db6	1
d94192c0-2500-4b80-9059-fecbfa3732f2	233ef2f6-92c4-4692-9c42-1bc530832afa	1
d94192c0-2500-4b80-9059-fecbfa3732f2	340a93a4-0974-40f0-a4cc-43a324f26a50	1
d94192c0-2500-4b80-9059-fecbfa3732f2	2a9f3756-f1f6-4a70-a76d-a6185b6b3c69	1
d94192c0-2500-4b80-9059-fecbfa3732f2	a6597bfb-ea32-4d61-8cc9-674fe9c4d672	1
c263193f-a7e3-43f4-8df3-fd108287286b	e27423d1-29e3-43b1-9a9e-44a44287a1af	2
c263193f-a7e3-43f4-8df3-fd108287286b	bc415a01-36f2-4acc-a0c7-111fe67d8d1d	1
c263193f-a7e3-43f4-8df3-fd108287286b	41fb3a58-fee7-4811-b261-ec74e4ddd2e3	3
b0fb314c-15b9-4e90-b8e0-7c67336d0c74	695cd895-89e4-4e89-bf66-c8eed56b7772	1
b0fb314c-15b9-4e90-b8e0-7c67336d0c74	fec90fa0-f610-410d-a01a-2af0074f86ed	1
b0fb314c-15b9-4e90-b8e0-7c67336d0c74	1ce37d3f-8932-4447-9e69-da4b74092683	1
b0fb314c-15b9-4e90-b8e0-7c67336d0c74	a8c6e733-7575-4488-bee0-bc9525ffbe40	1
0279e9fb-bd6f-4fa6-9230-4840495824e9	edd9b15e-e32b-430d-80ce-d09106d494da	1
0279e9fb-bd6f-4fa6-9230-4840495824e9	56d0dca5-cc0b-4a71-b9a6-f89eb56701c7	2
0279e9fb-bd6f-4fa6-9230-4840495824e9	82ff8c2d-3a2d-4d2d-8e3c-af8a0fa552af	1
1fa5fd99-3c4b-411e-848c-d84856150719	f299b2fa-7c81-4dcd-a173-d4b85b6538d0	2
1fa5fd99-3c4b-411e-848c-d84856150719	0dad5e59-f9db-428d-9975-7bfc62994ac8	1
1fa5fd99-3c4b-411e-848c-d84856150719	b1806865-42e7-4bfd-bef6-d721f9e2ce1c	1
5947f2da-12ad-4f1b-a29f-6eb02fdad37f	3df9faad-0341-41f5-adfa-9aa266c18e56	1
5947f2da-12ad-4f1b-a29f-6eb02fdad37f	80939592-9d3c-43da-a52d-8d9ec57aff2d	1
5947f2da-12ad-4f1b-a29f-6eb02fdad37f	fc62c3e3-6c9b-4b78-951b-769b8eb1bf1b	3
5947f2da-12ad-4f1b-a29f-6eb02fdad37f	d8a4c98b-8f95-4b2c-b7dc-7ad579bc0ae3	1
5947f2da-12ad-4f1b-a29f-6eb02fdad37f	e9e1754c-e8d3-483a-a423-df7ea9cd01e6	3
b704356b-0483-49a9-94a6-c9d114084b15	f5bf9f4c-bffa-4aa2-9e82-66e2a4368cf7	1
b704356b-0483-49a9-94a6-c9d114084b15	e7751bbb-ceb5-4fc2-a9bc-15cecd457250	1
b704356b-0483-49a9-94a6-c9d114084b15	44c7039f-774e-400b-98be-c40d82c4aa7f	2
15f102e6-6560-476c-85f5-1203e1ba9a3d	3876bccc-4ba1-4082-bfa8-2e14bc2789aa	1
15f102e6-6560-476c-85f5-1203e1ba9a3d	bf22aa6c-6c8e-4e76-adbe-a7d51c50b3f1	2
15f102e6-6560-476c-85f5-1203e1ba9a3d	2a978cdb-c4b2-4a25-9f21-1eb1c4b8d97b	1
094fac7a-d456-436d-9102-9a5bbb724a03	53767b5f-3dc7-4371-b81f-3f400f2ac46b	3
094fac7a-d456-436d-9102-9a5bbb724a03	323d3c51-3697-498d-941f-68b206a6c3d4	1
094fac7a-d456-436d-9102-9a5bbb724a03	e9e1754c-e8d3-483a-a423-df7ea9cd01e6	3
ab64eb59-7a4a-4118-9a26-151d7b5e83cd	b1806865-42e7-4bfd-bef6-d721f9e2ce1c	2
ab64eb59-7a4a-4118-9a26-151d7b5e83cd	0f93d61b-d703-4726-aea0-d9e43b0f0ad1	1
ab64eb59-7a4a-4118-9a26-151d7b5e83cd	f5a3c67b-1ea6-4481-9de6-66a9ee3bfdbb	1
\.


--
-- Data for Name: song; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.song (id, game, title, track_number) FROM stdin;
c6b65c62-0f0c-4224-b13c-97c066e375f3	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Once Upon a Time	1
fd3f83fd-0f4b-45c6-b45f-571d32225901	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Start Menu	2
6658eb0c-6774-4ae1-afe3-b07bc733239b	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Your Best Friend	3
7349d962-8ca3-4a7d-971d-3c26b080f94b	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Fallen Down	4
175b6be6-1377-452b-a29a-dd19b090bafb	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Ruins	5
bf4cf56c-6ca1-444d-ab07-2354fc738c30	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Uwa!! So Temperate♫	6
93ad3587-5057-4b59-9657-78fe2ef28532	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Anticipation	7
705a1b54-b6d6-4c0f-bd0c-aedf0c515867	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Unnecessary Tension	8
cb822319-01e2-477a-8f93-6faa915d07ee	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Enemy Approaching	9
684d7582-fa77-45f0-abd9-8cbf33f5e70d	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Ghost Fight	10
c802a0bc-39c8-4480-ad19-2fd632027eea	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Determination	11
e4eea6fd-8fd8-4d0e-a6c6-e5457fd68d0b	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Home	12
e8d747a0-1b94-4c3a-b147-61c6998b2391	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Home (Music Box)	13
eb0a2f89-96df-4d29-abeb-33bbf63a7fc9	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Heartache	14
6d0fadff-b109-4200-89b7-29802b65bd22	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	sans.	15
2a6dca3b-ccd8-4da8-85e0-4757ac0b4596	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Nyeh Heh Heh!	16
5204cb2e-d256-4140-91c5-c9a3a4a66cf4	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Snowy	17
7de74813-0cff-467d-9431-be9b820bfb77	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Uwa!! So Holiday♫	18
ead26c60-2210-4c39-8b98-58ffedbb2c29	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Dogbass	19
d16f6bd1-41c0-4c5e-a476-bd9b3a9b6b87	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Mysterious Place	20
f3b3e854-4f82-485e-96d0-5502ee951c56	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Snowdin Town	22
bacf938f-723d-4838-a581-68c13d619b4e	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Shop	23
169a9bb1-4fae-41b5-ae01-0092aa49fa96	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Bonetrousle	24
64d9ce6a-0070-46b4-8f97-f266bc1d0bed	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Dating Start!	25
efedd64a-881d-4377-9bca-0159f1097a35	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Dating Tense!	26
e8cceef5-9e02-4df9-8dd8-124fed49b3dc	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Dating Fight!	27
ad8d3162-89fd-4784-932d-2413072fc9f3	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Premonition	28
688830b5-c3b0-47aa-bcd7-9fedee769f3f	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Danger Mystery	29
154090e9-0b1b-4af9-9081-c613adec7df4	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Undyne	30
c984d4d8-e48f-4454-9fe7-bbacb62ded6b	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Waterfall	31
8df3cdcd-df7e-427c-b03e-97dce7e4e77b	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Run!	32
bc1c9e34-464f-40c7-b213-0bd9030a6630	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Quiet Water	33
fc0d55d5-7f6c-4e03-b421-54a8661d7293	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Memory	34
2770c2c0-ace8-4ee2-b898-55711da5d163	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Bird That Carries You Over A Disproportionately Small Gap	35
318b2889-5188-4fef-b8f0-239434a6b621	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Dummy!	36
0cb593cd-2f53-4da5-aa0f-417d733e4e11	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Pathetic House	37
77ebb8e4-0bab-46d5-983b-72327f9003d5	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Spooktune	38
f50f4dbd-6dd4-4a22-b15f-dd5b67bf784a	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Spookwave	39
5fbc991b-40a7-470c-a36b-4672d5df23ae	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Ghouliday	40
e41b730d-d206-41b7-b7b1-b71e763666e6	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Chill	41
1e9070fd-242a-4d42-a1f4-0e71ca352196	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Thundersnail	42
f46274c4-591b-4b31-8230-5ab7904e3577	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Temmie Village	43
8151823e-267e-4e21-bac1-24ceb6d72078	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Tem Shop	44
3bf2f291-3c78-4544-af1e-6c5622f2f84c	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	NGAHHH!!	45
dbeb5fbd-c27d-469a-9de5-3ed37e6b5fef	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Spear of Justice	46
03226a16-78c2-4f6d-a589-bf52c49854b8	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Ooo	47
37cc8403-1aa6-4856-895c-7fce711a1689	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Alphys	48
ba4a3357-52ff-4016-a579-68d0d03fd473	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	It's Showtime!	49
f27fa242-a186-4748-97a6-437a496e3db9	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Metal Crusher	50
1af1546f-496a-4919-ad33-1161af5f7a66	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Another Medium	51
d22d8f91-24e7-48b1-b715-2da25ea540cc	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Uwa!! So HEATS!!♫	52
a90f2c39-4a14-4515-aa55-b6fcf2f54fee	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Stronger Monsters	53
cb477238-c3e8-470c-bb03-00edcc896f4a	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Hotel	54
01141db6-7276-48a2-aac7-1d2064b3a473	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Can You Really Call This A Hotel, I Didn't Receive A Mint On My Pillow Or Anything	55
fadcb4fc-44e9-4723-9dcb-c8f74553ca63	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Confession	56
5a7385f5-270a-4e08-a486-907831505b8d	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Live Report	57
82716eeb-cb50-4f69-9ffc-dd159b69d0c8	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Death Report	58
7ffc5f69-a0cf-4da1-beff-34ef004ea5ad	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Spider Dance	59
3b0a078e-9f25-4f77-8667-bc5a5d6d80d1	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Wrong Enemy !?	60
88ededcb-3ad2-47bd-9ba0-0d4a3152696c	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Oh! One True Love	61
8b53692a-1dfb-4e57-8a8a-0cb3eceefcad	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Oh! Dungeon	62
5eceb84c-61dd-4497-afb7-0978dcffe4cd	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	It's Raining Somewhere Else	63
9ecc4b2f-5c67-4989-840e-63f76da0d17d	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	CORE Approach	64
48a29ce4-fdc9-4c2b-941d-5ea25c6cf221	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	CORE	65
346b2845-d746-4c46-af07-860d35213bc0	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Last Episode!	66
7c19a10f-ed4f-4632-ac65-ab76c4ab3ee6	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Oh My...	67
1a540624-ebb5-460e-b9ca-57d408f4023b	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Death by Glamour	68
a22ab1b5-4709-4d31-bb4c-4252f1a51e77	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	For the Fans	69
b384e5d2-7f94-4356-b157-69b0db4d17b2	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Long Elevator	70
667f33a6-1547-40db-bb54-0b035bbb4cf4	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Undertale	71
79a76e25-0582-465f-8286-a987cc9a35a6	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Song That Might Play When You Fight Sans	72
85adfe66-5c12-48dc-96c2-25c45cd52c39	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	The Choice	73
003fad0e-6869-4adc-9ca4-51ffa9d4dbc7	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Small Shock	74
d7dd2e76-142d-4483-afbd-82fd636aa5d3	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Barrier	75
5eb59bef-6df7-4c4c-bdf9-4fbd83335647	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Bergentrückung	76
b0d78ce0-3472-466d-95a0-05899d26e5f7	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	ASGORE	77
c196a9dc-1614-415f-a1d1-8002bc5883c8	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	You Idiot	78
750c2d4f-8c8b-4c68-98d1-28b3a9c51feb	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Your Best Nightmare	79
242a8a16-d598-4c3f-9ad1-8113fe87bc0f	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Finale	80
d7190c3b-b8e5-46a3-b3cb-b25ecce78546	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	An Ending	81
f7f6db77-e665-4433-96ca-a5a62a8a4ba2	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	She's Playing Piano	82
a43b8ff9-4caf-4105-b24a-38d4816da010	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Here We Are	83
061ab11b-e294-44e8-bb40-43d01ac31a44	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Amalgam	84
cf9065f2-5178-4dd7-a619-5a3286d5980c	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Fallen Down (Reprise)	85
ab893906-2030-4295-a624-06ef410d5c44	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Don't Give Up	86
d25ff546-1a1c-42d5-a56e-444a76700784	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Hopes and Dreams	87
78b4a517-d283-4cca-9e30-e92c770cb656	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Burn in Despair!	88
d2a1ea9f-6e49-4db5-a078-d145b23ac48c	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	SAVE the World	89
846ebe2d-3cf4-4a98-9f68-f1dd7e019c57	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	His Theme	90
0419d875-feee-452f-b659-3944e27d7f99	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Final Power	91
8fda3b80-c743-4dcb-b898-df6d1bd4e298	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Reunited	92
b4d6b844-52de-4062-9fc0-0e1169f95a30	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Menu (Full)	93
68eb1cb3-33ec-4056-b929-7b102f81bce7	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Respite	94
4f297de4-9cac-4369-bdcb-3b6ce8579c41	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Bring It In, Guys!	95
c8a155be-ba30-4135-81f8-fe8d32eb31f0	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Last Goodbye	96
47b89fc4-120f-49e4-a3bb-b1182938b50e	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	But the Earth Refused to Die	97
4d07332c-d388-4c30-a8a4-bf5cedaba82f	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Battle Against a True Hero	98
28ff7948-3030-443a-bc43-47e0f9e80253	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	MEGALOVANIA	100
682cb61e-29e3-42ac-9711-40ea21156b17	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Good Night	101
51005ec2-405a-49ab-9485-a5a9948048ea	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	ANOTHER HIM	1
11685976-052b-4375-a929-fec5c80567dd	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Beginning	2
93adb015-b2f5-4572-8f8a-d66a633356ca	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	School	3
ecc818c2-ae97-4311-9814-a5317c620718	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Susie	4
ed38cca5-3c86-4f46-970f-f30ecd41a98d	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	The Door	5
b2f1e1ab-c4f0-42ff-81b6-788924423815	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Cliffs	6
1e6ca18b-abb8-477e-9d43-d20244ea2aee	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	The Chase	7
8bb46c52-024c-4850-881f-fb2223c66948	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	The Legend	8
eb37f156-034a-4f51-a1aa-f5c5fae13288	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Lancer	9
1ae3f34c-e2b4-424a-b267-da19a9cc199d	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Rude Buster	10
cb4167e9-9b1d-4453-a7d2-b27cda31267f	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Empty Town	11
c6d11230-5751-4093-ab7d-1accc0672e64	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Weird Birds	12
234a2874-379e-4c45-8d7c-37d14f1ac068	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Field of Hopes and Dreams	13
d21effb4-29a8-46f9-8b9a-91990e1e31be	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Lantern	15
457d0f0d-cd4b-4c80-8758-cd45354844c2	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	I'm Very Bad	16
543f02d1-16cd-4507-b8ff-e444ba5c10a5	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Checker Dance	17
f296a458-f47e-4e98-8f0e-81d4c2325de7	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Quiet Autumn	18
4992fcfa-fd9b-4385-a2c2-27bea74a35ef	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Scarlet Forest	19
9cdaedcb-552a-460c-8cf8-9a63a6c8c6f5	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Thrash Machine	20
1d11eb02-51c9-46ff-8068-26292dbac45f	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Vs. Lancer	21
696a3530-ed93-4b23-be9f-4d1a19b2bfd8	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Basement	22
5c9bde91-ec2b-404e-a675-e47bc509e9d2	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Imminent Death	23
b4639bfd-be77-47e6-9557-11411f541dc4	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Vs. Susie	24
4bc7cb4f-f5fa-4893-91c7-9333ea13b92d	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Card Castle	25
c4e2d49e-0f3b-472b-903f-5940524f0a77	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Rouxls Kaard	26
2d1a87f3-a59c-4241-b3b3-ff617a4edd3c	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	April 2012	27
29b06b39-b75a-4ded-bc36-5b7a713fa625	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Hip Shop	28
28cca80c-fc33-4c30-9b13-85f26e6c9cfe	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Gallery	29
981f9891-b037-4c75-82e9-8906e1e81aea	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Chaos King	30
83b3ccd3-5f4a-4717-b9b3-b15c82509107	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Darkness Falls	31
db729160-cbc2-4977-976c-2e773f7d7bae	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	The Circus	32
b4aa6877-63e3-4088-8e12-cf93547edf1c	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	THE WORLD REVOLVING	33
5f038d42-8434-4360-b6c7-7959d5607d1e	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Friendship	34
fcb68884-77a1-4526-b46a-68a99bf1dde8	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	THE HOLY	35
c268a54b-7fbf-4b27-b8fc-e58ab1a52f0b	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Your Power	36
affc356b-21d5-4883-967d-4e6673abe424	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	A Town Called Hometown	37
697fc3e9-902d-4efa-b0b5-30763bda2f26	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	You Can Always Come Home	38
d64a2787-2915-4393-8439-0e3fc0c08976	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Don't Forget	39
675ec961-ba98-4cec-893a-3ffd92e9960f	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Before the Story	40
df724baf-5e3c-4e54-af7d-df0c18e737dd	9eecc3c4-0c95-448e-9735-19b6055b5260	Faint Glow	1
72d2879e-679f-4e8b-8d3e-86735176f449	9eecc3c4-0c95-448e-9735-19b6055b5260	Girl Next Door	2
c8dc8dd7-79d4-4bf8-b901-4bc8f2dc3b42	9eecc3c4-0c95-448e-9735-19b6055b5260	My Castle Town	3
5cb9a76f-90ef-45b6-b87a-ab8843c7c0b0	9eecc3c4-0c95-448e-9735-19b6055b5260	Ohhhhohohoho!	4
900e400f-a92c-456e-8c90-f608f17e183c	9eecc3c4-0c95-448e-9735-19b6055b5260	Queen	5
18263566-6943-425a-9604-c4a386945480	9eecc3c4-0c95-448e-9735-19b6055b5260	A CYBER'S WORLD?	6
29b1f57a-db9f-4280-8c78-dc176dd723ea	9eecc3c4-0c95-448e-9735-19b6055b5260	A Simple Diversion	7
bfc9f82a-fc44-477f-a172-49ba361656d1	9eecc3c4-0c95-448e-9735-19b6055b5260	Almost To The Guys!	8
012dc67c-ad8e-4170-9dfa-b09a9982c2ba	9eecc3c4-0c95-448e-9735-19b6055b5260	Cool Beat	9
eb79f9c5-c3f7-4763-829c-03e08f013a6e	9eecc3c4-0c95-448e-9735-19b6055b5260	When I Get Mad I Dance Like This	10
832fd404-e0b7-4218-a6d6-d4313daaa0c5	9eecc3c4-0c95-448e-9735-19b6055b5260	Cyber Battle (Solo)	11
8d6db041-7637-4419-8efb-af71f9110c14	9eecc3c4-0c95-448e-9735-19b6055b5260	When I Get Happy I Dance Like This	12
2243e8a9-2fb0-4bf7-87bd-44f607aa155c	9eecc3c4-0c95-448e-9735-19b6055b5260	Sound Studio	13
233c6e03-3d1f-429e-bf4f-e27f61e88a37	9eecc3c4-0c95-448e-9735-19b6055b5260	Berdly	14
559cf5b9-d390-43fb-b4a1-e9b02b06a179	9eecc3c4-0c95-448e-9735-19b6055b5260	Smart Race	15
69cb3136-550a-46c0-9707-4b3f714bdbbb	9eecc3c4-0c95-448e-9735-19b6055b5260	Faint Courage (Game Over)	16
ab7d6c7f-4af8-4c9d-a0fa-0dbedb2c605a	9eecc3c4-0c95-448e-9735-19b6055b5260	WELCOME TO THE CITY	17
5bfdb631-b853-4de3-91fe-e9220701f2b7	9eecc3c4-0c95-448e-9735-19b6055b5260	Mini Studio	18
0a385dd4-aff3-47f8-ade3-cb81958a62b9	9eecc3c4-0c95-448e-9735-19b6055b5260	Holiday Studio	19
c9ef2f9a-25c6-4ed9-b27c-fe547fc4fed7	9eecc3c4-0c95-448e-9735-19b6055b5260	Cool Mixtape	20
6c8ed503-3d5a-41bc-a7c4-78b50ed60996	9eecc3c4-0c95-448e-9735-19b6055b5260	Spamton	22
552c63d3-f52b-4447-974a-fcb925e51a90	9eecc3c4-0c95-448e-9735-19b6055b5260	NOW'S YOUR CHANCE TO BE A	23
303b2e5c-f728-48ea-a610-4ad818f4fc55	9eecc3c4-0c95-448e-9735-19b6055b5260	Elegant Entrance	24
b9dc3f51-9983-4182-8eea-a3eea9d809e2	9eecc3c4-0c95-448e-9735-19b6055b5260	Bluebird of Misfortune	25
4de9fbd1-9824-4700-8f27-af95d8f7df7e	9eecc3c4-0c95-448e-9735-19b6055b5260	Pandora Palace	26
79d40a6d-e984-4a78-868f-033d5bbae6c1	9eecc3c4-0c95-448e-9735-19b6055b5260	KEYGEN	27
356b2f82-41c7-42e5-95de-583a180bf82b	9eecc3c4-0c95-448e-9735-19b6055b5260	Acid Tunnel of Love	28
5bae394a-7047-4e18-948e-f86e8f73b30e	9eecc3c4-0c95-448e-9735-19b6055b5260	Lost Girl	30
52c37015-86cd-40da-be44-ba68b182b128	9eecc3c4-0c95-448e-9735-19b6055b5260	Ferris Wheel	31
a849b106-f405-46db-9bc1-9b5a64229025	9eecc3c4-0c95-448e-9735-19b6055b5260	Attack of the Killer Queen	32
3707347d-3ba4-4396-b5c6-5a60767527b5	9eecc3c4-0c95-448e-9735-19b6055b5260	Giga Size	33
eca67e53-76b4-4f68-830b-5bc6eb346edd	9eecc3c4-0c95-448e-9735-19b6055b5260	Powers Combined	34
5dd51ed8-f52b-4d32-88f3-4cdcbc04e6f8	9eecc3c4-0c95-448e-9735-19b6055b5260	Knock You Down !!	35
343a74f5-394f-445f-b1f8-8c09a766fd55	9eecc3c4-0c95-448e-9735-19b6055b5260	The Dark Truth	36
349aa9c0-5536-44b9-899a-ddb224c647b6	9eecc3c4-0c95-448e-9735-19b6055b5260	HEY EVERY    !	21
b87799d7-d58a-4dfe-a222-b45f630d448d	9eecc3c4-0c95-448e-9735-19b6055b5260	Digital Roots	37
8e581acc-ba7f-4a67-a429-4a9f81645f35	9eecc3c4-0c95-448e-9735-19b6055b5260	Deal Gone Wrong	38
120daa30-58b1-4450-a1ab-a29186f8837e	9eecc3c4-0c95-448e-9735-19b6055b5260	BIG SHOT	39
cf3a758b-faf9-4623-83d1-33af2b7aa929	9eecc3c4-0c95-448e-9735-19b6055b5260	A Real Boy!	40
0e6b6138-cc03-47d5-8ed5-a956f19babd2	9eecc3c4-0c95-448e-9735-19b6055b5260	Dialtone	41
86750b57-b4db-4b1f-9a45-65f68bc6ef79	9eecc3c4-0c95-448e-9735-19b6055b5260	sans.	42
1a00e312-4488-402a-b496-69a9e14ae595	9eecc3c4-0c95-448e-9735-19b6055b5260	Chill Jailbreak Alarm To Study And Relax To	43
534f3357-817e-4b0f-9771-e7a6d619dab0	9eecc3c4-0c95-448e-9735-19b6055b5260	You Can Always Come Home	44
296144fc-ed59-4048-b226-c869c8b7fa49	9eecc3c4-0c95-448e-9735-19b6055b5260	Until Next Time	45
74137671-c2bf-4398-8196-ed319975ebb3	a507f978-3614-497c-b1fc-9481c0e63181	Flashback (Excerpt)	1
3084a496-3ce3-46e3-b3d1-ee1d6c01904b	a507f978-3614-497c-b1fc-9481c0e63181	Feature Presentation	2
f03fed85-fd38-4ce1-b4f0-f2d7ae85e046	a507f978-3614-497c-b1fc-9481c0e63181	MIKE, the BOARD, please!	4
3744cde6-d9d6-4d68-b98b-061f3d8ec5d2	a507f978-3614-497c-b1fc-9481c0e63181	Sandy Board	5
e7cfecb7-6a36-40ae-be93-792895dbc60a	a507f978-3614-497c-b1fc-9481c0e63181	Adventure Board	6
4206f7b1-3c84-4fe4-991d-2cd8099297cf	a507f978-3614-497c-b1fc-9481c0e63181	Query?	7
1e29b7db-8c4e-4d87-9e13-221032898177	a507f978-3614-497c-b1fc-9481c0e63181	Quiz!	8
180383f5-0f60-4442-967b-ad0a260c0606	a507f978-3614-497c-b1fc-9481c0e63181	Dig! Dig! To The Center of the Earth!	9
7746c8fb-f304-41a9-a1eb-d0d71f722c4e	a507f978-3614-497c-b1fc-9481c0e63181	Pushing Buddies	10
bd643605-d78d-4224-ac81-ab6927439260	a507f978-3614-497c-b1fc-9481c0e63181	Ruder Buster	11
eab50732-0a61-4540-a2b3-6cc102183dd0	a507f978-3614-497c-b1fc-9481c0e63181	Physical Challenge	12
bf749da3-c47f-405b-816b-ea41793a348e	a507f978-3614-497c-b1fc-9481c0e63181	Board Clear!	13
159e9c50-f815-453a-8671-8cc3c6621db0	a507f978-3614-497c-b1fc-9481c0e63181	Welcome to the Green Room	14
0ffbc125-53aa-40de-8274-677f26724305	a507f978-3614-497c-b1fc-9481c0e63181	Vapor Buster	15
a3dd97ff-b37c-45ff-9b07-c0013922671b	a507f978-3614-497c-b1fc-9481c0e63181	Paradise, Paradise	16
af463b1d-0237-4e30-ac24-67a32a730846	a507f978-3614-497c-b1fc-9481c0e63181	Raft Ride	17
3f852178-b804-4adb-980e-eaf0830aabc4	a507f978-3614-497c-b1fc-9481c0e63181	SOUTH OF THE BORDER!!	18
3c81d6da-eb2c-47e3-aecc-e2327dc7e1d9	a507f978-3614-497c-b1fc-9481c0e63181	Sound Check	19
94882a77-829b-45f4-9367-44b1759cfce7	a507f978-3614-497c-b1fc-9481c0e63181	Raise Up Your Bat	20
1bdd69e0-30db-4c84-9ef7-f972d05b97d8	a507f978-3614-497c-b1fc-9481c0e63181	KING OF ROLYPOLY	21
df55f2bf-f0bc-4aac-b88d-c4250bc27299	a507f978-3614-497c-b1fc-9481c0e63181	Glowing Snow	22
3d0a7634-3f27-4aa3-b219-7b9b379f11f6	a507f978-3614-497c-b1fc-9481c0e63181	Big City Board	23
c883faca-5f6f-48de-a373-3ceea8d35b04	a507f978-3614-497c-b1fc-9481c0e63181	Doom Board	24
513718f1-a56c-4152-854b-6d44bb3e2197	a507f978-3614-497c-b1fc-9481c0e63181	Metaphysical Challenge	25
2e843edf-2d51-458a-be15-bb890cb13809	a507f978-3614-497c-b1fc-9481c0e63181	TV WORLD	26
5ca8f9a8-090d-4b6e-8676-23a82fa6bbaa	a507f978-3614-497c-b1fc-9481c0e63181	Hall of Fame	28
119cfbba-ee24-4d53-a433-5e3640cb55a6	a507f978-3614-497c-b1fc-9481c0e63181	Breath	29
30d8ae7c-171d-48ce-aa48-34b88ded8d14	a507f978-3614-497c-b1fc-9481c0e63181	Black Knife	30
31cd366c-a5e6-4dc7-9bb3-2a799e8ce365	a507f978-3614-497c-b1fc-9481c0e63181	Crickets	31
395537f6-897f-4248-a848-06d9b78b57c2	a507f978-3614-497c-b1fc-9481c0e63181	Dump	32
1a747669-38af-47fd-9be2-05bc1db8f26d	a507f978-3614-497c-b1fc-9481c0e63181	SWORD	33
1ef40bfa-9584-408a-8609-7530f5e5a9a7	a507f978-3614-497c-b1fc-9481c0e63181	NORTHERNLIGHT	34
99004f27-2812-462f-9ec4-a74222ac508e	a507f978-3614-497c-b1fc-9481c0e63181	GLACEIR	35
fede205f-5a9d-4207-8cfe-0d259a27950d	a507f978-3614-497c-b1fc-9481c0e63181	BIT ROOTS	36
ebba8356-ce5c-4b6f-989d-073332b77609	a507f978-3614-497c-b1fc-9481c0e63181	ERAM	37
a262e2d2-9626-4212-ba17-b4e5e074c76a	a507f978-3614-497c-b1fc-9481c0e63181	BURNING EYES	38
cf111277-24d2-4469-9c23-7d743484e740	e5abb674-39be-4e7f-ad99-82070d669db0	Old wooden rafters	39
d55ad71d-5eb0-4fbb-86cf-c01f5045a053	e5abb674-39be-4e7f-ad99-82070d669db0	Hymn	40
45f2b6ea-7086-4d71-a971-144a5a1c844e	e5abb674-39be-4e7f-ad99-82070d669db0	Another day in hometown	41
7184857d-1385-4fad-a5c4-abb359657287	e5abb674-39be-4e7f-ad99-82070d669db0	Friends	42
b6a26697-8ae9-491b-84b5-e77aec15571b	e5abb674-39be-4e7f-ad99-82070d669db0	Castle Funk	43
2e877ab4-6045-4134-829c-f4cc302616a3	e5abb674-39be-4e7f-ad99-82070d669db0	Gingerbread House	45
c51f6b0b-7679-4c7e-9790-c8c32b03f99c	e5abb674-39be-4e7f-ad99-82070d669db0	The distance between two	46
a8884f16-3692-4f31-b58e-2399e1423dfe	e5abb674-39be-4e7f-ad99-82070d669db0	C	47
526f1467-8709-4128-9f51-223b94ae30a9	e5abb674-39be-4e7f-ad99-82070d669db0	ATRIUM	48
32f417c5-5021-4a7c-8c9c-be850d2b458e	9eecc3c4-0c95-448e-9735-19b6055b5260	Before The Story	46
643adc13-ea24-4cbb-9b46-867a94dcea05	a507f978-3614-497c-b1fc-9481c0e63181	And Now For Today’s Sponsors…!	3
80ad01ca-8d08-4b0a-a746-35993d2de5a2	a507f978-3614-497c-b1fc-9481c0e63181	It’s TV Time!	27
09a12576-c631-4148-a01a-b0e4dad69852	25ba7daa-308e-40e3-b25a-b429c273a277	Loving Steps	28
0c522be0-bfc7-4bad-b56c-58aefa075ce4	25ba7daa-308e-40e3-b25a-b429c273a277	Onsen	29
ebb233f0-4783-4d8d-8b39-86398eab5ddb	25ba7daa-308e-40e3-b25a-b429c273a277	Beautiful Bathtime	30
736fa897-5a24-49db-a402-de1233f4fd6d	e5abb674-39be-4e7f-ad99-82070d669db0	Dark Sanctuary	49
960b6af5-1def-46dc-aca1-e890b0941378	e5abb674-39be-4e7f-ad99-82070d669db0	From Now On (Battle 2)	50
c6d5b01a-2306-4dbb-abc4-56922804fdb0	e5abb674-39be-4e7f-ad99-82070d669db0	Gyaa Ha ha!	51
bc493144-b958-4cb0-bc33-f5639626dff2	e5abb674-39be-4e7f-ad99-82070d669db0	Fireplace	52
f3197e54-27af-4899-85cd-09f0ed83ef37	e5abb674-39be-4e7f-ad99-82070d669db0	A DARK ZONE	53
cb9b6fd6-858f-4e1d-ae65-6907a8ee5707	e5abb674-39be-4e7f-ad99-82070d669db0	Mysterious Ringing	54
e55934a3-c4ef-45a3-b49a-bc69c6110137	e5abb674-39be-4e7f-ad99-82070d669db0	Ever Higher	55
2a9c6130-34b0-41ae-87f4-1a52c77a4a58	e5abb674-39be-4e7f-ad99-82070d669db0	Wise words	56
0b072a9e-25e8-43b1-b673-8fd53617eeac	e5abb674-39be-4e7f-ad99-82070d669db0	Piano that may not be played that well	57
43575626-d21b-4142-b0bc-14beef352722	e5abb674-39be-4e7f-ad99-82070d669db0	Hammer of Justice	58
a877fa36-425a-4009-a1f6-04c5492a8fec	e5abb674-39be-4e7f-ad99-82070d669db0	12am	59
1b7ee751-ff61-49d6-b7cc-e312f7832f00	e5abb674-39be-4e7f-ad99-82070d669db0	The Second Sanctuary	60
f147dd6f-3b68-49a7-b3a8-294ba50ed941	e5abb674-39be-4e7f-ad99-82070d669db0	Ripple	61
dc54bcff-a598-4126-b242-42d013747398	e5abb674-39be-4e7f-ad99-82070d669db0	13am	62
157e37cb-1858-4afc-b258-108e562bbfda	e5abb674-39be-4e7f-ad99-82070d669db0	The Third Sanctuary	63
a623e667-3d3f-4181-841d-66a5833dbc2b	e5abb674-39be-4e7f-ad99-82070d669db0	Dark Place	64
e3e7f909-c7d5-4380-aafb-6d791895f500	e5abb674-39be-4e7f-ad99-82070d669db0	Heavy Footsteps	65
2ca14d4f-10dc-480f-bbff-1b37fb443de9	e5abb674-39be-4e7f-ad99-82070d669db0	Crumbling Tower	66
8e1dab23-5305-4017-8d1a-23e6d1a04142	e5abb674-39be-4e7f-ad99-82070d669db0	SPAWN	67
176003b1-33ed-43a7-84c0-88265ba7015b	e5abb674-39be-4e7f-ad99-82070d669db0	GUARDIAN	68
1ccbf6a3-9b6c-4e50-855a-d727191314e4	e5abb674-39be-4e7f-ad99-82070d669db0	Need a hand!?	69
56142794-7b91-442f-a12c-8f73b39d79cd	e5abb674-39be-4e7f-ad99-82070d669db0	The place where it rained	70
f12f54be-7899-47d8-bde8-7cb2384fde3c	e5abb674-39be-4e7f-ad99-82070d669db0	Neverending Night	72
fb6e9e3c-1cc1-4bb2-ba2f-2fff72afd55f	e5abb674-39be-4e7f-ad99-82070d669db0	The LEGEND...?	73
9617aecb-d3ea-4996-b0ba-02eae5c72b72	e5abb674-39be-4e7f-ad99-82070d669db0	With Hope Crossed On Our Hearts	74
e90201a2-4293-4e2e-99ae-9190236792bb	e5abb674-39be-4e7f-ad99-82070d669db0	Volume Adjustment	75
15e51479-8510-4143-bc4a-8d129f36b155	e5abb674-39be-4e7f-ad99-82070d669db0	Catswing	76
7831ca92-e4ef-4eb8-9e32-65c5a4f64515	e5abb674-39be-4e7f-ad99-82070d669db0	Concert for you	78
c2e6e756-11ad-4753-9325-b6bc9943dbde	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Dogsong	21
6aac8c7d-ca34-4c82-82c0-0340a8d2db3b	182d7fe1-28b0-45e1-95ca-2bfd08cd3ff4	Power of "NEO"	99
6fb34278-b184-42e6-8c3b-9e19f51d90cd	9eecc3c4-0c95-448e-9735-19b6055b5260	It's Pronounced "Rules"	29
39d24d4b-e09f-4c1a-b7d1-37f7032e5a0e	e5abb674-39be-4e7f-ad99-82070d669db0	AIRWAVES	77
90aebae7-a1b5-4f98-a988-0e884a9e3f61	25ba7daa-308e-40e3-b25a-b429c273a277	I guess I'm in love feat. Itoki Hana	8
d20ee51e-ad56-4e40-b436-c591c3e7fe82	edd2842d-9d8d-4a8a-a771-c67de8c0e7aa	Fanfare (from Rose of Winter)	14
b14d38db-6282-42c9-a44c-db6b106d616c	9eecc3c4-0c95-448e-9735-19b6055b5260	Berdly (Rejected Concept)	47
63438837-ecc8-4ea3-bf10-081cf1f19a81	e5abb674-39be-4e7f-ad99-82070d669db0	Knock You Down!! (Rhythm Ver.)	44
2cd4116c-3692-4eef-ac85-ca5db59c8988	e5abb674-39be-4e7f-ad99-82070d669db0	The Ol’ Jitterbug	71
c163351c-f250-4fb5-9d79-e1255a8a4f94	25ba7daa-308e-40e3-b25a-b429c273a277	Chapter 5 Logo	1
fb8b7ea6-8275-4251-98e5-7e1eed9f9f09	25ba7daa-308e-40e3-b25a-b429c273a277	Inappropriate Recycling	2
cf20d93e-d90d-4836-9773-d2714b406eb2	25ba7daa-308e-40e3-b25a-b429c273a277	Pirate Dojo	3
c9ca8b28-7467-4740-8387-db5d7bd4e44f	25ba7daa-308e-40e3-b25a-b429c273a277	4rd Sanctuary	4
4cc6ce1f-2e77-48b9-9f11-bbd672443edc	25ba7daa-308e-40e3-b25a-b429c273a277	Festival	5
a8a7bac4-b467-4ac3-8669-8696e01a7c2d	25ba7daa-308e-40e3-b25a-b429c273a277	Catfession...?	6
e94d8fa0-524a-4df5-98e0-277fcc0c20e4	25ba7daa-308e-40e3-b25a-b429c273a277	Bratfession...?	7
3fef7c7c-a1cd-4a98-9f63-cde0c5ee8a49	25ba7daa-308e-40e3-b25a-b429c273a277	Weirder Birds	9
7c4c5d8f-a867-4919-b723-5de63575877a	25ba7daa-308e-40e3-b25a-b429c273a277	Your Dad's Best Friend	10
36f2e643-53cc-4194-a9a1-f693ecca8950	25ba7daa-308e-40e3-b25a-b429c273a277	Garden of Hopes and Dreams	11
748e67d1-e513-45ef-84fd-7b72825e3572	25ba7daa-308e-40e3-b25a-b429c273a277	The Diner Song of Best Friends	13
d2960862-8ed6-4da1-a815-fdea342cf42e	25ba7daa-308e-40e3-b25a-b429c273a277	Ride the Board	14
7022925f-6488-40e8-a32a-dd4adcd3bbd6	25ba7daa-308e-40e3-b25a-b429c273a277	Quiet Glade	15
3d038c7a-b03f-404b-9a47-2d2328ba6242	25ba7daa-308e-40e3-b25a-b429c273a277	Who might you be?	16
d22b807b-a066-49ee-b653-6a6cb9df8279	25ba7daa-308e-40e3-b25a-b429c273a277	Petal Dance	17
44b0782a-d3cc-44ca-b3be-17ca25a575fd	25ba7daa-308e-40e3-b25a-b429c273a277	Flying Feather	18
45918706-7867-4838-bc3f-461590da8ac6	25ba7daa-308e-40e3-b25a-b429c273a277	Sunset of Seven Suns	19
ec42e992-4c02-4d2f-b5c6-cd46f1d95c23	25ba7daa-308e-40e3-b25a-b429c273a277	Shop 3	20
4cad9b21-440e-48b7-87e8-3912ea10c3ca	25ba7daa-308e-40e3-b25a-b429c273a277	Violet Tactics	21
ff41ef1b-ad99-4c8d-9720-6334ec172ec3	25ba7daa-308e-40e3-b25a-b429c273a277	Flower King	22
dc87916a-e5d6-4d33-b448-abb79c6f4344	25ba7daa-308e-40e3-b25a-b429c273a277	Flower Foyer	23
d970bc12-059d-4eb3-9e33-1a49b26f23a2	25ba7daa-308e-40e3-b25a-b429c273a277	Flower Castle	24
691ec65b-3a77-435b-b380-5bbac4ef8938	25ba7daa-308e-40e3-b25a-b429c273a277	Thousand Cafe Zukan	25
0f3c9387-afb2-45fb-a30a-9a29dceb4f06	25ba7daa-308e-40e3-b25a-b429c273a277	I'm Telling!	26
8983d1e7-3fbd-4a86-8653-66d50b98168e	25ba7daa-308e-40e3-b25a-b429c273a277	Stop, Criminell!	27
4446abad-40ce-443e-ae32-72c1557d7346	25ba7daa-308e-40e3-b25a-b429c273a277	Rakuichi Buster feat. Rakuichi	12
f86ccf98-d528-4cd2-bfe8-27796e9aa65f	25ba7daa-308e-40e3-b25a-b429c273a277	Pink	31
fcc36e8a-101e-47af-a780-98aebbb717fb	25ba7daa-308e-40e3-b25a-b429c273a277	Running Sky	33
46e9484b-a996-486c-90af-1244af7665e8	25ba7daa-308e-40e3-b25a-b429c273a277	That Day	35
fe736301-a72d-4bd8-a7f9-2e3e5cb31763	25ba7daa-308e-40e3-b25a-b429c273a277	Dreamwatchers	36
cd1b745c-1c9c-439c-870e-ea6ea574baa8	25ba7daa-308e-40e3-b25a-b429c273a277	Weak Flowers	37
2abefa9d-cf23-4672-8f29-216bba94ae7b	25ba7daa-308e-40e3-b25a-b429c273a277	Walking Home	38
c4483568-1502-4fe1-8570-2a7326aa64e1	25ba7daa-308e-40e3-b25a-b429c273a277	Goodnight, Sweet Prince	40
6dd5ee9c-2bf0-4970-938e-07865e4cb04f	25ba7daa-308e-40e3-b25a-b429c273a277	Cutie Mew Mew Magic feat. Camellia	32
7d06d273-5260-401e-a91d-4132e855687a	25ba7daa-308e-40e3-b25a-b429c273a277	Flower Man feat. Camellia	34
9c56008a-85da-445d-9fb5-d31d892a73e9	25ba7daa-308e-40e3-b25a-b429c273a277	Field of Hopes and Dreams (From "DELTARUNE Piano Collections Vol. 1") (Credits Version)	39
\.


--
-- Data for Name: source; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.source (id, title, short_title) FROM stdin;
d3956f87-96a1-4d58-bc20-424958476ae5	Star Wars Legends	Legends
efc2bb2f-50ef-4c3d-9c92-1acb0dee893a	Star Wars: The Clone Wars	TCW
f6fa9122-599b-4619-9d7c-5d1f41391448	Star Wars: The Old Republic	SWTOR
9f161292-a4b7-4126-9e42-9251419c7f00	Star Wars: Rebels	Rebels
b615fe65-6993-423f-a247-cd3176bee174	Star Wars: The Force Unleashed	SWTFU
d3f0bac4-4f32-4a48-a31e-fc6f090d429c	Star Wars: Battlefront	SWBF
0494681e-a897-4fad-a537-dc4c6f14a22c	Rogue One: A Star Wars Story	R1
491425b1-453a-4d44-a50b-8dbab49a1b35	Solo: A Star Wars Story	Solo
6049e287-86a6-4551-8c63-574d6f02bd7a	Star Wars: The Mandalorian	Mando
3bd7dc2f-360c-43d1-9a25-e69cb30b501a	Star Wars: Ahsoka	Ahsoka
aa52f74f-89bd-4ee9-a97b-af2c69f05d8c	Star Wars: Episode I -  The Phantom Menace	Ep. I
a7c14ee6-241c-4f62-a75a-48c962721731	Star Wars: Episode II - Attack of the Clones	Ep. II
8017ffe2-04d4-4ed6-b6aa-acd7b308b50d	Star Wars: Episode III - Revenge of the Sith	Ep. III
bb7cf9ce-7142-4c9a-affd-76182c0a9f13	Star Wars: Episode IV - A New Hope	Ep. IV
df33b025-935f-4a1b-9658-9bf6bc8a3cab	Star Wars: Episode V - The Empire Strikes Back	Ep. V
2f4a15df-b1e0-4f3f-bcf6-005a460a2535	Star Wars: Episode VI - Return of the Jedi	Ep. VI
84ea70c4-ddef-469f-87d3-8fc90b163e4a	Star Wars: Episode VII - The Force Awakens	Ep. VII
db3f0f4c-b754-4759-831e-7ca13dd22772	Star Wars: Episode VIII - The Last Jedi	Ep. VIII
f4c288d7-4866-4a42-accb-e95532b44c18	Star Wars: Episode IX - The Rise of Skywalker	Ep. IX
\.


--
-- Data for Name: subleitmotif; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subleitmotif (id, leitmotif, name, sort_order) FROM stdin;
2451703d-3d7d-4c1b-a089-7674550dbd6c	4c8d2893-e3e6-4f38-8750-3b98cc386f07	A	\N
b999f2ee-3c46-4ac6-bf85-134345987ad4	4c8d2893-e3e6-4f38-8750-3b98cc386f07	B	\N
cb9d6d0b-43b5-4520-8bbd-e25687b1556f	4c8d2893-e3e6-4f38-8750-3b98cc386f07	C	\N
687b88cf-5e82-41c4-9388-8ef180490b1c	1f465eb3-0bf3-4b70-bb2c-e9f21b922ec7	A (It's Showtime!)	\N
7f5851a4-fc84-4285-856d-2c1d5832f33b	1f465eb3-0bf3-4b70-bb2c-e9f21b922ec7	B (Metal Crusher)	\N
c6e54649-f47c-43f2-a512-12df619f27e4	d26f0150-4332-40b9-9cef-362609586701	A	\N
ee5ef5a9-0217-401a-875a-d128b3ded179	d26f0150-4332-40b9-9cef-362609586701	B	\N
a6b780e8-918a-4efb-b39e-dd2b16c769bd	c64e5087-6838-4c4e-92b1-07081503b2b6	A	\N
bcf35a54-041a-4234-aeb9-965cfc63cb95	c64e5087-6838-4c4e-92b1-07081503b2b6	B	\N
6fb478fc-4a5f-448c-9558-596109650b8b	c64e5087-6838-4c4e-92b1-07081503b2b6	C	\N
b37bfe02-5d82-4fa7-8be9-4968a36e3b60	0d19f646-5bea-4735-bf98-ae091d489dfd	A	\N
a06d02cb-2216-4f30-a38e-4769daab414a	0d19f646-5bea-4735-bf98-ae091d489dfd	B	\N
026a66cf-ff88-4e4e-8e32-8d8eb1e874b0	36236ea7-314f-4c8f-bc59-e137f9112344	A	\N
5d75b76a-1627-4267-ba0e-2bf65206c848	36236ea7-314f-4c8f-bc59-e137f9112344	B	\N
c446f25a-7148-4b59-820b-f56427996d35	7adf7534-6d47-47d7-b98f-b8d7a981b39f	A	\N
f75aa61c-a701-4145-856a-3686fd4640ba	7adf7534-6d47-47d7-b98f-b8d7a981b39f	A Bass	\N
a31238ee-ede0-4f91-a040-bb06906e7e06	7adf7534-6d47-47d7-b98f-b8d7a981b39f	B	\N
9d50ccae-cf75-4a2b-9836-0de6ac899bdd	084d659f-b990-4083-b82b-8d614df11a72	Original	1
a9befaf7-c8ef-418c-9f7d-03e39e420a65	084d659f-b990-4083-b82b-8d614df11a72	Don't Forget Variant	2
8bb31ab0-9656-452f-acc4-24b45a6299aa	084d659f-b990-4083-b82b-8d614df11a72	Titan Variant	3
afbf7f8e-7cdd-4ec6-bff8-a56b8de81d4b	6f737841-8385-4be2-98ad-11777c1deb7a	A	\N
c8877ad7-167e-4732-810e-fd3284af8c04	6f737841-8385-4be2-98ad-11777c1deb7a	B	\N
4d6ae5b2-a132-44d2-ae6d-c1929c41a489	60af1344-d7ac-4a91-bfb9-4bb5c1d8a3e2	A	\N
66e0a900-4f40-4119-b59c-c0eef1cc7ccf	60af1344-d7ac-4a91-bfb9-4bb5c1d8a3e2	B	\N
62c4ed6b-c3d9-4964-9d30-824bfaa78f6b	b0fa7f8f-ee10-4487-8f56-d6002db4d5ea	A	\N
03defba6-381d-43fb-ac86-15da506a11ae	b0fa7f8f-ee10-4487-8f56-d6002db4d5ea	B	\N
21721708-766b-4c28-b81a-9f66ec068b2f	4b5ed6ed-0ff4-4e2a-932c-9ac5001e4f1f	A	\N
de00a11c-cf8e-4f04-8927-83e8ad06aac6	4b5ed6ed-0ff4-4e2a-932c-9ac5001e4f1f	B	\N
153681b6-4ab3-4075-880e-73834b59b461	4b5ed6ed-0ff4-4e2a-932c-9ac5001e4f1f	C	\N
2eb3eaa0-85c8-4fb6-8501-b0c495a53e45	29346f17-7569-48cd-a290-184746526cb5	A	\N
7b8fc57c-1005-4391-b06e-dbb0d9e277ab	29346f17-7569-48cd-a290-184746526cb5	B	\N
e34dbe77-c171-4ead-a6cf-093dec5d5d00	80a87b09-030a-401c-8f37-a5f303aed044	A	\N
0ed253dd-11ff-478d-9e5c-2656becb69d0	80a87b09-030a-401c-8f37-a5f303aed044	B	\N
f8f8eccd-c109-4414-93e7-66d2a4cdbaca	1e0c01ed-3940-4cd6-bdac-d83848dfb883	Dogsong Variant	3
417d9422-e371-462c-b94b-1f03d4226bc5	1e0c01ed-3940-4cd6-bdac-d83848dfb883	Original	2
624de1ab-5915-41ed-b2e2-ee9a5ac79cc0	0d19f646-5bea-4735-bf98-ae091d489dfd	Drums	\N
7553243a-e0c7-400b-ad64-6302e87fa9db	4b5ed6ed-0ff4-4e2a-932c-9ac5001e4f1f	D	\N
c511084c-113d-4b62-8c0d-22116f64df98	1e0c01ed-3940-4cd6-bdac-d83848dfb883	Intro	1
10edb3fe-85c0-4279-be57-d3f7444c098c	b0fa7f8f-ee10-4487-8f56-d6002db4d5ea	C	\N
ad3f7dca-663b-4447-be81-5052fd205a3a	ace9a60b-60ce-43f8-8329-b87edbc66d9e	A	\N
df067690-75b0-4f8a-99b3-7aa5341a0be2	ace9a60b-60ce-43f8-8329-b87edbc66d9e	B	\N
386fa0dc-4153-454d-8061-8512ca262fa0	ce616089-4d35-43a1-a982-0f0f334e99d7	A	\N
0a176911-b6ed-4adc-833d-f9b275724cfb	ce616089-4d35-43a1-a982-0f0f334e99d7	B	\N
648334ae-7773-45b6-8812-48b17128584a	f8575489-195e-44f1-89f1-9bb1033ebf69	A	\N
571bac8e-198e-405f-bfd3-071ad5882fdf	f8575489-195e-44f1-89f1-9bb1033ebf69	B	\N
\.


--
-- Data for Name: subleitmotif_in_song; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subleitmotif_in_song (subleitmotif, song) FROM stdin;
2451703d-3d7d-4c1b-a089-7674550dbd6c	c6b65c62-0f0c-4224-b13c-97c066e375f3
b999f2ee-3c46-4ac6-bf85-134345987ad4	c6b65c62-0f0c-4224-b13c-97c066e375f3
cb9d6d0b-43b5-4520-8bbd-e25687b1556f	c6b65c62-0f0c-4224-b13c-97c066e375f3
2451703d-3d7d-4c1b-a089-7674550dbd6c	fd3f83fd-0f4b-45c6-b45f-571d32225901
c511084c-113d-4b62-8c0d-22116f64df98	93ad3587-5057-4b59-9657-78fe2ef28532
417d9422-e371-462c-b94b-1f03d4226bc5	cb822319-01e2-477a-8f93-6faa915d07ee
c511084c-113d-4b62-8c0d-22116f64df98	cb822319-01e2-477a-8f93-6faa915d07ee
c446f25a-7148-4b59-820b-f56427996d35	684d7582-fa77-45f0-abd9-8cbf33f5e70d
f75aa61c-a701-4145-856a-3686fd4640ba	684d7582-fa77-45f0-abd9-8cbf33f5e70d
a31238ee-ede0-4f91-a040-bb06906e7e06	684d7582-fa77-45f0-abd9-8cbf33f5e70d
2451703d-3d7d-4c1b-a089-7674550dbd6c	e4eea6fd-8fd8-4d0e-a6c6-e5457fd68d0b
b999f2ee-3c46-4ac6-bf85-134345987ad4	e4eea6fd-8fd8-4d0e-a6c6-e5457fd68d0b
2451703d-3d7d-4c1b-a089-7674550dbd6c	e8d747a0-1b94-4c3a-b147-61c6998b2391
b999f2ee-3c46-4ac6-bf85-134345987ad4	e8d747a0-1b94-4c3a-b147-61c6998b2391
62c4ed6b-c3d9-4964-9d30-824bfaa78f6b	5204cb2e-d256-4140-91c5-c9a3a4a66cf4
f75aa61c-a701-4145-856a-3686fd4640ba	ead26c60-2210-4c39-8b98-58ffedbb2c29
f8f8eccd-c109-4414-93e7-66d2a4cdbaca	c2e6e756-11ad-4753-9325-b6bc9943dbde
62c4ed6b-c3d9-4964-9d30-824bfaa78f6b	f3b3e854-4f82-485e-96d0-5502ee951c56
03defba6-381d-43fb-ac86-15da506a11ae	f3b3e854-4f82-485e-96d0-5502ee951c56
62c4ed6b-c3d9-4964-9d30-824bfaa78f6b	bacf938f-723d-4838-a581-68c13d619b4e
03defba6-381d-43fb-ac86-15da506a11ae	bacf938f-723d-4838-a581-68c13d619b4e
62c4ed6b-c3d9-4964-9d30-824bfaa78f6b	64d9ce6a-0070-46b4-8f97-f266bc1d0bed
03defba6-381d-43fb-ac86-15da506a11ae	64d9ce6a-0070-46b4-8f97-f266bc1d0bed
62c4ed6b-c3d9-4964-9d30-824bfaa78f6b	e8cceef5-9e02-4df9-8dd8-124fed49b3dc
03defba6-381d-43fb-ac86-15da506a11ae	e8cceef5-9e02-4df9-8dd8-124fed49b3dc
2eb3eaa0-85c8-4fb6-8501-b0c495a53e45	2770c2c0-ace8-4ee2-b898-55711da5d163
c446f25a-7148-4b59-820b-f56427996d35	318b2889-5188-4fef-b8f0-239434a6b621
f75aa61c-a701-4145-856a-3686fd4640ba	318b2889-5188-4fef-b8f0-239434a6b621
a31238ee-ede0-4f91-a040-bb06906e7e06	318b2889-5188-4fef-b8f0-239434a6b621
a31238ee-ede0-4f91-a040-bb06906e7e06	0cb593cd-2f53-4da5-aa0f-417d733e4e11
f8f8eccd-c109-4414-93e7-66d2a4cdbaca	f46274c4-591b-4b31-8230-5ab7904e3577
f8f8eccd-c109-4414-93e7-66d2a4cdbaca	8151823e-267e-4e21-bac1-24ceb6d72078
2eb3eaa0-85c8-4fb6-8501-b0c495a53e45	37cc8403-1aa6-4856-895c-7fce711a1689
7b8fc57c-1005-4391-b06e-dbb0d9e277ab	37cc8403-1aa6-4856-895c-7fce711a1689
687b88cf-5e82-41c4-9388-8ef180490b1c	ba4a3357-52ff-4016-a579-68d0d03fd473
7f5851a4-fc84-4285-856d-2c1d5832f33b	f27fa242-a186-4748-97a6-437a496e3db9
2451703d-3d7d-4c1b-a089-7674550dbd6c	cb477238-c3e8-470c-bb03-00edcc896f4a
2451703d-3d7d-4c1b-a089-7674550dbd6c	01141db6-7276-48a2-aac7-1d2064b3a473
b999f2ee-3c46-4ac6-bf85-134345987ad4	cb477238-c3e8-470c-bb03-00edcc896f4a
b999f2ee-3c46-4ac6-bf85-134345987ad4	01141db6-7276-48a2-aac7-1d2064b3a473
03defba6-381d-43fb-ac86-15da506a11ae	fadcb4fc-44e9-4723-9dcb-c8f74553ca63
687b88cf-5e82-41c4-9388-8ef180490b1c	5a7385f5-270a-4e08-a486-907831505b8d
687b88cf-5e82-41c4-9388-8ef180490b1c	82716eeb-cb50-4f69-9ffc-dd159b69d0c8
a31238ee-ede0-4f91-a040-bb06906e7e06	7ffc5f69-a0cf-4da1-beff-34ef004ea5ad
7f5851a4-fc84-4285-856d-2c1d5832f33b	346b2845-d746-4c46-af07-860d35213bc0
687b88cf-5e82-41c4-9388-8ef180490b1c	1a540624-ebb5-460e-b9ca-57d408f4023b
7f5851a4-fc84-4285-856d-2c1d5832f33b	1a540624-ebb5-460e-b9ca-57d408f4023b
2451703d-3d7d-4c1b-a089-7674550dbd6c	667f33a6-1547-40db-bb54-0b035bbb4cf4
b999f2ee-3c46-4ac6-bf85-134345987ad4	667f33a6-1547-40db-bb54-0b035bbb4cf4
2451703d-3d7d-4c1b-a089-7674550dbd6c	85adfe66-5c12-48dc-96c2-25c45cd52c39
7b8fc57c-1005-4391-b06e-dbb0d9e277ab	f7f6db77-e665-4433-96ca-a5a62a8a4ba2
2eb3eaa0-85c8-4fb6-8501-b0c495a53e45	a43b8ff9-4caf-4105-b24a-38d4816da010
7b8fc57c-1005-4391-b06e-dbb0d9e277ab	a43b8ff9-4caf-4105-b24a-38d4816da010
2451703d-3d7d-4c1b-a089-7674550dbd6c	cf9065f2-5178-4dd7-a619-5a3286d5980c
b999f2ee-3c46-4ac6-bf85-134345987ad4	cf9065f2-5178-4dd7-a619-5a3286d5980c
cb9d6d0b-43b5-4520-8bbd-e25687b1556f	cf9065f2-5178-4dd7-a619-5a3286d5980c
2451703d-3d7d-4c1b-a089-7674550dbd6c	d25ff546-1a1c-42d5-a56e-444a76700784
cb9d6d0b-43b5-4520-8bbd-e25687b1556f	d25ff546-1a1c-42d5-a56e-444a76700784
03defba6-381d-43fb-ac86-15da506a11ae	d25ff546-1a1c-42d5-a56e-444a76700784
2451703d-3d7d-4c1b-a089-7674550dbd6c	d2a1ea9f-6e49-4db5-a078-d145b23ac48c
cb9d6d0b-43b5-4520-8bbd-e25687b1556f	d2a1ea9f-6e49-4db5-a078-d145b23ac48c
cb9d6d0b-43b5-4520-8bbd-e25687b1556f	0419d875-feee-452f-b659-3944e27d7f99
2451703d-3d7d-4c1b-a089-7674550dbd6c	8fda3b80-c743-4dcb-b898-df6d1bd4e298
b999f2ee-3c46-4ac6-bf85-134345987ad4	8fda3b80-c743-4dcb-b898-df6d1bd4e298
cb9d6d0b-43b5-4520-8bbd-e25687b1556f	8fda3b80-c743-4dcb-b898-df6d1bd4e298
03defba6-381d-43fb-ac86-15da506a11ae	8fda3b80-c743-4dcb-b898-df6d1bd4e298
2451703d-3d7d-4c1b-a089-7674550dbd6c	b4d6b844-52de-4062-9fc0-0e1169f95a30
cb9d6d0b-43b5-4520-8bbd-e25687b1556f	b4d6b844-52de-4062-9fc0-0e1169f95a30
c511084c-113d-4b62-8c0d-22116f64df98	4f297de4-9cac-4369-bdcb-3b6ce8579c41
417d9422-e371-462c-b94b-1f03d4226bc5	4f297de4-9cac-4369-bdcb-3b6ce8579c41
62c4ed6b-c3d9-4964-9d30-824bfaa78f6b	4f297de4-9cac-4369-bdcb-3b6ce8579c41
03defba6-381d-43fb-ac86-15da506a11ae	4f297de4-9cac-4369-bdcb-3b6ce8579c41
2451703d-3d7d-4c1b-a089-7674550dbd6c	4f297de4-9cac-4369-bdcb-3b6ce8579c41
cb9d6d0b-43b5-4520-8bbd-e25687b1556f	c8a155be-ba30-4135-81f8-fe8d32eb31f0
2451703d-3d7d-4c1b-a089-7674550dbd6c	c8a155be-ba30-4135-81f8-fe8d32eb31f0
b999f2ee-3c46-4ac6-bf85-134345987ad4	c8a155be-ba30-4135-81f8-fe8d32eb31f0
2451703d-3d7d-4c1b-a089-7674550dbd6c	682cb61e-29e3-42ac-9711-40ea21156b17
cb9d6d0b-43b5-4520-8bbd-e25687b1556f	11685976-052b-4375-a929-fec5c80567dd
03defba6-381d-43fb-ac86-15da506a11ae	93adb015-b2f5-4572-8f8a-d66a633356ca
a6b780e8-918a-4efb-b39e-dd2b16c769bd	8bb46c52-024c-4850-881f-fb2223c66948
bcf35a54-041a-4234-aeb9-965cfc63cb95	8bb46c52-024c-4850-881f-fb2223c66948
6fb478fc-4a5f-448c-9558-596109650b8b	8bb46c52-024c-4850-881f-fb2223c66948
c6e54649-f47c-43f2-a512-12df619f27e4	eb37f156-034a-4f51-a1aa-f5c5fae13288
ee5ef5a9-0217-401a-875a-d128b3ded179	eb37f156-034a-4f51-a1aa-f5c5fae13288
bcf35a54-041a-4234-aeb9-965cfc63cb95	cb4167e9-9b1d-4453-a7d2-b27cda31267f
6fb478fc-4a5f-448c-9558-596109650b8b	cb4167e9-9b1d-4453-a7d2-b27cda31267f
c6e54649-f47c-43f2-a512-12df619f27e4	457d0f0d-cd4b-4c80-8758-cd45354844c2
c6e54649-f47c-43f2-a512-12df619f27e4	9cdaedcb-552a-460c-8cf8-9a63a6c8c6f5
ee5ef5a9-0217-401a-875a-d128b3ded179	9cdaedcb-552a-460c-8cf8-9a63a6c8c6f5
c6e54649-f47c-43f2-a512-12df619f27e4	1d11eb02-51c9-46ff-8068-26292dbac45f
ee5ef5a9-0217-401a-875a-d128b3ded179	1d11eb02-51c9-46ff-8068-26292dbac45f
c6e54649-f47c-43f2-a512-12df619f27e4	4bc7cb4f-f5fa-4893-91c7-9333ea13b92d
c6e54649-f47c-43f2-a512-12df619f27e4	981f9891-b037-4c75-82e9-8906e1e81aea
6fb478fc-4a5f-448c-9558-596109650b8b	981f9891-b037-4c75-82e9-8906e1e81aea
4d6ae5b2-a132-44d2-ae6d-c1929c41a489	db729160-cbc2-4977-976c-2e773f7d7bae
4d6ae5b2-a132-44d2-ae6d-c1929c41a489	b4aa6877-63e3-4088-8e12-cf93547edf1c
66e0a900-4f40-4119-b59c-c0eef1cc7ccf	b4aa6877-63e3-4088-8e12-cf93547edf1c
e34dbe77-c171-4ead-a6cf-093dec5d5d00	fcb68884-77a1-4526-b46a-68a99bf1dde8
0ed253dd-11ff-478d-9e5c-2656becb69d0	fcb68884-77a1-4526-b46a-68a99bf1dde8
03defba6-381d-43fb-ac86-15da506a11ae	affc356b-21d5-4883-967d-4e6673abe424
2451703d-3d7d-4c1b-a089-7674550dbd6c	697fc3e9-902d-4efa-b0b5-30763bda2f26
2451703d-3d7d-4c1b-a089-7674550dbd6c	675ec961-ba98-4cec-893a-3ffd92e9960f
a6b780e8-918a-4efb-b39e-dd2b16c769bd	c8dc8dd7-79d4-4bf8-b901-4bc8f2dc3b42
bcf35a54-041a-4234-aeb9-965cfc63cb95	c8dc8dd7-79d4-4bf8-b901-4bc8f2dc3b42
6fb478fc-4a5f-448c-9558-596109650b8b	c8dc8dd7-79d4-4bf8-b901-4bc8f2dc3b42
21721708-766b-4c28-b81a-9f66ec068b2f	900e400f-a92c-456e-8c90-f608f17e183c
de00a11c-cf8e-4f04-8927-83e8ad06aac6	900e400f-a92c-456e-8c90-f608f17e183c
21721708-766b-4c28-b81a-9f66ec068b2f	29b1f57a-db9f-4280-8c78-dc176dd723ea
153681b6-4ab3-4075-880e-73834b59b461	29b1f57a-db9f-4280-8c78-dc176dd723ea
b37bfe02-5d82-4fa7-8be9-4968a36e3b60	bfc9f82a-fc44-477f-a172-49ba361656d1
b37bfe02-5d82-4fa7-8be9-4968a36e3b60	832fd404-e0b7-4218-a6d6-d4313daaa0c5
a06d02cb-2216-4f30-a38e-4769daab414a	832fd404-e0b7-4218-a6d6-d4313daaa0c5
b37bfe02-5d82-4fa7-8be9-4968a36e3b60	8d6db041-7637-4419-8efb-af71f9110c14
b37bfe02-5d82-4fa7-8be9-4968a36e3b60	2243e8a9-2fb0-4bf7-87bd-44f607aa155c
a06d02cb-2216-4f30-a38e-4769daab414a	2243e8a9-2fb0-4bf7-87bd-44f607aa155c
afbf7f8e-7cdd-4ec6-bff8-a56b8de81d4b	233c6e03-3d1f-429e-bf4f-e27f61e88a37
c8877ad7-167e-4732-810e-fd3284af8c04	233c6e03-3d1f-429e-bf4f-e27f61e88a37
afbf7f8e-7cdd-4ec6-bff8-a56b8de81d4b	559cf5b9-d390-43fb-b4a1-e9b02b06a179
c8877ad7-167e-4732-810e-fd3284af8c04	559cf5b9-d390-43fb-b4a1-e9b02b06a179
21721708-766b-4c28-b81a-9f66ec068b2f	559cf5b9-d390-43fb-b4a1-e9b02b06a179
b37bfe02-5d82-4fa7-8be9-4968a36e3b60	18263566-6943-425a-9604-c4a386945480
b37bfe02-5d82-4fa7-8be9-4968a36e3b60	ab7d6c7f-4af8-4c9d-a0fa-0dbedb2c605a
b37bfe02-5d82-4fa7-8be9-4968a36e3b60	5bfdb631-b853-4de3-91fe-e9220701f2b7
a06d02cb-2216-4f30-a38e-4769daab414a	5bfdb631-b853-4de3-91fe-e9220701f2b7
624de1ab-5915-41ed-b2e2-ee9a5ac79cc0	012dc67c-ad8e-4170-9dfa-b09a9982c2ba
624de1ab-5915-41ed-b2e2-ee9a5ac79cc0	832fd404-e0b7-4218-a6d6-d4313daaa0c5
624de1ab-5915-41ed-b2e2-ee9a5ac79cc0	8d6db041-7637-4419-8efb-af71f9110c14
624de1ab-5915-41ed-b2e2-ee9a5ac79cc0	2243e8a9-2fb0-4bf7-87bd-44f607aa155c
624de1ab-5915-41ed-b2e2-ee9a5ac79cc0	0a385dd4-aff3-47f8-ade3-cb81958a62b9
a06d02cb-2216-4f30-a38e-4769daab414a	0a385dd4-aff3-47f8-ade3-cb81958a62b9
21721708-766b-4c28-b81a-9f66ec068b2f	c9ef2f9a-25c6-4ed9-b27c-fe547fc4fed7
153681b6-4ab3-4075-880e-73834b59b461	c9ef2f9a-25c6-4ed9-b27c-fe547fc4fed7
026a66cf-ff88-4e4e-8e32-8d8eb1e874b0	6c8ed503-3d5a-41bc-a7c4-78b50ed60996
026a66cf-ff88-4e4e-8e32-8d8eb1e874b0	552c63d3-f52b-4447-974a-fcb925e51a90
5d75b76a-1627-4267-ba0e-2bf65206c848	552c63d3-f52b-4447-974a-fcb925e51a90
21721708-766b-4c28-b81a-9f66ec068b2f	303b2e5c-f728-48ea-a610-4ad818f4fc55
de00a11c-cf8e-4f04-8927-83e8ad06aac6	303b2e5c-f728-48ea-a610-4ad818f4fc55
afbf7f8e-7cdd-4ec6-bff8-a56b8de81d4b	b9dc3f51-9983-4182-8eea-a3eea9d809e2
c8877ad7-167e-4732-810e-fd3284af8c04	b9dc3f51-9983-4182-8eea-a3eea9d809e2
21721708-766b-4c28-b81a-9f66ec068b2f	4de9fbd1-9824-4700-8f27-af95d8f7df7e
de00a11c-cf8e-4f04-8927-83e8ad06aac6	4de9fbd1-9824-4700-8f27-af95d8f7df7e
c6e54649-f47c-43f2-a512-12df619f27e4	356b2f82-41c7-42e5-95de-583a180bf82b
ee5ef5a9-0217-401a-875a-d128b3ded179	356b2f82-41c7-42e5-95de-583a180bf82b
ee5ef5a9-0217-401a-875a-d128b3ded179	6fb34278-b184-42e6-8c3b-9e19f51d90cd
21721708-766b-4c28-b81a-9f66ec068b2f	a849b106-f405-46db-9bc1-9b5a64229025
c8877ad7-167e-4732-810e-fd3284af8c04	a849b106-f405-46db-9bc1-9b5a64229025
afbf7f8e-7cdd-4ec6-bff8-a56b8de81d4b	a849b106-f405-46db-9bc1-9b5a64229025
153681b6-4ab3-4075-880e-73834b59b461	a849b106-f405-46db-9bc1-9b5a64229025
7553243a-e0c7-400b-ad64-6302e87fa9db	a849b106-f405-46db-9bc1-9b5a64229025
7553243a-e0c7-400b-ad64-6302e87fa9db	c9ef2f9a-25c6-4ed9-b27c-fe547fc4fed7
21721708-766b-4c28-b81a-9f66ec068b2f	3707347d-3ba4-4396-b5c6-5a60767527b5
153681b6-4ab3-4075-880e-73834b59b461	3707347d-3ba4-4396-b5c6-5a60767527b5
21721708-766b-4c28-b81a-9f66ec068b2f	5dd51ed8-f52b-4d32-88f3-4cdcbc04e6f8
026a66cf-ff88-4e4e-8e32-8d8eb1e874b0	8e581acc-ba7f-4a67-a429-4a9f81645f35
026a66cf-ff88-4e4e-8e32-8d8eb1e874b0	120daa30-58b1-4450-a1ab-a29186f8837e
5d75b76a-1627-4267-ba0e-2bf65206c848	120daa30-58b1-4450-a1ab-a29186f8837e
4d6ae5b2-a132-44d2-ae6d-c1929c41a489	120daa30-58b1-4450-a1ab-a29186f8837e
66e0a900-4f40-4119-b59c-c0eef1cc7ccf	0e6b6138-cc03-47d5-8ed5-a956f19babd2
a31238ee-ede0-4f91-a040-bb06906e7e06	1a00e312-4488-402a-b496-69a9e14ae595
2451703d-3d7d-4c1b-a089-7674550dbd6c	534f3357-817e-4b0f-9771-e7a6d619dab0
2451703d-3d7d-4c1b-a089-7674550dbd6c	32f417c5-5021-4a7c-8c9c-be850d2b458e
c6e54649-f47c-43f2-a512-12df619f27e4	180383f5-0f60-4442-967b-ad0a260c0606
0ed253dd-11ff-478d-9e5c-2656becb69d0	395537f6-897f-4248-a848-06d9b78b57c2
e34dbe77-c171-4ead-a6cf-093dec5d5d00	1a747669-38af-47fd-9be2-05bc1db8f26d
a6b780e8-918a-4efb-b39e-dd2b16c769bd	cf111277-24d2-4469-9c23-7d743484e740
bcf35a54-041a-4234-aeb9-965cfc63cb95	cf111277-24d2-4469-9c23-7d743484e740
10edb3fe-85c0-4279-be57-d3f7444c098c	64d9ce6a-0070-46b4-8f97-f266bc1d0bed
10edb3fe-85c0-4279-be57-d3f7444c098c	45f2b6ea-7086-4d71-a971-144a5a1c844e
bcf35a54-041a-4234-aeb9-965cfc63cb95	b6a26697-8ae9-491b-84b5-e77aec15571b
21721708-766b-4c28-b81a-9f66ec068b2f	63438837-ecc8-4ea3-bf10-081cf1f19a81
bcf35a54-041a-4234-aeb9-965cfc63cb95	736fa897-5a24-49db-a402-de1233f4fd6d
9d50ccae-cf75-4a2b-9836-0de6ac899bdd	736fa897-5a24-49db-a402-de1233f4fd6d
a6b780e8-918a-4efb-b39e-dd2b16c769bd	736fa897-5a24-49db-a402-de1233f4fd6d
a9befaf7-c8ef-418c-9f7d-03e39e420a65	960b6af5-1def-46dc-aca1-e890b0941378
a9befaf7-c8ef-418c-9f7d-03e39e420a65	e55934a3-c4ef-45a3-b49a-bc69c6110137
4d6ae5b2-a132-44d2-ae6d-c1929c41a489	43575626-d21b-4142-b0bc-14beef352722
a6b780e8-918a-4efb-b39e-dd2b16c769bd	1b7ee751-ff61-49d6-b7cc-e312f7832f00
bcf35a54-041a-4234-aeb9-965cfc63cb95	1b7ee751-ff61-49d6-b7cc-e312f7832f00
bcf35a54-041a-4234-aeb9-965cfc63cb95	157e37cb-1858-4afc-b258-108e562bbfda
8bb31ab0-9656-452f-acc4-24b45a6299aa	2ca14d4f-10dc-480f-bbff-1b37fb443de9
a9befaf7-c8ef-418c-9f7d-03e39e420a65	2ca14d4f-10dc-480f-bbff-1b37fb443de9
8bb31ab0-9656-452f-acc4-24b45a6299aa	8e1dab23-5305-4017-8d1a-23e6d1a04142
8bb31ab0-9656-452f-acc4-24b45a6299aa	176003b1-33ed-43a7-84c0-88265ba7015b
a9befaf7-c8ef-418c-9f7d-03e39e420a65	176003b1-33ed-43a7-84c0-88265ba7015b
c446f25a-7148-4b59-820b-f56427996d35	2cd4116c-3692-4eef-ac85-ca5db59c8988
9d50ccae-cf75-4a2b-9836-0de6ac899bdd	f12f54be-7899-47d8-bde8-7cb2384fde3c
a6b780e8-918a-4efb-b39e-dd2b16c769bd	fb6e9e3c-1cc1-4bb2-ba2f-2fff72afd55f
026a66cf-ff88-4e4e-8e32-8d8eb1e874b0	15e51479-8510-4143-bc4a-8d129f36b155
5d75b76a-1627-4267-ba0e-2bf65206c848	15e51479-8510-4143-bc4a-8d129f36b155
21721708-766b-4c28-b81a-9f66ec068b2f	15e51479-8510-4143-bc4a-8d129f36b155
026a66cf-ff88-4e4e-8e32-8d8eb1e874b0	39d24d4b-e09f-4c1a-b7d1-37f7032e5a0e
4d6ae5b2-a132-44d2-ae6d-c1929c41a489	39d24d4b-e09f-4c1a-b7d1-37f7032e5a0e
648334ae-7773-45b6-8812-48b17128584a	72d2879e-679f-4e8b-8d3e-86735176f449
648334ae-7773-45b6-8812-48b17128584a	5bae394a-7047-4e18-948e-f86e8f73b30e
648334ae-7773-45b6-8812-48b17128584a	52c37015-86cd-40da-be44-ba68b182b128
648334ae-7773-45b6-8812-48b17128584a	94882a77-829b-45f4-9367-44b1759cfce7
648334ae-7773-45b6-8812-48b17128584a	c51f6b0b-7679-4c7e-9790-c8c32b03f99c
571bac8e-198e-405f-bfd3-071ad5882fdf	72d2879e-679f-4e8b-8d3e-86735176f449
571bac8e-198e-405f-bfd3-071ad5882fdf	5bae394a-7047-4e18-948e-f86e8f73b30e
571bac8e-198e-405f-bfd3-071ad5882fdf	52c37015-86cd-40da-be44-ba68b182b128
4d6ae5b2-a132-44d2-ae6d-c1929c41a489	fb8b7ea6-8275-4251-98e5-7e1eed9f9f09
bcf35a54-041a-4234-aeb9-965cfc63cb95	fb8b7ea6-8275-4251-98e5-7e1eed9f9f09
a6b780e8-918a-4efb-b39e-dd2b16c769bd	fb8b7ea6-8275-4251-98e5-7e1eed9f9f09
03defba6-381d-43fb-ac86-15da506a11ae	a8a7bac4-b467-4ac3-8669-8696e01a7c2d
03defba6-381d-43fb-ac86-15da506a11ae	e94d8fa0-524a-4df5-98e0-277fcc0c20e4
2451703d-3d7d-4c1b-a089-7674550dbd6c	36f2e643-53cc-4194-a9a1-f693ecca8950
ad3f7dca-663b-4447-be81-5052fd205a3a	3d038c7a-b03f-404b-9a47-2d2328ba6242
df067690-75b0-4f8a-99b3-7aa5341a0be2	3d038c7a-b03f-404b-9a47-2d2328ba6242
ad3f7dca-663b-4447-be81-5052fd205a3a	d22b807b-a066-49ee-b653-6a6cb9df8279
ad3f7dca-663b-4447-be81-5052fd205a3a	45918706-7867-4838-bc3f-461590da8ac6
ad3f7dca-663b-4447-be81-5052fd205a3a	d970bc12-059d-4eb3-9e33-1a49b26f23a2
ad3f7dca-663b-4447-be81-5052fd205a3a	0f3c9387-afb2-45fb-a30a-9a29dceb4f06
df067690-75b0-4f8a-99b3-7aa5341a0be2	0f3c9387-afb2-45fb-a30a-9a29dceb4f06
386fa0dc-4153-454d-8061-8512ca262fa0	0f3c9387-afb2-45fb-a30a-9a29dceb4f06
ad3f7dca-663b-4447-be81-5052fd205a3a	8983d1e7-3fbd-4a86-8653-66d50b98168e
df067690-75b0-4f8a-99b3-7aa5341a0be2	8983d1e7-3fbd-4a86-8653-66d50b98168e
ad3f7dca-663b-4447-be81-5052fd205a3a	09a12576-c631-4148-a01a-b0e4dad69852
df067690-75b0-4f8a-99b3-7aa5341a0be2	09a12576-c631-4148-a01a-b0e4dad69852
386fa0dc-4153-454d-8061-8512ca262fa0	f86ccf98-d528-4cd2-bfe8-27796e9aa65f
0a176911-b6ed-4adc-833d-f9b275724cfb	f86ccf98-d528-4cd2-bfe8-27796e9aa65f
386fa0dc-4153-454d-8061-8512ca262fa0	6dd5ee9c-2bf0-4970-938e-07865e4cb04f
0a176911-b6ed-4adc-833d-f9b275724cfb	6dd5ee9c-2bf0-4970-938e-07865e4cb04f
4d6ae5b2-a132-44d2-ae6d-c1929c41a489	6dd5ee9c-2bf0-4970-938e-07865e4cb04f
ad3f7dca-663b-4447-be81-5052fd205a3a	7d06d273-5260-401e-a91d-4132e855687a
a6b780e8-918a-4efb-b39e-dd2b16c769bd	c9ca8b28-7467-4740-8387-db5d7bd4e44f
bcf35a54-041a-4234-aeb9-965cfc63cb95	c9ca8b28-7467-4740-8387-db5d7bd4e44f
df067690-75b0-4f8a-99b3-7aa5341a0be2	45918706-7867-4838-bc3f-461590da8ac6
\.


--
-- Name: battle_pack battle_pack_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.battle_pack
    ADD CONSTRAINT battle_pack_pkey PRIMARY KEY (id);


--
-- Name: battle_pack battle_pack_set_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.battle_pack
    ADD CONSTRAINT battle_pack_set_number_key UNIQUE (set_number);


--
-- Name: game game_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_number_key UNIQUE (number);


--
-- Name: game game_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_pkey PRIMARY KEY (id);


--
-- Name: game game_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game
    ADD CONSTRAINT game_title_key UNIQUE (title);


--
-- Name: leitmotif_in_song leitmotif_in_song_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leitmotif_in_song
    ADD CONSTRAINT leitmotif_in_song_pkey PRIMARY KEY (leitmotif, song);


--
-- Name: leitmotif leitmotif_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leitmotif
    ADD CONSTRAINT leitmotif_name_key UNIQUE (name);


--
-- Name: leitmotif leitmotif_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leitmotif
    ADD CONSTRAINT leitmotif_pkey PRIMARY KEY (id);


--
-- Name: minifig minifig_bricklink_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.minifig
    ADD CONSTRAINT minifig_bricklink_id_key UNIQUE (bricklink_id);


--
-- Name: minifig_in_battle_pack minifig_in_battle_pack_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.minifig_in_battle_pack
    ADD CONSTRAINT minifig_in_battle_pack_pkey PRIMARY KEY (battle_pack, minifig);


--
-- Name: minifig minifig_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.minifig
    ADD CONSTRAINT minifig_pkey PRIMARY KEY (id);


--
-- Name: song song_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_pkey PRIMARY KEY (id);


--
-- Name: source source_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source
    ADD CONSTRAINT source_pkey PRIMARY KEY (id);


--
-- Name: source source_short_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source
    ADD CONSTRAINT source_short_title_key UNIQUE (short_title);


--
-- Name: source source_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.source
    ADD CONSTRAINT source_title_key UNIQUE (title);


--
-- Name: subleitmotif_in_song subleitmotif_in_song_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subleitmotif_in_song
    ADD CONSTRAINT subleitmotif_in_song_pkey PRIMARY KEY (subleitmotif, song);


--
-- Name: subleitmotif subleitmotif_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subleitmotif
    ADD CONSTRAINT subleitmotif_pkey PRIMARY KEY (id);


--
-- Name: battle_pack battle_pack_source_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.battle_pack
    ADD CONSTRAINT battle_pack_source_fkey FOREIGN KEY (source) REFERENCES public.source(id);


--
-- Name: leitmotif_in_song leitmotif_in_song_leitmotif_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leitmotif_in_song
    ADD CONSTRAINT leitmotif_in_song_leitmotif_fkey FOREIGN KEY (leitmotif) REFERENCES public.leitmotif(id);


--
-- Name: leitmotif_in_song leitmotif_in_song_song_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.leitmotif_in_song
    ADD CONSTRAINT leitmotif_in_song_song_fkey FOREIGN KEY (song) REFERENCES public.song(id);


--
-- Name: minifig_in_battle_pack minifig_in_battle_pack_battle_pack_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.minifig_in_battle_pack
    ADD CONSTRAINT minifig_in_battle_pack_battle_pack_fkey FOREIGN KEY (battle_pack) REFERENCES public.battle_pack(id);


--
-- Name: minifig_in_battle_pack minifig_in_battle_pack_minifig_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.minifig_in_battle_pack
    ADD CONSTRAINT minifig_in_battle_pack_minifig_fkey FOREIGN KEY (minifig) REFERENCES public.minifig(id);


--
-- Name: song song_game_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.song
    ADD CONSTRAINT song_game_fkey FOREIGN KEY (game) REFERENCES public.game(id);


--
-- Name: subleitmotif_in_song subleitmotif_in_song_song_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subleitmotif_in_song
    ADD CONSTRAINT subleitmotif_in_song_song_fkey FOREIGN KEY (song) REFERENCES public.song(id);


--
-- Name: subleitmotif_in_song subleitmotif_in_song_subleitmotif_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subleitmotif_in_song
    ADD CONSTRAINT subleitmotif_in_song_subleitmotif_fkey FOREIGN KEY (subleitmotif) REFERENCES public.subleitmotif(id);


--
-- Name: subleitmotif subleitmotif_leitmotif_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subleitmotif
    ADD CONSTRAINT subleitmotif_leitmotif_fkey FOREIGN KEY (leitmotif) REFERENCES public.leitmotif(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA public TO readonly;


--
-- Name: TABLE battle_pack; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.battle_pack TO readonly;


--
-- Name: TABLE game; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.game TO readonly;


--
-- Name: TABLE leitmotif; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.leitmotif TO readonly;


--
-- Name: TABLE leitmotif_in_song; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.leitmotif_in_song TO readonly;


--
-- Name: TABLE minifig; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.minifig TO readonly;


--
-- Name: TABLE minifig_in_battle_pack; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.minifig_in_battle_pack TO readonly;


--
-- Name: TABLE song; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.song TO readonly;


--
-- Name: TABLE source; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.source TO readonly;


--
-- Name: TABLE subleitmotif; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.subleitmotif TO readonly;


--
-- Name: TABLE subleitmotif_in_song; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.subleitmotif_in_song TO readonly;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT SELECT ON TABLES  TO readonly;


--
-- PostgreSQL database dump complete
--

\unrestrict o3QsV6ETwniaqnu7tb780n6sMQXwcvMm3NaKxwZoNyaRTKNYFYosYAnXeEjPez0

