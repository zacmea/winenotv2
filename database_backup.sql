--
-- PostgreSQL database dump
--

-- Dumped from database version 14.12 (Homebrew)
-- Dumped by pg_dump version 14.12 (Homebrew)

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
-- Name: account_user; Type: TABLE; Schema: public; Owner: zach
--

CREATE TABLE public.account_user (
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    id uuid NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_active boolean NOT NULL,
    is_superuser boolean NOT NULL,
    is_staff boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.account_user OWNER TO zach;

--
-- Name: account_user_groups; Type: TABLE; Schema: public; Owner: zach
--

CREATE TABLE public.account_user_groups (
    id bigint NOT NULL,
    user_id uuid NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.account_user_groups OWNER TO zach;

--
-- Name: account_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: zach
--

ALTER TABLE public.account_user_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.account_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: account_user_user_permissions; Type: TABLE; Schema: public; Owner: zach
--

CREATE TABLE public.account_user_user_permissions (
    id bigint NOT NULL,
    user_id uuid NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.account_user_user_permissions OWNER TO zach;

--
-- Name: account_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: zach
--

ALTER TABLE public.account_user_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.account_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: zach
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO zach;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: zach
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: zach
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO zach;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: zach
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: zach
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO zach;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: zach
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: collexn_collexn; Type: TABLE; Schema: public; Owner: zach
--

CREATE TABLE public.collexn_collexn (
    id uuid NOT NULL,
    name character varying(30) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    created_by_id uuid NOT NULL
);


ALTER TABLE public.collexn_collexn OWNER TO zach;

--
-- Name: collexn_collexn_wines; Type: TABLE; Schema: public; Owner: zach
--

CREATE TABLE public.collexn_collexn_wines (
    id bigint NOT NULL,
    collexn_id uuid NOT NULL,
    wine_id bigint NOT NULL
);


ALTER TABLE public.collexn_collexn_wines OWNER TO zach;

--
-- Name: collexn_collexn_wines_id_seq; Type: SEQUENCE; Schema: public; Owner: zach
--

ALTER TABLE public.collexn_collexn_wines ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.collexn_collexn_wines_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: collexn_wine; Type: TABLE; Schema: public; Owner: zach
--

CREATE TABLE public.collexn_wine (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    link character varying(200) NOT NULL,
    thumb character varying(200) NOT NULL,
    country character varying(100) NOT NULL,
    region character varying(100) NOT NULL,
    average_rating numeric(3,2) NOT NULL,
    number_of_ratings integer NOT NULL,
    price numeric(10,2) NOT NULL
);


ALTER TABLE public.collexn_wine OWNER TO zach;

--
-- Name: collexn_wine_id_seq; Type: SEQUENCE; Schema: public; Owner: zach
--

ALTER TABLE public.collexn_wine ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.collexn_wine_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: zach
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id uuid NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO zach;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: zach
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: zach
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO zach;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: zach
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: zach
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO zach;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: zach
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: zach
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO zach;

--
-- Data for Name: account_user; Type: TABLE DATA; Schema: public; Owner: zach
--

COPY public.account_user (password, last_login, id, first_name, last_name, email, is_active, is_superuser, is_staff, date_joined) FROM stdin;
pbkdf2_sha256$720000$i7lUyL2v5LVBPATaRtawp1$HC90R4w5DiiUbFnf1oXMV4VqyLEBt6T8Z7f4B+ogUrU=	\N	c4b7ab64-1f15-4811-a803-ba1039757289	Zachary	Mears	zach.mears@gmail.com	t	t	f	2024-06-06 19:35:53.359584-04
pbkdf2_sha256$720000$KvzrldCtUMXyEylZZw4fpc$NQRGPHiWlQMWUc5eBexax4YmPt6WlAtrsAvzmBLXR3s=	2024-06-07 21:29:48.945123-04	c0b08492-ac38-4f78-b37a-f05acf7d9fdc			a@a.com	t	t	t	2024-06-07 21:29:22.741055-04
pbkdf2_sha256$720000$Y1G0ODcp87nq868rl4wPpN$z/u6bS6k0UNDiPv2GnuzgDK4Q0ABHYrFn5J8OPFRalI=	\N	2bffad1a-132b-47a4-822f-837a6a5c8d94	Zachary	Mears	a@b.com	t	f	f	2024-06-08 10:47:48.252943-04
\.


--
-- Data for Name: account_user_groups; Type: TABLE DATA; Schema: public; Owner: zach
--

COPY public.account_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: account_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: zach
--

COPY public.account_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: zach
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: zach
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: zach
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add wine	6	add_wine
22	Can change wine	6	change_wine
23	Can delete wine	6	delete_wine
24	Can view wine	6	view_wine
25	Can add user	7	add_user
26	Can change user	7	change_user
27	Can delete user	7	delete_user
28	Can view user	7	view_user
29	Can add wine collection	8	add_winecollection
30	Can change wine collection	8	change_winecollection
31	Can delete wine collection	8	delete_winecollection
32	Can view wine collection	8	view_winecollection
33	Can add collexn	9	add_collexn
34	Can change collexn	9	change_collexn
35	Can delete collexn	9	delete_collexn
36	Can view collexn	9	view_collexn
37	Can add wine	10	add_wine
38	Can change wine	10	change_wine
39	Can delete wine	10	delete_wine
40	Can view wine	10	view_wine
\.


--
-- Data for Name: collexn_collexn; Type: TABLE DATA; Schema: public; Owner: zach
--

COPY public.collexn_collexn (id, name, created_at, created_by_id) FROM stdin;
1325aa11-c940-4869-8091-95b2a3e4bda2	Lunch Wines	2024-06-07 21:35:37.095857-04	c4b7ab64-1f15-4811-a803-ba1039757289
a3aab93c-0194-479a-ac30-faf238d58c30	dinner wines	2024-06-08 08:30:10.85148-04	c4b7ab64-1f15-4811-a803-ba1039757289
3a61eb97-44d7-4c8d-b62d-4cd0e52f3939	test	2024-06-08 11:00:07.635585-04	2bffad1a-132b-47a4-822f-837a6a5c8d94
0a26310a-ea72-4ea4-aad0-f306c2a75fe4	test2	2024-06-08 11:08:17.765112-04	2bffad1a-132b-47a4-822f-837a6a5c8d94
9d1cd0ab-e34f-4e38-965b-430a0cea6c6a	brekkie wines	2024-06-08 12:23:58.220309-04	2bffad1a-132b-47a4-822f-837a6a5c8d94
f9b2032f-7763-4811-8c8e-4174cbba8be0	picnic wines	2024-06-08 12:35:32.003821-04	2bffad1a-132b-47a4-822f-837a6a5c8d94
fea1128e-95b4-45f0-9566-ad19de35135e	test3	2024-06-08 14:17:09.882064-04	c4b7ab64-1f15-4811-a803-ba1039757289
0692de6b-2316-4291-8e6c-946470a50f8f	test4	2024-06-08 15:57:13.089193-04	c4b7ab64-1f15-4811-a803-ba1039757289
fcd465d2-0efc-4833-995d-9d97f1ad70cd	test5	2024-06-08 15:59:22.898042-04	c4b7ab64-1f15-4811-a803-ba1039757289
\.


--
-- Data for Name: collexn_collexn_wines; Type: TABLE DATA; Schema: public; Owner: zach
--

COPY public.collexn_collexn_wines (id, collexn_id, wine_id) FROM stdin;
1	1325aa11-c940-4869-8091-95b2a3e4bda2	1
2	a3aab93c-0194-479a-ac30-faf238d58c30	1
3	a3aab93c-0194-479a-ac30-faf238d58c30	2
4	9d1cd0ab-e34f-4e38-965b-430a0cea6c6a	5
5	9d1cd0ab-e34f-4e38-965b-430a0cea6c6a	6
6	f9b2032f-7763-4811-8c8e-4174cbba8be0	8
7	f9b2032f-7763-4811-8c8e-4174cbba8be0	7
8	fea1128e-95b4-45f0-9566-ad19de35135e	9
9	0692de6b-2316-4291-8e6c-946470a50f8f	10
10	fcd465d2-0efc-4833-995d-9d97f1ad70cd	11
\.


--
-- Data for Name: collexn_wine; Type: TABLE DATA; Schema: public; Owner: zach
--

COPY public.collexn_wine (id, name, link, thumb, country, region, average_rating, number_of_ratings, price) FROM stdin;
1	big grape	http://www.grape.com	http://www.img.com	usa	ca	4.30	5	12.99
2	big white	http://www.grape.com	http://www.img.com	United States	MA	3.50	12	11.99
3	name	http://www.link.com	http://www.link.com	usa	ma	2.90	10	2.99
4	name	http://www.link.com	http://www.link.com	us	us	2.90	2	2.99
5	black and gold	http://www.link.com	http://www.thumb.com	usa	ma	2.30	2	2.33
6	black and yellow	http://www.link.com	http://www.thumb.com	usa	ma	3.40	5	2.34
7	red and blue	http://www.link.com	http://www.thumb.com	usa	ma	3.40	4	4.55
8	true blue	http://www.links.com	http://www.thumbs.com	usa	ma	5.00	10	10.99
9	winer	http://www.l.com	http://www.t.com	us	us	4.00	4	4.09
10	asdf	http://asdf	http://asdf	asdf	asdf	4.00	44	4.00
11	asdf	http://lkj	http://lkj	lkjlkj	lkj	5.00	5	5.00
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: zach
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2024-06-07 21:35:00.988288-04	1	big grape	1	[{"added": {}}]	10	c0b08492-ac38-4f78-b37a-f05acf7d9fdc
2	2024-06-07 21:35:37.107956-04	1325aa11-c940-4869-8091-95b2a3e4bda2	Lunch Wines	1	[{"added": {}}]	9	c0b08492-ac38-4f78-b37a-f05acf7d9fdc
3	2024-06-08 08:29:58.588986-04	2	big white	1	[{"added": {}}]	10	c0b08492-ac38-4f78-b37a-f05acf7d9fdc
4	2024-06-08 08:30:10.857807-04	a3aab93c-0194-479a-ac30-faf238d58c30	dinner wines	1	[{"added": {}}]	9	c0b08492-ac38-4f78-b37a-f05acf7d9fdc
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: zach
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	account	wine
7	account	user
8	account	winecollection
9	collexn	collexn
10	collexn	wine
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: zach
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-06-03 22:33:20.812186-04
2	contenttypes	0002_remove_content_type_name	2024-06-03 22:33:20.818416-04
3	auth	0001_initial	2024-06-03 22:33:20.854036-04
4	auth	0002_alter_permission_name_max_length	2024-06-03 22:33:20.857493-04
5	auth	0003_alter_user_email_max_length	2024-06-03 22:33:20.859719-04
6	auth	0004_alter_user_username_opts	2024-06-03 22:33:20.86323-04
7	auth	0005_alter_user_last_login_null	2024-06-03 22:33:20.865472-04
8	auth	0006_require_contenttypes_0002	2024-06-03 22:33:20.866438-04
9	auth	0007_alter_validators_add_error_messages	2024-06-03 22:33:20.868493-04
10	auth	0008_alter_user_username_max_length	2024-06-03 22:33:20.870695-04
11	auth	0009_alter_user_last_name_max_length	2024-06-03 22:33:20.873192-04
12	auth	0010_alter_group_name_max_length	2024-06-03 22:33:20.876829-04
13	auth	0011_update_proxy_permissions	2024-06-03 22:33:20.878552-04
14	auth	0012_alter_user_first_name_max_length	2024-06-03 22:33:20.880836-04
15	account	0001_initial	2024-06-03 22:33:20.926886-04
16	admin	0001_initial	2024-06-03 22:33:20.938775-04
17	admin	0002_logentry_remove_auto_add	2024-06-03 22:33:20.943226-04
18	admin	0003_logentry_add_action_flag_choices	2024-06-03 22:33:20.946236-04
19	sessions	0001_initial	2024-06-03 22:33:20.952918-04
20	account	0002_remove_winecollection_wines_and_more	2024-06-07 17:09:32.183634-04
21	collexn	0001_initial	2024-06-07 21:32:33.327709-04
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: zach
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
yw0jnwqcn448lrr8ley46bnzx679ezv4	.eJxVzDkOwjAQheG7uMbWeMM2JT1niMYzHsKiRMpSIe4OkVJA_f7vvVSH69J369ym7sbqpAgq5FCcRvJZB0lZV59QC0QkSVyESR1-WUV6tGGzfMfhOhoah2W6VbMlZl9ncxm5Pc97-3fQ49x_dURwjnxLBaWEShDb0bsSm4ANxUOt3DiCRSvQWCwIu2QzMcYqHKx6fwBS10JN:1sFktw:68ugWUJ_SL8GWEQF0fiKubA3yaB-nT-1pPlhAsyIzbw	2024-06-21 21:29:48.948208-04
\.


--
-- Name: account_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zach
--

SELECT pg_catalog.setval('public.account_user_groups_id_seq', 1, false);


--
-- Name: account_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zach
--

SELECT pg_catalog.setval('public.account_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zach
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zach
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zach
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);


--
-- Name: collexn_collexn_wines_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zach
--

SELECT pg_catalog.setval('public.collexn_collexn_wines_id_seq', 10, true);


--
-- Name: collexn_wine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zach
--

SELECT pg_catalog.setval('public.collexn_wine_id_seq', 11, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zach
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 4, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zach
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zach
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 21, true);


--
-- Name: account_user account_user_email_key; Type: CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.account_user
    ADD CONSTRAINT account_user_email_key UNIQUE (email);


--
-- Name: account_user_groups account_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.account_user_groups
    ADD CONSTRAINT account_user_groups_pkey PRIMARY KEY (id);


--
-- Name: account_user_groups account_user_groups_user_id_group_id_4d09af3e_uniq; Type: CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.account_user_groups
    ADD CONSTRAINT account_user_groups_user_id_group_id_4d09af3e_uniq UNIQUE (user_id, group_id);


--
-- Name: account_user account_user_pkey; Type: CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.account_user
    ADD CONSTRAINT account_user_pkey PRIMARY KEY (id);


--
-- Name: account_user_user_permissions account_user_user_permis_user_id_permission_id_48bdd28b_uniq; Type: CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.account_user_user_permissions
    ADD CONSTRAINT account_user_user_permis_user_id_permission_id_48bdd28b_uniq UNIQUE (user_id, permission_id);


--
-- Name: account_user_user_permissions account_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.account_user_user_permissions
    ADD CONSTRAINT account_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: collexn_collexn collexn_collexn_pkey; Type: CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.collexn_collexn
    ADD CONSTRAINT collexn_collexn_pkey PRIMARY KEY (id);


--
-- Name: collexn_collexn_wines collexn_collexn_wines_collexn_id_wine_id_ad07c6ef_uniq; Type: CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.collexn_collexn_wines
    ADD CONSTRAINT collexn_collexn_wines_collexn_id_wine_id_ad07c6ef_uniq UNIQUE (collexn_id, wine_id);


--
-- Name: collexn_collexn_wines collexn_collexn_wines_pkey; Type: CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.collexn_collexn_wines
    ADD CONSTRAINT collexn_collexn_wines_pkey PRIMARY KEY (id);


--
-- Name: collexn_wine collexn_wine_pkey; Type: CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.collexn_wine
    ADD CONSTRAINT collexn_wine_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: account_user_email_0bd7c421_like; Type: INDEX; Schema: public; Owner: zach
--

CREATE INDEX account_user_email_0bd7c421_like ON public.account_user USING btree (email varchar_pattern_ops);


--
-- Name: account_user_groups_group_id_6c71f749; Type: INDEX; Schema: public; Owner: zach
--

CREATE INDEX account_user_groups_group_id_6c71f749 ON public.account_user_groups USING btree (group_id);


--
-- Name: account_user_groups_user_id_14345e7b; Type: INDEX; Schema: public; Owner: zach
--

CREATE INDEX account_user_groups_user_id_14345e7b ON public.account_user_groups USING btree (user_id);


--
-- Name: account_user_user_permissions_permission_id_66c44191; Type: INDEX; Schema: public; Owner: zach
--

CREATE INDEX account_user_user_permissions_permission_id_66c44191 ON public.account_user_user_permissions USING btree (permission_id);


--
-- Name: account_user_user_permissions_user_id_cc42d270; Type: INDEX; Schema: public; Owner: zach
--

CREATE INDEX account_user_user_permissions_user_id_cc42d270 ON public.account_user_user_permissions USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: zach
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: zach
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: zach
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: zach
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: collexn_collexn_created_by_id_8c0ab473; Type: INDEX; Schema: public; Owner: zach
--

CREATE INDEX collexn_collexn_created_by_id_8c0ab473 ON public.collexn_collexn USING btree (created_by_id);


--
-- Name: collexn_collexn_wines_collexn_id_20f804ac; Type: INDEX; Schema: public; Owner: zach
--

CREATE INDEX collexn_collexn_wines_collexn_id_20f804ac ON public.collexn_collexn_wines USING btree (collexn_id);


--
-- Name: collexn_collexn_wines_wine_id_afd43aab; Type: INDEX; Schema: public; Owner: zach
--

CREATE INDEX collexn_collexn_wines_wine_id_afd43aab ON public.collexn_collexn_wines USING btree (wine_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: zach
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: zach
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: zach
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: zach
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: account_user_groups account_user_groups_group_id_6c71f749_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.account_user_groups
    ADD CONSTRAINT account_user_groups_group_id_6c71f749_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_groups account_user_groups_user_id_14345e7b_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.account_user_groups
    ADD CONSTRAINT account_user_groups_user_id_14345e7b_fk_account_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_user_permissions account_user_user_pe_permission_id_66c44191_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.account_user_user_permissions
    ADD CONSTRAINT account_user_user_pe_permission_id_66c44191_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_user_user_permissions account_user_user_pe_user_id_cc42d270_fk_account_u; Type: FK CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.account_user_user_permissions
    ADD CONSTRAINT account_user_user_pe_user_id_cc42d270_fk_account_u FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: collexn_collexn collexn_collexn_created_by_id_8c0ab473_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.collexn_collexn
    ADD CONSTRAINT collexn_collexn_created_by_id_8c0ab473_fk_account_user_id FOREIGN KEY (created_by_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: collexn_collexn_wines collexn_collexn_wines_collexn_id_20f804ac_fk_collexn_collexn_id; Type: FK CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.collexn_collexn_wines
    ADD CONSTRAINT collexn_collexn_wines_collexn_id_20f804ac_fk_collexn_collexn_id FOREIGN KEY (collexn_id) REFERENCES public.collexn_collexn(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: collexn_collexn_wines collexn_collexn_wines_wine_id_afd43aab_fk_collexn_wine_id; Type: FK CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.collexn_collexn_wines
    ADD CONSTRAINT collexn_collexn_wines_wine_id_afd43aab_fk_collexn_wine_id FOREIGN KEY (wine_id) REFERENCES public.collexn_wine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_account_user_id; Type: FK CONSTRAINT; Schema: public; Owner: zach
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_account_user_id FOREIGN KEY (user_id) REFERENCES public.account_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

