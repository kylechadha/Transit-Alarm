--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: agencies; Type: TABLE; Schema: public; Owner: kyle; Tablespace: 
--

CREATE TABLE agencies (
    id integer NOT NULL,
    gtfs_agency_id character varying(255),
    name character varying(255),
    url character varying(255),
    timezone character varying(255),
    lang character varying(255),
    phone character varying(255),
    fare_url character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.agencies OWNER TO kyle;

--
-- Name: agencies_id_seq; Type: SEQUENCE; Schema: public; Owner: kyle
--

CREATE SEQUENCE agencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.agencies_id_seq OWNER TO kyle;

--
-- Name: agencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kyle
--

ALTER SEQUENCE agencies_id_seq OWNED BY agencies.id;


--
-- Name: journeys; Type: TABLE; Schema: public; Owner: kyle; Tablespace: 
--

CREATE TABLE journeys (
    id integer NOT NULL,
    name character varying(255),
    direction character varying(255),
    start_lat double precision,
    start_lon double precision,
    end_lat double precision,
    end_lon double precision,
    alert_distance character varying(255),
    alert_type character varying(255),
    user_id integer,
    trip_id integer,
    stop_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.journeys OWNER TO kyle;

--
-- Name: journeys_id_seq; Type: SEQUENCE; Schema: public; Owner: kyle
--

CREATE SEQUENCE journeys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.journeys_id_seq OWNER TO kyle;

--
-- Name: journeys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kyle
--

ALTER SEQUENCE journeys_id_seq OWNED BY journeys.id;


--
-- Name: routes; Type: TABLE; Schema: public; Owner: kyle; Tablespace: 
--

CREATE TABLE routes (
    id integer NOT NULL,
    gtfs_route_id character varying(255),
    gtfs_agency_id character varying(255),
    short_name character varying(255),
    long_name character varying(255),
    "desc" character varying(255),
    route_type integer,
    url character varying(255),
    color character varying(255),
    text_color character varying(255),
    outbound character varying(255),
    inbound character varying(255),
    agency_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.routes OWNER TO kyle;

--
-- Name: routes_id_seq; Type: SEQUENCE; Schema: public; Owner: kyle
--

CREATE SEQUENCE routes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.routes_id_seq OWNER TO kyle;

--
-- Name: routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kyle
--

ALTER SEQUENCE routes_id_seq OWNED BY routes.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: kyle; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO kyle;

--
-- Name: stop_times; Type: TABLE; Schema: public; Owner: kyle; Tablespace: 
--

CREATE TABLE stop_times (
    id integer NOT NULL,
    gtfs_trip_id character varying(255),
    arrival_time character varying(255),
    departure_time character varying(255),
    gtfs_stop_id character varying(255),
    sequence integer,
    headsign character varying(255),
    pickup_type integer,
    drop_off_type integer,
    shape_dist_traveled double precision,
    trip_id integer,
    stop_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.stop_times OWNER TO kyle;

--
-- Name: stop_times_id_seq; Type: SEQUENCE; Schema: public; Owner: kyle
--

CREATE SEQUENCE stop_times_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stop_times_id_seq OWNER TO kyle;

--
-- Name: stop_times_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kyle
--

ALTER SEQUENCE stop_times_id_seq OWNED BY stop_times.id;


--
-- Name: stops; Type: TABLE; Schema: public; Owner: kyle; Tablespace: 
--

CREATE TABLE stops (
    id integer NOT NULL,
    gtfs_stop_id character varying(255),
    code character varying(255),
    name character varying(255),
    "desc" character varying(255),
    lat double precision,
    lon double precision,
    zone_id character varying(255),
    url character varying(255),
    location_type character varying(255),
    parent_station character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.stops OWNER TO kyle;

--
-- Name: stops_id_seq; Type: SEQUENCE; Schema: public; Owner: kyle
--

CREATE SEQUENCE stops_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stops_id_seq OWNER TO kyle;

--
-- Name: stops_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kyle
--

ALTER SEQUENCE stops_id_seq OWNED BY stops.id;


--
-- Name: trips; Type: TABLE; Schema: public; Owner: kyle; Tablespace: 
--

CREATE TABLE trips (
    id integer NOT NULL,
    gtfs_route_id character varying(255),
    gtfs_service_id character varying(255),
    gtfs_trip_id character varying(255),
    headsign character varying(255),
    short_name character varying(255),
    direction_id integer,
    block_id character varying(255),
    shape_id character varying(255),
    route_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.trips OWNER TO kyle;

--
-- Name: trips_id_seq; Type: SEQUENCE; Schema: public; Owner: kyle
--

CREATE SEQUENCE trips_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trips_id_seq OWNER TO kyle;

--
-- Name: trips_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kyle
--

ALTER SEQUENCE trips_id_seq OWNED BY trips.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: kyle; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255),
    name character varying(255),
    password_salt character varying(255),
    password_hash character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO kyle;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: kyle
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO kyle;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kyle
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY agencies ALTER COLUMN id SET DEFAULT nextval('agencies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY journeys ALTER COLUMN id SET DEFAULT nextval('journeys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY routes ALTER COLUMN id SET DEFAULT nextval('routes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY stop_times ALTER COLUMN id SET DEFAULT nextval('stop_times_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY stops ALTER COLUMN id SET DEFAULT nextval('stops_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY trips ALTER COLUMN id SET DEFAULT nextval('trips_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kyle
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: agencies; Type: TABLE DATA; Schema: public; Owner: kyle
--

COPY agencies (id, gtfs_agency_id, name, url, timezone, lang, phone, fare_url, created_at, updated_at) FROM stdin;
2	6216179	Big Blue Bus	http://www.bigbluebus.com	America/Los_Angeles	en	3104581975	\N	2014-03-07 00:47:15.304805	2014-03-07 00:47:15.304805
\.


--
-- Name: agencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kyle
--

SELECT pg_catalog.setval('agencies_id_seq', 2, true);


--
-- Data for Name: journeys; Type: TABLE DATA; Schema: public; Owner: kyle
--

COPY journeys (id, name, direction, start_lat, start_lon, end_lat, end_lon, alert_distance, alert_type, user_id, trip_id, stop_id, created_at, updated_at) FROM stdin;
1	Route 4: San Vicente Blvd - Carlyle Ave	To Westside Pavilion	34.0130188999999987	-118.495106799999974	\N	\N	\N	\N	\N	5351	\N	2014-03-08 02:50:00.911354	2014-03-08 02:50:00.911354
2	Route 4: San Vicente Blvd - Carlyle Ave	To Westside Pavilion	34.0130188999999987	-118.495106799999974	\N	\N	\N	\N	\N	5351	\N	2014-03-08 02:50:23.994578	2014-03-08 02:50:23.994578
3	Route 4: San Vicente Blvd - Carlyle Ave	To Westside Pavilion	34.0130188999999987	-118.495106799999974	\N	\N	\N	\N	\N	5351	\N	2014-03-08 02:50:44.198073	2014-03-08 02:50:44.198073
4	Route R3: Rapid 3 Lincoln Bl - Green Line	To LAX / Green Line Station	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	6220	\N	2014-03-08 02:51:00.678199	2014-03-08 02:51:00.678199
5	Route R3: Rapid 3 Lincoln Bl - Green Line	To LAX / Green Line Station	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	6220	\N	2014-03-08 02:51:04.0722	2014-03-08 02:51:04.0722
6	Route R3: Rapid 3 Lincoln Bl - Green Line	To LAX / Green Line Station	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	6220	\N	2014-03-08 03:07:11.790949	2014-03-08 03:07:11.790949
7	Route 7: Pico Blvd	To Rimpau Transit Center	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	3682	\N	2014-03-08 03:07:18.151412	2014-03-08 03:07:18.151412
8	Route R3: Rapid 3 Lincoln Bl - Green Line	To LAX / Green Line Station	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	6220	\N	2014-03-08 03:08:01.191746	2014-03-08 03:08:01.191746
9	Route R3: Rapid 3 Lincoln Bl - Green Line	To Santa Monica	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	6179	\N	2014-03-08 03:08:04.259439	2014-03-08 03:08:04.259439
10	Route R3: Rapid 3 Lincoln Bl - Green Line	To LAX / Green Line Station	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	6220	\N	2014-03-08 03:08:06.588339	2014-03-08 03:08:06.588339
11	Route 10: Rapid 10 Santa Monica Freeway Exp	To Santa Monica	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	3966	\N	2014-03-08 03:08:23.744302	2014-03-08 03:08:23.744302
12	Route 10: Rapid 10 Santa Monica Freeway Exp	To Downtown Los Angeles	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	3941	\N	2014-03-08 03:08:26.357458	2014-03-08 03:08:26.357458
13	Route 9: Pacific Palisades	To Pacific Palisades	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	3892	\N	2014-03-08 03:09:39.742882	2014-03-08 03:09:39.742882
14	Route 10: Rapid 10 Santa Monica Freeway Exp	To Downtown Los Angeles	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	3941	\N	2014-03-08 03:09:42.718234	2014-03-08 03:09:42.718234
15	Route 8: Ocean Park Blvd - Ucla	To Santa Monica	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	3858	\N	2014-03-08 03:09:45.434066	2014-03-08 03:09:45.434066
16	Route R3: Rapid 3 Lincoln Bl - Green Line	To LAX / Green Line Station	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	6220	\N	2014-03-08 03:10:54.409836	2014-03-08 03:10:54.409836
17	Route 8: Ocean Park Blvd - Ucla	To Santa Monica	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	3858	\N	2014-03-08 03:11:07.799399	2014-03-08 03:11:07.799399
18	Route 8: Ocean Park Blvd - Ucla	To UCLA	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	5644	\N	2014-03-08 03:11:13.351628	2014-03-08 03:11:13.351628
19	Route 1: Santa Monica Blvd - Ucla	To Venice	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	5000	\N	2014-03-08 03:11:16.853193	2014-03-08 03:11:16.853193
20	Route 10: Rapid 10 Santa Monica Freeway Exp	To Santa Monica	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	3966	\N	2014-03-08 03:11:59.673686	2014-03-08 03:11:59.673686
21	Route 10: Rapid 10 Santa Monica Freeway Exp	To Downtown Los Angeles	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	3941	\N	2014-03-08 03:12:01.493034	2014-03-08 03:12:01.493034
22	Route 8: Ocean Park Blvd - Ucla	To Santa Monica	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	3858	\N	2014-03-08 03:12:06.466705	2014-03-08 03:12:06.466705
23	Route 8: Ocean Park Blvd - Ucla	To UCLA	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	5644	\N	2014-03-08 03:12:10.645759	2014-03-08 03:12:10.645759
24	Route 1: Santa Monica Blvd - Ucla	To Venice	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	5000	\N	2014-03-08 03:12:20.224147	2014-03-08 03:12:20.224147
25	Route 1: Santa Monica Blvd - Ucla	To UCLA	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	4906	\N	2014-03-08 03:12:27.007306	2014-03-08 03:12:27.007306
26	Route 7: Pico Blvd	To Santa Monica	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	3753	\N	2014-03-08 03:12:34.522985	2014-03-08 03:12:34.522985
27	Route 7: Pico Blvd	To Rimpau Transit Center	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	3682	\N	2014-03-08 03:12:39.871328	2014-03-08 03:12:39.871328
28	Route R7: Rapid 7 Pico Blvd	To Santa Monica	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	6342	\N	2014-03-08 03:12:52.337715	2014-03-08 03:12:52.337715
29	Route R7: Rapid 7 Pico Blvd	To Metro Purple Station	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	6263	\N	2014-03-08 03:12:56.346172	2014-03-08 03:12:56.346172
30	Route R3: Rapid 3 Lincoln Bl - Green Line	To LAX / Green Line Station	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	6220	\N	2014-03-08 03:13:01.035317	2014-03-08 03:13:01.035317
31	Route 4: San Vicente Blvd - Carlyle Ave	To Downtown Santa Monica	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	5360	\N	2014-03-08 03:13:16.324615	2014-03-08 03:13:16.324615
32	Route 4: San Vicente Blvd - Carlyle Ave	To Westside Pavilion	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	5351	\N	2014-03-08 03:13:26.826791	2014-03-08 03:13:26.826791
33	Route 3: Montana Ave - Lincoln Blvd	To Green Line Station	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	3541	\N	2014-03-08 03:13:38.885325	2014-03-08 03:13:38.885325
34	Route R3: Rapid 3 Lincoln Bl - Green Line	To LAX / Green Line Station	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	6220	\N	2014-03-08 03:13:59.967111	2014-03-08 03:13:59.967111
35	Route R3: Rapid 3 Lincoln Bl - Green Line	To LAX / Green Line Station	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	6220	\N	2014-03-08 03:15:23.17081	2014-03-08 03:15:23.17081
36	Route 9: Pacific Palisades	To Santa Monica	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	3916	\N	2014-03-08 03:18:39.105366	2014-03-08 03:18:39.105366
37	Route 9: Pacific Palisades	To Pacific Palisades	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	3892	\N	2014-03-08 03:18:43.419153	2014-03-08 03:18:43.419153
38	Route R7: Rapid 7 Pico Blvd	To Santa Monica	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	6342	\N	2014-03-08 03:33:28.599336	2014-03-08 03:33:28.599336
39	Route R7: Rapid 7 Pico Blvd	To Metro Purple Station	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	6263	\N	2014-03-08 03:33:29.30456	2014-03-08 03:33:29.30456
40	Route 20: Santa Monica - Expo Express	To Santa Monica	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	4127	\N	2014-03-08 03:34:03.720357	2014-03-08 03:34:03.720357
41	Route 20: Santa Monica - Expo Express	To Expo Culver City Station	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	4124	\N	2014-03-08 03:34:04.194821	2014-03-08 03:34:04.194821
42	Route 9: Pacific Palisades	To Santa Monica	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	3916	\N	2014-03-08 03:34:49.314498	2014-03-08 03:34:49.314498
43	Route 9: Pacific Palisades	To Pacific Palisades	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	3892	\N	2014-03-08 03:34:49.777085	2014-03-08 03:34:49.777085
44	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	5200	\N	2014-03-08 03:34:54.135831	2014-03-08 03:34:54.135831
45	Route 2: Wilshire Blvd - Venice	To Santa Monica	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	3430	\N	2014-03-08 03:35:13.14045	2014-03-08 03:35:13.14045
46	Route 2: Wilshire Blvd - Venice	To UCLA	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	5095	\N	2014-03-08 03:35:13.786285	2014-03-08 03:35:13.786285
47	Route 4: San Vicente Blvd - Carlyle Ave	To Westside Pavilion	34.013034900000001	-118.495101000000005	\N	\N	\N	\N	\N	5351	\N	2014-03-08 03:35:33.882637	2014-03-08 03:35:33.882637
48	Route 8: Ocean Park Blvd - Ucla	To Santa Monica	34.0130300000000005	-118.495115899999988	\N	\N	\N	\N	\N	3858	\N	2014-03-08 04:07:11.126771	2014-03-08 04:07:11.126771
49	Route 7: Pico Blvd	To Santa Monica	34.0130149000000017	-118.495109799999994	\N	\N	\N	\N	\N	3753	\N	2014-03-08 04:09:26.738935	2014-03-08 04:09:26.738935
50	Route 7: Pico Blvd	To Rimpau Transit Center	34.0130149000000017	-118.495109799999994	\N	\N	\N	\N	\N	3682	\N	2014-03-08 04:09:31.425152	2014-03-08 04:09:31.425152
51	Route 7: Pico Blvd	To Rimpau Transit Center	34.0130149000000017	-118.495109799999994	\N	\N	\N	\N	\N	3682	\N	2014-03-08 04:12:39.880965	2014-03-08 04:12:39.880965
52	Route 7: Pico Blvd	To Santa Monica	34.0130272999999974	-118.495099599999975	\N	\N	\N	\N	\N	3753	\N	2014-03-08 04:14:17.702026	2014-03-08 04:14:17.702026
53	Route 7: Pico Blvd	To Santa Monica	34.0130272999999974	-118.495099599999975	\N	\N	\N	\N	\N	3753	\N	2014-03-08 04:14:34.389964	2014-03-08 04:14:34.389964
54	Route 7: Pico Blvd	To Santa Monica	34.0130272999999974	-118.495099599999975	\N	\N	\N	\N	\N	3753	\N	2014-03-08 04:14:48.416507	2014-03-08 04:14:48.416507
55	Route 7: Pico Blvd	To Santa Monica	34.0130272999999974	-118.495099599999975	\N	\N	\N	\N	\N	3753	\N	2014-03-08 04:14:53.459221	2014-03-08 04:14:53.459221
56	Route 7: Pico Blvd	To Santa Monica	34.0130272999999974	-118.495099599999975	\N	\N	\N	\N	\N	3753	\N	2014-03-08 04:15:48.836761	2014-03-08 04:15:48.836761
57	Route 7: Pico Blvd	To Santa Monica	34.0130272999999974	-118.495099599999975	\N	\N	\N	\N	\N	3753	\N	2014-03-08 04:18:13.788567	2014-03-08 04:18:13.788567
58	Route 7: Pico Blvd	To Santa Monica	34.0130272999999974	-118.495099599999975	\N	\N	\N	\N	\N	3753	\N	2014-03-08 04:18:29.653517	2014-03-08 04:18:29.653517
59	Route 7: Pico Blvd	To Santa Monica	34.0130272999999974	-118.495099599999975	\N	\N	\N	\N	\N	3753	\N	2014-03-08 04:23:51.282764	2014-03-08 04:23:51.282764
60	Route 7: Pico Blvd	To Santa Monica	34.0130272999999974	-118.495099599999975	\N	\N	\N	\N	\N	3753	\N	2014-03-08 04:23:52.416975	2014-03-08 04:23:52.416975
61	Route 7: Pico Blvd	To Santa Monica	34.0130272999999974	-118.495099599999975	\N	\N	\N	\N	\N	3753	\N	2014-03-08 04:24:21.344936	2014-03-08 04:24:21.344936
62	Route 7: Pico Blvd	To Santa Monica	34.0130272999999974	-118.495099599999975	\N	\N	\N	\N	\N	3753	\N	2014-03-08 04:24:30.023723	2014-03-08 04:24:30.023723
63	Route 7: Pico Blvd	To Santa Monica	34.0130272999999974	-118.495099599999975	\N	\N	\N	\N	\N	3753	\N	2014-03-08 04:24:39.331838	2014-03-08 04:24:39.331838
64	Route 7: Pico Blvd	To Santa Monica	34.0130272999999974	-118.495099599999975	\N	\N	\N	\N	\N	3753	\N	2014-03-08 04:24:51.848185	2014-03-08 04:24:51.848185
65	Route 1: Santa Monica Blvd - Ucla	To Venice	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-03-08 05:12:43.218666	2014-03-08 05:12:43.218666
66	Route 1: Santa Monica Blvd - Ucla	To Venice	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-03-08 05:13:30.687823	2014-03-08 05:13:30.687823
67	Route 1: Santa Monica Blvd - Ucla	To Venice	\N	\N	\N	\N	\N	\N	\N	\N	\N	2014-03-08 05:20:21.611492	2014-03-08 05:20:21.611492
68	Route 1: Santa Monica Blvd - Ucla	To UCLA	34.0130551999999966	-118.495075	34.042231000000001	-118.459280000000007	\N	\N	\N	4906	1076	2014-03-08 05:20:38.670618	2014-03-08 05:20:38.670618
69	Route R3: Rapid 3 Lincoln Bl - Green Line	To LAX / Green Line Station	34.0128538999999961	-118.495176799999996	33.990016500000003	-118.447562500000004	\N	\N	\N	6220	1026	2014-03-08 05:21:50.257295	2014-03-08 05:21:50.257295
70	Route 7: Pico Blvd	To Rimpau Transit Center	34.0128538999999961	-118.495176799999996	34.0282344000000023	-118.452393299999997	500 meters	Alarm	\N	3682	1216	2014-03-08 05:24:34.895574	2014-03-08 05:24:34.895574
71	Route 7: Pico Blvd	To Rimpau Transit Center	34.0128538999999961	-118.495176799999996	34.0282344000000023	-118.452393299999997	1500 meters	Alarm & Notification	\N	3682	1216	2014-03-08 05:24:50.255433	2014-03-08 05:24:50.255433
72	Route 7: Pico Blvd	To Rimpau Transit Center	34.0128538999999961	-118.495176799999996	34.0282344000000023	-118.452393299999997	500 meters	Alarm	\N	3682	1216	2014-03-08 05:26:56.118361	2014-03-08 05:26:56.118361
73	Route 7: Pico Blvd	To Rimpau Transit Center	34.0128538999999961	-118.495176799999996	34.0282344000000023	-118.452393299999997	500 meters	Alarm	\N	3682	1216	2014-03-08 05:27:23.640249	2014-03-08 05:27:23.640249
74	Route 7: Pico Blvd	To Rimpau Transit Center	34.0128538999999961	-118.495176799999996	34.0282344000000023	-118.452393299999997	500 meters	Alarm	\N	3682	1216	2014-03-08 05:27:58.849422	2014-03-08 05:27:58.849422
75	Route 7: Pico Blvd	To Rimpau Transit Center	34.0128538999999961	-118.495176799999996	34.0282344000000023	-118.452393299999997	500 meters	Alarm	\N	3682	1216	2014-03-08 05:28:53.11916	2014-03-08 05:28:53.11916
76	Route 7: Pico Blvd	To Rimpau Transit Center	34.0128538999999961	-118.495176799999996	34.0282344000000023	-118.452393299999997	500 meters	Alarm & Notification	\N	3682	1216	2014-03-08 05:29:02.789238	2014-03-08 05:29:02.789238
77	Route 7: Pico Blvd	To Rimpau Transit Center	34.0128538999999961	-118.495176799999996	34.0282344000000023	-118.452393299999997	500 meters	Alarm & Notification	\N	3682	1216	2014-03-08 05:29:19.057825	2014-03-08 05:29:19.057825
78	Route 7: Pico Blvd	To Rimpau Transit Center	34.0128538999999961	-118.495176799999996	34.0282344000000023	-118.452393299999997	500 meters	Alarm & Notification	\N	3682	1216	2014-03-08 05:30:00.685798	2014-03-08 05:30:00.685798
79	Route 7: Pico Blvd	To Rimpau Transit Center	34.0128538999999961	-118.495176799999996	34.0282344000000023	-118.452393299999997	500 meters	Alarm & Notification	\N	3682	1216	2014-03-08 05:30:10.508275	2014-03-08 05:30:10.508275
80	Route 7: Pico Blvd	To Rimpau Transit Center	34.0128538999999961	-118.495176799999996	34.0282344000000023	-118.452393299999997	500 meters	Alarm	\N	3682	1216	2014-03-08 05:30:19.084573	2014-03-08 05:30:19.084573
81	Route 7: Pico Blvd	To Rimpau Transit Center	34.0128538999999961	-118.495176799999996	34.0282344000000023	-118.452393299999997	500 meters	Alarm	\N	3682	1216	2014-03-08 05:31:04.813818	2014-03-08 05:31:04.813818
82	Route 4: San Vicente Blvd - Carlyle Ave	To Westside Pavilion	34.0130337000000011	-118.495101699999992	34.0531811999999974	-118.461430899999996	1500 meters	Alarm & Notification	\N	5351	1401	2014-03-08 05:33:23.342534	2014-03-08 05:33:23.342534
83	Route 20: Santa Monica - Expo Express	To Expo Culver City Station	34.0130138999999971	-118.495083599999987	34.0291139999999999	-118.387952600000006	1500 meters	Alarm	\N	4124	1969	2014-03-08 05:38:35.810701	2014-03-08 05:38:35.810701
84	Route 20: Santa Monica - Expo Express	To Expo Culver City Station	34.0130138999999971	-118.495083599999987	34.0291139999999999	-118.387952600000006	0.5 miles	Alarm	\N	4124	1969	2014-03-08 05:39:49.519989	2014-03-08 05:39:49.519989
85	Route 3: Montana Ave - Lincoln Blvd	To Green Line Station	34.0130184	-118.495086199999989	34.0109801999999988	-118.4888677	1.0 miles	Alarm	\N	3541	1890	2014-03-08 05:43:34.554026	2014-03-08 05:43:34.554026
86	Route 8: Ocean Park Blvd - Ucla	To Santa Monica	34.0130096999999978	-118.495148900000004	34.0133921999999984	-118.495295499999997	1.0 miles	Alarm	\N	3858	1159	2014-03-08 19:55:27.279738	2014-03-08 19:55:27.279738
87	Route 9: Pacific Palisades	To Pacific Palisades	34.0130566999999999	-118.495125200000004	34.0490186999999978	-118.540286499999993	0.5 miles	Alarm	\N	3892	1728	2014-03-08 20:47:48.816039	2014-03-08 20:47:48.816039
88	Route 10: Rapid 10 Santa Monica Freeway Exp	To Santa Monica	34.0130462999999992	-118.495139600000002	34.0130414999999999	-118.495010100000002	0.5 miles	Alarm	\N	3966	1138	2014-03-08 21:05:52.853169	2014-03-08 21:05:52.853169
89	Route 7: Pico Blvd	To Rimpau Transit Center	34.0130162000000027	-118.495143299999995	34.0252377999999993	-118.458571000000006	1.5 miles	Notification	\N	3682	1214	2014-03-08 23:22:55.857242	2014-03-08 23:22:55.857242
90	Route 7: Pico Blvd	To Rimpau Transit Center	34.0129736000000022	-118.495316000000003	34.0292302000000007	-118.450380199999998	0.5 miles	Alarm	\N	3682	1041	2014-03-08 23:30:50.561345	2014-03-08 23:30:50.561345
91	Route 7: Pico Blvd	To Rimpau Transit Center	34.0130067999999994	-118.495255700000001	34.0282344000000023	-118.452393299999997	0.5 miles	Alarm	\N	3682	1216	2014-03-08 23:31:39.405682	2014-03-08 23:31:39.405682
92	Route 10: Rapid 10 Santa Monica Freeway Exp	To Downtown Los Angeles	34.0129317999999969	-118.495229199999997	34.0158941999999982	-118.495807299999996	1.0 miles	Alarm	\N	3941	1052	2014-03-09 00:06:43.331744	2014-03-09 00:06:43.331744
93	Route 1: Santa Monica Blvd - Ucla	To UCLA	34.0130057000000008	-118.495287300000001	34.0154397000000017	-118.496358499999999	1.5 miles	Alarm	\N	4906	1133	2014-03-09 00:08:28.133832	2014-03-09 00:08:28.133832
94	Route R3: Rapid 3 Lincoln Bl - Green Line	To LAX / Green Line Station	34.0130527000000029	-118.495131299999997	33.9723371999999983	-118.430669399999999	0.5 miles	Alarm	\N	6220	1427	2014-03-09 00:14:19.805523	2014-03-09 00:14:19.805523
95	Route 10: Rapid 10 Santa Monica Freeway Exp	To Downtown Los Angeles	34.0128909000000021	-118.495220599999996	34.0140090000000015	-118.497764099999998	1.0 miles	Alarm	\N	3941	1156	2014-03-09 00:32:37.150763	2014-03-09 00:32:37.150763
96	Route R3: Rapid 3 Lincoln Bl - Green Line	To Santa Monica	34.0130380000000017	-118.495135899999994	34.0140930999999966	-118.492270099999999	0.5 miles	Alarm	\N	6179	1007	2014-03-09 00:39:30.637886	2014-03-09 00:39:30.637886
97	Route 7: Pico Blvd	To Rimpau Transit Center	34.0129389999999958	-118.495226799999998	34.0149893000000034	-118.477779499999997	0.5 miles	Alarm	\N	3682	1565	2014-03-09 01:20:18.969471	2014-03-09 01:20:18.969471
98	Route 8: Ocean Park Blvd - Ucla	To UCLA	34.0130203000000009	-118.495124200000006	34.0081478000000033	-118.489862700000003	0.5 miles	Alarm & Notification	\N	5644	1004	2014-03-09 02:04:22.596721	2014-03-09 02:04:22.596721
99	Route R7: Rapid 7 Pico Blvd	To Metro Purple Station	34.0129650000000012	-118.495325800000003	34.0367598999999998	-118.435356900000002	0.25 miles	Alarm & Notification	\N	6263	1567	2014-03-09 02:10:59.415391	2014-03-09 02:10:59.415391
100	Route R7: Rapid 7 Pico Blvd	To Metro Purple Station	34.0129650000000012	-118.495325800000003	34.0367598999999998	-118.435356900000002	0.25 miles	Alarm & Notification	\N	6263	1567	2014-03-09 02:13:04.979871	2014-03-09 02:13:04.979871
101	Route R7: Rapid 7 Pico Blvd	To Metro Purple Station	34.0129650000000012	-118.495325800000003	34.0367598999999998	-118.435356900000002	0.25 miles	Alarm & Notification	\N	6263	1567	2014-03-09 02:13:37.072775	2014-03-09 02:13:37.072775
102	Route 7: Pico Blvd	To Rimpau Transit Center	34.0128981999999951	-118.495221399999977	34.0481307000000015	-118.352930900000004	0.25 miles	Alarm & Notification	\N	3682	1559	2014-03-09 02:21:53.449924	2014-03-09 02:21:53.449924
103	Route 9: Pacific Palisades	To Pacific Palisades	34.0128935999999982	-118.495217100000005	34.0486385999999968	-118.541536899999997	0.25 miles	Alarm & Notification	\N	3892	1729	2014-03-09 03:20:58.790453	2014-03-09 03:20:58.790453
104	Route 9: Pacific Palisades	To Pacific Palisades	34.0130462999999992	-118.495072300000004	34.0359782999999965	-118.519248300000001	0.25 miles	Alarm & Notification	\N	3892	1716	2014-03-09 03:21:20.467397	2014-03-09 03:21:20.467397
105	Route 7: Pico Blvd	To Rimpau Transit Center	34.0129990000000006	-118.495234199999999	34.0478194000000016	-118.344335999999998	0.25 miles	Alarm & Notification	\N	3682	1562	2014-03-09 03:33:47.255099	2014-03-09 03:33:47.255099
106	Route R3: Rapid 3 Lincoln Bl - Green Line	To Santa Monica	33.9538221999999976	-118.438562399999995	34.0163320999999996	-118.494924400000002	1.0 miles	Alarm & Notification	\N	6179	997	2014-03-09 08:52:07.537643	2014-03-09 08:52:07.537643
107	Route 14: Bundy Dr - Centinela Ave	To Brentwood	33.9538219000000012	-118.438537299999993	34.0387495000000015	-118.461034799999993	0.5 miles	Alarm & Notification	\N	4047	1762	2014-03-09 17:17:09.305847	2014-03-09 17:17:09.305847
108	Route 1: Santa Monica Blvd - Ucla	To UCLA	33.9538361999999978	-118.438519299999996	33.9949202000000028	-118.463170599999998	0.25 miles	Alarm & Notification	\N	4906	1314	2014-03-09 18:38:50.351941	2014-03-09 18:38:50.351941
109	Route 1: Santa Monica Blvd - Ucla	To UCLA	33.9538361999999978	-118.438519299999996	33.9949202000000028	-118.463170599999998	0.25 miles	Alarm & Notification	\N	4906	1314	2014-03-09 18:41:42.245005	2014-03-09 18:41:42.245005
110	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9538249000000008	-118.438583000000008	33.9624851000000021	-118.421420699999999	2.0 miles	Alarm & Notification	\N	5200	1371	2014-03-09 19:34:03.55647	2014-03-09 19:34:03.55647
111	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.953831000000001	-118.438541399999991	33.9624851000000021	-118.421420699999999	2.0 miles	Alarm & Notification	\N	5200	1371	2014-03-09 19:35:28.262571	2014-03-09 19:35:28.262571
112	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9538281999999967	-118.438542299999995	33.9624851000000021	-118.421420699999999	2.0 miles	Alarm	\N	5200	1371	2014-03-09 19:35:41.860826	2014-03-09 19:35:41.860826
113	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9538281999999967	-118.438542299999995	33.9624851000000021	-118.421420699999999	2.0 miles	Notification	\N	5200	1371	2014-03-09 19:36:50.840987	2014-03-09 19:36:50.840987
114	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9538281999999967	-118.438542299999995	33.9624851000000021	-118.421420699999999	2.0 miles	Alarm	\N	5200	1371	2014-03-09 19:40:41.400469	2014-03-09 19:40:41.400469
115	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9538281999999967	-118.438542299999995	33.9624851000000021	-118.421420699999999	0.25 miles	Alarm	\N	5200	1371	2014-03-09 19:50:09.062783	2014-03-09 19:50:09.062783
116	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9538054000000002	-118.438572100000002	33.9624851000000021	-118.421420699999999	2.0 miles	Alarm & Notification	\N	5200	1371	2014-03-09 19:53:14.303132	2014-03-09 19:53:14.303132
117	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9538054000000002	-118.438572100000002	33.9624851000000021	-118.421420699999999	2.0 miles	Alarm & Notification	\N	5200	1371	2014-03-09 20:18:54.623821	2014-03-09 20:18:54.623821
118	Route 3: Montana Ave - Lincoln Blvd	To Green Line Station	33.9538173999999984	-118.438554100000005	33.9672048999999987	-118.427528199999998	2.0 miles	Alarm & Notification	\N	3541	1947	2014-03-09 20:20:23.233527	2014-03-09 20:20:23.233527
119	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9538173999999984	-118.438554100000005	33.9624851000000021	-118.421420699999999	2.0 miles	Alarm & Notification	\N	5200	1371	2014-03-09 20:22:57.658203	2014-03-09 20:22:57.658203
120	Route 3: Montana Ave - Lincoln Blvd	To Green Line Station	33.9538081999999974	-118.438595800000016	33.9672048999999987	-118.427528199999998	2.0 miles	Alarm	\N	3541	1947	2014-03-09 20:30:09.134776	2014-03-09 20:30:09.134776
121	Route 3: Montana Ave - Lincoln Blvd	To Green Line Station	33.9538081999999974	-118.438595800000016	33.9672048999999987	-118.427528199999998	2.0 miles	Alarm	\N	3541	1947	2014-03-09 20:32:36.865702	2014-03-09 20:32:36.865702
122	Route 3: Montana Ave - Lincoln Blvd	To Green Line Station	33.9538081999999974	-118.438595800000016	33.9672048999999987	-118.427528199999998	0.25 miles	Alarm & Notification	\N	3541	1947	2014-03-09 20:33:06.499779	2014-03-09 20:33:06.499779
123	Route 3: Montana Ave - Lincoln Blvd	To Green Line Station	33.9538263000000029	-118.438551399999994	33.9568709999999996	-118.396383599999993	1.0 miles	Alarm & Notification	\N	3541	1434	2014-03-09 20:46:01.681661	2014-03-09 20:46:01.681661
124	Route R3: Rapid 3 Lincoln Bl - Green Line	To Santa Monica	33.9538293999999965	-118.438587199999986	33.9859493000000015	-118.443529699999999	0.25 miles	Alarm & Notification	\N	6179	1377	2014-03-09 20:47:54.050827	2014-03-09 20:47:54.050827
125	Route 3: Montana Ave - Lincoln Blvd	To Green Line Station	33.9538263000000029	-118.438551399999994	33.9597288000000006	-118.409603200000006	0.25 miles	Alarm & Notification	\N	3541	1431	2014-03-09 21:18:51.477521	2014-03-09 21:18:51.477521
126	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9538089999999997	-118.438582999999994	34.0140930999999966	-118.492270099999999	0.5 miles	Alarm & Notification	\N	5200	1007	2014-03-09 22:22:41.175534	2014-03-09 22:22:41.175534
127	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9538237000000009	-118.438590399999995	33.9624851000000021	-118.421420699999999	0.25 miles	Alarm & Notification	\N	5200	1371	2014-03-09 23:01:26.818593	2014-03-09 23:01:26.818593
128	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9538038999999969	-118.438549899999998	33.980894499999998	-118.439215599999997	2.0 miles	Alarm & Notification	\N	5200	1375	2014-03-09 23:19:53.186638	2014-03-09 23:19:53.186638
129	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9538089999999997	-118.438582399999987	33.9624851000000021	-118.421420699999999	0.25 miles	Alarm & Notification	\N	5200	1371	2014-03-09 23:20:24.70189	2014-03-09 23:20:24.70189
130	Route 3: Montana Ave - Lincoln Blvd	To Green Line Station	33.9538097000000008	-118.438591500000001	33.9672048999999987	-118.427528199999998	2.0 miles	Alarm & Notification	\N	3541	1947	2014-03-10 01:12:56.451226	2014-03-10 01:12:56.451226
131	Route 3: Montana Ave - Lincoln Blvd	To Green Line Station	33.9538097000000008	-118.438591500000001	33.9672048999999987	-118.427528199999998	2.0 miles	Notification	\N	3541	1947	2014-03-10 01:15:13.302087	2014-03-10 01:15:13.302087
132	Route 1: Santa Monica Blvd - Ucla	To UCLA	33.9537497330773164	-118.438656348845399	33.9912782999999976	-118.468085599999995	2.0 miles	Alarm & Notification	\N	4906	1908	2014-03-10 01:23:32.594855	2014-03-10 01:23:32.594855
133	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9538208000000026	-118.438578199999995	33.9624851000000021	-118.421420699999999	2.0 miles	Notification	\N	5200	1371	2014-03-10 01:25:08.330074	2014-03-10 01:25:08.330074
134	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9538208000000026	-118.438578199999995	33.9624851000000021	-118.421420699999999	0.25 miles	Alarm & Notification	\N	5200	1371	2014-03-10 01:26:57.962651	2014-03-10 01:26:57.962651
135	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9538152000000011	-118.438589699999994	33.9624851000000021	-118.421420699999999	2.0 miles	Notification	\N	5200	1371	2014-03-10 01:32:32.194924	2014-03-10 01:32:32.194924
136	Route R3: Rapid 3 Lincoln Bl - Green Line	To Santa Monica	33.9538178999999971	-118.438589599999986	33.960451599999999	-118.419659800000005	2.0 miles	Notification	\N	6179	1912	2014-03-10 01:32:57.10222	2014-03-10 01:32:57.10222
137	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9538353000000015	-118.438585200000006	33.9624851000000021	-118.421420699999999	2.0 miles	Notification	\N	5200	1371	2014-03-10 01:40:05.880517	2014-03-10 01:40:05.880517
138	Route R3: Rapid 3 Lincoln Bl - Green Line	To Santa Monica	33.9538178999999971	-118.438589599999986	33.960451599999999	-118.419659800000005	0.25 miles	Alarm & Notification	\N	6179	1912	2014-03-10 01:44:27.740441	2014-03-10 01:44:27.740441
139	Route R3: Rapid 3 Lincoln Bl - Green Line	To Santa Monica	33.9538178999999971	-118.438589599999986	33.960451599999999	-118.419659800000005	1.0 miles	Alarm & Notification	\N	6179	1912	2014-03-10 01:44:56.958106	2014-03-10 01:44:56.958106
140	Route R3: Rapid 3 Lincoln Bl - Green Line	To Santa Monica	33.9538178999999971	-118.438589599999986	33.960451599999999	-118.419659800000005	2.0 miles	Alarm	\N	6179	1912	2014-03-10 01:45:18.87695	2014-03-10 01:45:18.87695
141	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9538174999999995	-118.438576499999996	33.9624851000000021	-118.421420699999999	0.25 miles	Alarm & Notification	\N	5200	1371	2014-03-10 01:52:45.338202	2014-03-10 01:52:45.338202
142	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9538109000000006	-118.438571899999999	34.0112497000000005	-118.484945600000003	0.25 miles	Alarm & Notification	\N	5200	1152	2014-03-10 02:06:16.792893	2014-03-10 02:06:16.792893
143	Route 14: Bundy Dr - Centinela Ave	To Culver City	33.9538225000000011	-118.438596700000005	33.9914771999999985	-118.421328799999998	0.25 miles	Alarm & Notification	\N	4090	1070	2014-03-10 02:25:07.677459	2014-03-10 02:25:07.677459
144	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.953831000000001	-118.438540999999987	34.0112497000000005	-118.484945600000003	0.25 miles	Alarm & Notification	\N	5200	1152	2014-03-10 02:38:39.101373	2014-03-10 02:38:39.101373
145	Route 14: Bundy Dr - Centinela Ave	To Brentwood	33.9537963000000005	-118.438622899999999	34.0471038000000021	-118.468907700000003	0.25 miles	Alarm & Notification	\N	4047	1741	2014-03-10 02:46:17.393834	2014-03-10 02:46:17.393834
146	Route R3: Rapid 3 Lincoln Bl - Green Line	To Santa Monica	33.9538212000000001	-118.438580400000006	33.9939070000000001	-118.452276699999999	0.25 miles	Alarm & Notification	\N	6179	1306	2014-03-10 05:14:40.654891	2014-03-10 05:14:40.654891
147	Route R3: Rapid 3 Lincoln Bl - Green Line	To Santa Monica	33.9538212000000001	-118.438580400000006	33.9939070000000001	-118.452276699999999	2.0 miles	Alarm & Notification	\N	6179	1306	2014-03-10 05:15:28.045454	2014-03-10 05:15:28.045454
148	Route R3: Rapid 3 Lincoln Bl - Green Line	To Santa Monica	33.9538212000000001	-118.438580400000006	33.9939070000000001	-118.452276699999999	0.5 miles	Alarm & Notification	\N	6179	1306	2014-03-10 05:15:55.081324	2014-03-10 05:15:55.081324
149	Route R3: Rapid 3 Lincoln Bl - Green Line	To Santa Monica	33.9538212000000001	-118.438580400000006	33.9939070000000001	-118.452276699999999	0.5 miles	Alarm & Notification	\N	6179	1306	2014-03-10 05:22:19.089751	2014-03-10 05:22:19.089751
150	Route R3: Rapid 3 Lincoln Bl - Green Line	To Santa Monica	33.9538075000000035	-118.438574599999995	34.0163320999999996	-118.494924400000002	0.25 miles	Alarm & Notification	\N	6179	997	2014-03-10 05:46:04.664498	2014-03-10 05:46:04.664498
151	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9537977999999967	-118.438549300000005	33.9624851000000021	-118.421420699999999	2.0 miles	Alarm & Notification	\N	5200	1371	2014-03-10 05:46:59.240181	2014-03-10 05:46:59.240181
152	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9537977999999967	-118.438549300000005	33.9624851000000021	-118.421420699999999	2.0 miles	Alarm & Notification	\N	5200	1371	2014-03-10 05:47:35.261193	2014-03-10 05:47:35.261193
153	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9538280000000015	-118.438593099999991	33.9624851000000021	-118.421420699999999	2.0 miles	Alarm & Notification	\N	5200	1371	2014-03-10 05:49:15.462161	2014-03-10 05:49:15.462161
154	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9537977999999967	-118.438549300000005	33.9624851000000021	-118.421420699999999	2.0 miles	Alarm & Notification	\N	5200	1371	2014-03-10 05:50:31.986456	2014-03-10 05:50:31.986456
155	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9537977999999967	-118.438549300000005	33.9624851000000021	-118.421420699999999	1.0 miles	Alarm & Notification	\N	5200	1371	2014-03-10 05:50:49.838319	2014-03-10 05:50:49.838319
156	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9537977999999967	-118.438549300000005	33.9624851000000021	-118.421420699999999	2.0 miles	Alarm & Notification	\N	5200	1371	2014-03-10 05:51:15.347022	2014-03-10 05:51:15.347022
157	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9538174999999995	-118.438570200000001	33.9624851000000021	-118.421420699999999	2.0 miles	Alarm & Notification	\N	5200	1371	2014-03-10 05:52:20.460998	2014-03-10 05:52:20.460998
158	Route 8: Ocean Park Blvd - Ucla	To Santa Monica	33.9538152000000011	-118.438590599999998	34.0025417000000019	-118.483737700000006	0.5 miles	Alarm & Notification	\N	3858	1199	2014-03-10 05:54:05.078206	2014-03-10 05:54:05.078206
159	Route R3: Rapid 3 Lincoln Bl - Green Line	To Santa Monica	33.953821099999999	-118.438585599999996	33.9979465999999988	-118.460669300000006	0.25 miles	Alarm & Notification	\N	6179	1920	2014-03-10 05:58:27.915693	2014-03-10 05:58:27.915693
160	Route 8: Ocean Park Blvd - Ucla	To UCLA	33.9538141000000024	-118.438586400000005	34.0189395000000019	-118.455549099999999	1.0 miles	Alarm & Notification	\N	5644	1667	2014-03-10 06:26:19.013396	2014-03-10 06:26:19.013396
161	Route R3: Rapid 3 Lincoln Bl - Green Line	To LAX / Green Line Station	33.953809200000002	-118.438597999999999	33.9295297999999974	-118.376399500000005	2.0 miles	Alarm	\N	6220	1014	2014-03-10 06:28:23.319567	2014-03-10 06:28:23.319567
162	Route 14: Bundy Dr - Centinela Ave	To Brentwood	33.9538219000000012	-118.438579599999997	34.0079333999999989	-118.436678400000005	0.25 miles	Alarm & Notification	\N	4047	1868	2014-03-10 06:55:04.627084	2014-03-10 06:55:04.627084
163	Route 6: Smc Commuter	To Palms	33.9537976000000015	-118.438568000000004	34.0275436000000013	-118.406210000000002	0.5 miles	Alarm & Notification	\N	5462	1824	2014-03-10 14:55:27.550013	2014-03-10 14:55:27.550013
164	Route 10: Rapid 10 Santa Monica Freeway Exp	To Santa Monica	34.0130617000000015	-118.495143400000003	34.0130414999999999	-118.495010100000002	0.25 miles	Alarm & Notification	\N	3966	1138	2014-03-10 16:34:18.555289	2014-03-10 16:34:18.555289
165	Route 3: Montana Ave - Lincoln Blvd	To Green Line Station	34.0132950124898485	-118.495206042742367	33.9295297999999974	-118.376399500000005	0.25 miles	Alarm & Notification	\N	3541	1014	2014-03-10 16:34:41.920901	2014-03-10 16:34:41.920901
166	Route 10: Rapid 10 Santa Monica Freeway Exp	To Santa Monica	34.0131019000000023	-118.495039899999995	34.0130414999999999	-118.495010100000002	2.0 miles	Alarm & Notification	\N	3966	1138	2014-03-10 16:37:03.614119	2014-03-10 16:37:03.614119
167	Route 7: Pico Blvd	To Rimpau Transit Center	34.0130820999999983	-118.495077800000004	34.0548576999999995	-118.399268599999999	0.5 miles	Alarm & Notification	\N	3682	1545	2014-03-10 21:46:30.289889	2014-03-10 21:46:30.289889
168	Route 10: Rapid 10 Santa Monica Freeway Exp	To Downtown Los Angeles	34.0130691000000027	-118.495106699999994	34.0130414999999999	-118.495010100000002	0.5 miles	Notification	\N	3941	1138	2014-03-10 21:47:33.963336	2014-03-10 21:47:33.963336
169	Route 7: Pico Blvd	To Rimpau Transit Center	34.0130958000000021	-118.495064400000004	34.0217761999999979	-118.465059999999994	0.5 miles	Alarm & Notification	\N	3682	1211	2014-03-10 22:47:38.16888	2014-03-10 22:47:38.16888
170	Route R7: Rapid 7 Pico Blvd	To Santa Monica	32.9776854999999998	-117.069099100000003	34.0240545999999995	-118.461094299999999	0.5 miles	Alarm & Notification	\N	6342	1945	2014-03-15 21:13:59.504907	2014-03-15 21:13:59.504907
171	Route 10: Rapid 10 Santa Monica Freeway Exp	To Downtown Los Angeles	32.9776962999999981	-117.069110699999996	34.0566056999999986	-118.237322000000006	2.0 miles	Alarm & Notification	\N	3941	1752	2014-03-16 18:09:02.35176	2014-03-16 18:09:02.35176
172	Route R3: Rapid 3 Lincoln Bl - Green Line	To Santa Monica	33.9538147999999964	-118.438577600000002	34.0140930999999966	-118.492270099999999	0.5 miles	Alarm & Notification	\N	6179	1007	2014-03-31 23:09:29.109111	2014-03-31 23:09:29.109111
173	Route 5: Olympic Bl - Century City	To Expo Culver City Station	34.0583017999999953	-118.422759599999992	34.0383854000000028	-118.388455199999996	0.5 miles	Alarm & Notification	\N	3626	1787	2014-04-03 17:26:10.147519	2014-04-03 17:26:10.147519
174	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9538366000000025	-118.438533100000001	33.9624851000000021	-118.421420699999999	2.0 miles	Alarm & Notification	\N	5200	1371	2014-04-08 20:57:20.963178	2014-04-08 20:57:20.963178
175	Route 6: Smc Commuter	To Palms	33.9538391999999973	-118.438571699999997	34.0295763000000022	-118.388631599999997	0.25 miles	Alarm	\N	5462	1103	2014-04-08 20:59:25.322997	2014-04-08 20:59:25.322997
176	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9538411999999994	-118.438570000000013	33.9823975999999988	-118.440742099999994	0.25 miles	Alarm & Notification	\N	5200	1376	2014-04-08 21:14:47.550464	2014-04-08 21:14:47.550464
177	Route 8: Ocean Park Blvd - Ucla	To UCLA	33.9915100999999993	-118.477261500000012	34.0209503000000026	-118.452066700000003	0.25 miles	Alarm & Notification	\N	5644	1668	2014-04-14 22:10:34.250497	2014-04-14 22:10:34.250497
178	Route 8: Ocean Park Blvd - Ucla	To UCLA	33.9915166999999983	-118.477233900000016	34.0295981000000012	-118.422883100000007	1.0 miles	Alarm & Notification	\N	5644	1109	2014-04-14 22:12:52.168966	2014-04-14 22:12:52.168966
179	Route 3: Montana Ave - Lincoln Blvd	To Santa Monica / UCLA	33.9538427999999968	-118.438552599999994	34.0140930999999966	-118.492270099999999	1.0 miles	Alarm & Notification	\N	5200	1007	2014-04-16 05:49:23.447379	2014-04-16 05:49:23.447379
180	Route R7: Rapid 7 Pico Blvd	To Metro Purple Station	40.7786862999999968	-73.9517206000000016	34.0624058000000005	-118.308894899999999	0.5 miles	Alarm & Notification	\N	6263	1956	2014-04-18 03:20:44.663472	2014-04-18 03:20:44.663472
181	Route 5: Olympic Bl - Century City	To Expo Culver City Station	40.7786960999999977	-73.951688500000003	34.0414636000000002	-118.387624099999996	1.0 miles	Alarm & Notification	\N	3626	1784	2014-04-18 04:08:45.482938	2014-04-18 04:08:45.482938
182	Route 5: Olympic Bl - Century City	To Expo Culver City Station	40.7786758999999961	-73.9517077	34.0368558999999991	-118.388875100000007	2.0 miles	Alarm & Notification	\N	3626	1788	2014-04-18 04:23:54.867409	2014-04-18 04:23:54.867409
183	Route 5: Olympic Bl - Century City	To Expo Culver City Station	40.7786891999999952	-73.9517116999999899	34.0543410000000009	-118.3839057	0.25 miles	Alarm & Notification	\N	3626	1128	2014-04-18 04:27:14.913894	2014-04-18 04:27:14.913894
\.


--
-- Name: journeys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kyle
--

SELECT pg_catalog.setval('journeys_id_seq', 183, true);


--
-- Data for Name: routes; Type: TABLE DATA; Schema: public; Owner: kyle
--

COPY routes (id, gtfs_route_id, gtfs_agency_id, short_name, long_name, "desc", route_type, url, color, text_color, outbound, inbound, agency_id, created_at, updated_at) FROM stdin;
20	1944	6216179	1	Santa Monica Blvd - Ucla	\N	3	\N	\N	\N	To Venice	To UCLA	2	2014-03-07 00:47:15.353788	2014-03-07 00:47:15.579293
21	1945	6216179	2	Wilshire Blvd - Venice	\N	3	\N	\N	\N	To Santa Monica	To UCLA	2	2014-03-07 00:47:15.370996	2014-03-07 00:47:15.593593
22	1946	6216179	3	Montana Ave - Lincoln Blvd	\N	3	\N	\N	\N	To Green Line Station	To Santa Monica / UCLA	2	2014-03-07 00:47:15.382407	2014-03-07 00:47:15.603945
23	1947	6216179	4	San Vicente Blvd - Carlyle Ave	\N	3	\N	\N	\N	To Downtown Santa Monica	To Westside Pavilion	2	2014-03-07 00:47:15.393508	2014-03-07 00:47:15.615229
24	1948	6216179	5	Olympic Bl - Century City	\N	3	\N	\N	\N	Santa Monica	To Expo Culver City Station	2	2014-03-07 00:47:15.404615	2014-03-07 00:47:15.626434
25	1949	6216179	6	Smc Commuter	\N	3	\N	\N	\N	To Santa Monica College	To Palms	2	2014-03-07 00:47:15.4157	2014-03-07 00:47:15.638355
26	1950	6216179	7	Pico Blvd	\N	3	\N	\N	\N	To Santa Monica	To Rimpau Transit Center	2	2014-03-07 00:47:15.426831	2014-03-07 00:47:15.650069
27	1951	6216179	8	Ocean Park Blvd - Ucla	\N	3	\N	\N	\N	To Santa Monica	To UCLA	2	2014-03-07 00:47:15.437961	2014-03-07 00:47:15.661154
28	1952	6216179	9	Pacific Palisades	\N	3	\N	\N	\N	To Santa Monica	To Pacific Palisades	2	2014-03-07 00:47:15.448653	2014-03-07 00:47:15.672437
29	1953	6216179	10	Rapid 10 Santa Monica Freeway Exp	\N	3	\N	\N	\N	To Santa Monica	To Downtown Los Angeles	2	2014-03-07 00:47:15.459282	2014-03-07 00:47:15.683574
30	1955	6216179	12	Ucla - Palms - Robertson Blvd	\N	3	\N	\N	\N	To UCLA	To Expo Culver City Station	2	2014-03-07 00:47:15.470537	2014-03-07 00:47:15.693754
31	1956	6216179	13	Cheviot Hills - Westside Pavilion	\N	3	\N	\N	\N	To Westside Pavilion	To Rimpau Transit Center	2	2014-03-07 00:47:15.481624	2014-03-07 00:47:15.70575
32	1957	6216179	14	Bundy Dr - Centinela Ave	\N	3	\N	\N	\N	To Culver City	To Brentwood	2	2014-03-07 00:47:15.493319	2014-03-07 00:47:15.716127
33	1958	6216179	20	Santa Monica - Expo Express	\N	3	\N	\N	\N	To Santa Monica	To Expo Culver City Station	2	2014-03-07 00:47:15.503649	2014-03-07 00:47:15.727923
34	1959	6216179	R12	Rapid 12 National Bl- Ucla Ackerman	\N	3	\N	\N	\N	To UCLA	To Expo Culver City Station	2	2014-03-07 00:47:15.515481	2014-03-07 00:47:15.73829
35	1960	6216179	R3	Rapid 3 Lincoln Bl - Green Line	\N	3	\N	\N	\N	To LAX / Green Line Station	To Santa Monica	2	2014-03-07 00:47:15.526617	2014-03-07 00:47:15.749272
36	1961	6216179	R7	Rapid 7 Pico Blvd	\N	3	\N	\N	\N	To Santa Monica	To Metro Purple Station	2	2014-03-07 00:47:15.537735	2014-03-07 00:47:15.761371
37	1962	6216179	41	Crosstown Ride	\N	3	\N	\N	\N	\N	Crosstown Ride	2	2014-03-07 00:47:15.548879	2014-03-07 00:47:15.772462
38	1963	6216179	44	Sunset Ride	\N	3	\N	\N	\N	\N	Sunset Ride	2	2014-03-07 00:47:15.559935	2014-03-07 00:47:15.783581
\.


--
-- Name: routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kyle
--

SELECT pg_catalog.setval('routes_id_seq', 38, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: kyle
--

COPY schema_migrations (version) FROM stdin;
20140307000024
20140307000705
20140307002538
20140307002615
20140307002822
20140307002852
20140307003142
\.


--
-- Data for Name: stop_times; Type: TABLE DATA; Schema: public; Owner: kyle
--

COPY stop_times (id, gtfs_trip_id, arrival_time, departure_time, gtfs_stop_id, sequence, headsign, pickup_type, drop_off_type, shape_dist_traveled, trip_id, stop_id, created_at, updated_at) FROM stdin;
33033	582408	 6:48:30	 6:48:30	842	21		0	0	6.18069999999999986	3858	1642	2014-03-07 00:56:14.115268	2014-03-07 01:31:17.624846
33052	582408	 7:01:16	 7:01:16	860	40		0	0	12.0562000000000005	3858	1657	2014-03-07 00:56:14.467012	2014-03-07 01:31:17.836477
34861	582609	 7:23:47	 7:23:47	431	3		0	0	0.473899999999999988	3892	1286	2014-03-07 00:56:40.905441	2014-03-07 01:31:45.227704
34889	582609	 7:41:26	 7:41:26	929	31		0	0	7.63619999999999965	3892	1724	2014-03-07 00:56:41.271964	2014-03-07 01:31:45.539375
35897	582634	 6:53:54	 6:53:54	897	15		0	0	3.13540000000000019	3916	1692	2014-03-07 00:56:54.647756	2014-03-07 01:32:00.708734
35915	582634	 7:05:31	 7:05:31	507	33		0	0	8.34190000000000076	3916	1339	2014-03-07 00:56:54.925706	2014-03-07 01:32:01.509402
8529	580994	 7:24:00	 7:24:00	1327	1		0	0	\N	3430	1974	2014-03-07 00:50:51.337123	2014-03-07 01:25:13.290295
8530	580994	 7:24:51	 7:24:51	258	2		0	0	0.32779999999999998	3430	1132	2014-03-07 00:50:51.348223	2014-03-07 01:25:13.301338
8531	580994	 7:25:30	 7:25:30	261	3		0	0	0.584600000000000009	3430	1135	2014-03-07 00:50:51.359337	2014-03-07 01:25:13.31317
8532	580994	 7:26:30	 7:26:30	301	4		0	0	0.973600000000000021	3430	1166	2014-03-07 00:50:51.370444	2014-03-07 01:25:13.323973
8533	580994	 7:26:54	 7:26:54	302	5		0	0	1.13129999999999997	3430	1167	2014-03-07 00:50:51.381554	2014-03-07 01:25:13.335283
8534	580994	 7:27:42	 7:27:42	303	6		0	0	1.4444999999999999	3430	1168	2014-03-07 00:50:51.392708	2014-03-07 01:25:13.346021
8535	580994	 7:28:37	 7:28:37	304	7		0	0	1.80390000000000006	3430	1169	2014-03-07 00:50:51.403773	2014-03-07 01:25:13.357359
8536	580994	 7:29:40	 7:29:40	401	8		0	0	2.20840000000000014	3430	1257	2014-03-07 00:50:51.414221	2014-03-07 01:25:13.368186
8537	580994	 7:31:42	 7:31:42	225	9		0	0	2.99500000000000011	3430	1113	2014-03-07 00:50:51.426193	2014-03-07 01:25:13.379328
8538	580994	 7:33:20	 7:33:20	407	10		0	0	3.63039999999999985	3430	1263	2014-03-07 00:50:51.437132	2014-03-07 01:25:13.391166
8539	580994	 7:33:52	 7:33:52	409	11		0	0	3.83630000000000004	3430	1265	2014-03-07 00:50:51.448246	2014-03-07 01:25:13.401885
8540	580994	 7:34:37	 7:34:37	411	12		0	0	4.13079999999999981	3430	1267	2014-03-07 00:50:51.459336	2014-03-07 01:25:13.41247
8541	580994	 7:35:09	 7:35:09	413	13		0	0	4.33769999999999989	3430	1269	2014-03-07 00:50:51.470523	2014-03-07 01:25:13.42343
8542	580994	 7:36:00	 7:36:00	141	14		0	0	4.62260000000000026	3430	1074	2014-03-07 00:50:51.481857	2014-03-07 01:25:13.43447
8543	580994	 7:37:00	 7:37:00	415	15		0	0	4.99800000000000022	3430	1271	2014-03-07 00:50:51.492681	2014-03-07 01:25:13.513361
8544	580994	 7:37:56	 7:37:56	416	16		0	0	5.34830000000000005	3430	1272	2014-03-07 00:50:51.503718	2014-03-07 01:25:13.524176
8545	580994	 7:38:33	 7:38:33	417	17		0	0	5.58249999999999957	3430	1273	2014-03-07 00:50:51.514968	2014-03-07 01:25:13.534937
8546	580994	 7:39:31	 7:39:31	418	18		0	0	5.94529999999999959	3430	1274	2014-03-07 00:50:51.526059	2014-03-07 01:25:13.547193
8547	580994	 7:40:21	 7:40:21	419	19		0	0	6.25649999999999995	3430	1275	2014-03-07 00:50:51.537228	2014-03-07 01:25:13.557342
8548	580994	 7:40:54	 7:40:54	420	20		0	0	6.46509999999999962	3430	1276	2014-03-07 00:50:51.547532	2014-03-07 01:25:13.568165
8550	580994	 7:42:07	 7:42:07	424	22		0	0	6.92419999999999991	3430	1280	2014-03-07 00:50:51.570533	2014-03-07 01:25:13.591226
8551	580994	 7:42:45	 7:42:45	425	23		0	0	7.16539999999999999	3430	1281	2014-03-07 00:50:51.581697	2014-03-07 01:25:13.601492
8552	580994	 7:43:24	 7:43:24	275	24		0	0	7.4093	3430	1143	2014-03-07 00:50:51.592859	2014-03-07 01:25:13.613342
8553	580994	 7:44:31	 7:44:31	276	25		0	0	7.8301999999999996	3430	1144	2014-03-07 00:50:51.603745	2014-03-07 01:25:13.624223
8554	580994	 7:45:19	 7:45:19	426	26		0	0	8.1335999999999995	3430	1282	2014-03-07 00:50:51.61496	2014-03-07 01:25:13.63485
8555	580994	 7:45:58	 7:45:58	427	27		0	0	8.38119999999999976	3430	1283	2014-03-07 00:50:51.626283	2014-03-07 01:25:13.646616
8556	580994	 7:46:48	 7:46:48	50	28		0	0	8.69379999999999953	3430	1024	2014-03-07 00:50:51.637244	2014-03-07 01:25:13.656901
8557	580994	 7:48:00	 7:48:00	13	29		0	0	9.10260000000000069	3430	1003	2014-03-07 00:50:51.648305	2014-03-07 01:25:13.668123
8558	580994	 7:48:30	 7:48:30	430	30		0	0	9.25960000000000072	3430	1285	2014-03-07 00:50:51.659424	2014-03-07 01:25:13.679768
8559	580994	 7:49:00	 7:49:00	34	31		0	0	9.4095999999999993	3430	1013	2014-03-07 00:50:51.670539	2014-03-07 01:25:13.69158
8560	580994	 7:50:28	 7:50:28	1128	32		0	0	9.98320000000000007	3430	1891	2014-03-07 00:50:51.681664	2014-03-07 01:25:13.717105
8561	580994	 7:52:13	 7:52:13	283	33		0	0	10.6666000000000007	3430	1151	2014-03-07 00:50:51.69281	2014-03-07 01:25:13.734064
36864	584557	 6:21:33	 6:21:33	1234	10		0	1	2.71150000000000002	3941	1933	2014-03-07 00:57:07.664993	2014-03-07 01:32:15.733791
36893	584557	 7:03:00	 7:03:00	1317	39		1	0	30.1384000000000007	3941	1968	2014-03-07 00:57:08.055135	2014-03-07 01:32:16.111615
37834	584582	 7:18:39	 7:18:39	966	5		0	1	0.943300000000000027	3966	1753	2014-03-07 00:57:20.919372	2014-03-07 01:32:30.623371
37863	584582	 8:04:45	 8:04:45	331	34		1	0	27.4901000000000018	3966	1191	2014-03-07 00:57:21.308479	2014-03-07 01:32:30.946188
38143	582956	 7:25:32	 7:25:32	307	10		0	0	2.52510000000000012	3991	1171	2014-03-07 00:57:24.866126	2014-03-07 01:32:35.350544
38167	582956	 7:43:06	 7:43:06	1050	34		0	0	10.2216000000000005	3991	1825	2014-03-07 00:57:25.199289	2014-03-07 01:32:35.6954
14075	581289	 7:13:00	 7:13:00	1328	1		0	0	\N	3541	1975	2014-03-07 00:52:05.489003	2014-03-07 01:26:39.844426
14076	581289	 7:13:40	 7:13:40	258	2		0	0	0.32779999999999998	3541	1132	2014-03-07 00:52:05.500128	2014-03-07 01:26:39.854851
14077	581289	 7:14:12	 7:14:12	261	3		0	0	0.584600000000000009	3541	1135	2014-03-07 00:52:05.511226	2014-03-07 01:26:39.866093
14079	581289	 7:15:19	 7:15:19	302	5		0	0	1.13129999999999997	3541	1167	2014-03-07 00:52:05.533346	2014-03-07 01:26:40.066756
14080	581289	 7:15:58	 7:15:58	303	6		0	0	1.4444999999999999	3541	1168	2014-03-07 00:52:05.544651	2014-03-07 01:26:40.076647
14081	581289	 7:16:42	 7:16:42	304	7		0	0	1.80390000000000006	3541	1169	2014-03-07 00:52:05.555947	2014-03-07 01:26:40.088302
14082	581289	 7:17:32	 7:17:32	401	8		0	0	2.20840000000000014	3541	1257	2014-03-07 00:52:05.567024	2014-03-07 01:26:40.099049
14083	581289	 7:19:10	 7:19:10	225	9		0	0	2.99500000000000011	3541	1113	2014-03-07 00:52:05.578129	2014-03-07 01:26:40.109991
14084	581289	 7:21:21	 7:21:21	579	10		0	0	4.04940000000000033	3541	1402	2014-03-07 00:52:05.589167	2014-03-07 01:26:40.121984
14085	581289	 7:22:00	 7:22:00	47	11		0	0	4.32850000000000001	3541	1022	2014-03-07 00:52:05.60022	2014-03-07 01:26:40.134724
14086	581289	 7:22:59	 7:22:59	580	12		0	0	4.78690000000000015	3541	1403	2014-03-07 00:52:05.611378	2014-03-07 01:26:40.155793
14088	581289	 7:23:54	 7:23:54	582	14		0	0	5.22090000000000032	3541	1405	2014-03-07 00:52:05.633607	2014-03-07 01:26:40.17833
14089	581289	 7:24:22	 7:24:22	583	15		0	0	5.44169999999999998	3541	1406	2014-03-07 00:52:05.644757	2014-03-07 01:26:40.189475
14090	581289	 7:25:03	 7:25:03	584	16		0	0	5.76569999999999983	3541	1407	2014-03-07 00:52:05.655897	2014-03-07 01:26:40.199731
14091	581289	 7:26:11	 7:26:11	585	17		0	0	6.29250000000000043	3541	1408	2014-03-07 00:52:05.666919	2014-03-07 01:26:40.211421
14092	581289	 7:26:42	 7:26:42	586	18		0	0	6.5389999999999997	3541	1409	2014-03-07 00:52:05.678114	2014-03-07 01:26:40.222665
14093	581289	 7:27:18	 7:27:18	587	19		0	0	6.8219000000000003	3541	1410	2014-03-07 00:52:05.689229	2014-03-07 01:26:40.233843
14094	581289	 7:27:44	 7:27:44	588	20		0	0	7.02850000000000019	3541	1411	2014-03-07 00:52:05.700274	2014-03-07 01:26:40.244661
14095	581289	 7:28:06	 7:28:06	589	21		0	0	7.20530000000000026	3541	1412	2014-03-07 00:52:05.71134	2014-03-07 01:26:40.256314
14096	581289	 7:28:48	 7:28:48	48	22		0	0	7.53490000000000038	3541	1023	2014-03-07 00:52:05.722525	2014-03-07 01:26:40.266296
14098	581289	 7:30:03	 7:30:03	591	24		0	0	8.12260000000000026	3541	1414	2014-03-07 00:52:05.744731	2014-03-07 01:26:40.287033
14099	581289	 7:30:33	 7:30:33	592	25		0	0	8.35810000000000031	3541	1415	2014-03-07 00:52:05.756086	2014-03-07 01:26:40.298164
14100	581289	 7:31:05	 7:31:05	593	26		0	0	8.60989999999999966	3541	1416	2014-03-07 00:52:05.766986	2014-03-07 01:26:40.309418
14101	581289	 7:32:02	 7:32:02	594	27		0	0	9.05189999999999984	3541	1417	2014-03-07 00:52:05.778082	2014-03-07 01:26:40.322348
14102	581289	 7:32:26	 7:32:26	595	28		0	0	9.24430000000000085	3541	1418	2014-03-07 00:52:05.789304	2014-03-07 01:26:40.33341
14103	581289	 7:32:53	 7:32:53	165	29		0	0	9.45579999999999998	3541	1086	2014-03-07 00:52:05.800413	2014-03-07 01:26:40.344887
14104	581289	 7:33:17	 7:33:17	501	30		0	0	9.64819999999999922	3541	1333	2014-03-07 00:52:05.811523	2014-03-07 01:26:40.355665
14105	581289	 7:33:36	 7:33:36	428	31		0	0	9.7995000000000001	3541	1284	2014-03-07 00:52:05.822641	2014-03-07 01:26:40.36687
14106	581289	 7:34:08	 7:34:08	427	32		0	0	10.0548999999999999	3541	1283	2014-03-07 00:52:05.833874	2014-03-07 01:26:40.377954
14107	581289	 7:35:00	 7:35:00	50	33		0	0	10.3674999999999997	3541	1024	2014-03-07 00:52:05.844874	2014-03-07 01:26:40.389923
14108	581289	 7:37:17	 7:37:17	13	34		0	0	10.7763000000000009	3541	1003	2014-03-07 00:52:05.856057	2014-03-07 01:26:40.422937
14109	581289	 7:38:09	 7:38:09	430	35		0	0	10.9332999999999991	3541	1285	2014-03-07 00:52:05.866909	2014-03-07 01:26:40.45651
14110	581289	 7:39:00	 7:39:00	34	36		0	0	11.0832999999999995	3541	1013	2014-03-07 00:52:05.87822	2014-03-07 01:26:40.533767
14111	581289	 7:40:18	 7:40:18	1126	37		0	0	11.6214999999999993	3541	1890	2014-03-07 00:52:05.889284	2014-03-07 01:26:40.545183
14112	581289	 7:40:49	 7:40:49	20	38		0	0	11.8354999999999997	3541	1006	2014-03-07 00:52:05.900404	2014-03-07 01:26:40.555463
14113	581289	 7:41:14	 7:41:14	174	39		0	0	12.0142000000000007	3541	1089	2014-03-07 00:52:05.911511	2014-03-07 01:26:40.56718
14114	581289	 7:41:55	 7:41:55	1186	40		0	0	12.2981999999999996	3541	1910	2014-03-07 00:52:05.922663	2014-03-07 01:26:40.57825
14115	581289	 7:42:54	 7:42:54	262	41		0	0	12.7077000000000009	3541	1136	2014-03-07 00:52:05.933737	2014-03-07 01:26:40.589252
14116	581289	 7:44:00	 7:44:00	51	42		0	0	13.1504999999999992	3541	1025	2014-03-07 00:52:05.944901	2014-03-07 01:26:40.600031
14117	581289	 7:44:44	 7:44:44	596	43		0	0	13.4975000000000005	3541	1419	2014-03-07 00:52:05.955687	2014-03-07 01:26:40.61171
14118	581289	 7:45:18	 7:45:18	597	44		0	0	13.7623999999999995	3541	1420	2014-03-07 00:52:05.967045	2014-03-07 01:26:40.622664
14119	581289	 7:46:08	 7:46:08	598	45		0	0	14.1532	3541	1421	2014-03-07 00:52:05.978203	2014-03-07 01:26:40.634045
14120	581289	 7:46:36	 7:46:36	599	46		0	0	14.3770000000000007	3541	1422	2014-03-07 00:52:05.989275	2014-03-07 01:26:40.645281
14121	581289	 7:47:32	 7:47:32	1201	47		0	0	14.8155000000000001	3541	1921	2014-03-07 00:52:06.000373	2014-03-07 01:26:40.656157
14122	581289	 7:48:05	 7:48:05	473	48		0	0	15.0738000000000003	3541	1308	2014-03-07 00:52:06.011469	2014-03-07 01:26:40.66708
14123	581289	 7:48:25	 7:48:25	474	49		0	0	15.2354000000000003	3541	1309	2014-03-07 00:52:06.022577	2014-03-07 01:26:40.678585
14124	581289	 7:49:02	 7:49:02	475	50		0	0	15.5236000000000001	3541	1310	2014-03-07 00:52:06.03371	2014-03-07 01:26:40.689256
14125	581289	 7:49:25	 7:49:25	476	51		0	0	15.7088000000000001	3541	1311	2014-03-07 00:52:06.044834	2014-03-07 01:26:40.700446
14127	581289	 7:51:00	 7:51:00	52	53		0	0	16.4099000000000004	3541	1026	2014-03-07 00:52:06.067009	2014-03-07 01:26:40.723344
14128	581289	 7:52:08	 7:52:08	600	54		0	0	17.0750999999999991	3541	1423	2014-03-07 00:52:06.078183	2014-03-07 01:26:40.734104
14129	581289	 7:52:47	 7:52:47	601	55		0	0	17.4513999999999996	3541	1424	2014-03-07 00:52:06.089285	2014-03-07 01:26:40.744988
14130	581289	 7:53:22	 7:53:22	602	56		0	0	17.7951000000000015	3541	1425	2014-03-07 00:52:06.100342	2014-03-07 01:26:40.756997
14131	581289	 7:53:46	 7:53:46	603	57		0	0	18.0326999999999984	3541	1426	2014-03-07 00:52:06.111499	2014-03-07 01:26:40.767673
14132	581289	 7:55:29	 7:55:29	1288	58		0	0	19.0310999999999986	3541	1952	2014-03-07 00:52:06.121979	2014-03-07 01:26:40.77852
14133	581289	 7:56:18	 7:56:18	1280	59		0	0	19.5124999999999993	3541	1947	2014-03-07 00:52:06.133784	2014-03-07 01:26:40.789848
14134	581289	 7:57:01	 7:57:01	1138	60		0	0	19.9314999999999998	3541	1898	2014-03-07 00:52:06.144824	2014-03-07 01:26:40.800353
14135	581289	 7:57:48	 7:57:48	605	61		0	0	20.3872	3541	1428	2014-03-07 00:52:06.155911	2014-03-07 01:26:40.811799
14136	581289	 7:58:30	 7:58:30	53	62		0	0	20.7937000000000012	3541	1027	2014-03-07 00:52:06.168358	2014-03-07 01:26:40.822234
14137	581289	 7:58:52	 7:58:52	606	63		0	0	21.0126999999999988	3541	1429	2014-03-07 00:52:06.178274	2014-03-07 01:26:40.833643
14138	581289	 7:59:15	 7:59:15	607	64		0	0	21.2407000000000004	3541	1430	2014-03-07 00:52:06.189458	2014-03-07 01:26:40.845545
14139	581289	 7:59:53	 7:59:53	608	65		0	0	21.6107000000000014	3541	1431	2014-03-07 00:52:06.200512	2014-03-07 01:26:40.855656
14140	581289	 8:00:48	 8:00:48	609	66		0	0	22.1477000000000004	3541	1432	2014-03-07 00:52:06.267286	2014-03-07 01:26:40.867364
14141	581289	 8:01:20	 8:01:20	610	67		0	0	22.4627000000000017	3541	1433	2014-03-07 00:52:06.300666	2014-03-07 01:26:40.878931
14142	581289	 8:02:00	 8:02:00	1282	68		0	0	22.8506999999999998	3541	1949	2014-03-07 00:52:06.311657	2014-03-07 01:26:40.889367
14143	581289	 8:02:34	 8:02:34	612	69		0	0	23.1817999999999991	3541	1434	2014-03-07 00:52:06.322743	2014-03-07 01:26:40.900681
14144	581289	 8:04:22	 8:04:22	1192	70		0	0	24.2254000000000005	3541	1914	2014-03-07 00:52:06.333934	2014-03-07 01:26:40.912522
14145	581289	 8:07:00	 8:07:00	1190	71		0	0	25.6654000000000018	3541	1913	2014-03-07 00:52:06.345003	2014-03-07 01:26:40.92236
14146	581289	 8:08:35	 8:08:35	613	72		0	0	26.3534000000000006	3541	1435	2014-03-07 00:52:06.356065	2014-03-07 01:26:40.933875
14147	581289	 8:09:14	 8:09:14	1286	73		0	0	26.6339000000000006	3541	1950	2014-03-07 00:52:06.367348	2014-03-07 01:26:40.945536
14148	581289	 8:09:46	 8:09:46	614	74		0	0	26.8671000000000006	3541	1436	2014-03-07 00:52:06.378371	2014-03-07 01:26:40.95626
14149	581289	 8:10:33	 8:10:33	615	75		0	0	27.2110999999999983	3541	1437	2014-03-07 00:52:06.389519	2014-03-07 01:26:40.96798
14150	581289	 8:11:11	 8:11:11	616	76		0	0	27.4901000000000018	3541	1438	2014-03-07 00:52:06.401273	2014-03-07 01:26:40.978909
14151	581289	 8:12:08	 8:12:08	617	77		0	0	27.9021000000000008	3541	1439	2014-03-07 00:52:06.434133	2014-03-07 01:26:40.990159
14152	581289	 8:14:03	 8:14:03	618	78		0	0	28.7301000000000002	3541	1440	2014-03-07 00:52:06.467393	2014-03-07 01:26:41.001313
14153	581289	 8:16:00	 8:16:00	38	79		0	0	29.5362000000000009	3541	1014	2014-03-07 00:52:06.478588	2014-03-07 01:26:41.01203
19048	584949	 7:17:00	 7:17:00	43	1		0	0	\N	3626	1018	2014-03-07 00:53:10.85807	2014-03-07 01:27:51.546967
19049	584949	 7:18:49	 7:18:49	50	2		0	0	0.630199999999999982	3626	1024	2014-03-07 00:53:10.869132	2014-03-07 01:27:51.557924
19050	584949	 7:20:00	 7:20:00	13	3		0	0	1.03899999999999992	3626	1003	2014-03-07 00:53:10.880312	2014-03-07 01:27:51.56897
19051	584949	 7:23:00	 7:23:00	1334	4		0	0	1.6903999999999999	3626	1979	2014-03-07 00:53:10.891391	2014-03-07 01:27:51.647661
19052	584949	 7:23:40	 7:23:40	1333	5		0	0	2.06320000000000014	3626	1978	2014-03-07 00:53:10.90252	2014-03-07 01:27:51.657973
19053	584949	 7:24:19	 7:24:19	1335	6		0	0	2.42240000000000011	3626	1980	2014-03-07 00:53:10.914241	2014-03-07 01:27:51.669387
19055	584949	 7:25:38	 7:25:38	1337	8		0	0	3.15359999999999996	3626	1982	2014-03-07 00:53:10.935874	2014-03-07 01:27:51.692891
19056	584949	 7:26:50	 7:26:50	696	9		0	0	3.8113999999999999	3626	1506	2014-03-07 00:53:10.947115	2014-03-07 01:27:51.702477
19057	584949	 7:27:23	 7:27:23	697	10		0	0	4.11969999999999992	3626	1507	2014-03-07 00:53:10.95821	2014-03-07 01:27:51.714841
19058	584949	 7:28:04	 7:28:04	698	11		0	0	4.49500000000000011	3626	1508	2014-03-07 00:53:10.969478	2014-03-07 01:27:51.726023
19059	584949	 7:28:53	 7:28:53	699	12		0	0	4.94289999999999985	3626	1509	2014-03-07 00:53:10.980498	2014-03-07 01:27:51.7487
19060	584949	 7:29:36	 7:29:36	700	13		0	0	5.3395999999999999	3626	1510	2014-03-07 00:53:10.991578	2014-03-07 01:27:51.770271
19061	584949	 7:29:52	 7:29:52	701	14		0	0	5.49190000000000023	3626	1511	2014-03-07 00:53:11.002749	2014-03-07 01:27:51.781285
19062	584949	 7:30:15	 7:30:15	702	15		0	0	5.70610000000000017	3626	1512	2014-03-07 00:53:11.080628	2014-03-07 01:27:51.791489
19063	584949	 7:31:00	 7:31:00	178	16		0	0	6.06259999999999977	3626	1091	2014-03-07 00:53:11.091714	2014-03-07 01:27:51.80317
19064	584949	 7:31:32	 7:31:32	714	17		0	0	6.35850000000000026	3626	1522	2014-03-07 00:53:11.102753	2014-03-07 01:27:51.814399
19065	584949	 7:31:55	 7:31:55	715	18		0	0	6.57629999999999981	3626	1523	2014-03-07 00:53:11.113908	2014-03-07 01:27:51.824907
19066	584949	 7:32:29	 7:32:29	716	19		0	0	6.89599999999999991	3626	1524	2014-03-07 00:53:11.124994	2014-03-07 01:27:51.836481
19067	584949	 7:32:51	 7:32:51	717	20		0	0	7.10580000000000034	3626	1525	2014-03-07 00:53:11.136121	2014-03-07 01:27:51.848106
19068	584949	 7:33:21	 7:33:21	58	21		0	0	7.38320000000000043	3626	1029	2014-03-07 00:53:11.147293	2014-03-07 01:27:51.858249
19069	584949	 7:33:57	 7:33:57	686	22		0	0	7.71509999999999962	3626	1498	2014-03-07 00:53:11.158328	2014-03-07 01:27:51.870222
19070	584949	 7:34:15	 7:34:15	687	23		0	0	7.88180000000000014	3626	1499	2014-03-07 00:53:11.169484	2014-03-07 01:27:51.88041
19071	584949	 7:34:37	 7:34:37	688	24		0	0	8.09120000000000061	3626	1500	2014-03-07 00:53:11.180536	2014-03-07 01:27:51.891932
19072	584949	 7:35:15	 7:35:15	59	25		0	0	8.44769999999999932	3626	1030	2014-03-07 00:53:11.191655	2014-03-07 01:27:51.956664
19073	584949	 7:35:31	 7:35:31	718	26		0	0	8.6034000000000006	3626	1526	2014-03-07 00:53:11.202732	2014-03-07 01:27:51.968187
19074	584949	 7:35:50	 7:35:50	719	27		0	0	8.78560000000000052	3626	1527	2014-03-07 00:53:11.213915	2014-03-07 01:27:51.981032
19075	584949	 7:36:13	 7:36:13	720	28		0	0	9.0046999999999997	3626	1528	2014-03-07 00:53:11.225108	2014-03-07 01:27:51.992361
19076	584949	 7:36:35	 7:36:35	721	29		0	0	9.20749999999999957	3626	1529	2014-03-07 00:53:11.236165	2014-03-07 01:27:52.003814
19077	584949	 7:37:01	 7:37:01	722	30		0	0	9.44759999999999955	3626	1530	2014-03-07 00:53:11.247397	2014-03-07 01:27:52.0145
19078	584949	 7:37:22	 7:37:22	723	31		0	0	9.64789999999999992	3626	1531	2014-03-07 00:53:11.258547	2014-03-07 01:27:52.026305
19079	584949	 7:38:25	 7:38:25	725	32		0	0	10.2317	3626	1532	2014-03-07 00:53:11.269616	2014-03-07 01:27:52.037025
19080	584949	 7:39:19	 7:39:19	726	33		0	0	10.7364999999999995	3626	1533	2014-03-07 00:53:11.280717	2014-03-07 01:27:52.047972
19081	584949	 7:40:00	 7:40:00	60	34		0	0	11.0397999999999996	3626	1031	2014-03-07 00:53:11.291937	2014-03-07 01:27:52.059495
19082	584949	 7:40:28	 7:40:28	727	35		0	0	11.2424999999999997	3626	1534	2014-03-07 00:53:11.302967	2014-03-07 01:27:52.070322
19084	584949	 7:41:52	 7:41:52	729	37		0	0	11.8460000000000001	3626	1536	2014-03-07 00:53:11.391937	2014-03-07 01:27:52.562651
19085	584949	 7:42:26	 7:42:26	730	38		0	0	12.093	3626	1537	2014-03-07 00:53:11.402906	2014-03-07 01:27:52.579916
19086	584949	 7:43:14	 7:43:14	731	39		0	0	12.4369999999999994	3626	1538	2014-03-07 00:53:11.41415	2014-03-07 01:27:52.590957
19087	584949	 7:43:49	 7:43:49	733	40		0	0	12.6905999999999999	3626	1540	2014-03-07 00:53:11.425156	2014-03-07 01:27:52.603927
19088	584949	 7:44:29	 7:44:29	734	41		0	0	12.9804999999999993	3626	1541	2014-03-07 00:53:11.436305	2014-03-07 01:27:52.614801
19089	584949	 7:45:19	 7:45:19	61	42		0	0	13.3430999999999997	3626	1032	2014-03-07 00:53:11.447391	2014-03-07 01:27:52.625545
19090	584949	 7:45:46	 7:45:46	735	43		0	0	13.5360999999999994	3626	1542	2014-03-07 00:53:11.458557	2014-03-07 01:27:52.636763
19091	584949	 7:46:22	 7:46:22	739	44		0	0	13.7950999999999997	3626	1546	2014-03-07 00:53:11.469655	2014-03-07 01:27:52.648039
19092	584949	 7:47:09	 7:47:09	740	45		0	0	14.1350999999999996	3626	1547	2014-03-07 00:53:11.480773	2014-03-07 01:27:52.658502
19093	584949	 7:47:51	 7:47:51	246	46		0	0	14.4377999999999993	3626	1128	2014-03-07 00:53:11.491946	2014-03-07 01:27:52.670169
19094	584949	 7:48:23	 7:48:23	782	47		0	0	14.6717999999999993	3626	1585	2014-03-07 00:53:11.503043	2014-03-07 01:27:52.680687
19095	584949	 7:49:16	 7:49:16	131	48		0	0	15.0553000000000008	3626	1067	2014-03-07 00:53:11.514307	2014-03-07 01:27:52.692071
19096	584949	 7:50:00	 7:50:00	1004	49		0	0	15.3748000000000005	3626	1781	2014-03-07 00:53:11.525356	2014-03-07 01:27:52.705673
19097	584949	 7:50:30	 7:50:30	1006	50		0	0	15.5897000000000006	3626	1783	2014-03-07 00:53:11.536433	2014-03-07 01:27:52.723774
19098	584949	 7:51:18	 7:51:18	1007	51		0	0	15.9349000000000007	3626	1784	2014-03-07 00:53:11.547536	2014-03-07 01:27:52.769362
19099	584949	 7:51:43	 7:51:43	1009	52		0	0	16.1153000000000013	3626	1786	2014-03-07 00:53:11.558665	2014-03-07 01:27:52.780818
19100	584949	 7:52:05	 7:52:05	1010	53		0	0	16.2759999999999998	3626	1787	2014-03-07 00:53:11.569824	2014-03-07 01:27:52.790877
19101	584949	 7:52:30	 7:52:30	1011	54		0	0	16.4542000000000002	3626	1788	2014-03-07 00:53:11.580887	2014-03-07 01:27:52.801473
19102	584949	 7:53:11	 7:53:11	210	55		0	0	16.7470999999999997	3626	1106	2014-03-07 00:53:11.592045	2014-03-07 01:27:52.814613
19103	584949	 7:53:31	 7:53:31	280	56		0	0	16.8934999999999995	3626	1148	2014-03-07 00:53:11.603092	2014-03-07 01:27:52.825987
19104	584949	 7:54:04	 7:54:04	1265	57		0	0	17.1341000000000001	3626	1942	2014-03-07 00:53:11.669633	2014-03-07 01:27:52.837335
19105	584949	 7:54:55	 7:54:55	1318	58		0	0	17.501100000000001	3626	1969	2014-03-07 00:53:11.702954	2014-03-07 01:27:52.847971
19106	584949	 7:57:00	 7:57:00	1319	59		0	0	18.3076000000000008	3626	1970	2014-03-07 00:53:11.714073	2014-03-07 01:27:52.859092
20700	584977	 6:33:00	 6:33:00	1319	1		0	0	\N	3654	1970	2014-03-07 00:53:31.828429	2014-03-07 01:28:16.257221
20701	584977	 6:34:24	 6:34:24	216	2		0	0	0.586099999999999954	3654	1110	2014-03-07 00:53:31.839538	2014-03-07 01:28:16.269094
20702	584977	 6:34:57	 6:34:57	1056	3		0	0	0.820100000000000051	3654	1830	2014-03-07 00:53:31.850682	2014-03-07 01:28:16.281196
20704	584977	 6:35:58	 6:35:58	194	5		0	0	1.24639999999999995	3654	1097	2014-03-07 00:53:31.872937	2014-03-07 01:28:16.30253
20705	584977	 6:36:27	 6:36:27	1012	6		0	0	1.44989999999999997	3654	1789	2014-03-07 00:53:31.884017	2014-03-07 01:28:16.313193
20706	584977	 6:36:57	 6:36:57	1013	7		0	0	1.65809999999999991	3654	1790	2014-03-07 00:53:31.89513	2014-03-07 01:28:16.324465
20707	584977	 6:37:18	 6:37:18	1014	8		0	0	1.80719999999999992	3654	1791	2014-03-07 00:53:31.906279	2014-03-07 01:28:16.335873
20708	584977	 6:37:43	 6:37:43	1008	9		0	0	1.98409999999999997	3654	1785	2014-03-07 00:53:31.917555	2014-03-07 01:28:16.34621
20709	584977	 6:38:41	 6:38:41	1015	10		0	0	2.38960000000000017	3654	1792	2014-03-07 00:53:31.928621	2014-03-07 01:28:16.357534
20710	584977	 6:39:12	 6:39:12	1005	11		0	0	2.61050000000000004	3654	1782	2014-03-07 00:53:31.939677	2014-03-07 01:28:16.369805
20711	584977	 6:39:46	 6:39:46	1016	12		0	0	2.85289999999999999	3654	1793	2014-03-07 00:53:31.950777	2014-03-07 01:28:16.379858
20712	584977	 6:40:44	 6:40:44	1017	13		0	0	3.26129999999999987	3654	1794	2014-03-07 00:53:31.961941	2014-03-07 01:28:16.458089
20713	584977	 6:41:33	 6:41:33	65	14		0	0	3.60539999999999994	3654	1035	2014-03-07 00:53:31.973054	2014-03-07 01:28:16.467725
20714	584977	 6:42:09	 6:42:09	781	15		0	0	3.8591000000000002	3654	1584	2014-03-07 00:53:31.984193	2014-03-07 01:28:16.480252
20715	584977	 6:42:51	 6:42:51	783	16		0	0	4.15610000000000035	3654	1586	2014-03-07 00:53:31.995246	2014-03-07 01:28:16.491195
20716	584977	 6:43:29	 6:43:29	784	17		0	0	4.42110000000000003	3654	1587	2014-03-07 00:53:32.006396	2014-03-07 01:28:16.502886
20717	584977	 6:43:57	 6:43:57	66	18		0	0	4.61709999999999976	3654	1036	2014-03-07 00:53:32.01753	2014-03-07 01:28:16.513554
20718	584977	 6:44:35	 6:44:35	785	19		0	0	4.88260000000000005	3654	1588	2014-03-07 00:53:32.028636	2014-03-07 01:28:16.524638
20719	584977	 6:45:36	 6:45:36	786	20		0	0	5.31170000000000009	3654	1589	2014-03-07 00:53:32.039689	2014-03-07 01:28:16.53593
20720	584977	 6:46:16	 6:46:16	732	21		0	0	5.59130000000000038	3654	1539	2014-03-07 00:53:32.050832	2014-03-07 01:28:16.547094
20721	584977	 6:46:59	 6:46:59	787	22		0	0	5.89029999999999987	3654	1590	2014-03-07 00:53:32.061945	2014-03-07 01:28:16.558493
20722	584977	 6:47:42	 6:47:42	788	23		0	0	6.1886000000000001	3654	1591	2014-03-07 00:53:32.073053	2014-03-07 01:28:16.568631
20723	584977	 6:48:20	 6:48:20	789	24		0	0	6.45500000000000007	3654	1592	2014-03-07 00:53:32.084461	2014-03-07 01:28:16.580438
20724	584977	 6:49:01	 6:49:01	790	25		0	0	6.74420000000000019	3654	1593	2014-03-07 00:53:32.095624	2014-03-07 01:28:16.5909
20725	584977	 6:50:00	 6:50:00	67	26		0	0	7.07169999999999987	3654	1037	2014-03-07 00:53:32.106691	2014-03-07 01:28:16.602378
20726	584977	 6:50:25	 6:50:25	791	27		0	0	7.27679999999999971	3654	1594	2014-03-07 00:53:32.117752	2014-03-07 01:28:16.613444
20727	584977	 6:51:27	 6:51:27	792	28		0	0	7.78469999999999995	3654	1595	2014-03-07 00:53:32.128976	2014-03-07 01:28:16.624798
20728	584977	 6:52:09	 6:52:09	793	29		0	0	8.13020000000000032	3654	1596	2014-03-07 00:53:32.140069	2014-03-07 01:28:16.635776
20729	584977	 6:52:29	 6:52:29	794	30		0	0	8.2950999999999997	3654	1597	2014-03-07 00:53:32.151157	2014-03-07 01:28:16.647136
20730	584977	 6:52:53	 6:52:53	795	31		0	0	8.49499999999999922	3654	1598	2014-03-07 00:53:32.162287	2014-03-07 01:28:16.659064
20731	584977	 6:53:23	 6:53:23	796	32		0	0	8.73780000000000001	3654	1599	2014-03-07 00:53:32.173372	2014-03-07 01:28:16.669093
20733	584977	 6:54:14	 6:54:14	798	34		0	0	9.15520000000000067	3654	1601	2014-03-07 00:53:32.195581	2014-03-07 01:28:16.691073
20734	584977	 6:54:38	 6:54:38	799	35		0	0	9.35079999999999956	3654	1602	2014-03-07 00:53:32.206757	2014-03-07 01:28:16.758565
20735	584977	 6:55:06	 6:55:06	68	36		0	0	9.58179999999999943	3654	1038	2014-03-07 00:53:32.217914	2014-03-07 01:28:16.769134
20736	584977	 6:55:40	 6:55:40	690	37		0	0	9.86270000000000024	3654	1502	2014-03-07 00:53:32.228742	2014-03-07 01:28:16.780588
20737	584977	 6:56:04	 6:56:04	691	38		0	0	10.0640999999999998	3654	1503	2014-03-07 00:53:32.239778	2014-03-07 01:28:16.791705
20738	584977	 6:56:25	 6:56:25	296	39		0	0	10.2386999999999997	3654	1161	2014-03-07 00:53:32.250887	2014-03-07 01:28:16.802915
20739	584977	 6:57:11	 6:57:11	257	40		0	0	10.6135000000000002	3654	1131	2014-03-07 00:53:32.262086	2014-03-07 01:28:16.813991
20740	584977	 6:57:37	 6:57:37	800	41		0	0	10.8292000000000002	3654	1603	2014-03-07 00:53:32.273071	2014-03-07 01:28:16.824511
20741	584977	 6:58:04	 6:58:04	801	42		0	0	11.0479000000000003	3654	1604	2014-03-07 00:53:32.284247	2014-03-07 01:28:16.836105
20742	584977	 6:58:43	 6:58:43	802	43		0	0	11.3689	3654	1605	2014-03-07 00:53:32.29533	2014-03-07 01:28:16.847533
20743	584977	 6:59:09	 6:59:09	803	44		0	0	11.5803999999999991	3654	1606	2014-03-07 00:53:32.306478	2014-03-07 01:28:16.857908
20744	584977	 7:00:00	 7:00:00	179	45		0	0	11.9268000000000001	3654	1092	2014-03-07 00:53:32.317656	2014-03-07 01:28:16.868978
20745	584977	 7:00:47	 7:00:47	703	46		0	0	12.3325999999999993	3654	1513	2014-03-07 00:53:32.328733	2014-03-07 01:28:16.880499
20746	584977	 7:01:04	 7:01:04	704	47		0	0	12.4819999999999993	3654	1514	2014-03-07 00:53:32.339914	2014-03-07 01:28:16.891602
20747	584977	 7:01:27	 7:01:27	705	48		0	0	12.6808999999999994	3654	1515	2014-03-07 00:53:32.350785	2014-03-07 01:28:16.902748
20748	584977	 7:02:11	 7:02:11	706	49		0	0	13.0597999999999992	3654	1516	2014-03-07 00:53:32.361096	2014-03-07 01:28:16.91341
20749	584977	 7:03:03	 7:03:03	707	50		0	0	13.5139999999999993	3654	1517	2014-03-07 00:53:32.373152	2014-03-07 01:28:16.925525
20750	584977	 7:03:49	 7:03:49	708	51		0	0	13.9171999999999993	3654	1518	2014-03-07 00:53:32.384246	2014-03-07 01:28:16.959045
20751	584977	 7:04:29	 7:04:29	709	52		0	0	14.2622999999999998	3654	1519	2014-03-07 00:53:32.395327	2014-03-07 01:28:16.980759
20753	584977	 7:05:35	 7:05:35	1338	54		0	0	14.8316999999999997	3654	1983	2014-03-07 00:53:32.416957	2014-03-07 01:28:17.003059
20754	584977	 7:06:14	 7:06:14	1339	55		0	0	15.1724999999999994	3654	1984	2014-03-07 00:53:32.428002	2014-03-07 01:28:17.01374
20755	584977	 7:06:56	 7:06:56	1340	56		0	0	15.5388000000000002	3654	1985	2014-03-07 00:53:32.439656	2014-03-07 01:28:17.025241
20756	584977	 7:07:41	 7:07:41	1341	57		0	0	15.9270999999999994	3654	1986	2014-03-07 00:53:32.450953	2014-03-07 01:28:17.035614
20757	584977	 7:08:20	 7:08:20	1342	58		0	0	16.2700999999999993	3654	1987	2014-03-07 00:53:32.462205	2014-03-07 01:28:17.04713
20758	584977	 7:09:00	 7:09:00	79	59		0	0	16.5600999999999985	3654	1045	2014-03-07 00:53:32.473287	2014-03-07 01:28:17.058483
20759	584977	 7:11:05	 7:11:05	4	60		0	0	16.9505000000000017	3654	997	2014-03-07 00:53:32.484368	2014-03-07 01:28:17.06939
20760	584977	 7:13:00	 7:13:00	43	61		0	0	17.3077000000000005	3654	1018	2014-03-07 00:53:32.495509	2014-03-07 01:28:17.080392
22408	585392	 5:17:00	 5:17:00	244	1		0	0	\N	3682	1126	2014-03-07 00:53:53.909363	2014-03-07 01:28:40.926996
22409	585392	 5:17:31	 5:17:31	22	2		0	0	0.188099999999999989	3682	1008	2014-03-07 00:53:53.920446	2014-03-07 01:28:40.947486
22411	585392	 5:18:31	 5:18:31	290	4		0	0	0.551599999999999979	3682	1157	2014-03-07 00:53:53.942705	2014-03-07 01:28:40.969157
22412	585392	 5:18:54	 5:18:54	291	5		0	0	0.689500000000000002	3682	1158	2014-03-07 00:53:53.953929	2014-03-07 01:28:40.980518
22413	585392	 5:20:53	 5:20:53	713	6		0	0	1.39999999999999991	3682	1521	2014-03-07 00:53:53.964801	2014-03-07 01:28:40.991769
22414	585392	 5:21:47	 5:21:47	20	7		0	0	1.72360000000000002	3682	1006	2014-03-07 00:53:53.975971	2014-03-07 01:28:41.002459
22415	585392	 5:22:16	 5:22:16	174	8		0	0	1.90240000000000009	3682	1089	2014-03-07 00:53:53.987379	2014-03-07 01:28:41.0139
22416	585392	 5:23:00	 5:23:00	245	9		0	0	2.14590000000000014	3682	1127	2014-03-07 00:53:53.998323	2014-03-07 01:28:41.024703
22417	585392	 5:23:21	 5:23:21	757	10		0	0	2.4049999999999998	3682	1564	2014-03-07 00:53:54.009448	2014-03-07 01:28:41.036164
22418	585392	 5:23:49	 5:23:49	758	11		0	0	2.7370000000000001	3682	1565	2014-03-07 00:53:54.020488	2014-03-07 01:28:41.047752
22419	585392	 5:24:08	 5:24:08	347	12		0	0	2.96870000000000012	3682	1206	2014-03-07 00:53:54.0316	2014-03-07 01:28:41.057656
22420	585392	 5:24:29	 5:24:29	348	13		0	0	3.2240000000000002	3682	1207	2014-03-07 00:53:54.042703	2014-03-07 01:28:41.124016
22421	585392	 5:24:45	 5:24:45	349	14		0	0	3.42430000000000012	3682	1208	2014-03-07 00:53:54.053846	2014-03-07 01:28:41.136642
22422	585392	 5:25:01	 5:25:01	350	15		0	0	3.62449999999999983	3682	1209	2014-03-07 00:53:54.064968	2014-03-07 01:28:41.147145
22423	585392	 5:25:29	 5:25:29	351	16		0	0	3.96079999999999988	3682	1210	2014-03-07 00:53:54.076067	2014-03-07 01:28:41.15817
22424	585392	 5:25:43	 5:25:43	352	17		0	0	4.13529999999999998	3682	1211	2014-03-07 00:53:54.08715	2014-03-07 01:28:41.169536
22425	585392	 5:26:11	 5:26:11	353	18		0	0	4.47789999999999999	3682	1212	2014-03-07 00:53:54.09828	2014-03-07 01:28:41.181337
22426	585392	 5:26:22	 5:26:22	354	19		0	0	4.61910000000000043	3682	1213	2014-03-07 00:53:54.109432	2014-03-07 01:28:41.191929
22427	585392	 5:26:40	 5:26:40	355	20		0	0	4.83330000000000037	3682	1214	2014-03-07 00:53:54.120588	2014-03-07 01:28:41.203382
22428	585392	 5:27:08	 5:27:08	356	21		0	0	5.16990000000000016	3682	1215	2014-03-07 00:53:54.131312	2014-03-07 01:28:41.214333
22429	585392	 5:27:34	 5:27:34	357	22		0	0	5.48339999999999961	3682	1216	2014-03-07 00:53:54.142712	2014-03-07 01:28:41.22555
22430	585392	 5:28:00	 5:28:00	73	23		0	0	5.70340000000000025	3682	1041	2014-03-07 00:53:54.153823	2014-03-07 01:28:41.236839
22431	585392	 5:29:15	 5:29:15	358	24		0	0	6.20549999999999979	3682	1217	2014-03-07 00:53:54.164997	2014-03-07 01:28:41.247828
22432	585392	 5:30:17	 5:30:17	1330	25		0	0	6.62199999999999989	3682	1977	2014-03-07 00:53:54.17612	2014-03-07 01:28:41.258714
22433	585392	 5:31:18	 5:31:18	761	26		0	0	7.03329999999999966	3682	1566	2014-03-07 00:53:54.187158	2014-03-07 01:28:41.270014
22434	585392	 5:32:05	 5:32:05	762	27		0	0	7.34700000000000042	3682	1567	2014-03-07 00:53:54.198306	2014-03-07 01:28:41.280251
22435	585392	 5:33:04	 5:33:04	764	28		0	0	7.74500000000000011	3682	1568	2014-03-07 00:53:54.209512	2014-03-07 01:28:41.291915
22436	585392	 5:34:00	 5:34:00	238	29		0	0	8.09379999999999988	3682	1121	2014-03-07 00:53:54.220725	2014-03-07 01:28:41.303171
22438	585392	 5:34:56	 5:34:56	805	31		0	0	8.64409999999999989	3682	1608	2014-03-07 00:53:54.242838	2014-03-07 01:28:41.325136
22439	585392	 5:35:17	 5:35:17	806	32		0	0	8.84660000000000046	3682	1609	2014-03-07 00:53:54.253995	2014-03-07 01:28:41.337364
22440	585392	 5:35:45	 5:35:45	807	33		0	0	9.12310000000000088	3682	1610	2014-03-07 00:53:54.265114	2014-03-07 01:28:41.347472
22441	585392	 5:36:24	 5:36:24	809	34		0	0	9.50019999999999953	3682	1611	2014-03-07 00:53:54.276159	2014-03-07 01:28:41.359336
22442	585392	 5:36:48	 5:36:48	810	35		0	0	9.73680000000000057	3682	1612	2014-03-07 00:53:54.287279	2014-03-07 01:28:41.36953
22443	585392	 5:37:15	 5:37:15	488	36		0	0	9.99770000000000003	3682	1320	2014-03-07 00:53:54.29846	2014-03-07 01:28:41.448179
22444	585392	 5:37:44	 5:37:44	489	37		0	0	10.2760999999999996	3682	1321	2014-03-07 00:53:54.309532	2014-03-07 01:28:41.45752
22445	585392	 5:38:11	 5:38:11	736	38		0	0	10.5427999999999997	3682	1543	2014-03-07 00:53:54.320663	2014-03-07 01:28:41.470185
22446	585392	 5:38:49	 5:38:49	737	39		0	0	10.9124999999999996	3682	1544	2014-03-07 00:53:54.331781	2014-03-07 01:28:41.481336
22447	585392	 5:39:25	 5:39:25	738	40		0	0	11.2629000000000001	3682	1545	2014-03-07 00:53:54.342836	2014-03-07 01:28:41.491411
22448	585392	 5:40:00	 5:40:00	61	41		0	0	11.6019000000000005	3682	1032	2014-03-07 00:53:54.354007	2014-03-07 01:28:41.502737
22449	585392	 5:40:20	 5:40:20	735	42		0	0	11.7949000000000002	3682	1542	2014-03-07 00:53:54.365111	2014-03-07 01:28:41.51428
22451	585392	 5:41:21	 5:41:21	740	44		0	0	12.3939000000000004	3682	1547	2014-03-07 00:53:54.387299	2014-03-07 01:28:41.536362
22452	585392	 5:42:00	 5:42:00	62	45		0	0	12.702	3682	1033	2014-03-07 00:53:54.398551	2014-03-07 01:28:41.547694
22453	585392	 5:42:16	 5:42:16	741	46		0	0	12.8445999999999998	3682	1548	2014-03-07 00:53:54.409562	2014-03-07 01:28:41.558393
22454	585392	 5:42:39	 5:42:39	742	47		0	0	13.0398999999999994	3682	1549	2014-03-07 00:53:54.420668	2014-03-07 01:28:41.569776
22455	585392	 5:43:22	 5:43:22	743	48		0	0	13.4026999999999994	3682	1550	2014-03-07 00:53:54.431818	2014-03-07 01:28:41.581138
22456	585392	 5:44:02	 5:44:02	745	49		0	0	13.7445000000000004	3682	1552	2014-03-07 00:53:54.442946	2014-03-07 01:28:41.592584
22457	585392	 5:44:40	 5:44:40	746	50		0	0	14.0643999999999991	3682	1553	2014-03-07 00:53:54.454074	2014-03-07 01:28:41.603805
22458	585392	 5:45:09	 5:45:09	747	51		0	0	14.3084000000000007	3682	1554	2014-03-07 00:53:54.465182	2014-03-07 01:28:41.614954
22459	585392	 5:45:38	 5:45:38	748	52		0	0	14.5520999999999994	3682	1555	2014-03-07 00:53:54.476287	2014-03-07 01:28:41.625886
22460	585392	 5:46:22	 5:46:22	749	53		0	0	14.9298000000000002	3682	1556	2014-03-07 00:53:54.487318	2014-03-07 01:28:41.636843
22461	585392	 5:46:56	 5:46:56	750	54		0	0	15.2164000000000001	3682	1557	2014-03-07 00:53:54.498475	2014-03-07 01:28:41.648713
22462	585392	 5:47:23	 5:47:23	751	55		0	0	15.4454999999999991	3682	1558	2014-03-07 00:53:54.509695	2014-03-07 01:28:41.658917
22463	585392	 5:47:41	 5:47:41	752	56		0	0	15.6045999999999996	3682	1559	2014-03-07 00:53:54.520749	2014-03-07 01:28:41.67032
22464	585392	 5:48:18	 5:48:18	753	57		0	0	15.9186999999999994	3682	1560	2014-03-07 00:53:54.531821	2014-03-07 01:28:41.680833
22465	585392	 5:48:42	 5:48:42	754	58		0	0	16.1250999999999998	3682	1561	2014-03-07 00:53:54.542965	2014-03-07 01:28:41.692365
22466	585392	 5:49:12	 5:49:12	755	59		0	0	16.3808000000000007	3682	1562	2014-03-07 00:53:54.554103	2014-03-07 01:28:41.703109
22467	585392	 5:50:02	 5:50:02	756	60		0	0	16.8035999999999994	3682	1563	2014-03-07 00:53:54.565188	2014-03-07 01:28:41.714193
22468	585392	 5:51:00	 5:51:00	63	61		0	0	17.2358000000000011	3682	1034	2014-03-07 00:53:54.576291	2014-03-07 01:28:41.726091
41122	583215	 7:13:00	 7:13:00	135	7		0	0	1.75849999999999995	4047	1071	2014-03-07 00:58:03.269051	2014-03-07 01:33:19.901642
26739	585463	 5:30:00	 5:30:00	63	1		0	0	\N	3753	1034	2014-03-07 00:54:50.601023	2014-03-07 01:29:43.791636
26740	585463	 5:30:33	 5:30:33	767	2		0	0	0.241199999999999998	3753	1570	2014-03-07 00:54:50.612588	2014-03-07 01:29:43.803183
26741	585463	 5:31:21	 5:31:21	768	3		0	0	0.593899999999999983	3753	1571	2014-03-07 00:54:50.62417	2014-03-07 01:29:43.814987
26742	585463	 5:32:18	 5:32:18	769	4		0	0	1.01279999999999992	3753	1572	2014-03-07 00:54:50.634482	2014-03-07 01:29:43.824886
26744	585463	 5:33:29	 5:33:29	771	6		0	0	1.53530000000000011	3753	1574	2014-03-07 00:54:50.657569	2014-03-07 01:29:43.847471
26745	585463	 5:33:54	 5:33:54	772	7		0	0	1.72009999999999996	3753	1575	2014-03-07 00:54:50.668603	2014-03-07 01:29:43.858435
26746	585463	 5:34:46	 5:34:46	773	8		0	0	2.10139999999999993	3753	1576	2014-03-07 00:54:50.679439	2014-03-07 01:29:43.869667
26747	585463	 5:35:25	 5:35:25	774	9		0	0	2.38470000000000004	3753	1577	2014-03-07 00:54:50.69097	2014-03-07 01:29:43.880654
26748	585463	 5:36:15	 5:36:15	775	10		0	0	2.75199999999999978	3753	1578	2014-03-07 00:54:50.701919	2014-03-07 01:29:43.891899
26749	585463	 5:36:38	 5:36:38	776	11		0	0	2.92269999999999985	3753	1579	2014-03-07 00:54:50.713078	2014-03-07 01:29:43.903103
26750	585463	 5:37:14	 5:37:14	777	12		0	0	3.18869999999999987	3753	1580	2014-03-07 00:54:50.77937	2014-03-07 01:29:43.914031
26751	585463	 5:38:09	 5:38:09	779	13		0	0	3.58950000000000014	3753	1582	2014-03-07 00:54:50.812995	2014-03-07 01:29:43.924793
26752	585463	 5:38:52	 5:38:52	1139	14		0	0	3.90090000000000003	3753	1899	2014-03-07 00:54:50.824015	2014-03-07 01:29:43.936628
26753	585463	 5:39:17	 5:39:17	780	15		0	0	4.08809999999999985	3753	1583	2014-03-07 00:54:50.835254	2014-03-07 01:29:44.003051
26754	585463	 5:40:00	 5:40:00	65	16		0	0	4.34020000000000028	3753	1035	2014-03-07 00:54:50.846263	2014-03-07 01:29:44.013718
26755	585463	 5:40:33	 5:40:33	781	17		0	0	4.59389999999999965	3753	1584	2014-03-07 00:54:50.869104	2014-03-07 01:29:44.025534
26756	585463	 5:41:12	 5:41:12	783	18		0	0	4.89090000000000025	3753	1586	2014-03-07 00:54:50.879857	2014-03-07 01:29:44.036373
26757	585463	 5:41:46	 5:41:46	784	19		0	0	5.15589999999999993	3753	1587	2014-03-07 00:54:50.913048	2014-03-07 01:29:44.04739
26758	585463	 5:42:11	 5:42:11	66	20		0	0	5.35189999999999966	3753	1036	2014-03-07 00:54:50.924339	2014-03-07 01:29:44.058569
26759	585463	 5:43:00	 5:43:00	811	21		0	0	5.72710000000000008	3753	1613	2014-03-07 00:54:50.935335	2014-03-07 01:29:44.07005
26760	585463	 5:43:39	 5:43:39	812	22		0	0	6.02479999999999993	3753	1614	2014-03-07 00:54:50.946473	2014-03-07 01:29:44.080677
26761	585463	 5:44:33	 5:44:33	813	23		0	0	6.4419000000000004	3753	1615	2014-03-07 00:54:50.957594	2014-03-07 01:29:44.092108
26762	585463	 5:44:59	 5:44:59	487	24		0	0	6.63949999999999996	3753	1319	2014-03-07 00:54:50.968709	2014-03-07 01:29:44.103381
26763	585463	 5:45:43	 5:45:43	486	25		0	0	6.97839999999999971	3753	1318	2014-03-07 00:54:50.979829	2014-03-07 01:29:44.11421
26764	585463	 5:46:18	 5:46:18	814	26		0	0	7.24650000000000016	3753	1616	2014-03-07 00:54:50.990866	2014-03-07 01:29:44.125965
26765	585463	 5:46:42	 5:46:42	815	27		0	0	7.42929999999999957	3753	1617	2014-03-07 00:54:51.001997	2014-03-07 01:29:44.599692
26766	585463	 5:47:36	 5:47:36	817	28		0	0	7.84429999999999961	3753	1618	2014-03-07 00:54:51.012867	2014-03-07 01:29:44.61575
26767	585463	 5:48:07	 5:48:07	818	29		0	0	8.0835000000000008	3753	1619	2014-03-07 00:54:51.023852	2014-03-07 01:29:44.624114
26768	585463	 5:48:34	 5:48:34	819	30		0	0	8.29010000000000069	3753	1620	2014-03-07 00:54:51.091114	2014-03-07 01:29:44.636769
26769	585463	 5:49:02	 5:49:02	820	31		0	0	8.50619999999999976	3753	1621	2014-03-07 00:54:51.10217	2014-03-07 01:29:44.648212
26770	585463	 5:50:00	 5:50:00	75	32		0	0	8.89530000000000065	3753	1043	2014-03-07 00:54:51.112943	2014-03-07 01:29:44.658138
26771	585463	 5:50:48	 5:50:48	619	33		0	0	9.27439999999999998	3753	1441	2014-03-07 00:54:51.124529	2014-03-07 01:29:44.669873
26773	585463	 5:52:17	 5:52:17	622	35		0	0	9.97860000000000014	3753	1444	2014-03-07 00:54:51.146296	2014-03-07 01:29:44.692351
26774	585463	 5:52:44	 5:52:44	765	36		0	0	10.1917000000000009	3753	1569	2014-03-07 00:54:51.157016	2014-03-07 01:29:44.770796
26775	585463	 5:53:54	 5:53:54	359	37		0	0	10.7392000000000003	3753	1218	2014-03-07 00:54:51.168816	2014-03-07 01:29:44.779963
26776	585463	 5:55:00	 5:55:00	76	38		0	0	11.2296999999999993	3753	1044	2014-03-07 00:54:51.179622	2014-03-07 01:29:44.792234
26777	585463	 5:55:37	 5:55:37	821	39		0	0	11.5167000000000002	3753	1622	2014-03-07 00:54:51.190632	2014-03-07 01:29:44.80384
26778	585463	 5:56:10	 5:56:10	822	40		0	0	11.7769999999999992	3753	1623	2014-03-07 00:54:51.202144	2014-03-07 01:29:44.813885
26779	585463	 5:56:52	 5:56:52	823	41		0	0	12.1005000000000003	3753	1624	2014-03-07 00:54:51.213058	2014-03-07 01:29:44.825382
26780	585463	 5:57:25	 5:57:25	1278	42		0	0	12.3582999999999998	3753	1945	2014-03-07 00:54:51.224493	2014-03-07 01:29:44.836491
26781	585463	 5:57:49	 5:57:49	825	43		0	0	12.5487000000000002	3753	1625	2014-03-07 00:54:51.235457	2014-03-07 01:29:44.848053
26782	585463	 5:58:28	 5:58:28	826	44		0	0	12.8488000000000007	3753	1626	2014-03-07 00:54:51.246443	2014-03-07 01:29:44.859068
26783	585463	 5:59:08	 5:59:08	827	45		0	0	13.1585000000000001	3753	1627	2014-03-07 00:54:51.2579	2014-03-07 01:29:44.870662
26784	585463	 5:59:27	 5:59:27	828	46		0	0	13.3073999999999995	3753	1628	2014-03-07 00:54:51.268826	2014-03-07 01:29:44.880885
26785	585463	 5:59:54	 5:59:54	829	47		0	0	13.5198999999999998	3753	1629	2014-03-07 00:54:51.279837	2014-03-07 01:29:44.892333
26786	585463	 6:00:12	 6:00:12	830	48		0	0	13.6653000000000002	3753	1630	2014-03-07 00:54:51.291014	2014-03-07 01:29:44.903492
26787	585463	 6:01:00	 6:01:00	831	49		0	0	14.0389999999999997	3753	1631	2014-03-07 00:54:51.302183	2014-03-07 01:29:44.914344
26788	585463	 6:01:32	 6:01:32	832	50		0	0	14.2858999999999998	3753	1632	2014-03-07 00:54:51.313421	2014-03-07 01:29:44.925899
26789	585463	 6:02:04	 6:02:04	833	51		0	0	14.5342000000000002	3753	1633	2014-03-07 00:54:51.391184	2014-03-07 01:29:44.936802
26790	585463	 6:03:00	 6:03:00	72	52		0	0	14.9054000000000002	3753	1040	2014-03-07 00:54:51.402255	2014-03-07 01:29:44.947387
26791	585463	 6:03:17	 6:03:17	285	53		0	0	14.9941999999999993	3753	1152	2014-03-07 00:54:51.413393	2014-03-07 01:29:44.959139
26792	585463	 6:04:26	 6:04:26	286	54		0	0	15.3431999999999995	3753	1153	2014-03-07 00:54:51.424986	2014-03-07 01:29:44.97012
26793	585463	 6:05:06	 6:05:06	287	55		0	0	15.5475999999999992	3753	1154	2014-03-07 00:54:51.435235	2014-03-07 01:29:44.981092
26794	585463	 6:05:34	 6:05:34	3	56		0	0	15.6888000000000005	3753	996	2014-03-07 00:54:51.446749	2014-03-07 01:29:44.992459
26795	585463	 6:07:23	 6:07:23	288	57		0	0	16.2391000000000005	3753	1155	2014-03-07 00:54:51.45789	2014-03-07 01:29:45.069765
26796	585463	 6:08:05	 6:08:05	103	58		0	0	16.4533999999999985	3753	1051	2014-03-07 00:54:51.46903	2014-03-07 01:29:45.08169
26797	585463	 6:08:46	 6:08:46	289	59		0	0	16.6614000000000004	3753	1156	2014-03-07 00:54:51.480117	2014-03-07 01:29:45.092818
26798	585463	 6:09:32	 6:09:32	259	60		1	0	16.8976000000000006	3753	1133	2014-03-07 00:54:51.491215	2014-03-07 01:29:45.103033
26799	585463	 6:09:48	 6:09:48	104	61		0	0	16.9782000000000011	3753	1052	2014-03-07 00:54:51.502224	2014-03-07 01:29:45.1148
26800	585463	 6:10:09	 6:10:09	227	62		0	0	17.0878000000000014	3753	1114	2014-03-07 00:54:51.513254	2014-03-07 01:29:45.125539
26801	585463	 6:10:45	 6:10:45	5	63		0	0	17.2738000000000014	3753	998	2014-03-07 00:54:51.524141	2014-03-07 01:29:45.137123
41151	583215	 7:35:29	 7:35:29	1136	36		0	0	11.1518999999999995	4047	1897	2014-03-07 00:58:03.647034	2014-03-07 01:33:20.246099
42621	583249	 8:07:05	 8:07:05	299	25		0	0	7.91910000000000025	4090	1164	2014-03-07 00:58:23.137696	2014-03-07 01:33:42.222924
33013	582408	 6:32:00	 6:32:00	1328	1		0	0	\N	3858	1975	2014-03-07 00:56:13.777956	2014-03-07 01:31:17.402015
33014	582408	 6:32:56	 6:32:56	258	2		0	0	0.32779999999999998	3858	1132	2014-03-07 00:56:13.789219	2014-03-07 01:31:17.413601
33015	582408	 6:33:40	 6:33:40	261	3		0	0	0.584600000000000009	3858	1135	2014-03-07 00:56:13.800064	2014-03-07 01:31:17.423541
33016	582408	 6:34:47	 6:34:47	301	4		0	0	0.973600000000000021	3858	1166	2014-03-07 00:56:13.811016	2014-03-07 01:31:17.435362
33017	582408	 6:35:14	 6:35:14	302	5		0	0	1.13129999999999997	3858	1167	2014-03-07 00:56:13.821987	2014-03-07 01:31:17.447044
33018	582408	 6:36:08	 6:36:08	303	6		0	0	1.4444999999999999	3858	1168	2014-03-07 00:56:13.833343	2014-03-07 01:31:17.458596
33019	582408	 6:37:10	 6:37:10	304	7		0	0	1.80390000000000006	3858	1169	2014-03-07 00:56:13.84424	2014-03-07 01:31:17.468924
33020	582408	 6:37:38	 6:37:38	86	8		0	0	1.9677	3858	1046	2014-03-07 00:56:13.855375	2014-03-07 01:31:17.480618
33021	582408	 6:38:24	 6:38:24	306	9		0	0	2.23799999999999999	3858	1170	2014-03-07 00:56:13.866538	2014-03-07 01:31:17.49088
33022	582408	 6:39:13	 6:39:13	307	10		0	0	2.52510000000000012	3858	1171	2014-03-07 00:56:13.87773	2014-03-07 01:31:17.502532
33023	582408	 6:40:48	 6:40:48	309	11		0	0	3.0766	3858	1172	2014-03-07 00:56:13.889029	2014-03-07 01:31:17.514486
33024	582408	 6:41:33	 6:41:33	834	12		0	0	3.33829999999999982	3858	1634	2014-03-07 00:56:13.899769	2014-03-07 01:31:17.524838
33025	582408	 6:42:10	 6:42:10	835	13		0	0	3.55609999999999982	3858	1635	2014-03-07 00:56:13.910994	2014-03-07 01:31:17.53617
33026	582408	 6:43:16	 6:43:16	836	14		0	0	3.93780000000000019	3858	1636	2014-03-07 00:56:13.922682	2014-03-07 01:31:17.547658
33027	582408	 6:45:00	 6:45:00	236	15		0	0	4.50459999999999994	3858	1120	2014-03-07 00:56:13.989324	2014-03-07 01:31:17.55814
33028	582408	 6:45:47	 6:45:47	837	16		0	0	4.88229999999999986	3858	1637	2014-03-07 00:56:14.000376	2014-03-07 01:31:17.569621
33029	582408	 6:46:17	 6:46:17	838	17		0	0	5.11960000000000015	3858	1638	2014-03-07 00:56:14.011225	2014-03-07 01:31:17.580924
33030	582408	 6:46:46	 6:46:46	839	18		0	0	5.35060000000000002	3858	1639	2014-03-07 00:56:14.023439	2014-03-07 01:31:17.591676
33031	582408	 6:47:31	 6:47:31	840	19		0	0	5.71159999999999979	3858	1640	2014-03-07 00:56:14.05648	2014-03-07 01:31:17.603888
33032	582408	 6:47:55	 6:47:55	841	20		0	0	5.90230000000000032	3858	1641	2014-03-07 00:56:14.089371	2014-03-07 01:31:17.613918
33034	582408	 6:49:09	 6:49:09	843	22		0	0	6.49300000000000033	3858	1643	2014-03-07 00:56:14.155491	2014-03-07 01:31:17.636882
33035	582408	 6:49:56	 6:49:56	844	23		0	0	6.86969999999999992	3858	1644	2014-03-07 00:56:14.170904	2014-03-07 01:31:17.647065
33036	582408	 6:50:54	 6:50:54	846	24		0	0	7.32960000000000012	3858	1645	2014-03-07 00:56:14.211518	2014-03-07 01:31:17.659043
33037	582408	 6:51:18	 6:51:18	394	25		0	0	7.52230000000000043	3858	1250	2014-03-07 00:56:14.244798	2014-03-07 01:31:17.669117
33038	582408	 6:52:12	 6:52:12	848	26		0	0	7.95000000000000018	3858	1646	2014-03-07 00:56:14.304035	2014-03-07 01:31:17.680792
33039	582408	 6:52:42	 6:52:42	849	27		0	0	8.19050000000000011	3858	1647	2014-03-07 00:56:14.322291	2014-03-07 01:31:17.692135
33040	582408	 6:53:06	 6:53:06	850	28		0	0	8.38690000000000069	3858	1648	2014-03-07 00:56:14.333299	2014-03-07 01:31:17.702347
33041	582408	 6:53:33	 6:53:33	851	29		0	0	8.60019999999999918	3858	1649	2014-03-07 00:56:14.345028	2014-03-07 01:31:17.713944
33042	582408	 6:54:12	 6:54:12	852	30		0	0	8.9117999999999995	3858	1650	2014-03-07 00:56:14.355866	2014-03-07 01:31:17.725214
33043	582408	 6:55:00	 6:55:00	185	31		0	0	9.23610000000000042	3858	1094	2014-03-07 00:56:14.366703	2014-03-07 01:31:17.735569
33044	582408	 6:55:58	 6:55:58	853	32		0	0	9.66680000000000028	3858	1651	2014-03-07 00:56:14.378102	2014-03-07 01:31:17.747129
33045	582408	 6:56:47	 6:56:47	854	33		0	0	10.0356000000000005	3858	1652	2014-03-07 00:56:14.389207	2014-03-07 01:31:17.7591
33046	582408	 6:57:25	 6:57:25	855	34		0	0	10.3207000000000004	3858	1653	2014-03-07 00:56:14.39999	2014-03-07 01:31:17.769019
33047	582408	 6:58:17	 6:58:17	856	35		0	0	10.7075999999999993	3858	1654	2014-03-07 00:56:14.411391	2014-03-07 01:31:17.780757
33048	582408	 6:58:45	 6:58:45	680	36		0	0	10.9221000000000004	3858	1493	2014-03-07 00:56:14.42248	2014-03-07 01:31:17.791181
33049	582408	 6:59:26	 6:59:26	857	37		0	0	11.2279	3858	1655	2014-03-07 00:56:14.433678	2014-03-07 01:31:17.802388
33050	582408	 7:00:23	 7:00:23	1196	38		0	0	11.6571999999999996	3858	1916	2014-03-07 00:56:14.4449	2014-03-07 01:31:17.814773
33051	582408	 7:00:41	 7:00:41	859	39		0	0	11.7965	3858	1656	2014-03-07 00:56:14.455588	2014-03-07 01:31:17.825061
33053	582408	 7:02:00	 7:02:00	232	41		0	0	12.3463999999999992	3858	1119	2014-03-07 00:56:14.478519	2014-03-07 01:31:17.847544
33054	582408	 7:02:42	 7:02:42	1027	42		0	0	12.5876000000000001	3858	1803	2014-03-07 00:56:14.489345	2014-03-07 01:31:17.858233
33055	582408	 7:03:13	 7:03:13	861	43		0	0	12.7646999999999995	3858	1658	2014-03-07 00:56:14.500247	2014-03-07 01:31:17.869692
33056	582408	 7:03:43	 7:03:43	439	44		0	0	12.9351000000000003	3858	1288	2014-03-07 00:56:14.532933	2014-03-07 01:31:17.880949
33057	582408	 7:04:23	 7:04:23	339	45		0	0	13.1675000000000004	3858	1199	2014-03-07 00:56:14.568314	2014-03-07 01:31:17.891464
33058	582408	 7:05:09	 7:05:09	365	46		0	0	13.4298000000000002	3858	1224	2014-03-07 00:56:14.601685	2014-03-07 01:31:17.903072
33059	582408	 7:05:47	 7:05:47	366	47		0	0	13.6481999999999992	3858	1225	2014-03-07 00:56:14.622615	2014-03-07 01:31:17.913931
33060	582408	 7:06:27	 7:06:27	367	48		0	0	13.8792000000000009	3858	1226	2014-03-07 00:56:14.633719	2014-03-07 01:31:17.924897
33061	582408	 7:07:08	 7:07:08	441	49		0	0	14.1175999999999995	3858	1290	2014-03-07 00:56:14.644617	2014-03-07 01:31:17.936783
33062	582408	 7:08:18	 7:08:18	1129	50		0	0	14.5203000000000007	3858	1892	2014-03-07 00:56:14.65584	2014-03-07 01:31:17.94716
33063	582408	 7:09:23	 7:09:23	292	51		0	0	14.8943999999999992	3858	1159	2014-03-07 00:56:14.666869	2014-03-07 01:31:17.958572
33064	582408	 7:09:59	 7:09:59	293	52		0	0	15.1023999999999994	3858	1160	2014-03-07 00:56:14.677819	2014-03-07 01:31:17.970223
33065	582408	 7:10:20	 7:10:20	259	53		1	0	15.2219999999999995	3858	1133	2014-03-07 00:56:14.689037	2014-03-07 01:31:18.047481
33066	582408	 7:10:34	 7:10:34	104	54		0	0	15.3026	3858	1052	2014-03-07 00:56:14.700587	2014-03-07 01:31:18.059404
33067	582408	 7:11:00	 7:11:00	227	55		0	0	15.4122000000000003	3858	1114	2014-03-07 00:56:14.711181	2014-03-07 01:31:18.067901
33068	582408	 7:12:00	 7:12:00	5	56		0	0	15.5982000000000003	3858	998	2014-03-07 00:56:14.722568	2014-03-07 01:31:18.08103
33069	582408	 7:13:00	 7:13:00	1217	57		0	0	15.9376999999999995	3858	1922	2014-03-07 00:56:14.733546	2014-03-07 01:31:18.092178
34859	582609	 7:22:00	 7:22:00	157	1		0	0	\N	3892	1080	2014-03-07 00:56:40.860684	2014-03-07 01:31:45.206172
34860	582609	 7:23:00	 7:23:00	21	2		0	0	0.341600000000000015	3892	1007	2014-03-07 00:56:40.871825	2014-03-07 01:31:45.216316
34862	582609	 7:25:00	 7:25:00	4	4		0	0	0.674799999999999955	3892	997	2014-03-07 00:56:40.916291	2014-03-07 01:31:45.239498
34863	582609	 7:25:38	 7:25:38	432	5		0	0	0.953500000000000014	3892	1287	2014-03-07 00:56:40.927371	2014-03-07 01:31:45.251136
34864	582609	 7:25:56	 7:25:56	44	6		0	0	1.08929999999999993	3892	1019	2014-03-07 00:56:40.938565	2014-03-07 01:31:45.261264
34865	582609	 7:26:39	 7:26:39	511	7		0	0	1.40680000000000005	3892	1343	2014-03-07 00:56:40.949671	2014-03-07 01:31:45.27287
34866	582609	 7:27:00	 7:27:00	509	8		0	0	1.56319999999999992	3892	1341	2014-03-07 00:56:40.960755	2014-03-07 01:31:45.283053
34867	582609	 7:27:27	 7:27:27	510	9		0	0	1.76190000000000002	3892	1342	2014-03-07 00:56:40.971821	2014-03-07 01:31:45.295047
34868	582609	 7:27:57	 7:27:57	910	10		0	0	1.98399999999999999	3892	1705	2014-03-07 00:56:40.982992	2014-03-07 01:31:45.305891
34869	582609	 7:28:25	 7:28:25	911	11		0	0	2.19130000000000003	3892	1706	2014-03-07 00:56:40.994119	2014-03-07 01:31:45.317267
34870	582609	 7:28:47	 7:28:47	912	12		0	0	2.35539999999999994	3892	1707	2014-03-07 00:56:41.005193	2014-03-07 01:31:45.328432
34871	582609	 7:29:17	 7:29:17	914	13		0	0	2.57750000000000012	3892	1709	2014-03-07 00:56:41.016251	2014-03-07 01:31:45.339716
34872	582609	 7:29:44	 7:29:44	913	14		0	0	2.77629999999999999	3892	1708	2014-03-07 00:56:41.027356	2014-03-07 01:31:45.350662
34873	582609	 7:30:30	 7:30:30	915	15		0	0	3.11289999999999978	3892	1710	2014-03-07 00:56:41.037712	2014-03-07 01:31:45.361973
34874	582609	 7:31:28	 7:31:28	916	16		0	0	3.5383	3892	1711	2014-03-07 00:56:41.049661	2014-03-07 01:31:45.372427
34875	582609	 7:32:17	 7:32:17	917	17		0	0	3.89880000000000004	3892	1712	2014-03-07 00:56:41.060763	2014-03-07 01:31:45.383751
34876	582609	 7:33:02	 7:33:02	918	18		0	0	4.23190000000000044	3892	1713	2014-03-07 00:56:41.071795	2014-03-07 01:31:45.395285
34877	582609	 7:34:00	 7:34:00	94	19		0	0	4.60609999999999964	3892	1047	2014-03-07 00:56:41.082944	2014-03-07 01:31:45.405725
34878	582609	 7:35:12	 7:35:12	919	20		0	0	5.08650000000000002	3892	1714	2014-03-07 00:56:41.094124	2014-03-07 01:31:45.417192
34879	582609	 7:35:58	 7:35:58	920	21		0	0	5.39440000000000008	3892	1715	2014-03-07 00:56:41.105263	2014-03-07 01:31:45.428383
34880	582609	 7:36:34	 7:36:34	921	22		0	0	5.63930000000000042	3892	1716	2014-03-07 00:56:41.116434	2014-03-07 01:31:45.43924
34881	582609	 7:37:24	 7:37:24	922	23		0	0	5.9764999999999997	3892	1717	2014-03-07 00:56:41.127486	2014-03-07 01:31:45.450656
34882	582609	 7:37:59	 7:37:59	923	24		0	0	6.21370000000000022	3892	1718	2014-03-07 00:56:41.138609	2014-03-07 01:31:45.462023
34883	582609	 7:38:23	 7:38:23	924	25		0	0	6.37750000000000039	3892	1719	2014-03-07 00:56:41.149726	2014-03-07 01:31:45.472263
34884	582609	 7:38:53	 7:38:53	925	26		0	0	6.58119999999999994	3892	1720	2014-03-07 00:56:41.160872	2014-03-07 01:31:45.48473
34885	582609	 7:39:39	 7:39:39	926	27		0	0	6.89179999999999993	3892	1721	2014-03-07 00:56:41.227573	2014-03-07 01:31:45.494781
34886	582609	 7:39:54	 7:39:54	927	28		0	0	6.99220000000000041	3892	1722	2014-03-07 00:56:41.238615	2014-03-07 01:31:45.506051
34887	582609	 7:40:33	 7:40:33	928	29		0	0	7.2533000000000003	3892	1723	2014-03-07 00:56:41.249791	2014-03-07 01:31:45.517716
34888	582609	 7:41:00	 7:41:00	95	30		0	0	7.40629999999999988	3892	1048	2014-03-07 00:56:41.26087	2014-03-07 01:31:45.528691
34890	582609	 7:42:20	 7:42:20	930	32		0	0	8.11359999999999992	3892	1725	2014-03-07 00:56:41.283218	2014-03-07 01:31:45.551082
34891	582609	 7:42:48	 7:42:48	931	33		0	0	8.36759999999999948	3892	1726	2014-03-07 00:56:41.294369	2014-03-07 01:31:45.562152
34892	582609	 7:43:17	 7:43:17	932	34		0	0	8.62620000000000076	3892	1727	2014-03-07 00:56:41.305498	2014-03-07 01:31:45.573027
34893	582609	 7:43:28	 7:43:28	933	35		0	0	8.72320000000000029	3892	1728	2014-03-07 00:56:41.316524	2014-03-07 01:31:45.584409
34894	582609	 7:43:37	 7:43:37	934	36		0	0	8.80760000000000076	3892	1729	2014-03-07 00:56:41.327698	2014-03-07 01:31:45.595018
34895	582609	 7:44:04	 7:44:04	935	37		0	0	9.05189999999999984	3892	1730	2014-03-07 00:56:41.338754	2014-03-07 01:31:45.606317
34896	582609	 7:44:37	 7:44:37	936	38		0	0	9.34280000000000044	3892	1731	2014-03-07 00:56:41.349901	2014-03-07 01:31:45.683886
34897	582609	 7:45:02	 7:45:02	937	39		0	0	9.56630000000000003	3892	1732	2014-03-07 00:56:41.361015	2014-03-07 01:31:45.717353
34898	582609	 7:45:27	 7:45:27	938	40		0	0	9.79369999999999941	3892	1733	2014-03-07 00:56:41.372082	2014-03-07 01:31:45.728618
34899	582609	 7:46:00	 7:46:00	1146	41		0	0	10.0349000000000004	3892	1901	2014-03-07 00:56:41.383196	2014-03-07 01:31:45.739186
35883	582634	 6:49:00	 6:49:00	1145	1		0	0	\N	3916	1900	2014-03-07 00:56:54.436629	2014-03-07 01:32:00.542193
35884	582634	 6:49:28	 6:49:28	885	2		0	0	0.308800000000000019	3916	1680	2014-03-07 00:56:54.447675	2014-03-07 01:32:00.553085
35885	582634	 6:49:37	 6:49:37	886	3		0	0	0.409399999999999986	3916	1681	2014-03-07 00:56:54.458829	2014-03-07 01:32:00.563452
35886	582634	 6:49:57	 6:49:57	887	4		0	0	0.63600000000000001	3916	1682	2014-03-07 00:56:54.470125	2014-03-07 01:32:00.574925
35887	582634	 6:50:35	 6:50:35	888	5		0	0	1.05309999999999993	3916	1683	2014-03-07 00:56:54.481199	2014-03-07 01:32:00.586188
35888	582634	 6:50:41	 6:50:41	889	6		0	0	1.12799999999999989	3916	1684	2014-03-07 00:56:54.492288	2014-03-07 01:32:00.597523
35889	582634	 6:50:58	 6:50:58	890	7		0	0	1.31770000000000009	3916	1685	2014-03-07 00:56:54.50338	2014-03-07 01:32:00.608277
35890	582634	 6:51:17	 6:51:17	891	8		0	0	1.52960000000000007	3916	1686	2014-03-07 00:56:54.51455	2014-03-07 01:32:00.619609
35891	582634	 6:51:28	 6:51:28	892	9		0	0	1.6573	3916	1687	2014-03-07 00:56:54.525511	2014-03-07 01:32:00.630721
35892	582634	 6:51:57	 6:51:57	893	10		0	0	1.97740000000000005	3916	1688	2014-03-07 00:56:54.592179	2014-03-07 01:32:00.641556
35893	582634	 6:52:31	 6:52:31	894	11		0	0	2.35429999999999984	3916	1689	2014-03-07 00:56:54.603268	2014-03-07 01:32:00.652821
35894	582634	 6:53:00	 6:53:00	98	12		0	0	2.62250000000000005	3916	1049	2014-03-07 00:56:54.614461	2014-03-07 01:32:00.66326
35895	582634	 6:53:21	 6:53:21	895	13		0	0	2.82060000000000022	3916	1690	2014-03-07 00:56:54.625591	2014-03-07 01:32:00.676996
35896	582634	 6:53:36	 6:53:36	896	14		0	0	2.96629999999999994	3916	1691	2014-03-07 00:56:54.636775	2014-03-07 01:32:00.697375
35898	582634	 6:54:29	 6:54:29	898	16		0	0	3.45800000000000018	3916	1693	2014-03-07 00:56:54.658967	2014-03-07 01:32:00.719191
35899	582634	 6:55:04	 6:55:04	899	17		0	0	3.77899999999999991	3916	1694	2014-03-07 00:56:54.670058	2014-03-07 01:32:00.730707
35900	582634	 6:55:34	 6:55:34	900	18		0	0	4.05539999999999967	3916	1695	2014-03-07 00:56:54.681114	2014-03-07 01:32:00.741494
35901	582634	 6:56:04	 6:56:04	901	19		0	0	4.33729999999999993	3916	1696	2014-03-07 00:56:54.692282	2014-03-07 01:32:00.752711
35902	582634	 6:56:32	 6:56:32	902	20		0	0	4.59710000000000019	3916	1697	2014-03-07 00:56:54.703301	2014-03-07 01:32:00.764949
35903	582634	 6:57:04	 6:57:04	243	21		0	0	4.89569999999999972	3916	1125	2014-03-07 00:56:54.714498	2014-03-07 01:32:00.774654
35904	582634	 6:58:00	 6:58:00	99	22		0	0	5.35799999999999965	3916	1050	2014-03-07 00:56:54.725826	2014-03-07 01:32:00.852788
35905	582634	 6:58:57	 6:58:57	903	23		0	0	5.73099999999999987	3916	1698	2014-03-07 00:56:54.736946	2014-03-07 01:32:00.864906
35906	582634	 6:59:38	 6:59:38	1147	24		0	0	6.00070000000000014	3916	1902	2014-03-07 00:56:54.74792	2014-03-07 01:32:00.873637
35907	582634	 7:00:33	 7:00:33	904	25		0	0	6.36289999999999978	3916	1699	2014-03-07 00:56:54.759059	2014-03-07 01:32:00.885438
35908	582634	 7:01:38	 7:01:38	656	26		0	0	6.78960000000000008	3916	1469	2014-03-07 00:56:54.77019	2014-03-07 01:32:00.897923
35909	582634	 7:02:31	 7:02:31	905	27		0	0	7.14229999999999965	3916	1700	2014-03-07 00:56:54.781313	2014-03-07 01:32:00.909003
35910	582634	 7:02:58	 7:02:58	906	28		0	0	7.3219000000000003	3916	1701	2014-03-07 00:56:54.792396	2014-03-07 01:32:00.920147
35911	582634	 7:03:40	 7:03:40	907	29		0	0	7.59999999999999964	3916	1702	2014-03-07 00:56:54.803498	2014-03-07 01:32:01.455595
35912	582634	 7:04:09	 7:04:09	908	30		0	0	7.79450000000000021	3916	1703	2014-03-07 00:56:54.81475	2014-03-07 01:32:01.475694
35913	582634	 7:04:31	 7:04:31	909	31		0	0	7.94160000000000021	3916	1704	2014-03-07 00:56:54.903955	2014-03-07 01:32:01.486878
35914	582634	 7:05:00	 7:05:00	506	32		0	0	8.13540000000000063	3916	1338	2014-03-07 00:56:54.914521	2014-03-07 01:32:01.498033
35916	582634	 7:06:04	 7:06:04	508	34		0	0	8.55840000000000067	3916	1340	2014-03-07 00:56:54.93681	2014-03-07 01:32:01.520213
35917	582634	 7:06:51	 7:06:51	50	35		0	0	8.87100000000000044	3916	1024	2014-03-07 00:56:54.947853	2014-03-07 01:32:01.531131
35918	582634	 7:08:00	 7:08:00	13	36		0	0	9.27979999999999983	3916	1003	2014-03-07 00:56:54.958975	2014-03-07 01:32:01.542713
35919	582634	 7:08:30	 7:08:30	430	37		0	0	9.43689999999999962	3916	1285	2014-03-07 00:56:54.970124	2014-03-07 01:32:01.553237
35920	582634	 7:09:00	 7:09:00	34	38		0	0	9.58680000000000021	3916	1013	2014-03-07 00:56:54.98125	2014-03-07 01:32:01.564493
35921	582634	 7:11:00	 7:11:00	157	39		0	0	10.3027999999999995	3916	1080	2014-03-07 00:56:54.992382	2014-03-07 01:32:01.575619
36855	584557	 6:15:00	 6:15:00	268	1		0	1	\N	3941	1138	2014-03-07 00:57:07.565862	2014-03-07 01:32:15.633116
36856	584557	 6:16:19	 6:16:19	103	2		0	1	0.504299999999999971	3941	1051	2014-03-07 00:57:07.576485	2014-03-07 01:32:15.643999
36857	584557	 6:16:51	 6:16:51	289	3		0	1	0.712300000000000044	3941	1156	2014-03-07 00:57:07.588948	2014-03-07 01:32:15.65539
36858	584557	 6:17:41	 6:17:41	104	4		0	1	1.0290999999999999	3941	1052	2014-03-07 00:57:07.59895	2014-03-07 01:32:15.665849
36859	584557	 6:18:00	 6:18:00	227	5		0	1	1.13870000000000005	3941	1114	2014-03-07 00:57:07.610569	2014-03-07 01:32:15.677185
36860	584557	 6:18:25	 6:18:25	5	6		0	1	1.32469999999999999	3941	998	2014-03-07 00:57:07.622055	2014-03-07 01:32:15.688695
36861	584557	 6:18:57	 6:18:57	368	7		0	1	1.56020000000000003	3941	1227	2014-03-07 00:57:07.632466	2014-03-07 01:32:15.699364
36862	584557	 6:19:47	 6:19:47	369	8		0	1	1.93149999999999999	3941	1228	2014-03-07 00:57:07.643992	2014-03-07 01:32:15.710737
36863	584557	 6:20:37	 6:20:37	370	9		0	1	2.29999999999999982	3941	1229	2014-03-07 00:57:07.655527	2014-03-07 01:32:15.722186
36865	584557	 6:22:23	 6:22:23	373	11		0	1	3.07929999999999993	3941	1232	2014-03-07 00:57:07.676891	2014-03-07 01:32:15.744163
36866	584557	 6:22:52	 6:22:52	374	12		0	1	3.29429999999999978	3941	1233	2014-03-07 00:57:07.688425	2014-03-07 01:32:15.754613
36867	584557	 6:23:16	 6:23:16	375	13		0	1	3.4740000000000002	3941	1234	2014-03-07 00:57:07.699223	2014-03-07 01:32:15.766119
36868	584557	 6:23:55	 6:23:55	376	14		0	1	3.76609999999999978	3941	1235	2014-03-07 00:57:07.709824	2014-03-07 01:32:15.777425
36869	584557	 6:24:51	 6:24:51	149	15		0	1	4.17849999999999966	3941	1075	2014-03-07 00:57:07.721775	2014-03-07 01:32:15.788296
36870	584557	 6:25:57	 6:25:57	6	16		0	1	4.66450000000000031	3941	999	2014-03-07 00:57:07.732906	2014-03-07 01:32:15.799593
36871	584557	 6:27:00	 6:27:00	151	17		0	1	5.09919999999999973	3941	1077	2014-03-07 00:57:07.743644	2014-03-07 01:32:15.811287
36872	584557	 6:27:41	 6:27:41	939	18		0	1	5.33560000000000034	3941	1734	2014-03-07 00:57:07.754225	2014-03-07 01:32:15.821845
36873	584557	 6:28:58	 6:28:58	940	19		0	1	5.77890000000000015	3941	1735	2014-03-07 00:57:07.765468	2014-03-07 01:32:15.833995
36874	584557	 6:29:57	 6:29:57	941	20		0	1	6.11679999999999957	3941	1736	2014-03-07 00:57:07.776376	2014-03-07 01:32:15.844797
36875	584557	 6:30:42	 6:30:42	1290	21		0	1	6.37880000000000003	3941	1953	2014-03-07 00:57:07.787392	2014-03-07 01:32:15.855195
36876	584557	 6:32:00	 6:32:00	228	22		0	1	6.80850000000000044	3941	1115	2014-03-07 00:57:07.799107	2014-03-07 01:32:15.866261
36877	584557	 6:55:34	 6:55:34	106	23		1	0	24.5494999999999983	3941	1053	2014-03-07 00:57:07.810585	2014-03-07 01:32:15.876839
36878	584557	 6:56:06	 6:56:06	948	24		1	0	24.9606999999999992	3941	1743	2014-03-07 00:57:07.821852	2014-03-07 01:32:15.888801
36879	584557	 6:56:50	 6:56:50	951	25		1	0	25.5238000000000014	3941	1744	2014-03-07 00:57:07.832787	2014-03-07 01:32:15.899623
36880	584557	 6:57:10	 6:57:10	1028	26		1	0	25.7841999999999985	3941	1804	2014-03-07 00:57:07.844089	2014-03-07 01:32:15.910884
36881	584557	 6:57:40	 6:57:40	1258	27		1	0	26.1621999999999986	3941	1937	2014-03-07 00:57:07.855073	2014-03-07 01:32:15.922479
36882	584557	 6:57:59	 6:57:59	1260	28		1	0	26.4102999999999994	3941	1938	2014-03-07 00:57:07.866232	2014-03-07 01:32:15.932777
36883	584557	 6:58:18	 6:58:18	1261	29		1	0	26.6500999999999983	3941	1939	2014-03-07 00:57:07.877347	2014-03-07 01:32:15.999152
36884	584557	 6:58:37	 6:58:37	955	30		1	0	26.8930000000000007	3941	1745	2014-03-07 00:57:07.955061	2014-03-07 01:32:16.010131
36885	584557	 6:58:48	 6:58:48	956	31		1	0	27.0315000000000012	3941	1746	2014-03-07 00:57:07.966297	2014-03-07 01:32:16.021304
36886	584557	 6:59:28	 6:59:28	198	32		1	0	27.5416999999999987	3941	1100	2014-03-07 00:57:07.97741	2014-03-07 01:32:16.032439
36887	584557	 7:00:15	 7:00:15	957	33		1	0	28.1338000000000008	3941	1747	2014-03-07 00:57:07.988518	2014-03-07 01:32:16.044505
36888	584557	 7:00:37	 7:00:37	958	34		1	0	28.4151999999999987	3941	1748	2014-03-07 00:57:07.999603	2014-03-07 01:32:16.055578
36889	584557	 7:01:14	 7:01:14	960	35		1	0	28.8872999999999998	3941	1749	2014-03-07 00:57:08.010731	2014-03-07 01:32:16.06612
36890	584557	 7:01:29	 7:01:29	961	36		1	0	29.0782999999999987	3941	1750	2014-03-07 00:57:08.021876	2014-03-07 01:32:16.077867
36891	584557	 7:01:52	 7:01:52	962	37		1	0	29.3750999999999998	3941	1751	2014-03-07 00:57:08.032996	2014-03-07 01:32:16.089098
36892	584557	 7:02:29	 7:02:29	964	38		1	0	29.8431999999999995	3941	1752	2014-03-07 00:57:08.044223	2014-03-07 01:32:16.099647
37830	584582	 7:15:00	 7:15:00	1317	1		0	1	\N	3966	1968	2014-03-07 00:57:20.87483	2014-03-07 01:32:30.57969
37831	584582	 7:15:59	 7:15:59	272	2		0	1	0.254400000000000015	3966	1140	2014-03-07 00:57:20.886105	2014-03-07 01:32:30.590132
37832	584582	 7:17:08	 7:17:08	273	3		0	1	0.550599999999999978	3966	1141	2014-03-07 00:57:20.897117	2014-03-07 01:32:30.601179
37833	584582	 7:17:34	 7:17:34	274	4		0	1	0.662000000000000033	3966	1142	2014-03-07 00:57:20.908252	2014-03-07 01:32:30.612716
37835	584582	 7:19:36	 7:19:36	967	6		0	1	1.18940000000000001	3966	1754	2014-03-07 00:57:20.997356	2014-03-07 01:32:30.635477
37836	584582	 7:22:51	 7:22:51	969	7		0	1	2.02360000000000007	3966	1755	2014-03-07 00:57:21.008224	2014-03-07 01:32:30.646749
37837	584582	 7:25:00	 7:25:00	110	8		0	1	2.55759999999999987	3966	1054	2014-03-07 00:57:21.019372	2014-03-07 01:32:30.657005
37838	584582	 7:25:53	 7:25:53	971	9		0	1	2.86859999999999982	3966	1756	2014-03-07 00:57:21.030499	2014-03-07 01:32:30.668622
37839	584582	 7:26:35	 7:26:35	1262	10		0	1	3.1160000000000001	3966	1940	2014-03-07 00:57:21.041645	2014-03-07 01:32:30.680054
37840	584582	 7:27:16	 7:27:16	1263	11		0	1	3.36169999999999991	3966	1941	2014-03-07 00:57:21.052451	2014-03-07 01:32:30.690687
37841	584582	 7:27:47	 7:27:47	974	12		0	1	3.54590000000000005	3966	1757	2014-03-07 00:57:21.062819	2014-03-07 01:32:30.701641
37842	584582	 7:28:12	 7:28:12	1197	13		0	1	3.69249999999999989	3966	1917	2014-03-07 00:57:21.075032	2014-03-07 01:32:30.713371
37843	584582	 7:28:46	 7:28:46	1198	14		0	1	3.89460000000000006	3966	1918	2014-03-07 00:57:21.086004	2014-03-07 01:32:30.724877
37844	584582	 7:29:17	 7:29:17	1235	15		0	1	4.07800000000000029	3966	1934	2014-03-07 00:57:21.097267	2014-03-07 01:32:30.735382
37845	584582	 7:30:47	 7:30:47	980	16		0	1	4.60970000000000013	3966	1758	2014-03-07 00:57:21.108391	2014-03-07 01:32:30.747409
37846	584582	 7:31:24	 7:31:24	981	17		0	1	4.82720000000000038	3966	1759	2014-03-07 00:57:21.119426	2014-03-07 01:32:30.757058
37847	584582	 7:32:00	 7:32:00	111	18		0	1	5.0176999999999996	3966	1055	2014-03-07 00:57:21.1306	2014-03-07 01:32:30.768493
37848	584582	 7:57:43	 7:57:43	229	19		1	0	22.6097000000000001	3966	1116	2014-03-07 00:57:21.141682	2014-03-07 01:32:30.780078
37849	584582	 7:58:17	 7:58:17	265	20		1	0	23.0017999999999994	3966	1137	2014-03-07 00:57:21.152916	2014-03-07 01:32:30.790511
37850	584582	 7:58:37	 7:58:37	982	21		1	0	23.2362000000000002	3966	1760	2014-03-07 00:57:21.163962	2014-03-07 01:32:30.802372
37851	584582	 7:59:13	 7:59:13	983	22		1	0	23.6555	3966	1761	2014-03-07 00:57:21.174989	2014-03-07 01:32:30.813484
37852	584582	 7:59:45	 7:59:45	984	23		1	0	24.0208000000000013	3966	1762	2014-03-07 00:57:21.186259	2014-03-07 01:32:30.824132
37853	584582	 8:00:12	 8:00:12	230	24		1	0	24.3344999999999985	3966	1117	2014-03-07 00:57:21.197398	2014-03-07 01:32:30.835998
37854	584582	 8:00:54	 8:00:54	321	25		1	0	24.8152000000000008	3966	1181	2014-03-07 00:57:21.208179	2014-03-07 01:32:30.846178
37855	584582	 8:01:35	 8:01:35	323	26		1	0	25.2912999999999997	3966	1183	2014-03-07 00:57:21.219331	2014-03-07 01:32:30.857826
37856	584582	 8:02:02	 8:02:02	324	27		1	0	25.6024999999999991	3966	1184	2014-03-07 00:57:21.230562	2014-03-07 01:32:30.869075
37857	584582	 8:02:32	 8:02:32	325	28		1	0	25.9483999999999995	3966	1185	2014-03-07 00:57:21.241574	2014-03-07 01:32:30.879351
37858	584582	 8:02:47	 8:02:47	326	29		1	0	26.1217000000000006	3966	1186	2014-03-07 00:57:21.25278	2014-03-07 01:32:30.89099
37859	584582	 8:03:10	 8:03:10	327	30		1	0	26.3912000000000013	3966	1187	2014-03-07 00:57:21.263979	2014-03-07 01:32:30.902158
37860	584582	 8:03:27	 8:03:27	328	31		1	0	26.5899000000000001	3966	1188	2014-03-07 00:57:21.274973	2014-03-07 01:32:30.913269
37861	584582	 8:03:48	 8:03:48	329	32		1	0	26.8338999999999999	3966	1189	2014-03-07 00:57:21.286191	2014-03-07 01:32:30.924846
37862	584582	 8:04:08	 8:04:08	330	33		1	0	27.0671999999999997	3966	1190	2014-03-07 00:57:21.297358	2014-03-07 01:32:30.934826
37864	584582	 8:05:12	 8:05:12	332	35		1	0	27.799199999999999	3966	1192	2014-03-07 00:57:21.319534	2014-03-07 01:32:30.957552
37865	584582	 8:05:36	 8:05:36	1287	36		1	0	28.0792000000000002	3966	1951	2014-03-07 00:57:21.33069	2014-03-07 01:32:30.969162
37866	584582	 8:06:19	 8:06:19	22	37		0	0	28.5715000000000003	3966	1008	2014-03-07 00:57:21.341859	2014-03-07 01:32:30.979797
37867	584582	 8:07:00	 8:07:00	268	38		1	0	28.956900000000001	3966	1138	2014-03-07 00:57:21.353005	2014-03-07 01:32:30.990898
38134	582956	 7:20:00	 7:20:00	1328	1		0	0	\N	3991	1975	2014-03-07 00:57:24.766009	2014-03-07 01:32:35.250573
38135	582956	 7:20:43	 7:20:43	258	2		0	0	0.32779999999999998	3991	1132	2014-03-07 00:57:24.777061	2014-03-07 01:32:35.26184
38136	582956	 7:21:17	 7:21:17	261	3		0	0	0.584600000000000009	3991	1135	2014-03-07 00:57:24.788214	2014-03-07 01:32:35.272241
38137	582956	 7:22:08	 7:22:08	301	4		0	0	0.973600000000000021	3991	1166	2014-03-07 00:57:24.799233	2014-03-07 01:32:35.283709
38138	582956	 7:22:29	 7:22:29	302	5		0	0	1.13129999999999997	3991	1167	2014-03-07 00:57:24.810376	2014-03-07 01:32:35.294201
38139	582956	 7:23:10	 7:23:10	303	6		0	0	1.4444999999999999	3991	1168	2014-03-07 00:57:24.821473	2014-03-07 01:32:35.305828
38140	582956	 7:23:57	 7:23:57	304	7		0	0	1.80390000000000006	3991	1169	2014-03-07 00:57:24.832676	2014-03-07 01:32:35.317502
38141	582956	 7:24:18	 7:24:18	86	8		0	0	1.9677	3991	1046	2014-03-07 00:57:24.843788	2014-03-07 01:32:35.327208
38142	582956	 7:24:54	 7:24:54	306	9		0	0	2.23799999999999999	3991	1170	2014-03-07 00:57:24.854938	2014-03-07 01:32:35.338766
38144	582956	 7:26:45	 7:26:45	309	11		0	0	3.0766	3991	1172	2014-03-07 00:57:24.877148	2014-03-07 01:32:35.360671
38145	582956	 7:27:19	 7:27:19	834	12		0	0	3.33829999999999982	3991	1634	2014-03-07 00:57:24.888375	2014-03-07 01:32:35.372609
38146	582956	 7:27:48	 7:27:48	835	13		0	0	3.55609999999999982	3991	1635	2014-03-07 00:57:24.899204	2014-03-07 01:32:35.383664
38147	582956	 7:28:38	 7:28:38	836	14		0	0	3.93780000000000019	3991	1636	2014-03-07 00:57:24.909513	2014-03-07 01:32:35.394308
38148	582956	 7:30:00	 7:30:00	236	15		0	0	4.50459999999999994	3991	1120	2014-03-07 00:57:24.921654	2014-03-07 01:32:35.405585
38149	582956	 7:30:50	 7:30:50	837	16		0	0	4.88229999999999986	3991	1637	2014-03-07 00:57:24.932611	2014-03-07 01:32:35.417822
38150	582956	 7:31:21	 7:31:21	838	17		0	0	5.11960000000000015	3991	1638	2014-03-07 00:57:24.943921	2014-03-07 01:32:35.439757
38151	582956	 7:31:52	 7:31:52	839	18		0	0	5.35060000000000002	3991	1639	2014-03-07 00:57:24.954283	2014-03-07 01:32:35.44977
38152	582956	 7:32:40	 7:32:40	840	19		0	0	5.71159999999999979	3991	1640	2014-03-07 00:57:24.965986	2014-03-07 01:32:35.461436
38153	582956	 7:33:05	 7:33:05	841	20		0	0	5.90230000000000032	3991	1641	2014-03-07 00:57:24.977352	2014-03-07 01:32:35.472661
38154	582956	 7:33:42	 7:33:42	842	21		0	0	6.18069999999999986	3991	1642	2014-03-07 00:57:24.988388	2014-03-07 01:32:35.483944
38155	582956	 7:34:34	 7:34:34	123	22		0	0	6.57240000000000002	3991	1062	2014-03-07 00:57:24.999433	2014-03-07 01:32:35.560892
38156	582956	 7:35:29	 7:35:29	1040	23		0	0	6.9836999999999998	3991	1815	2014-03-07 00:57:25.077292	2014-03-07 01:32:35.571613
38157	582956	 7:36:48	 7:36:48	1041	24		0	0	7.5708000000000002	3991	1816	2014-03-07 00:57:25.088353	2014-03-07 01:32:35.582726
38158	582956	 7:37:44	 7:37:44	1042	25		0	0	7.98650000000000038	3991	1817	2014-03-07 00:57:25.098851	2014-03-07 01:32:35.594668
38159	582956	 7:38:09	 7:38:09	1043	26		0	0	8.17629999999999946	3991	1818	2014-03-07 00:57:25.110289	2014-03-07 01:32:35.606343
38160	582956	 7:38:34	 7:38:34	1044	27		0	0	8.36749999999999972	3991	1819	2014-03-07 00:57:25.121602	2014-03-07 01:32:35.616794
38161	582956	 7:38:56	 7:38:56	1045	28		0	0	8.53539999999999921	3991	1820	2014-03-07 00:57:25.132939	2014-03-07 01:32:35.628477
38162	582956	 7:39:39	 7:39:39	1046	29		0	0	8.86149999999999949	3991	1821	2014-03-07 00:57:25.144404	2014-03-07 01:32:35.640123
38163	582956	 7:40:09	 7:40:09	1047	30		0	0	9.08590000000000053	3991	1822	2014-03-07 00:57:25.154947	2014-03-07 01:32:35.650587
38164	582956	 7:41:00	 7:41:00	206	31		0	0	9.40000000000000036	3991	1104	2014-03-07 00:57:25.166182	2014-03-07 01:32:35.66242
38165	582956	 7:41:52	 7:41:52	1048	32		0	0	9.73969999999999914	3991	1823	2014-03-07 00:57:25.176895	2014-03-07 01:32:35.672766
38166	582956	 7:42:28	 7:42:28	1049	33		0	0	9.97310000000000052	3991	1824	2014-03-07 00:57:25.188358	2014-03-07 01:32:35.684237
38168	582956	 7:43:37	 7:43:37	1025	35		0	0	10.4281000000000006	3991	1801	2014-03-07 00:57:25.210486	2014-03-07 01:32:35.706141
38169	582956	 7:44:25	 7:44:25	1051	36		0	0	10.7426999999999992	3991	1826	2014-03-07 00:57:25.221706	2014-03-07 01:32:35.717612
38170	582956	 7:44:52	 7:44:52	1052	37		0	0	10.9192	3991	1827	2014-03-07 00:57:25.233041	2014-03-07 01:32:35.728749
38171	582956	 7:45:18	 7:45:18	1053	38		0	0	11.0882000000000005	3991	1828	2014-03-07 00:57:25.243813	2014-03-07 01:32:35.739157
38172	582956	 7:46:15	 7:46:15	1054	39		0	0	11.4609000000000005	3991	1829	2014-03-07 00:57:25.254893	2014-03-07 01:32:35.751183
38173	582956	 7:47:28	 7:47:28	125	40		0	0	11.9344000000000001	3991	1063	2014-03-07 00:57:25.266291	2014-03-07 01:32:35.761033
38174	582956	 7:48:08	 7:48:08	196	41		0	0	12.1988000000000003	3991	1099	2014-03-07 00:57:25.277669	2014-03-07 01:32:35.772356
38175	582956	 7:48:43	 7:48:43	1322	42		1	0	12.4303000000000008	3991	1971	2014-03-07 00:57:25.288433	2014-03-07 01:32:35.783854
38176	582956	 7:49:24	 7:49:24	1318	43		0	0	12.6994000000000007	3991	1969	2014-03-07 00:57:25.299747	2014-03-07 01:32:35.862047
38177	582956	 7:51:00	 7:51:00	1319	44		0	0	13.2798999999999996	3991	1970	2014-03-07 00:57:25.31076	2014-03-07 01:32:35.872795
41116	583215	 7:09:00	 7:09:00	134	1		0	0	\N	4047	1070	2014-03-07 00:58:03.202263	2014-03-07 01:33:19.823803
41117	583215	 7:09:40	 7:09:40	1093	2		0	0	0.298700000000000021	4047	1866	2014-03-07 00:58:03.213491	2014-03-07 01:33:19.835539
41118	583215	 7:10:22	 7:10:22	1094	3		0	0	0.611099999999999977	4047	1867	2014-03-07 00:58:03.224432	2014-03-07 01:33:19.847411
41119	583215	 7:11:09	 7:11:09	133	4		0	0	0.959200000000000053	4047	1069	2014-03-07 00:58:03.235586	2014-03-07 01:33:19.868756
41120	583215	 7:11:32	 7:11:32	494	5		0	0	1.13379999999999992	4047	1326	2014-03-07 00:58:03.24663	2014-03-07 01:33:19.879441
41121	583215	 7:12:29	 7:12:29	495	6		0	0	1.55590000000000006	4047	1327	2014-03-07 00:58:03.257751	2014-03-07 01:33:19.890413
41123	583215	 7:14:07	 7:14:07	1095	8		0	0	2.39080000000000004	4047	1868	2014-03-07 00:58:03.280409	2014-03-07 01:33:19.912677
41124	583215	 7:14:41	 7:14:41	1096	9		0	0	2.7105999999999999	4047	1869	2014-03-07 00:58:03.291228	2014-03-07 01:33:19.924056
41125	583215	 7:15:08	 7:15:08	1097	10		0	0	2.96649999999999991	4047	1870	2014-03-07 00:58:03.302403	2014-03-07 01:33:19.93699
41126	583215	 7:15:40	 7:15:40	492	11		0	0	3.27249999999999996	4047	1324	2014-03-07 00:58:03.313511	2014-03-07 01:33:19.957762
41127	583215	 7:16:11	 7:16:11	493	12		0	0	3.57050000000000001	4047	1325	2014-03-07 00:58:03.324727	2014-03-07 01:33:19.969505
41128	583215	 7:16:53	 7:16:53	300	13		0	0	3.96620000000000017	4047	1165	2014-03-07 00:58:03.336095	2014-03-07 01:33:19.979867
41129	583215	 7:17:41	 7:17:41	297	14		0	0	4.41800000000000015	4047	1162	2014-03-07 00:58:03.346937	2014-03-07 01:33:19.990744
41130	583215	 7:18:18	 7:18:18	1098	15		0	0	4.76579999999999959	4047	1871	2014-03-07 00:58:03.358028	2014-03-07 01:33:20.002076
41131	583215	 7:19:00	 7:19:00	229	16		0	0	5.13980000000000015	4047	1116	2014-03-07 00:58:03.369054	2014-03-07 01:33:20.012861
41132	583215	 7:20:03	 7:20:03	265	17		0	0	5.53190000000000026	4047	1137	2014-03-07 00:58:03.435773	2014-03-07 01:33:20.024138
41133	583215	 7:20:40	 7:20:40	982	18		0	0	5.7663000000000002	4047	1760	2014-03-07 00:58:03.447041	2014-03-07 01:33:20.034875
41134	583215	 7:21:47	 7:21:47	983	19		0	0	6.18559999999999999	4047	1761	2014-03-07 00:58:03.458169	2014-03-07 01:33:20.046309
41135	583215	 7:22:45	 7:22:45	984	20		0	0	6.55090000000000039	4047	1762	2014-03-07 00:58:03.469346	2014-03-07 01:33:20.057379
41136	583215	 7:23:37	 7:23:37	985	21		0	0	6.87819999999999965	4047	1763	2014-03-07 00:58:03.480393	2014-03-07 01:33:20.068848
41137	583215	 7:24:12	 7:24:12	986	22		0	0	7.09909999999999997	4047	1764	2014-03-07 00:58:03.491473	2014-03-07 01:33:20.079513
41138	583215	 7:25:00	 7:25:00	240	23		0	0	7.37420000000000009	4047	1123	2014-03-07 00:58:03.502558	2014-03-07 01:33:20.091291
41139	583215	 7:25:15	 7:25:15	282	24		0	0	7.47940000000000005	4047	1150	2014-03-07 00:58:03.513708	2014-03-07 01:33:20.101946
41140	583215	 7:25:56	 7:25:56	946	25		0	0	7.7533000000000003	4047	1741	2014-03-07 00:58:03.524886	2014-03-07 01:33:20.113003
41141	583215	 7:26:30	 7:26:30	947	26		0	0	7.98050000000000015	4047	1742	2014-03-07 00:58:03.535838	2014-03-07 01:33:20.124477
41142	583215	 7:27:10	 7:27:10	575	27		0	0	8.24810000000000088	4047	1398	2014-03-07 00:58:03.54705	2014-03-07 01:33:20.134874
41143	583215	 7:28:07	 7:28:07	577	28		0	0	8.62909999999999933	4047	1400	2014-03-07 00:58:03.558205	2014-03-07 01:33:20.14693
41144	583215	 7:29:06	 7:29:06	682	29		0	0	9.02630000000000088	4047	1494	2014-03-07 00:58:03.569257	2014-03-07 01:33:20.158669
41145	583215	 7:29:21	 7:29:21	683	30		0	0	9.13129999999999953	4047	1495	2014-03-07 00:58:03.580349	2014-03-07 01:33:20.180404
41146	583215	 7:29:50	 7:29:50	1099	31		0	0	9.32499999999999929	4047	1872	2014-03-07 00:58:03.591533	2014-03-07 01:33:20.191459
41147	583215	 7:31:01	 7:31:01	1100	32		0	0	9.80109999999999992	4047	1873	2014-03-07 00:58:03.602666	2014-03-07 01:33:20.202285
41148	583215	 7:31:31	 7:31:31	1102	33		0	0	10.0042000000000009	4047	1875	2014-03-07 00:58:03.613832	2014-03-07 01:33:20.213262
41149	583215	 7:32:00	 7:32:00	137	34		0	0	10.1734000000000009	4047	1072	2014-03-07 00:58:03.624857	2014-03-07 01:33:20.22372
41150	583215	 7:33:53	 7:33:53	1105	35		0	0	10.7018000000000004	4047	1878	2014-03-07 00:58:03.635917	2014-03-07 01:33:20.235822
41152	583215	 7:38:00	 7:38:00	1152	37		0	0	11.8449000000000009	4047	1906	2014-03-07 00:58:03.658203	2014-03-07 01:33:20.257931
42597	583249	 7:47:00	 7:47:00	1152	1		0	0	\N	4090	1906	2014-03-07 00:58:22.870736	2014-03-07 01:33:41.954679
42598	583249	 7:48:16	 7:48:16	1104	2		0	0	0.36080000000000001	4090	1877	2014-03-07 00:58:22.880667	2014-03-07 01:33:41.96553
42599	583249	 7:49:22	 7:49:22	213	3		0	0	0.676599999999999979	4090	1108	2014-03-07 00:58:22.893089	2014-03-07 01:33:41.977248
42600	583249	 7:50:52	 7:50:52	281	4		0	0	1.10359999999999991	4090	1149	2014-03-07 00:58:22.904134	2014-03-07 01:33:41.988982
42601	583249	 7:53:00	 7:53:00	140	5		0	0	1.7016	4090	1073	2014-03-07 00:58:22.915256	2014-03-07 01:33:42.000116
42602	583249	 7:53:26	 7:53:26	1103	6		0	0	1.90310000000000001	4090	1876	2014-03-07 00:58:22.926613	2014-03-07 01:33:42.011819
42603	583249	 7:53:48	 7:53:48	1101	7		0	0	2.07180000000000009	4090	1874	2014-03-07 00:58:22.937664	2014-03-07 01:33:42.022629
42604	583249	 7:54:50	 7:54:50	1106	8		0	0	2.55299999999999994	4090	1879	2014-03-07 00:58:22.948747	2014-03-07 01:33:42.034177
42605	583249	 7:55:08	 7:55:08	684	9		0	0	2.69439999999999991	4090	1496	2014-03-07 00:58:22.959795	2014-03-07 01:33:42.0451
42606	583249	 7:55:30	 7:55:30	685	10		0	0	2.86350000000000016	4090	1497	2014-03-07 00:58:22.970979	2014-03-07 01:33:42.055778
42607	583249	 7:56:22	 7:56:22	580	11		0	0	3.26639999999999997	4090	1403	2014-03-07 00:58:22.981791	2014-03-07 01:33:42.067315
42608	583249	 7:57:09	 7:57:09	576	12		0	0	3.63050000000000006	4090	1399	2014-03-07 00:58:22.993056	2014-03-07 01:33:42.078777
42609	583249	 7:57:38	 7:57:38	944	13		0	0	3.8530000000000002	4090	1739	2014-03-07 00:58:23.003993	2014-03-07 01:33:42.089788
42610	583249	 7:58:07	 7:58:07	945	14		0	0	4.07690000000000019	4090	1740	2014-03-07 00:58:23.015082	2014-03-07 01:33:42.101541
42611	583249	 7:59:00	 7:59:00	241	15		0	0	4.45939999999999959	4090	1124	2014-03-07 00:58:23.026209	2014-03-07 01:33:42.111117
42612	583249	 7:59:51	 7:59:51	942	16		0	0	4.78730000000000011	4090	1737	2014-03-07 00:58:23.037582	2014-03-07 01:33:42.123017
42613	583249	 8:00:25	 8:00:25	943	17		0	0	5.00530000000000008	4090	1738	2014-03-07 00:58:23.048762	2014-03-07 01:33:42.133652
42614	583249	 8:01:05	 8:01:05	939	18		0	0	5.26309999999999967	4090	1734	2014-03-07 00:58:23.059813	2014-03-07 01:33:42.145303
42615	583249	 8:02:15	 8:02:15	940	19		0	0	5.70640000000000036	4090	1735	2014-03-07 00:58:23.070924	2014-03-07 01:33:42.156139
42616	583249	 8:03:08	 8:03:08	941	20		0	0	6.04429999999999978	4090	1736	2014-03-07 00:58:23.082093	2014-03-07 01:33:42.167977
42617	583249	 8:03:49	 8:03:49	1290	21		0	0	6.30630000000000024	4090	1953	2014-03-07 00:58:23.093174	2014-03-07 01:33:42.178369
42618	583249	 8:05:00	 8:05:00	228	22		0	0	6.73599999999999977	4090	1115	2014-03-07 00:58:23.104274	2014-03-07 01:33:42.189811
42619	583249	 8:05:34	 8:05:34	1107	23		0	0	7.05600000000000005	4090	1880	2014-03-07 00:58:23.115351	2014-03-07 01:33:42.201029
42620	583249	 8:06:15	 8:06:15	298	24		0	0	7.44669999999999987	4090	1163	2014-03-07 00:58:23.126619	2014-03-07 01:33:42.211646
42622	583249	 8:07:49	 8:07:49	490	26		0	0	8.33399999999999963	4090	1322	2014-03-07 00:58:23.148838	2014-03-07 01:33:42.290085
42623	583249	 8:08:17	 8:08:17	491	27		0	0	8.59960000000000058	4090	1323	2014-03-07 00:58:23.159908	2014-03-07 01:33:42.300258
42624	583249	 8:08:49	 8:08:49	1108	28		0	0	8.89920000000000044	4090	1881	2014-03-07 00:58:23.170943	2014-03-07 01:33:42.312646
42625	583249	 8:09:11	 8:09:11	1109	29		0	0	9.11209999999999987	4090	1882	2014-03-07 00:58:23.182226	2014-03-07 01:33:42.323215
42626	583249	 8:09:50	 8:09:50	1110	30		0	0	9.47990000000000066	4090	1883	2014-03-07 00:58:23.193268	2014-03-07 01:33:42.333838
42627	583249	 8:11:00	 8:11:00	218	31		0	0	10.0985999999999994	4090	1111	2014-03-07 00:58:23.203961	2014-03-07 01:33:42.345401
42628	583249	 8:11:38	 8:11:38	497	32		0	0	10.3193000000000001	4090	1329	2014-03-07 00:58:23.215458	2014-03-07 01:33:42.356879
42629	583249	 8:12:22	 8:12:22	496	33		0	0	10.5765999999999991	4090	1328	2014-03-07 00:58:23.226619	2014-03-07 01:33:42.367761
42630	583249	 8:13:33	 8:13:33	498	34		0	0	10.9876000000000005	4090	1330	2014-03-07 00:58:23.237813	2014-03-07 01:33:42.40087
42631	583249	 8:14:06	 8:14:06	1111	35		0	0	11.1821999999999999	4090	1884	2014-03-07 00:58:23.248842	2014-03-07 01:33:42.412846
42632	583249	 8:15:02	 8:15:02	1112	36		0	0	11.5050000000000008	4090	1885	2014-03-07 00:58:23.259979	2014-03-07 01:33:42.422879
42633	583249	 8:15:30	 8:15:30	1113	37		0	0	11.6687999999999992	4090	1886	2014-03-07 00:58:23.271025	2014-03-07 01:33:42.43446
42634	583249	 8:16:23	 8:16:23	1114	38		0	0	11.9786999999999999	4090	1887	2014-03-07 00:58:23.282163	2014-03-07 01:33:42.445067
42635	583249	 8:18:00	 8:18:00	134	39		0	0	12.5120000000000005	4090	1070	2014-03-07 00:58:23.293308	2014-03-07 01:33:42.45604
45228	583440	 6:26:00	 6:26:00	244	1		0	0	\N	4124	1126	2014-03-07 00:58:57.458163	2014-03-07 01:34:21.245538
45229	583440	 6:27:00	 6:27:00	34	2		0	0	0.267299999999999982	4124	1013	2014-03-07 00:58:57.469218	2014-03-07 01:34:21.256417
45230	583440	 6:39:18	 6:39:18	1318	3		0	0	10.7125000000000004	4124	1969	2014-03-07 00:58:57.480346	2014-03-07 01:34:21.268631
45231	583440	 6:40:00	 6:40:00	1319	4		0	0	11.2929999999999993	4124	1970	2014-03-07 00:58:57.491443	2014-03-07 01:34:21.27965
45240	583443	19:43:00	19:43:00	1319	1		0	0	\N	4127	1970	2014-03-07 00:58:57.646992	2014-03-07 01:34:21.379121
45241	583443	19:54:00	19:54:00	21	2		0	0	10.4222000000000001	4127	1007	2014-03-07 00:58:57.65816	2014-03-07 01:34:21.389516
82935	580761	 6:32:00	 6:32:00	17	1		0	0	\N	4906	1005	2014-03-07 01:07:16.587907	2014-03-07 01:44:00.726538
82937	580761	 6:33:55	 6:33:55	466	3		0	0	0.677699999999999969	4906	1303	2014-03-07 01:07:16.610205	2014-03-07 01:44:00.759541
82938	580761	 6:34:29	 6:34:29	160	4		0	0	0.877499999999999947	4906	1083	2014-03-07 01:07:16.621282	2014-03-07 01:44:00.781576
82939	580761	 6:35:15	 6:35:15	460	5		0	0	1.14729999999999999	4906	1298	2014-03-07 01:07:16.632358	2014-03-07 01:44:00.791444
82940	580761	 6:36:29	 6:36:29	467	6		0	0	1.58509999999999995	4906	1304	2014-03-07 01:07:16.643547	2014-03-07 01:44:00.803113
82941	580761	 6:37:06	 6:37:06	478	7		0	0	1.80410000000000004	4906	1313	2014-03-07 01:07:16.654826	2014-03-07 01:44:00.814547
82942	580761	 6:37:33	 6:37:33	479	8		0	0	1.96399999999999997	4906	1314	2014-03-07 01:07:16.665829	2014-03-07 01:44:00.824906
82943	580761	 6:38:06	 6:38:06	480	9		0	0	2.16259999999999986	4906	1315	2014-03-07 01:07:16.676842	2014-03-07 01:44:00.836809
82944	580761	 6:38:43	 6:38:43	481	10		0	0	2.38370000000000015	4906	1316	2014-03-07 01:07:16.688028	2014-03-07 01:44:00.84832
82945	580761	 6:39:29	 6:39:29	1164	11		0	0	2.65419999999999989	4906	1908	2014-03-07 01:07:16.699137	2014-03-07 01:44:00.859316
82946	580761	 6:40:19	 6:40:19	485	12		0	0	2.95250000000000012	4906	1317	2014-03-07 01:07:16.710204	2014-03-07 01:44:00.869958
82947	580761	 6:41:11	 6:41:11	512	13		0	0	3.26109999999999989	4906	1344	2014-03-07 01:07:16.7216	2014-03-07 01:44:00.881736
82949	580761	 6:42:37	 6:42:37	360	15		0	0	3.73720000000000008	4906	1219	2014-03-07 01:07:16.809095	2014-03-07 01:44:00.90355
82950	580761	 6:43:22	 6:43:22	361	16		0	0	4.00659999999999972	4906	1220	2014-03-07 01:07:16.958451	2014-03-07 01:44:00.91418
82951	580761	 6:44:18	 6:44:18	362	17		0	0	4.34049999999999958	4906	1221	2014-03-07 01:07:17.00921	2014-03-07 01:44:00.925391
82952	580761	 6:44:46	 6:44:46	363	18		0	0	4.50600000000000023	4906	1222	2014-03-07 01:07:17.021461	2014-03-07 01:44:00.93708
82953	580761	 6:45:35	 6:45:35	1115	19		0	0	4.79429999999999978	4906	1888	2014-03-07 01:07:17.032707	2014-03-07 01:44:00.947447
82954	580761	 6:46:09	 6:46:09	364	20		0	0	4.99840000000000018	4906	1223	2014-03-07 01:07:17.043525	2014-03-07 01:44:00.958935
82955	580761	 6:46:44	 6:46:44	187	21		0	0	5.20600000000000041	4906	1095	2014-03-07 01:07:17.054738	2014-03-07 01:44:00.970054
82956	580761	 6:47:24	 6:47:24	338	22		0	0	5.44399999999999995	4906	1198	2014-03-07 01:07:17.066102	2014-03-07 01:44:01.038621
82957	580761	 6:48:01	 6:48:01	365	23		0	0	5.66650000000000009	4906	1224	2014-03-07 01:07:17.077078	2014-03-07 01:44:01.059147
82958	580761	 6:48:38	 6:48:38	366	24		0	0	5.88490000000000002	4906	1225	2014-03-07 01:07:17.088153	2014-03-07 01:44:01.070809
82959	580761	 6:49:17	 6:49:17	367	25		0	0	6.11589999999999989	4906	1226	2014-03-07 01:07:17.099415	2014-03-07 01:44:01.081465
82960	580761	 6:49:56	 6:49:56	3	26		0	0	6.35079999999999956	4906	996	2014-03-07 01:07:17.11043	2014-03-07 01:44:01.093197
82961	580761	 6:51:29	 6:51:29	288	27		0	0	6.90109999999999957	4906	1155	2014-03-07 01:07:17.121734	2014-03-07 01:44:01.104399
82962	580761	 6:52:05	 6:52:05	103	28		0	0	7.11549999999999994	4906	1051	2014-03-07 01:07:17.132323	2014-03-07 01:44:01.114437
82963	580761	 6:52:40	 6:52:40	289	29		0	0	7.32340000000000035	4906	1156	2014-03-07 01:07:17.143927	2014-03-07 01:44:01.125654
82964	580761	 6:53:20	 6:53:20	259	30		1	0	7.55959999999999965	4906	1133	2014-03-07 01:07:17.154624	2014-03-07 01:44:01.136391
82965	580761	 6:53:33	 6:53:33	104	31		0	0	7.64029999999999987	4906	1052	2014-03-07 01:07:17.1665	2014-03-07 01:44:01.14794
82966	580761	 6:54:00	 6:54:00	227	32		0	0	7.74990000000000023	4906	1114	2014-03-07 01:07:17.177279	2014-03-07 01:44:01.158801
82967	580761	 6:55:00	 6:55:00	5	33		0	0	7.93590000000000018	4906	998	2014-03-07 01:07:17.188356	2014-03-07 01:44:01.170306
82968	580761	 6:55:37	 6:55:37	368	34		0	0	8.17130000000000045	4906	1227	2014-03-07 01:07:17.199638	2014-03-07 01:44:01.182116
82969	580761	 6:56:36	 6:56:36	369	35		0	0	8.54260000000000019	4906	1228	2014-03-07 01:07:17.210617	2014-03-07 01:44:01.192124
82970	580761	 6:57:34	 6:57:34	370	36		0	0	8.91109999999999935	4906	1229	2014-03-07 01:07:17.221683	2014-03-07 01:44:01.203541
82971	580761	 6:58:13	 6:58:13	371	37		0	0	9.1593	4906	1230	2014-03-07 01:07:17.232772	2014-03-07 01:44:01.214593
82972	580761	 6:58:51	 6:58:51	372	38		0	0	9.40189999999999948	4906	1231	2014-03-07 01:07:17.243851	2014-03-07 01:44:01.226007
82973	580761	 6:59:36	 6:59:36	373	39		0	0	9.69050000000000011	4906	1232	2014-03-07 01:07:17.254968	2014-03-07 01:44:01.23701
82974	580761	 7:00:10	 7:00:10	374	40		0	0	9.9054000000000002	4906	1233	2014-03-07 01:07:17.266125	2014-03-07 01:44:01.248236
82976	580761	 7:01:24	 7:01:24	376	42		0	0	10.3772000000000002	4906	1235	2014-03-07 01:07:17.288265	2014-03-07 01:44:01.282196
82977	580761	 7:02:29	 7:02:29	149	43		0	0	10.7896000000000001	4906	1075	2014-03-07 01:07:17.299375	2014-03-07 01:44:01.358583
82978	580761	 7:02:59	 7:02:59	378	44		0	0	10.9826999999999995	4906	1237	2014-03-07 01:07:17.310529	2014-03-07 01:44:01.392495
82979	580761	 7:03:45	 7:03:45	6	45		0	0	11.2757000000000005	4906	999	2014-03-07 01:07:17.321672	2014-03-07 01:44:01.403276
82980	580761	 7:04:14	 7:04:14	379	46		0	0	11.4638000000000009	4906	1238	2014-03-07 01:07:17.332804	2014-03-07 01:44:01.41447
82981	580761	 7:05:00	 7:05:00	151	47		0	0	11.7103999999999999	4906	1077	2014-03-07 01:07:17.343799	2014-03-07 01:44:01.425687
82982	580761	 7:05:34	 7:05:34	380	48		0	0	11.9148999999999994	4906	1239	2014-03-07 01:07:17.355078	2014-03-07 01:44:01.436913
82983	580761	 7:06:11	 7:06:11	150	49		0	0	12.1349999999999998	4906	1076	2014-03-07 01:07:17.366222	2014-03-07 01:44:01.447753
82984	580761	 7:07:04	 7:07:04	381	50		0	0	12.4532000000000007	4906	1240	2014-03-07 01:07:17.377369	2014-03-07 01:44:01.459229
82985	580761	 7:07:48	 7:07:48	382	51		0	0	12.7203999999999997	4906	1241	2014-03-07 01:07:17.388909	2014-03-07 01:44:01.470929
82986	580761	 7:08:52	 7:08:52	384	52		0	0	13.1029999999999998	4906	1242	2014-03-07 01:07:17.399474	2014-03-07 01:44:01.481197
82987	580761	 7:09:11	 7:09:11	385	53		0	0	13.2190999999999992	4906	1243	2014-03-07 01:07:17.410731	2014-03-07 01:44:01.492588
82988	580761	 7:10:26	 7:10:26	387	54		0	0	13.6646999999999998	4906	1244	2014-03-07 01:07:17.421777	2014-03-07 01:44:01.504132
82989	580761	 7:11:27	 7:11:27	388	55		0	0	14.0272000000000006	4906	1245	2014-03-07 01:07:17.432935	2014-03-07 01:44:01.5143
82990	580761	 7:12:44	 7:12:44	389	56		0	0	14.4855999999999998	4906	1246	2014-03-07 01:07:17.443984	2014-03-07 01:44:01.526008
82991	580761	 7:13:12	 7:13:12	395	57		0	0	14.6545000000000005	4906	1251	2014-03-07 01:07:17.454493	2014-03-07 01:44:01.536958
82992	580761	 7:14:03	 7:14:03	396	58		0	0	14.9582999999999995	4906	1252	2014-03-07 01:07:17.46631	2014-03-07 01:44:01.547565
82993	580761	 7:14:51	 7:14:51	397	59		0	0	15.2463999999999995	4906	1253	2014-03-07 01:07:17.477421	2014-03-07 01:44:01.559291
82994	580761	 7:15:46	 7:15:46	398	60		0	0	15.5776000000000003	4906	1254	2014-03-07 01:07:17.489058	2014-03-07 01:44:01.571055
82995	580761	 7:16:03	 7:16:03	399	61		0	0	15.6797000000000004	4906	1255	2014-03-07 01:07:17.498403	2014-03-07 01:44:01.581134
82996	580761	 7:17:01	 7:17:01	402	62		0	0	16.0296999999999983	4906	1258	2014-03-07 01:07:17.510724	2014-03-07 01:44:01.593186
82997	580761	 7:17:23	 7:17:23	170	63		0	0	16.162700000000001	4906	1088	2014-03-07 01:07:17.565958	2014-03-07 01:44:01.603255
82998	580761	 7:18:06	 7:18:06	403	64		0	0	16.4198999999999984	4906	1259	2014-03-07 01:07:17.577092	2014-03-07 01:44:01.614819
82999	580761	 7:18:47	 7:18:47	404	65		0	0	16.6671000000000014	4906	1260	2014-03-07 01:07:17.588426	2014-03-07 01:44:01.626425
83000	580761	 7:19:22	 7:19:22	405	66		0	0	16.879999999999999	4906	1261	2014-03-07 01:07:17.599469	2014-03-07 01:44:01.636725
83001	580761	 7:20:15	 7:20:15	406	67		0	0	17.1975000000000016	4906	1262	2014-03-07 01:07:17.610713	2014-03-07 01:44:01.648142
83002	580761	 7:21:00	 7:21:00	8	68		0	0	17.4131	4906	1001	2014-03-07 01:07:17.621826	2014-03-07 01:44:01.659397
88351	580855	 6:19:14	 6:19:14	258	2		0	0	0.0928999999999999965	5000	1132	2014-03-07 01:08:27.735012	2014-03-07 01:45:25.320861
88352	580855	 6:19:53	 6:19:53	261	3		0	0	0.349700000000000011	5000	1135	2014-03-07 01:08:27.746185	2014-03-07 01:45:25.331975
88353	580855	 6:20:52	 6:20:52	301	4		0	0	0.738800000000000012	5000	1166	2014-03-07 01:08:27.757245	2014-03-07 01:45:25.343034
88354	580855	 6:21:16	 6:21:16	302	5		0	0	0.896499999999999964	5000	1167	2014-03-07 01:08:27.768266	2014-03-07 01:45:25.353908
88355	580855	 6:22:03	 6:22:03	303	6		0	0	1.2097	5000	1168	2014-03-07 01:08:27.779251	2014-03-07 01:45:25.36558
88356	580855	 6:22:58	 6:22:58	304	7		0	0	1.56909999999999994	5000	1169	2014-03-07 01:08:27.790815	2014-03-07 01:45:25.376326
88357	580855	 6:23:23	 6:23:23	86	8		0	0	1.73290000000000011	5000	1046	2014-03-07 01:08:27.801819	2014-03-07 01:45:25.386875
88358	580855	 6:24:04	 6:24:04	306	9		0	0	2.00320000000000009	5000	1170	2014-03-07 01:08:27.812983	2014-03-07 01:45:25.398628
88359	580855	 6:24:47	 6:24:47	307	10		0	0	2.29029999999999978	5000	1171	2014-03-07 01:08:27.823951	2014-03-07 01:45:25.409738
88360	580855	 6:26:26	 6:26:26	310	11		0	0	2.93820000000000014	5000	1173	2014-03-07 01:08:27.835128	2014-03-07 01:45:25.420468
88361	580855	 6:27:11	 6:27:11	1236	12		0	0	3.2370000000000001	5000	1935	2014-03-07 01:08:27.846301	2014-03-07 01:45:25.431633
88362	580855	 6:28:15	 6:28:15	1199	13		0	0	3.65969999999999995	5000	1919	2014-03-07 01:08:27.85753	2014-03-07 01:45:25.44302
88363	580855	 6:29:02	 6:29:02	314	14		0	0	3.9700000000000002	5000	1174	2014-03-07 01:08:27.868524	2014-03-07 01:45:25.453903
88364	580855	 6:29:20	 6:29:20	315	15		0	0	4.09149999999999991	5000	1175	2014-03-07 01:08:27.879698	2014-03-07 01:45:25.4645
88365	580855	 6:29:37	 6:29:37	316	16		0	0	4.20370000000000044	5000	1176	2014-03-07 01:08:27.89082	2014-03-07 01:45:25.476212
88366	580855	 6:30:26	 6:30:26	317	17		0	0	4.52639999999999976	5000	1177	2014-03-07 01:08:27.901864	2014-03-07 01:45:25.488139
88367	580855	 6:31:00	 6:31:00	318	18		0	0	4.7546999999999997	5000	1178	2014-03-07 01:08:27.913023	2014-03-07 01:45:25.498259
88368	580855	 6:31:48	 6:31:48	319	19		0	0	5.07369999999999965	5000	1179	2014-03-07 01:08:27.924063	2014-03-07 01:45:25.509407
88369	580855	 6:32:18	 6:32:18	320	20		0	0	5.2759999999999998	5000	1180	2014-03-07 01:08:27.935126	2014-03-07 01:45:25.521273
88370	580855	 6:33:00	 6:33:00	154	21		0	0	5.48320000000000007	5000	1078	2014-03-07 01:08:27.946145	2014-03-07 01:45:25.531801
88371	580855	 6:33:34	 6:33:34	155	22		0	0	5.72609999999999975	5000	1079	2014-03-07 01:08:27.957332	2014-03-07 01:45:25.542793
88372	580855	 6:34:17	 6:34:17	321	23		0	0	6.02970000000000006	5000	1181	2014-03-07 01:08:27.968507	2014-03-07 01:45:25.553706
88374	580855	 6:35:24	 6:35:24	323	25		0	0	6.50570000000000004	5000	1183	2014-03-07 01:08:27.990637	2014-03-07 01:45:25.57618
88375	580855	 6:36:08	 6:36:08	324	26		0	0	6.81700000000000017	5000	1184	2014-03-07 01:08:28.002143	2014-03-07 01:45:25.588239
88376	580855	 6:36:57	 6:36:57	325	27		0	0	7.16279999999999983	5000	1185	2014-03-07 01:08:28.01299	2014-03-07 01:45:25.598226
88377	580855	 6:37:21	 6:37:21	326	28		0	0	7.33610000000000007	5000	1186	2014-03-07 01:08:28.0241	2014-03-07 01:45:25.61002
88378	580855	 6:37:59	 6:37:59	327	29		0	0	7.60559999999999992	5000	1187	2014-03-07 01:08:28.035092	2014-03-07 01:45:25.620919
88379	580855	 6:38:27	 6:38:27	328	30		0	0	7.80429999999999957	5000	1188	2014-03-07 01:08:28.046234	2014-03-07 01:45:25.63138
88380	580855	 6:39:01	 6:39:01	329	31		0	0	8.04829999999999934	5000	1189	2014-03-07 01:08:28.057661	2014-03-07 01:45:25.64359
88381	580855	 6:39:34	 6:39:34	330	32		0	0	8.28159999999999918	5000	1190	2014-03-07 01:08:28.068531	2014-03-07 01:45:25.654495
88382	580855	 6:40:33	 6:40:33	331	33		0	0	8.70459999999999923	5000	1191	2014-03-07 01:08:28.079664	2014-03-07 01:45:25.665021
88383	580855	 6:41:16	 6:41:16	332	34		0	0	9.01360000000000028	5000	1192	2014-03-07 01:08:28.090967	2014-03-07 01:45:25.676987
88384	580855	 6:42:00	 6:42:00	1287	35		0	0	9.29369999999999941	5000	1951	2014-03-07 01:08:28.101906	2014-03-07 01:45:25.688032
88385	580855	 6:44:00	 6:44:00	22	36		0	0	9.78589999999999982	5000	1008	2014-03-07 01:08:28.113003	2014-03-07 01:45:25.698543
88386	580855	 6:44:18	 6:44:18	188	37		0	0	9.89409999999999989	5000	1096	2014-03-07 01:08:28.124189	2014-03-07 01:45:25.710337
88387	580855	 6:45:00	 6:45:00	290	38		0	0	10.1494	5000	1157	2014-03-07 01:08:28.135268	2014-03-07 01:45:25.720278
88388	580855	 6:45:23	 6:45:23	291	39		0	0	10.2873000000000001	5000	1158	2014-03-07 01:08:28.146416	2014-03-07 01:45:25.731925
88389	580855	 6:47:35	 6:47:35	333	40		0	0	11.0780999999999992	5000	1193	2014-03-07 01:08:28.157169	2014-03-07 01:45:25.743699
88390	580855	 6:48:12	 6:48:12	334	41		0	0	11.3033999999999999	5000	1194	2014-03-07 01:08:28.169053	2014-03-07 01:45:25.754635
88391	580855	 6:48:44	 6:48:44	335	42		0	0	11.4987999999999992	5000	1195	2014-03-07 01:08:28.179667	2014-03-07 01:45:25.76555
88392	580855	 6:49:41	 6:49:41	336	43		0	0	11.8408999999999995	5000	1196	2014-03-07 01:08:28.190834	2014-03-07 01:45:25.777019
88393	580855	 6:50:03	 6:50:03	340	44		0	0	11.9731000000000005	5000	1200	2014-03-07 01:08:28.201908	2014-03-07 01:45:25.787601
88394	580855	 6:50:40	 6:50:40	341	45		0	0	12.1941000000000006	5000	1201	2014-03-07 01:08:28.212717	2014-03-07 01:45:25.798696
88395	580855	 6:51:16	 6:51:16	202	46		0	0	12.4115000000000002	5000	1101	2014-03-07 01:08:28.224098	2014-03-07 01:45:25.809877
88396	580855	 6:52:06	 6:52:06	343	47		0	0	12.7133000000000003	5000	1202	2014-03-07 01:08:28.235118	2014-03-07 01:45:25.820682
88397	580855	 6:52:47	 6:52:47	344	48		0	0	12.9612999999999996	5000	1203	2014-03-07 01:08:28.301869	2014-03-07 01:45:25.832474
88398	580855	 6:53:34	 6:53:34	345	49		0	0	13.2477999999999998	5000	1204	2014-03-07 01:08:28.312602	2014-03-07 01:45:25.842605
88399	580855	 6:54:17	 6:54:17	346	50		0	0	13.5073000000000008	5000	1205	2014-03-07 01:08:28.324034	2014-03-07 01:45:25.854344
88400	580855	 6:55:17	 6:55:17	168	51		0	0	13.8689999999999998	5000	1087	2014-03-07 01:08:28.33508	2014-03-07 01:45:25.865552
88401	580855	 6:56:00	 6:56:00	1	52		0	0	14.0847999999999995	5000	995	2014-03-07 01:08:28.346362	2014-03-07 01:45:25.876046
88403	580855	 6:57:37	 6:57:37	453	54		0	0	14.6836000000000002	5000	1292	2014-03-07 01:08:28.390716	2014-03-07 01:45:25.901144
88404	580855	 6:58:20	 6:58:20	1275	55		0	0	14.9471000000000007	5000	1944	2014-03-07 01:08:28.445885	2014-03-07 01:45:25.923141
88405	580855	 6:59:04	 6:59:04	1131	56		0	0	15.218	5000	1893	2014-03-07 01:08:28.456691	2014-03-07 01:45:25.945412
88406	580855	 6:59:31	 6:59:31	455	57		0	0	15.3840000000000003	5000	1293	2014-03-07 01:08:28.468467	2014-03-07 01:45:25.95615
88407	580855	 7:00:09	 7:00:09	456	58		0	0	15.6184999999999992	5000	1294	2014-03-07 01:08:28.479627	2014-03-07 01:45:25.967692
88408	580855	 7:00:41	 7:00:41	457	59		0	0	15.8168000000000006	5000	1295	2014-03-07 01:08:28.490846	2014-03-07 01:45:25.978666
88409	580855	 7:01:19	 7:01:19	458	60		0	0	16.0518999999999998	5000	1296	2014-03-07 01:08:28.501281	2014-03-07 01:45:25.989867
88410	580855	 7:02:25	 7:02:25	459	61		0	0	16.4582000000000015	5000	1297	2014-03-07 01:08:28.512942	2014-03-07 01:45:26.001192
88411	580855	 7:03:30	 7:03:30	462	62		0	0	16.8587999999999987	5000	1299	2014-03-07 01:08:28.524206	2014-03-07 01:45:26.012324
88412	580855	 7:04:06	 7:04:06	1132	63		0	0	17.0784999999999982	5000	1894	2014-03-07 01:08:28.535169	2014-03-07 01:45:26.023442
88413	580855	 7:04:36	 7:04:36	463	64		0	0	17.2668999999999997	5000	1300	2014-03-07 01:08:28.546433	2014-03-07 01:45:26.034367
88414	580855	 7:05:18	 7:05:18	464	65		0	0	17.5259	5000	1301	2014-03-07 01:08:28.557581	2014-03-07 01:45:26.045289
88415	580855	 7:05:49	 7:05:49	176	66		0	0	17.7180999999999997	5000	1090	2014-03-07 01:08:28.56874	2014-03-07 01:45:26.056402
88416	580855	 7:07:00	 7:07:00	17	67		0	0	18.1075000000000017	5000	1005	2014-03-07 01:08:28.635326	2014-03-07 01:45:26.068157
107252	581682	15:15:37	15:15:37	663	9		0	0	1.78059999999999996	5351	1476	2014-03-07 01:12:40.68662	2014-03-07 01:50:37.65867
107281	581682	15:50:24	15:50:24	686	38		0	0	12.3780000000000001	5351	1498	2014-03-07 01:12:41.009136	2014-03-07 01:50:38.037063
107746	581691	 6:16:20	 6:16:20	619	2		0	0	0.238600000000000007	5360	1441	2014-03-07 01:12:47.523977	2014-03-07 01:50:45.609819
107774	581691	 6:38:37	 6:38:37	654	30		0	0	10.2895000000000003	5360	1467	2014-03-07 01:12:47.835577	2014-03-07 01:50:46.066273
93746	581118	 6:40:00	 6:40:00	1323	1		0	0	\N	5095	1972	2014-03-07 01:09:39.672519	2014-03-07 01:46:51.017704
93747	581118	 6:41:00	 6:41:00	21	2		0	0	0.519900000000000029	5095	1007	2014-03-07 01:09:39.683349	2014-03-07 01:46:51.029322
93748	581118	 6:41:47	 6:41:47	431	3		0	0	0.652100000000000013	5095	1286	2014-03-07 01:09:39.694934	2014-03-07 01:46:51.040778
93750	581118	 6:43:41	 6:43:41	432	5		0	0	1.13169999999999993	5095	1287	2014-03-07 01:09:39.717024	2014-03-07 01:46:51.063366
93751	581118	 6:44:01	 6:44:01	44	6		0	0	1.26750000000000007	5095	1019	2014-03-07 01:09:39.728058	2014-03-07 01:46:51.073479
93752	581118	 6:44:37	 6:44:37	519	7		0	0	1.50869999999999993	5095	1345	2014-03-07 01:09:39.738883	2014-03-07 01:46:51.085323
93753	581118	 6:45:25	 6:45:25	520	8		0	0	1.83050000000000002	5095	1346	2014-03-07 01:09:39.749735	2014-03-07 01:46:51.09742
93754	581118	 6:46:09	 6:46:09	277	9		0	0	2.12539999999999996	5095	1145	2014-03-07 01:09:39.761527	2014-03-07 01:46:51.118678
93755	581118	 6:47:02	 6:47:02	278	10		0	0	2.48680000000000012	5095	1146	2014-03-07 01:09:39.77249	2014-03-07 01:46:51.12959
93756	581118	 6:47:39	 6:47:39	521	11		0	0	2.73930000000000007	5095	1347	2014-03-07 01:09:39.783519	2014-03-07 01:46:51.140928
93757	581118	 6:48:15	 6:48:15	522	12		0	0	2.98050000000000015	5095	1348	2014-03-07 01:09:39.794891	2014-03-07 01:46:51.151805
93758	581118	 6:48:51	 6:48:51	523	13		0	0	3.22380000000000022	5095	1349	2014-03-07 01:09:39.806217	2014-03-07 01:46:51.1636
93759	581118	 6:49:23	 6:49:23	524	14		0	0	3.44169999999999998	5095	1350	2014-03-07 01:09:39.817172	2014-03-07 01:46:51.174646
93760	581118	 6:49:54	 6:49:54	525	15		0	0	3.65459999999999985	5095	1351	2014-03-07 01:09:39.828252	2014-03-07 01:46:51.185473
93761	581118	 6:50:48	 6:50:48	526	16		0	0	4.0174000000000003	5095	1352	2014-03-07 01:09:39.839581	2014-03-07 01:46:51.196218
93762	581118	 6:51:41	 6:51:41	527	17		0	0	4.37600000000000033	5095	1353	2014-03-07 01:09:39.850247	2014-03-07 01:46:51.207861
93764	581118	 6:53:08	 6:53:08	219	19		0	0	4.96400000000000041	5095	1112	2014-03-07 01:09:39.872638	2014-03-07 01:46:51.229344
93765	581118	 6:54:00	 6:54:00	26	20		0	0	5.27219999999999978	5095	1009	2014-03-07 01:09:39.883682	2014-03-07 01:46:51.241131
93766	581118	 6:54:49	 6:54:49	414	21		0	0	5.5647000000000002	5095	1270	2014-03-07 01:09:39.894837	2014-03-07 01:46:51.253578
93767	581118	 6:55:25	 6:55:25	412	22		0	0	5.78099999999999969	5095	1268	2014-03-07 01:09:39.905971	2014-03-07 01:46:51.275063
93768	581118	 6:56:20	 6:56:20	410	23		0	0	6.1086999999999998	5095	1266	2014-03-07 01:09:39.91729	2014-03-07 01:46:51.286421
93769	581118	 6:56:57	 6:56:57	408	24		0	0	6.32800000000000029	5095	1264	2014-03-07 01:09:39.92838	2014-03-07 01:46:51.297069
93770	581118	 6:58:43	 6:58:43	28	25		0	0	6.95950000000000024	5095	1010	2014-03-07 01:09:40.006261	2014-03-07 01:46:51.309022
93771	581118	 7:00:42	 7:00:42	400	26		0	0	7.66990000000000016	5095	1256	2014-03-07 01:09:40.017296	2014-03-07 01:46:51.320708
93772	581118	 7:02:04	 7:02:04	399	27		0	0	8.15820000000000078	5095	1255	2014-03-07 01:09:40.027977	2014-03-07 01:46:51.342104
93773	581118	 7:03:03	 7:03:03	402	28		0	0	8.50820000000000043	5095	1258	2014-03-07 01:09:40.039535	2014-03-07 01:46:51.353115
93774	581118	 7:03:25	 7:03:25	170	29		0	0	8.64119999999999955	5095	1088	2014-03-07 01:09:40.050664	2014-03-07 01:46:51.363525
93775	581118	 7:04:08	 7:04:08	403	30		0	0	8.89840000000000053	5095	1259	2014-03-07 01:09:40.061968	2014-03-07 01:46:51.430781
93776	581118	 7:04:49	 7:04:49	404	31		0	0	9.14550000000000018	5095	1260	2014-03-07 01:09:40.072651	2014-03-07 01:46:51.441389
93777	581118	 7:05:24	 7:05:24	405	32		0	0	9.35839999999999961	5095	1261	2014-03-07 01:09:40.083727	2014-03-07 01:46:51.452824
93778	581118	 7:06:17	 7:06:17	406	33		0	0	9.67590000000000039	5095	1262	2014-03-07 01:09:40.094962	2014-03-07 01:46:51.464252
93779	581118	 7:07:00	 7:07:00	8	34		0	0	9.89160000000000039	5095	1001	2014-03-07 01:09:40.106118	2014-03-07 01:46:51.475145
97230	581472	 5:47:00	 5:47:00	38	1		0	0	\N	5200	1014	2014-03-07 01:10:26.038085	2014-03-07 01:47:47.236873
97232	581472	 5:48:47	 5:48:47	530	3		0	0	0.743999999999999995	5200	1356	2014-03-07 01:10:26.059861	2014-03-07 01:47:47.25857
97233	581472	 5:50:46	 5:50:46	531	4		0	0	1.57299999999999995	5200	1357	2014-03-07 01:10:26.138074	2014-03-07 01:47:47.270491
97234	581472	 5:51:53	 5:51:53	532	5		0	0	2.03799999999999981	5200	1358	2014-03-07 01:10:26.14919	2014-03-07 01:47:47.281406
97235	581472	 5:52:25	 5:52:25	533	6		0	0	2.26600000000000001	5200	1359	2014-03-07 01:10:26.160199	2014-03-07 01:47:47.292179
97236	581472	 5:53:35	 5:53:35	534	7		0	0	2.75309999999999988	5200	1360	2014-03-07 01:10:26.171365	2014-03-07 01:47:47.30406
97237	581472	 5:54:37	 5:54:37	535	8		0	0	3.18469999999999986	5200	1361	2014-03-07 01:10:26.182718	2014-03-07 01:47:47.315289
97238	581472	 5:56:00	 5:56:00	1193	9		0	0	3.73139999999999983	5200	1915	2014-03-07 01:10:26.193771	2014-03-07 01:47:47.326473
97239	581472	 5:57:02	 5:57:02	536	10		0	0	4.15950000000000042	5200	1362	2014-03-07 01:10:26.205197	2014-03-07 01:47:47.3371
97240	581472	 5:58:36	 5:58:36	537	11		0	0	4.81050000000000022	5200	1363	2014-03-07 01:10:26.216033	2014-03-07 01:47:47.347457
97241	581472	 5:59:34	 5:59:34	538	12		0	0	5.20950000000000024	5200	1364	2014-03-07 01:10:26.227171	2014-03-07 01:47:47.359615
97242	581472	 6:00:15	 6:00:15	539	13		0	0	5.49460000000000015	5200	1365	2014-03-07 01:10:26.238164	2014-03-07 01:47:47.369933
97243	581472	 6:01:08	 6:01:08	540	14		0	0	5.86059999999999981	5200	1366	2014-03-07 01:10:26.249427	2014-03-07 01:47:47.380912
97244	581472	 6:01:52	 6:01:52	541	15		0	0	6.16560000000000041	5200	1367	2014-03-07 01:10:26.260401	2014-03-07 01:47:47.392531
97245	581472	 6:03:03	 6:03:03	542	16		0	0	6.65859999999999985	5200	1368	2014-03-07 01:10:26.271525	2014-03-07 01:47:47.404025
97246	581472	 6:03:51	 6:03:51	543	17		0	0	6.99460000000000015	5200	1369	2014-03-07 01:10:26.282544	2014-03-07 01:47:47.414652
97247	581472	 6:04:45	 6:04:45	544	18		0	0	7.36660000000000004	5200	1370	2014-03-07 01:10:26.293812	2014-03-07 01:47:47.425748
97248	581472	 6:05:12	 6:05:12	40	19		0	0	7.55459999999999976	5200	1015	2014-03-07 01:10:26.304893	2014-03-07 01:47:47.43657
97249	581472	 6:06:07	 6:06:07	545	20		0	0	7.93609999999999971	5200	1371	2014-03-07 01:10:26.316055	2014-03-07 01:47:47.448075
97250	581472	 6:07:12	 6:07:12	546	21		0	0	8.38230000000000075	5200	1372	2014-03-07 01:10:26.327107	2014-03-07 01:47:47.459965
97251	581472	 6:08:28	 6:08:28	1279	22		0	0	8.90390000000000015	5200	1946	2014-03-07 01:10:26.337731	2014-03-07 01:47:47.470333
97252	581472	 6:09:35	 6:09:35	549	23		0	0	9.36780000000000079	5200	1373	2014-03-07 01:10:26.349479	2014-03-07 01:47:47.481923
97253	581472	 6:11:49	 6:11:49	550	24		0	0	10.2905999999999995	5200	1374	2014-03-07 01:10:26.360431	2014-03-07 01:47:47.493196
97254	581472	 6:12:35	 6:12:35	551	25		0	0	10.6119000000000003	5200	1375	2014-03-07 01:10:26.371512	2014-03-07 01:47:47.503684
97255	581472	 6:13:03	 6:13:03	552	26		0	0	10.8087	5200	1376	2014-03-07 01:10:26.382027	2014-03-07 01:47:47.515168
97256	581472	 6:14:17	 6:14:17	553	27		0	0	11.3213000000000008	5200	1377	2014-03-07 01:10:26.393428	2014-03-07 01:47:47.526065
97257	581472	 6:16:00	 6:16:00	41	28		0	0	11.9616000000000007	5200	1016	2014-03-07 01:10:26.405033	2014-03-07 01:47:47.536924
97259	581472	 6:18:09	 6:18:09	469	30		0	0	12.5325000000000006	5200	1306	2014-03-07 01:10:26.427189	2014-03-07 01:47:47.615424
97260	581472	 6:19:00	 6:19:00	160	31		0	0	12.7611000000000008	5200	1083	2014-03-07 01:10:26.438282	2014-03-07 01:47:47.625681
97261	581472	 6:20:01	 6:20:01	460	32		0	0	13.0309000000000008	5200	1298	2014-03-07 01:10:26.449471	2014-03-07 01:47:47.637587
97262	581472	 6:20:46	 6:20:46	470	33		0	0	13.2342999999999993	5200	1307	2014-03-07 01:10:26.460494	2014-03-07 01:47:47.648106
97263	581472	 6:21:28	 6:21:28	1200	34		0	0	13.4240999999999993	5200	1920	2014-03-07 01:10:26.471583	2014-03-07 01:47:47.659248
97264	581472	 6:22:09	 6:22:09	554	35		0	0	13.6077999999999992	5200	1378	2014-03-07 01:10:26.482739	2014-03-07 01:47:47.670852
97265	581472	 6:23:10	 6:23:10	556	36		0	0	13.8809000000000005	5200	1379	2014-03-07 01:10:26.494119	2014-03-07 01:47:47.681382
97266	581472	 6:24:13	 6:24:13	557	37		0	0	14.1615000000000002	5200	1380	2014-03-07 01:10:26.505095	2014-03-07 01:47:47.692079
97267	581472	 6:25:35	 6:25:35	558	38		0	0	14.5274999999999999	5200	1381	2014-03-07 01:10:26.516124	2014-03-07 01:47:47.7038
97268	581472	 6:26:51	 6:26:51	559	39		0	0	14.8646999999999991	5200	1382	2014-03-07 01:10:26.527197	2014-03-07 01:47:47.715727
97269	581472	 6:28:00	 6:28:00	42	40		0	0	15.1450999999999993	5200	1017	2014-03-07 01:10:26.538401	2014-03-07 01:47:47.737617
97270	581472	 6:29:47	 6:29:47	560	41		0	0	15.6098999999999997	5200	1383	2014-03-07 01:10:26.549586	2014-03-07 01:47:47.748242
97271	581472	 6:31:48	 6:31:48	72	42		0	0	16.1329999999999991	5200	1040	2014-03-07 01:10:26.560628	2014-03-07 01:47:47.759344
97272	581472	 6:32:08	 6:32:08	285	43		0	0	16.2218000000000018	5200	1152	2014-03-07 01:10:26.571771	2014-03-07 01:47:47.771196
97273	581472	 6:33:34	 6:33:34	283	44		0	0	16.595600000000001	5200	1151	2014-03-07 01:10:26.582979	2014-03-07 01:47:47.780961
97274	581472	 6:36:00	 6:36:00	21	45		0	0	17.2131000000000007	5200	1007	2014-03-07 01:10:26.594186	2014-03-07 01:47:47.792782
97275	581472	 6:36:53	 6:36:53	431	46		0	0	17.3454000000000015	5200	1286	2014-03-07 01:10:26.605398	2014-03-07 01:47:47.804068
97276	581472	 6:38:13	 6:38:13	4	47		0	0	17.5462999999999987	5200	997	2014-03-07 01:10:26.616387	2014-03-07 01:47:47.814429
97277	581472	 6:40:04	 6:40:04	432	48		0	0	17.8249999999999993	5200	1287	2014-03-07 01:10:26.627576	2014-03-07 01:47:47.826813
97278	581472	 6:41:00	 6:41:00	44	49		0	0	17.960799999999999	5200	1019	2014-03-07 01:10:26.638648	2014-03-07 01:47:47.837306
97279	581472	 6:41:43	 6:41:43	519	50		0	0	18.2018999999999984	5200	1345	2014-03-07 01:10:26.649703	2014-03-07 01:47:47.848026
97280	581472	 6:42:40	 6:42:40	561	51		0	0	18.5237000000000016	5200	1384	2014-03-07 01:10:26.661055	2014-03-07 01:47:47.859323
97281	581472	 6:43:16	 6:43:16	499	52		0	0	18.7259999999999991	5200	1331	2014-03-07 01:10:26.672121	2014-03-07 01:47:47.870631
97282	581472	 6:43:54	 6:43:54	500	53		0	0	18.9404000000000003	5200	1332	2014-03-07 01:10:26.682922	2014-03-07 01:47:47.881285
97283	581472	 6:44:31	 6:44:31	562	54		0	0	19.1504000000000012	5200	1385	2014-03-07 01:10:26.694126	2014-03-07 01:47:47.893464
97284	581472	 6:44:56	 6:44:56	563	55		0	0	19.2905000000000015	5200	1386	2014-03-07 01:10:26.705231	2014-03-07 01:47:47.903565
97285	581472	 6:46:12	 6:46:12	564	56		0	0	19.7127000000000017	5200	1387	2014-03-07 01:10:26.782673	2014-03-07 01:47:47.915923
97286	581472	 6:46:56	 6:46:56	565	57		0	0	19.9594999999999985	5200	1388	2014-03-07 01:10:26.794103	2014-03-07 01:47:47.926438
97288	581472	 6:48:25	 6:48:25	118	59		0	0	20.4581000000000017	5200	1059	2014-03-07 01:10:26.860623	2014-03-07 01:47:47.948861
97289	581472	 6:49:20	 6:49:20	45	60		0	0	20.7678000000000011	5200	1020	2014-03-07 01:10:26.882253	2014-03-07 01:47:47.959298
97290	581472	 6:50:03	 6:50:03	567	61		0	0	21.0090000000000003	5200	1390	2014-03-07 01:10:26.89416	2014-03-07 01:47:47.9704
97291	581472	 6:51:02	 6:51:02	568	62		0	0	21.3408000000000015	5200	1391	2014-03-07 01:10:26.905234	2014-03-07 01:47:47.981933
97292	581472	 6:51:40	 6:51:40	161	63		0	0	21.5558000000000014	5200	1084	2014-03-07 01:10:26.916314	2014-03-07 01:47:47.992483
97293	581472	 6:52:11	 6:52:11	569	64		0	0	21.7318999999999996	5200	1392	2014-03-07 01:10:26.927452	2014-03-07 01:47:48.004002
97294	581472	 6:52:57	 6:52:57	570	65		0	0	21.9872000000000014	5200	1393	2014-03-07 01:10:26.938737	2014-03-07 01:47:48.015181
97295	581472	 6:54:26	 6:54:26	571	66		0	0	22.4850999999999992	5200	1394	2014-03-07 01:10:26.949944	2014-03-07 01:47:48.025789
97296	581472	 6:55:26	 6:55:26	572	67		0	0	22.8200000000000003	5200	1395	2014-03-07 01:10:26.961032	2014-03-07 01:47:48.037563
97297	581472	 6:56:04	 6:56:04	573	68		0	0	23.0350999999999999	5200	1396	2014-03-07 01:10:26.972015	2014-03-07 01:47:48.048221
97299	581472	 6:57:37	 6:57:37	577	70		0	0	23.5563000000000002	5200	1400	2014-03-07 01:10:26.994441	2014-03-07 01:47:48.09323
97300	581472	 6:59:00	 6:59:00	46	71		0	0	23.9544999999999995	5200	1021	2014-03-07 01:10:27.005591	2014-03-07 01:47:48.104176
97301	581472	 7:00:34	 7:00:34	578	72		0	0	24.3779000000000003	5200	1401	2014-03-07 01:10:27.01614	2014-03-07 01:47:48.114782
97302	581472	 7:04:05	 7:04:05	28	73		0	0	25.3264999999999993	5200	1010	2014-03-07 01:10:27.026635	2014-03-07 01:47:48.1262
97303	581472	 7:06:43	 7:06:43	400	74		0	0	26.0367999999999995	5200	1256	2014-03-07 01:10:27.038496	2014-03-07 01:47:48.137685
97304	581472	 7:08:31	 7:08:31	399	75		0	0	26.5250999999999983	5200	1255	2014-03-07 01:10:27.049733	2014-03-07 01:47:48.149176
97305	581472	 7:09:49	 7:09:49	402	76		0	0	26.8750999999999998	5200	1258	2014-03-07 01:10:27.060819	2014-03-07 01:47:48.159815
97307	581472	 7:11:15	 7:11:15	403	78		0	0	27.2652999999999999	5200	1259	2014-03-07 01:10:27.14987	2014-03-07 01:47:48.18175
97308	581472	 7:12:10	 7:12:10	404	79		0	0	27.5124999999999993	5200	1260	2014-03-07 01:10:27.160932	2014-03-07 01:47:48.193547
97309	581472	 7:12:57	 7:12:57	405	80		0	0	27.7254000000000005	5200	1261	2014-03-07 01:10:27.172084	2014-03-07 01:47:48.204357
97310	581472	 7:14:07	 7:14:07	406	81		0	0	28.0428999999999995	5200	1262	2014-03-07 01:10:27.183119	2014-03-07 01:47:48.215707
97311	581472	 7:15:00	 7:15:00	8	82		0	0	28.2585000000000015	5200	1001	2014-03-07 01:10:27.194222	2014-03-07 01:47:48.293693
107244	581682	15:10:00	15:10:00	157	1		0	0	\N	5351	1080	2014-03-07 01:12:40.498096	2014-03-07 01:50:37.570065
107245	581682	15:11:00	15:11:00	21	2		0	0	0.345399999999999985	5351	1007	2014-03-07 01:12:40.509279	2014-03-07 01:50:37.581191
107246	581682	15:11:47	15:11:47	431	3		0	0	0.477700000000000014	5351	1286	2014-03-07 01:12:40.520114	2014-03-07 01:50:37.592457
107247	581682	15:13:00	15:13:00	4	4		0	0	0.678599999999999981	5351	997	2014-03-07 01:12:40.530829	2014-03-07 01:50:37.603051
107248	581682	15:13:40	15:13:40	432	5		0	0	0.95730000000000004	5351	1287	2014-03-07 01:12:40.542194	2014-03-07 01:50:37.6139
107249	581682	15:13:59	15:13:59	44	6		0	0	1.09309999999999996	5351	1019	2014-03-07 01:12:40.553227	2014-03-07 01:50:37.624784
107250	581682	15:14:37	15:14:37	504	7		0	0	1.36040000000000005	5351	1336	2014-03-07 01:12:40.631234	2014-03-07 01:50:37.636363
107251	581682	15:15:09	15:15:09	505	8		0	0	1.58460000000000001	5351	1337	2014-03-07 01:12:40.675816	2014-03-07 01:50:37.647172
107253	581682	15:16:07	15:16:07	664	10		0	0	1.98780000000000001	5351	1477	2014-03-07 01:12:40.697338	2014-03-07 01:50:37.670279
107254	581682	15:16:47	15:16:47	665	11		0	0	2.26799999999999979	5351	1478	2014-03-07 01:12:40.708312	2014-03-07 01:50:37.681523
107255	581682	15:17:11	15:17:11	666	12		0	0	2.43550000000000022	5351	1479	2014-03-07 01:12:40.720032	2014-03-07 01:50:37.692487
107256	581682	15:17:35	15:17:35	667	13		0	0	2.60360000000000014	5351	1480	2014-03-07 01:12:40.731013	2014-03-07 01:50:37.703024
107257	581682	15:17:52	15:17:52	668	14		0	0	2.72560000000000002	5351	1481	2014-03-07 01:12:40.742006	2014-03-07 01:50:37.713645
107258	581682	15:18:51	15:18:51	669	15		0	0	3.13850000000000007	5351	1482	2014-03-07 01:12:40.753179	2014-03-07 01:50:37.725761
107259	581682	15:19:28	15:19:28	670	16		0	0	3.39729999999999999	5351	1483	2014-03-07 01:12:40.764573	2014-03-07 01:50:37.736725
107260	581682	15:20:09	15:20:09	671	17		0	0	3.68509999999999982	5351	1484	2014-03-07 01:12:40.775652	2014-03-07 01:50:37.747677
107261	581682	15:21:07	15:21:07	672	18		0	0	4.08619999999999983	5351	1485	2014-03-07 01:12:40.786845	2014-03-07 01:50:37.758925
107262	581682	15:22:00	15:22:00	673	19		0	0	4.4549000000000003	5351	1486	2014-03-07 01:12:40.798412	2014-03-07 01:50:37.770725
107263	581682	15:22:32	15:22:32	674	20		0	0	4.6756000000000002	5351	1487	2014-03-07 01:12:40.80905	2014-03-07 01:50:37.780602
107264	581682	15:23:19	15:23:19	675	21		0	0	5.00389999999999979	5351	1488	2014-03-07 01:12:40.820209	2014-03-07 01:50:37.792332
107265	581682	15:23:52	15:23:52	676	22		0	0	5.23310000000000031	5351	1489	2014-03-07 01:12:40.831111	2014-03-07 01:50:37.803551
107266	581682	15:25:00	15:25:00	56	23		0	0	5.63719999999999999	5351	1028	2014-03-07 01:12:40.842425	2014-03-07 01:50:37.813936
107267	581682	15:25:30	15:25:30	677	24		0	0	5.79380000000000006	5351	1490	2014-03-07 01:12:40.853286	2014-03-07 01:50:37.825785
107268	581682	15:26:51	15:26:51	678	25		0	0	6.2206999999999999	5351	1491	2014-03-07 01:12:40.864988	2014-03-07 01:50:37.837026
107269	581682	15:28:10	15:28:10	1151	26		0	0	6.63360000000000039	5351	1905	2014-03-07 01:12:40.876136	2014-03-07 01:50:37.848125
107270	581682	15:30:13	15:30:13	643	27		0	0	7.27639999999999976	5351	1456	2014-03-07 01:12:40.886902	2014-03-07 01:50:37.893055
107271	581682	15:31:32	15:31:32	1325	28		0	0	7.69120000000000026	5351	1973	2014-03-07 01:12:40.898362	2014-03-07 01:50:37.925852
107272	581682	15:32:46	15:32:46	46	29		0	0	8.07879999999999932	5351	1021	2014-03-07 01:12:40.909363	2014-03-07 01:50:37.936977
107273	581682	15:34:07	15:34:07	578	30		0	0	8.50229999999999997	5351	1401	2014-03-07 01:12:40.920874	2014-03-07 01:50:37.947618
107274	581682	15:37:11	15:37:11	640	31		0	0	9.46400000000000041	5351	1453	2014-03-07 01:12:40.931118	2014-03-07 01:50:37.958428
107275	581682	15:38:00	15:38:00	29	32		0	0	9.70369999999999955	5351	1011	2014-03-07 01:12:40.94262	2014-03-07 01:50:37.970656
107276	581682	15:41:48	15:41:48	629	33		0	0	10.5695999999999994	5351	1451	2014-03-07 01:12:40.95386	2014-03-07 01:50:37.981697
107277	581682	15:43:00	15:43:00	7	34		0	0	10.8417999999999992	5351	1000	2014-03-07 01:12:40.964596	2014-03-07 01:50:37.991595
107278	581682	15:44:39	15:44:39	626	35		0	0	11.1837	5351	1448	2014-03-07 01:12:40.975627	2014-03-07 01:50:38.003396
107279	581682	15:46:36	15:46:36	625	36		0	0	11.5904000000000007	5351	1447	2014-03-07 01:12:40.987179	2014-03-07 01:50:38.013848
107280	581682	15:48:48	15:48:48	58	37		0	0	12.0460999999999991	5351	1029	2014-03-07 01:12:40.997932	2014-03-07 01:50:38.025202
107282	581682	15:51:12	15:51:12	687	39		0	0	12.5447000000000006	5351	1499	2014-03-07 01:12:41.02064	2014-03-07 01:50:38.047441
107283	581682	15:52:12	15:52:12	688	40		0	0	12.7540999999999993	5351	1500	2014-03-07 01:12:41.031333	2014-03-07 01:50:38.05891
107284	581682	15:53:55	15:53:55	689	41		0	0	13.1115999999999993	5351	1501	2014-03-07 01:12:41.042478	2014-03-07 01:50:38.070743
107285	581682	15:56:04	15:56:04	74	42		0	0	13.5566999999999993	5351	1042	2014-03-07 01:12:41.0539	2014-03-07 01:50:38.081755
107286	581682	15:57:00	15:57:00	158	43		0	0	13.7391000000000005	5351	1081	2014-03-07 01:12:41.064667	2014-03-07 01:50:38.092258
107287	581682	15:57:54	15:57:54	619	44		0	0	13.9427000000000003	5351	1441	2014-03-07 01:12:41.076036	2014-03-07 01:50:38.103262
107288	581682	15:58:37	15:58:37	620	45		0	0	14.1039999999999992	5351	1442	2014-03-07 01:12:41.087813	2014-03-07 01:50:38.114175
107289	581682	15:59:19	15:59:19	621	46		0	0	14.2613000000000003	5351	1443	2014-03-07 01:12:41.098278	2014-03-07 01:50:38.125858
107290	581682	16:01:02	16:01:02	622	47		0	0	14.6470000000000002	5351	1444	2014-03-07 01:12:41.109281	2014-03-07 01:50:38.136489
107291	581682	16:03:00	16:03:00	70	48		0	0	15.0830000000000002	5351	1039	2014-03-07 01:12:41.120773	2014-03-07 01:50:38.148101
107745	581691	 6:16:00	 6:16:00	158	1		0	0	\N	5360	1081	2014-03-07 01:12:47.513118	2014-03-07 01:50:45.599211
107747	581691	 6:16:33	 6:16:33	620	3		0	0	0.399899999999999978	5360	1442	2014-03-07 01:12:47.535721	2014-03-07 01:50:45.621421
107748	581691	 6:16:46	 6:16:46	621	4		0	0	0.557200000000000029	5360	1443	2014-03-07 01:12:47.546677	2014-03-07 01:50:45.632922
107749	581691	 6:17:18	 6:17:18	622	5		0	0	0.94289999999999996	5360	1444	2014-03-07 01:12:47.557676	2014-03-07 01:50:45.654106
107750	581691	 6:18:00	 6:18:00	70	6		0	0	1.4205000000000001	5360	1039	2014-03-07 01:12:47.568662	2014-03-07 01:50:45.665593
107751	581691	 6:18:50	 6:18:50	624	7		0	0	1.73730000000000007	5360	1446	2014-03-07 01:12:47.579518	2014-03-07 01:50:45.68827
107752	581691	 6:20:03	 6:20:03	623	8		0	0	2.19519999999999982	5360	1445	2014-03-07 01:12:47.591139	2014-03-07 01:50:45.71913
107753	581691	 6:21:00	 6:21:00	11	9		0	0	2.54219999999999979	5360	1002	2014-03-07 01:12:47.601993	2014-03-07 01:50:45.730004
107754	581691	 6:21:41	 6:21:41	627	10		0	0	2.80790000000000006	5360	1449	2014-03-07 01:12:47.613269	2014-03-07 01:50:45.742823
107755	581691	 6:21:58	 6:21:58	628	11		0	0	2.91749999999999998	5360	1450	2014-03-07 01:12:47.624272	2014-03-07 01:50:45.754067
107756	581691	 6:24:00	 6:24:00	30	12		0	0	3.68579999999999997	5360	1012	2014-03-07 01:12:47.635234	2014-03-07 01:50:45.764861
107757	581691	 6:24:30	 6:24:30	630	13		0	0	3.92759999999999998	5360	1452	2014-03-07 01:12:47.646573	2014-03-07 01:50:45.776877
107758	581691	 6:24:39	 6:24:39	1329	14		0	0	3.99880000000000013	5360	1976	2014-03-07 01:12:47.65775	2014-03-07 01:50:45.787243
107759	581691	 6:26:49	 6:26:49	579	15		0	0	5.0293000000000001	5360	1402	2014-03-07 01:12:47.668498	2014-03-07 01:50:45.79914
107760	581691	 6:27:24	 6:27:24	47	16		0	0	5.30839999999999979	5360	1022	2014-03-07 01:12:47.679919	2014-03-07 01:50:45.810164
107761	581691	 6:28:11	 6:28:11	641	17		0	0	5.68090000000000028	5360	1454	2014-03-07 01:12:47.691027	2014-03-07 01:50:45.821116
107762	581691	 6:29:17	 6:29:17	642	18		0	0	6.20749999999999957	5360	1455	2014-03-07 01:12:47.701802	2014-03-07 01:50:45.843989
107763	581691	 6:30:25	 6:30:25	644	19		0	0	6.74830000000000041	5360	1457	2014-03-07 01:12:47.712863	2014-03-07 01:50:45.865845
107764	581691	 6:31:16	 6:31:16	645	20		0	0	7.15960000000000019	5360	1458	2014-03-07 01:12:47.724031	2014-03-07 01:50:45.878321
107765	581691	 6:32:11	 6:32:11	646	21		0	0	7.59860000000000024	5360	1459	2014-03-07 01:12:47.735122	2014-03-07 01:50:45.952827
107766	581691	 6:33:00	 6:33:00	1291	22		0	0	7.95929999999999982	5360	1954	2014-03-07 01:12:47.746373	2014-03-07 01:50:45.964053
107767	581691	 6:33:43	 6:33:43	647	23		0	0	8.25939999999999941	5360	1460	2014-03-07 01:12:47.757481	2014-03-07 01:50:45.976045
107768	581691	 6:34:07	 6:34:07	648	24		0	0	8.42689999999999984	5360	1461	2014-03-07 01:12:47.768687	2014-03-07 01:50:45.98555
107769	581691	 6:34:39	 6:34:39	649	25		0	0	8.64899999999999913	5360	1462	2014-03-07 01:12:47.779766	2014-03-07 01:50:45.996179
107770	581691	 6:35:28	 6:35:28	650	26		0	0	8.98429999999999929	5360	1463	2014-03-07 01:12:47.791398	2014-03-07 01:50:46.009279
107771	581691	 6:36:15	 6:36:15	651	27		0	0	9.31109999999999971	5360	1464	2014-03-07 01:12:47.802331	2014-03-07 01:50:46.020119
107772	581691	 6:37:08	 6:37:08	652	28		0	0	9.67340000000000089	5360	1465	2014-03-07 01:12:47.813352	2014-03-07 01:50:46.032382
107773	581691	 6:38:02	 6:38:02	653	29		0	0	10.0449000000000002	5360	1466	2014-03-07 01:12:47.824731	2014-03-07 01:50:46.044389
107775	581691	 6:39:07	 6:39:07	159	31		0	0	10.4990000000000006	5360	1082	2014-03-07 01:12:47.847044	2014-03-07 01:50:46.077783
107776	581691	 6:39:54	 6:39:54	655	32		0	0	10.8260000000000005	5360	1468	2014-03-07 01:12:47.857667	2014-03-07 01:50:46.098832
107777	581691	 6:40:56	 6:40:56	657	33		0	0	11.2502999999999993	5360	1470	2014-03-07 01:12:47.868788	2014-03-07 01:50:46.110969
107778	581691	 6:41:20	 6:41:20	658	34		0	0	11.4184000000000001	5360	1471	2014-03-07 01:12:47.880255	2014-03-07 01:50:46.132417
107779	581691	 6:41:41	 6:41:41	659	35		0	0	11.5639000000000003	5360	1472	2014-03-07 01:12:47.891344	2014-03-07 01:50:46.144145
107780	581691	 6:42:05	 6:42:05	660	36		0	0	11.7319999999999993	5360	1473	2014-03-07 01:12:47.902101	2014-03-07 01:50:46.154253
107781	581691	 6:42:49	 6:42:49	661	37		0	0	12.0360999999999994	5360	1474	2014-03-07 01:12:47.913682	2014-03-07 01:50:46.165398
107782	581691	 6:43:15	 6:43:15	662	38		0	0	12.2172000000000001	5360	1475	2014-03-07 01:12:47.924265	2014-03-07 01:50:46.177026
107783	581691	 6:43:47	 6:43:47	502	39		0	0	12.4379000000000008	5360	1334	2014-03-07 01:12:47.935524	2014-03-07 01:50:46.187803
107784	581691	 6:44:11	 6:44:11	503	40		0	0	12.6020000000000003	5360	1335	2014-03-07 01:12:47.946761	2014-03-07 01:50:46.198802
107785	581691	 6:44:50	 6:44:50	50	41		0	0	12.8728999999999996	5360	1024	2014-03-07 01:12:47.957533	2014-03-07 01:50:46.210447
107786	581691	 6:46:00	 6:46:00	13	42		0	0	13.2817000000000007	5360	1003	2014-03-07 01:12:47.968782	2014-03-07 01:50:46.22107
107787	581691	 6:46:30	 6:46:30	430	43		0	0	13.4388000000000005	5360	1285	2014-03-07 01:12:47.980153	2014-03-07 01:50:46.231877
107788	581691	 6:47:00	 6:47:00	34	44		0	0	13.5886999999999993	5360	1013	2014-03-07 01:12:47.990946	2014-03-07 01:50:46.243647
107789	581691	 6:49:00	 6:49:00	157	45		0	0	14.3050999999999995	5360	1080	2014-03-07 01:12:48.001839	2014-03-07 01:50:46.25464
138344	583138	 6:30:29	 6:30:29	1020	4		0	0	1.18310000000000004	5954	1796	2014-03-07 01:19:35.255601	2014-03-07 02:00:41.700131
138372	583138	 6:54:29	 6:54:29	389	32		0	0	9.64520000000000088	5954	1246	2014-03-07 01:19:35.621946	2014-03-07 02:00:42.022306
112340	581913	12:50:00	12:50:00	348	1		0	0	\N	5462	1207	2014-03-07 01:13:47.79918	2014-03-07 01:52:15.773958
112341	581913	12:50:21	12:50:21	349	2		0	0	0.146800000000000014	5462	1208	2014-03-07 01:13:47.809916	2014-03-07 01:52:15.795075
112342	581913	12:50:50	12:50:50	350	3		0	0	0.346999999999999975	5462	1209	2014-03-07 01:13:47.821744	2014-03-07 01:52:15.805254
112343	581913	12:55:59	12:55:59	73	4		0	0	2.42589999999999995	5462	1041	2014-03-07 01:13:47.832914	2014-03-07 01:52:15.814783
112344	581913	12:57:45	12:57:45	298	5		0	0	3.13710000000000022	5462	1163	2014-03-07 01:13:47.844007	2014-03-07 01:52:15.827787
112345	581913	12:58:55	12:58:55	299	6		0	0	3.60950000000000015	5462	1164	2014-03-07 01:13:47.855157	2014-03-07 01:52:15.84253
112346	581913	13:00:00	13:00:00	490	7		0	0	4.02439999999999998	5462	1322	2014-03-07 01:13:47.866137	2014-03-07 01:52:15.861972
112347	581913	13:00:40	13:00:40	491	8		0	0	4.29000000000000004	5462	1323	2014-03-07 01:13:47.877691	2014-03-07 01:52:15.884907
112348	581913	13:01:25	13:01:25	1108	9		0	0	4.5895999999999999	5462	1881	2014-03-07 01:13:47.888921	2014-03-07 01:52:15.906691
112349	581913	13:01:57	13:01:57	1109	10		0	0	4.80250000000000021	5462	1882	2014-03-07 01:13:47.899732	2014-03-07 01:52:15.915977
112350	581913	13:02:52	13:02:52	1110	11		0	0	5.17030000000000012	5462	1883	2014-03-07 01:13:47.967127	2014-03-07 01:52:15.927232
112351	581913	13:05:08	13:05:08	1224	12		0	0	6.0721999999999996	5462	1924	2014-03-07 01:13:47.977574	2014-03-07 01:52:16.982039
112352	581913	13:05:38	13:05:38	1225	13		0	0	6.27270000000000039	5462	1925	2014-03-07 01:13:47.988642	2014-03-07 01:52:17.018652
112353	581913	13:06:51	13:06:51	1226	14		0	0	6.75999999999999979	5462	1926	2014-03-07 01:13:47.999744	2014-03-07 01:52:17.048821
112354	581913	13:07:29	13:07:29	1227	15		0	0	7.01670000000000016	5462	1927	2014-03-07 01:13:48.010739	2014-03-07 01:52:17.061567
112355	581913	13:10:22	13:10:22	1042	16		0	0	8.16729999999999912	5462	1817	2014-03-07 01:13:48.021676	2014-03-07 01:52:17.071312
112356	581913	13:10:50	13:10:50	1043	17		0	0	8.35720000000000063	5462	1818	2014-03-07 01:13:48.099496	2014-03-07 01:52:17.081922
112357	581913	13:11:18	13:11:18	1044	18		0	0	8.54840000000000089	5462	1819	2014-03-07 01:13:48.110563	2014-03-07 01:52:17.094574
112358	581913	13:11:43	13:11:43	1045	19		0	0	8.71630000000000038	5462	1820	2014-03-07 01:13:48.121713	2014-03-07 01:52:17.106141
112359	581913	13:12:32	13:12:32	1046	20		0	0	9.04240000000000066	5462	1821	2014-03-07 01:13:48.13313	2014-03-07 01:52:17.118019
112360	581913	13:13:05	13:13:05	1047	21		0	0	9.26679999999999993	5462	1822	2014-03-07 01:13:48.143944	2014-03-07 01:52:17.128664
112362	581913	13:15:24	13:15:24	1048	23		0	0	9.92060000000000031	5462	1823	2014-03-07 01:13:48.166348	2014-03-07 01:52:17.162839
112363	581913	13:16:22	13:16:22	1049	24		0	0	10.1539999999999999	5462	1824	2014-03-07 01:13:48.177497	2014-03-07 01:52:17.183348
112364	581913	13:17:24	13:17:24	1050	25		0	0	10.4024999999999999	5462	1825	2014-03-07 01:13:48.188025	2014-03-07 01:52:17.195313
112365	581913	13:18:15	13:18:15	1025	26		0	0	10.609	5462	1801	2014-03-07 01:13:48.222391	2014-03-07 01:52:17.210044
112366	581913	13:19:33	13:19:33	1051	27		0	0	10.9236000000000004	5462	1826	2014-03-07 01:13:48.255261	2014-03-07 01:52:17.229882
112367	581913	13:20:17	13:20:17	1052	28		0	0	11.1000999999999994	5462	1827	2014-03-07 01:13:48.266226	2014-03-07 01:52:17.252103
112368	581913	13:20:59	13:20:59	1053	29		0	0	11.2690999999999999	5462	1828	2014-03-07 01:13:48.277316	2014-03-07 01:52:17.262284
112369	581913	13:23:06	13:23:06	1265	30		0	0	11.7774999999999999	5462	1942	2014-03-07 01:13:48.288806	2014-03-07 01:52:17.274628
112370	581913	13:24:14	13:24:14	205	31		0	0	12.0510000000000002	5462	1103	2014-03-07 01:13:48.300043	2014-03-07 01:52:17.296325
112371	581913	13:25:11	13:25:11	1019	32		0	0	12.2807999999999993	5462	1795	2014-03-07 01:13:48.310506	2014-03-07 01:52:17.319144
112372	581913	13:26:00	13:26:00	211	33		0	0	12.4610000000000003	5462	1107	2014-03-07 01:13:48.322013	2014-03-07 01:52:17.361636
112505	581918	 7:10:00	 7:10:00	211	1		0	0	\N	5467	1107	2014-03-07 01:13:50.278444	2014-03-07 01:52:19.530885
112506	581918	 7:10:50	 7:10:50	126	2		0	0	0.352700000000000014	5467	1064	2014-03-07 01:13:50.289867	2014-03-07 01:52:19.551316
112507	581918	 7:11:44	 7:11:44	1020	3		0	0	0.732099999999999973	5467	1796	2014-03-07 01:13:50.300593	2014-03-07 01:52:19.563617
112508	581918	 7:12:43	 7:12:43	1021	4		0	0	1.14759999999999995	5467	1797	2014-03-07 01:13:50.312025	2014-03-07 01:52:19.585609
112509	581918	 7:13:00	 7:13:00	1022	5		0	0	1.27229999999999999	5467	1798	2014-03-07 01:13:50.323311	2014-03-07 01:52:19.597477
112510	581918	 7:13:25	 7:13:25	1023	6		0	0	1.44809999999999994	5467	1799	2014-03-07 01:13:50.333981	2014-03-07 01:52:19.618491
112511	581918	 7:14:24	 7:14:24	1024	7		0	0	1.86329999999999996	5467	1800	2014-03-07 01:13:50.345554	2014-03-07 01:52:19.652144
112512	581918	 7:14:49	 7:14:49	1026	8		0	0	2.03730000000000011	5467	1802	2014-03-07 01:13:50.356125	2014-03-07 01:52:19.663643
112513	581918	 7:15:31	 7:15:31	1030	9		0	0	2.33250000000000002	5467	1805	2014-03-07 01:13:50.367778	2014-03-07 01:52:19.676488
112514	581918	 7:16:03	 7:16:03	1031	10		0	0	2.55860000000000021	5467	1806	2014-03-07 01:13:50.37878	2014-03-07 01:52:19.697687
112515	581918	 7:17:00	 7:17:00	249	11		0	0	2.91449999999999987	5467	1130	2014-03-07 01:13:50.390053	2014-03-07 01:52:19.707123
112516	581918	 7:17:38	 7:17:38	1032	12		0	0	3.1621999999999999	5467	1807	2014-03-07 01:13:50.400762	2014-03-07 01:52:19.717454
112517	581918	 7:18:13	 7:18:13	1033	13		0	0	3.38879999999999981	5467	1808	2014-03-07 01:13:50.412114	2014-03-07 01:52:19.729982
112518	581918	 7:18:55	 7:18:55	1034	14		0	0	3.66319999999999979	5467	1809	2014-03-07 01:13:50.423245	2014-03-07 01:52:19.743103
112519	581918	 7:19:21	 7:19:21	1035	15		0	0	3.83280000000000021	5467	1810	2014-03-07 01:13:50.434435	2014-03-07 01:52:19.764635
112521	581918	 7:20:43	 7:20:43	1221	17		0	0	4.36979999999999968	5467	1923	2014-03-07 01:13:50.456301	2014-03-07 01:52:19.811413
112522	581918	 7:22:34	 7:22:34	1229	18		0	0	5.09020000000000028	5467	1928	2014-03-07 01:13:50.534322	2014-03-07 01:52:19.833359
112523	581918	 7:23:16	 7:23:16	1230	19		0	0	5.3666999999999998	5467	1929	2014-03-07 01:13:50.545136	2014-03-07 01:52:19.853336
112524	581918	 7:23:54	 7:23:54	1231	20		0	0	5.61509999999999998	5467	1930	2014-03-07 01:13:50.556169	2014-03-07 01:52:19.863212
112525	581918	 7:25:01	 7:25:01	1232	21		0	0	6.05069999999999997	5467	1931	2014-03-07 01:13:50.567589	2014-03-07 01:52:19.941959
112526	581918	 7:25:50	 7:25:50	1233	22		0	0	6.37080000000000002	5467	1932	2014-03-07 01:13:50.578463	2014-03-07 01:52:19.953847
112527	581918	 7:27:51	 7:27:51	1095	23		0	0	7.15160000000000018	5467	1868	2014-03-07 01:13:50.589514	2014-03-07 01:52:19.976861
112528	581918	 7:28:40	 7:28:40	1096	24		0	0	7.47149999999999981	5467	1869	2014-03-07 01:13:50.601063	2014-03-07 01:52:19.997804
112529	581918	 7:29:19	 7:29:19	1097	25		0	0	7.72729999999999961	5467	1870	2014-03-07 01:13:50.611886	2014-03-07 01:52:20.007856
112530	581918	 7:30:06	 7:30:06	492	26		0	0	8.03340000000000032	5467	1324	2014-03-07 01:13:50.622935	2014-03-07 01:52:20.018597
112531	581918	 7:31:00	 7:31:00	493	27		0	0	8.33130000000000059	5467	1325	2014-03-07 01:13:50.634309	2014-03-07 01:52:20.03045
112532	581918	 7:32:31	 7:32:31	300	28		0	0	8.72700000000000031	5467	1165	2014-03-07 01:13:50.645237	2014-03-07 01:52:20.041321
112533	581918	 7:35:33	 7:35:33	185	29		0	0	9.51580000000000048	5467	1094	2014-03-07 01:13:50.658011	2014-03-07 01:52:20.050883
112534	581918	 7:37:12	 7:37:12	853	30		0	0	9.94650000000000034	5467	1651	2014-03-07 01:13:50.667739	2014-03-07 01:52:20.062926
112535	581918	 7:38:37	 7:38:37	854	31		0	0	10.3152000000000008	5467	1652	2014-03-07 01:13:50.678616	2014-03-07 01:52:20.075731
112536	581918	 7:39:42	 7:39:42	855	32		0	0	10.6004000000000005	5467	1653	2014-03-07 01:13:50.689976	2014-03-07 01:52:20.085664
112537	581918	 7:41:11	 7:41:11	856	33		0	0	10.9871999999999996	5467	1654	2014-03-07 01:13:50.700766	2014-03-07 01:52:20.096276
112538	581918	 7:42:00	 7:42:00	680	34		0	0	11.2017000000000007	5467	1493	2014-03-07 01:13:50.712232	2014-03-07 01:52:20.108229
112539	581918	 7:45:00	 7:45:00	1156	35		0	0	11.9674999999999994	5467	1907	2014-03-07 01:13:50.725191	2014-03-07 01:52:20.118857
140962	583191	14:33:34	14:33:34	1080	6		0	0	1.46269999999999989	6014	1853	2014-03-07 01:20:09.99919	2014-03-07 02:01:34.156094
140983	583191	14:51:43	14:51:43	1017	27		0	0	8.0904000000000007	6014	1794	2014-03-07 01:20:10.29908	2014-03-07 02:01:34.535939
141150	583195	 7:02:37	 7:02:37	778	14		0	0	3.27749999999999986	6018	1581	2014-03-07 01:20:12.557327	2014-03-07 02:01:37.439096
141172	583195	 7:20:08	 7:20:08	1067	36		0	0	9.72300000000000075	6018	1841	2014-03-07 01:20:12.869156	2014-03-07 02:01:37.795981
123277	582512	 6:59:00	 6:59:00	244	2		0	0	0.231300000000000006	5644	1126	2014-03-07 01:16:14.135723	2014-03-07 01:55:55.884684
123278	582512	 7:00:00	 7:00:00	22	3		0	0	0.430700000000000027	5644	1008	2014-03-07 01:16:14.146715	2014-03-07 01:55:55.896469
123279	582512	 7:00:53	 7:00:53	203	4		0	0	0.788599999999999968	5644	1102	2014-03-07 01:16:14.157649	2014-03-07 01:55:55.915956
123280	582512	 7:01:54	 7:01:54	1128	5		0	0	1.20659999999999989	5644	1891	2014-03-07 01:16:14.169136	2014-03-07 01:55:55.927805
123281	582512	 7:02:39	 7:02:39	15	6		0	0	1.51649999999999996	5644	1004	2014-03-07 01:16:14.180003	2014-03-07 01:55:55.939035
123282	582512	 7:02:54	 7:02:54	333	7		0	0	1.62329999999999997	5644	1193	2014-03-07 01:16:14.190979	2014-03-07 01:55:55.95117
123283	582512	 7:03:27	 7:03:27	334	8		0	0	1.84860000000000002	5644	1194	2014-03-07 01:16:14.202177	2014-03-07 01:55:55.962943
123284	582512	 7:03:55	 7:03:55	335	9		0	0	2.04400000000000004	5644	1195	2014-03-07 01:16:14.213222	2014-03-07 01:55:55.974167
123285	582512	 7:04:45	 7:04:45	337	10		0	0	2.38260000000000005	5644	1197	2014-03-07 01:16:14.224926	2014-03-07 01:55:55.984684
123286	582512	 7:05:29	 7:05:29	440	11		0	0	2.68550000000000022	5644	1289	2014-03-07 01:16:14.235581	2014-03-07 01:55:55.99637
123287	582512	 7:05:51	 7:05:51	862	12		0	0	2.83740000000000014	5644	1659	2014-03-07 01:16:14.246874	2014-03-07 01:55:56.006942
123288	582512	 7:06:09	 7:06:09	863	13		0	0	2.96379999999999999	5644	1660	2014-03-07 01:16:14.258222	2014-03-07 01:55:56.018689
123289	582512	 7:07:00	 7:07:00	231	14		0	0	3.26390000000000002	5644	1118	2014-03-07 01:16:14.269015	2014-03-07 01:55:56.030041
123290	582512	 7:07:27	 7:07:27	864	15		0	0	3.49589999999999979	5644	1661	2014-03-07 01:16:14.280297	2014-03-07 01:55:56.040209
123291	582512	 7:07:58	 7:07:58	865	16		0	0	3.75780000000000003	5644	1662	2014-03-07 01:16:14.291419	2014-03-07 01:55:56.051738
123292	582512	 7:08:14	 7:08:14	866	17		0	0	3.89489999999999981	5644	1663	2014-03-07 01:16:14.314925	2014-03-07 01:55:56.063351
123293	582512	 7:08:58	 7:08:58	867	18		0	0	4.27040000000000042	5644	1664	2014-03-07 01:16:14.347096	2014-03-07 01:55:56.07416
123294	582512	 7:09:40	 7:09:40	679	19		0	0	4.6272000000000002	5644	1492	2014-03-07 01:16:14.358056	2014-03-07 01:55:56.084883
123295	582512	 7:10:11	 7:10:11	868	20		0	0	4.89200000000000035	5644	1665	2014-03-07 01:16:14.368535	2014-03-07 01:55:56.096673
123296	582512	 7:10:57	 7:10:57	869	21		0	0	5.28739999999999988	5644	1666	2014-03-07 01:16:14.380592	2014-03-07 01:55:56.107959
123297	582512	 7:11:29	 7:11:29	870	22		0	0	5.56460000000000043	5644	1667	2014-03-07 01:16:14.391315	2014-03-07 01:55:56.118948
123298	582512	 7:12:13	 7:12:13	871	23		0	0	5.94270000000000032	5644	1668	2014-03-07 01:16:14.402493	2014-03-07 01:55:56.141499
123299	582512	 7:13:00	 7:13:00	184	24		0	0	6.3017000000000003	5644	1093	2014-03-07 01:16:14.413812	2014-03-07 01:55:56.163763
123300	582512	 7:13:50	 7:13:50	1343	25		0	0	6.63809999999999967	5644	1988	2014-03-07 01:16:14.424519	2014-03-07 01:55:56.186412
123301	582512	 7:14:35	 7:14:35	872	26		0	0	6.93940000000000001	5644	1669	2014-03-07 01:16:14.436367	2014-03-07 01:55:56.207688
123303	582512	 7:16:05	 7:16:05	874	28		0	0	7.54800000000000004	5644	1671	2014-03-07 01:16:14.457848	2014-03-07 01:55:56.229874
123304	582512	 7:17:18	 7:17:18	377	29		0	0	8.03599999999999959	5644	1236	2014-03-07 01:16:14.469592	2014-03-07 01:55:56.240796
123305	582512	 7:17:38	 7:17:38	876	30		0	0	8.16999999999999993	5644	1672	2014-03-07 01:16:14.480599	2014-03-07 01:55:56.251618
123306	582512	 7:18:20	 7:18:20	877	31		0	0	8.45260000000000034	5644	1673	2014-03-07 01:16:14.491313	2014-03-07 01:55:56.262511
123307	582512	 7:19:00	 7:19:00	878	32		0	0	8.72189999999999976	5644	1674	2014-03-07 01:16:14.502961	2014-03-07 01:55:56.275026
123308	582512	 7:19:51	 7:19:51	128	33		0	0	9.06209999999999916	5644	1065	2014-03-07 01:16:14.513553	2014-03-07 01:55:56.285417
123309	582512	 7:20:36	 7:20:36	879	34		0	0	9.3620000000000001	5644	1675	2014-03-07 01:16:14.580679	2014-03-07 01:55:56.296278
123310	582512	 7:21:12	 7:21:12	214	35		0	0	9.60500000000000043	5644	1109	2014-03-07 01:16:14.591635	2014-03-07 01:55:56.307949
123311	582512	 7:21:49	 7:21:49	881	36		0	0	9.85619999999999941	5644	1676	2014-03-07 01:16:14.602585	2014-03-07 01:55:56.318596
123312	582512	 7:22:36	 7:22:36	882	37		0	0	10.1717999999999993	5644	1677	2014-03-07 01:16:14.614201	2014-03-07 01:55:56.329513
123313	582512	 7:23:09	 7:23:09	883	38		0	0	10.3942999999999994	5644	1678	2014-03-07 01:16:14.624751	2014-03-07 01:55:56.341557
123314	582512	 7:23:48	 7:23:48	884	39		0	0	10.6568000000000005	5644	1679	2014-03-07 01:16:14.635611	2014-03-07 01:55:56.352821
123315	582512	 7:25:00	 7:25:00	1307	40		0	0	11.0927000000000007	5644	1959	2014-03-07 01:16:14.64699	2014-03-07 01:55:56.363407
123316	582512	 7:26:48	 7:26:48	391	41		0	0	11.6157000000000004	5644	1247	2014-03-07 01:16:14.658015	2014-03-07 01:55:56.374756
123317	582512	 7:27:54	 7:27:54	392	42		0	0	11.9350000000000005	5644	1248	2014-03-07 01:16:14.669152	2014-03-07 01:55:56.385062
123318	582512	 7:28:38	 7:28:38	393	43		0	0	12.1486999999999998	5644	1249	2014-03-07 01:16:14.680356	2014-03-07 01:55:56.396379
123319	582512	 7:29:49	 7:29:49	389	44		0	0	12.4932999999999996	5644	1246	2014-03-07 01:16:14.691781	2014-03-07 01:55:56.407362
123320	582512	 7:30:24	 7:30:24	395	45		0	0	12.6621000000000006	5644	1251	2014-03-07 01:16:14.702509	2014-03-07 01:55:56.418871
123321	582512	 7:31:27	 7:31:27	396	46		0	0	12.9659999999999993	5644	1252	2014-03-07 01:16:14.714182	2014-03-07 01:55:56.430575
123322	582512	 7:32:26	 7:32:26	397	47		0	0	13.2540999999999993	5644	1253	2014-03-07 01:16:14.724646	2014-03-07 01:55:56.440438
123323	582512	 7:33:34	 7:33:34	398	48		0	0	13.5853000000000002	5644	1254	2014-03-07 01:16:14.735943	2014-03-07 01:55:56.452334
123324	582512	 7:33:55	 7:33:55	399	49		0	0	13.6874000000000002	5644	1255	2014-03-07 01:16:14.747192	2014-03-07 01:55:56.463524
123325	582512	 7:35:07	 7:35:07	402	50		0	0	14.0373999999999999	5644	1258	2014-03-07 01:16:14.758107	2014-03-07 01:55:56.473705
123326	582512	 7:35:34	 7:35:34	170	51		0	0	14.1704000000000008	5644	1088	2014-03-07 01:16:14.76924	2014-03-07 01:55:56.485795
123327	582512	 7:36:27	 7:36:27	403	52		0	0	14.4276	5644	1259	2014-03-07 01:16:14.780684	2014-03-07 01:55:56.497252
123328	582512	 7:37:18	 7:37:18	404	53		0	0	14.6746999999999996	5644	1260	2014-03-07 01:16:14.791351	2014-03-07 01:55:56.507257
123329	582512	 7:38:02	 7:38:02	405	54		0	0	14.8876000000000008	5644	1261	2014-03-07 01:16:14.802511	2014-03-07 01:55:56.519056
123330	582512	 7:39:08	 7:39:08	406	55		0	0	15.2050999999999998	5644	1262	2014-03-07 01:16:14.88073	2014-03-07 01:55:56.530441
123331	582512	 7:40:00	 7:40:00	8	56		0	0	15.4207999999999998	5644	1001	2014-03-07 01:16:14.89098	2014-03-07 01:55:56.54073
138341	583138	 6:27:00	 6:27:00	1319	1		0	0	\N	5954	1970	2014-03-07 01:19:35.2211	2014-03-07 02:00:41.666589
138342	583138	 6:28:33	 6:28:33	211	2		0	0	0.524599999999999955	5954	1107	2014-03-07 01:19:35.233056	2014-03-07 02:00:41.677239
138343	583138	 6:29:22	 6:29:22	126	3		0	0	0.80369999999999997	5954	1064	2014-03-07 01:19:35.244013	2014-03-07 02:00:41.688171
138345	583138	 6:31:43	 6:31:43	1021	5		0	0	1.59870000000000001	5954	1797	2014-03-07 01:19:35.266554	2014-03-07 02:00:41.711823
138346	583138	 6:32:05	 6:32:05	1022	6		0	0	1.72330000000000005	5954	1798	2014-03-07 01:19:35.277715	2014-03-07 02:00:41.723032
138347	583138	 6:32:36	 6:32:36	1023	7		0	0	1.89910000000000001	5954	1799	2014-03-07 01:19:35.28878	2014-03-07 02:00:41.733903
138348	583138	 6:33:50	 6:33:50	1024	8		0	0	2.3142999999999998	5954	1800	2014-03-07 01:19:35.299995	2014-03-07 02:00:41.745034
138349	583138	 6:34:21	 6:34:21	1026	9		0	0	2.48830000000000018	5954	1802	2014-03-07 01:19:35.310835	2014-03-07 02:00:41.755804
138350	583138	 6:35:13	 6:35:13	1030	10		0	0	2.78350000000000009	5954	1805	2014-03-07 01:19:35.322467	2014-03-07 02:00:41.767578
138351	583138	 6:35:53	 6:35:53	1031	11		0	0	3.00959999999999983	5954	1806	2014-03-07 01:19:35.333202	2014-03-07 02:00:41.778354
138352	583138	 6:37:00	 6:37:00	249	12		0	0	3.36560000000000015	5954	1130	2014-03-07 01:19:35.344054	2014-03-07 02:00:41.788995
138353	583138	 6:37:39	 6:37:39	1032	13		0	0	3.61319999999999997	5954	1807	2014-03-07 01:19:35.354342	2014-03-07 02:00:41.800237
138354	583138	 6:38:15	 6:38:15	1033	14		0	0	3.83990000000000009	5954	1808	2014-03-07 01:19:35.366355	2014-03-07 02:00:41.812197
138355	583138	 6:38:44	 6:38:44	1281	15		0	0	4.02479999999999993	5954	1948	2014-03-07 01:19:35.377293	2014-03-07 02:00:41.823313
138356	583138	 6:39:25	 6:39:25	1035	16		0	0	4.28380000000000027	5954	1810	2014-03-07 01:19:35.388925	2014-03-07 02:00:41.833549
138357	583138	 6:39:56	 6:39:56	1036	17		0	0	4.4823000000000004	5954	1811	2014-03-07 01:19:35.399843	2014-03-07 02:00:41.844525
138358	583138	 6:40:33	 6:40:33	1037	18		0	0	4.71480000000000032	5954	1812	2014-03-07 01:19:35.410604	2014-03-07 02:00:41.856306
138359	583138	 6:41:39	 6:41:39	1038	19		0	0	5.12959999999999994	5954	1813	2014-03-07 01:19:35.421688	2014-03-07 02:00:41.866538
138360	583138	 6:43:04	 6:43:04	1039	20		0	0	5.66589999999999971	5954	1814	2014-03-07 01:19:35.433039	2014-03-07 02:00:41.877921
138361	583138	 6:44:31	 6:44:31	128	21		0	0	6.21410000000000018	5954	1065	2014-03-07 01:19:35.444106	2014-03-07 02:00:41.890115
138362	583138	 6:45:18	 6:45:18	879	22		0	0	6.51389999999999958	5954	1675	2014-03-07 01:19:35.455337	2014-03-07 02:00:41.901015
138363	583138	 6:45:56	 6:45:56	214	23		0	0	6.75699999999999967	5954	1109	2014-03-07 01:19:35.466587	2014-03-07 02:00:41.912455
138364	583138	 6:46:36	 6:46:36	881	24		0	0	7.00809999999999977	5954	1676	2014-03-07 01:19:35.477178	2014-03-07 02:00:41.923809
138365	583138	 6:47:26	 6:47:26	882	25		0	0	7.32380000000000031	5954	1677	2014-03-07 01:19:35.488752	2014-03-07 02:00:41.945292
138366	583138	 6:48:01	 6:48:01	883	26		0	0	7.5461999999999998	5954	1678	2014-03-07 01:19:35.499918	2014-03-07 02:00:41.956819
138367	583138	 6:48:42	 6:48:42	884	27		0	0	7.80869999999999997	5954	1679	2014-03-07 01:19:35.510636	2014-03-07 02:00:41.96755
138368	583138	 6:50:00	 6:50:00	1307	28		0	0	8.24460000000000015	5954	1959	2014-03-07 01:19:35.522307	2014-03-07 02:00:41.978506
138369	583138	 6:51:41	 6:51:41	391	29		0	0	8.76759999999999984	5954	1247	2014-03-07 01:19:35.53271	2014-03-07 02:00:41.989924
138370	583138	 6:52:42	 6:52:42	392	30		0	0	9.08699999999999974	5954	1248	2014-03-07 01:19:35.544388	2014-03-07 02:00:42.000296
138371	583138	 6:53:23	 6:53:23	393	31		0	0	9.30059999999999931	5954	1249	2014-03-07 01:19:35.555325	2014-03-07 02:00:42.011864
138373	583138	 6:55:01	 6:55:01	395	33		0	0	9.81409999999999982	5954	1251	2014-03-07 01:19:35.666417	2014-03-07 02:00:42.033901
138374	583138	 6:55:59	 6:55:59	396	34		0	0	10.1179000000000006	5954	1252	2014-03-07 01:19:35.677654	2014-03-07 02:00:42.045698
138375	583138	 6:56:54	 6:56:54	397	35		0	0	10.4060000000000006	5954	1253	2014-03-07 01:19:35.688515	2014-03-07 02:00:42.056021
138376	583138	 6:57:58	 6:57:58	398	36		0	0	10.7371999999999996	5954	1254	2014-03-07 01:19:35.699253	2014-03-07 02:00:42.067744
138377	583138	 6:58:17	 6:58:17	399	37		0	0	10.8392999999999997	5954	1255	2014-03-07 01:19:35.711215	2014-03-07 02:00:42.078287
138378	583138	 6:59:24	 6:59:24	402	38		0	0	11.1892999999999994	5954	1258	2014-03-07 01:19:35.722109	2014-03-07 02:00:42.089853
138379	583138	 6:59:49	 6:59:49	170	39		0	0	11.3223000000000003	5954	1088	2014-03-07 01:19:35.733522	2014-03-07 02:00:42.101228
138380	583138	 7:00:38	 7:00:38	403	40		0	0	11.5794999999999995	5954	1259	2014-03-07 01:19:35.744201	2014-03-07 02:00:42.112377
138381	583138	 7:01:25	 7:01:25	404	41		0	0	11.8267000000000007	5954	1260	2014-03-07 01:19:35.755645	2014-03-07 02:00:42.124591
138382	583138	 7:02:06	 7:02:06	405	42		0	0	12.0396000000000001	5954	1261	2014-03-07 01:19:35.76666	2014-03-07 02:00:42.147672
138383	583138	 7:03:07	 7:03:07	406	43		0	0	12.3571000000000009	5954	1262	2014-03-07 01:19:35.777912	2014-03-07 02:00:42.157973
138384	583138	 7:04:00	 7:04:00	8	44		0	0	12.5726999999999993	5954	1001	2014-03-07 01:19:35.788876	2014-03-07 02:00:42.169524
140957	583191	14:30:00	14:30:00	238	1		0	0	\N	6014	1121	2014-03-07 01:20:09.943331	2014-03-07 02:01:34.065474
140958	583191	14:31:03	14:31:03	1077	2		0	0	0.431599999999999984	6014	1850	2014-03-07 01:20:09.9546	2014-03-07 02:01:34.076005
140959	583191	14:32:19	14:32:19	1078	3		0	0	0.950300000000000034	6014	1851	2014-03-07 01:20:09.965425	2014-03-07 02:01:34.089472
140960	583191	14:32:35	14:32:35	1079	4		0	0	1.06069999999999998	6014	1852	2014-03-07 01:20:09.976966	2014-03-07 02:01:34.110746
140961	583191	14:33:15	14:33:15	1074	5		0	0	1.33329999999999993	6014	1848	2014-03-07 01:20:09.987942	2014-03-07 02:01:34.134547
140963	583191	14:34:16	14:34:16	1081	7		0	0	1.75	6014	1854	2014-03-07 01:20:10.010199	2014-03-07 02:01:34.177816
140964	583191	14:35:24	14:35:24	1082	8		0	0	2.21609999999999996	6014	1855	2014-03-07 01:20:10.021284	2014-03-07 02:01:34.185363
140965	583191	14:35:48	14:35:48	1083	9		0	0	2.38430000000000009	6014	1856	2014-03-07 01:20:10.031975	2014-03-07 02:01:34.197931
140966	583191	14:36:26	14:36:26	1084	10		0	0	2.64729999999999999	6014	1857	2014-03-07 01:20:10.043551	2014-03-07 02:01:34.208694
140967	583191	14:37:09	14:37:09	1085	11		0	0	2.94090000000000007	6014	1858	2014-03-07 01:20:10.054283	2014-03-07 02:01:34.223441
140968	583191	14:37:42	14:37:42	1086	12		0	0	3.16869999999999985	6014	1859	2014-03-07 01:20:10.065468	2014-03-07 02:01:34.244107
140969	583191	14:38:17	14:38:17	1087	13		0	0	3.41049999999999986	6014	1860	2014-03-07 01:20:10.143017	2014-03-07 02:01:34.26692
140970	583191	14:38:56	14:38:56	1088	14		0	0	3.67680000000000007	6014	1861	2014-03-07 01:20:10.15433	2014-03-07 02:01:34.287108
140971	583191	14:40:18	14:40:18	1063	15		0	0	4.23759999999999959	6014	1837	2014-03-07 01:20:10.165707	2014-03-07 02:01:34.298453
140972	583191	14:41:00	14:41:00	129	16		0	0	4.49139999999999961	6014	1066	2014-03-07 01:20:10.176479	2014-03-07 02:01:34.365425
140973	583191	14:41:52	14:41:52	489	17		0	0	4.79070000000000018	6014	1321	2014-03-07 01:20:10.187761	2014-03-07 02:01:34.37796
140974	583191	14:42:38	14:42:38	736	18		0	0	5.05740000000000034	6014	1543	2014-03-07 01:20:10.198989	2014-03-07 02:01:34.397298
140975	583191	14:43:42	14:43:42	737	19		0	0	5.42710000000000026	6014	1544	2014-03-07 01:20:10.209885	2014-03-07 02:01:34.408456
140976	583191	14:44:43	14:44:43	738	20		0	0	5.77749999999999986	6014	1545	2014-03-07 01:20:10.22103	2014-03-07 02:01:34.422076
140977	583191	14:45:34	14:45:34	248	21		0	0	6.07249999999999979	6014	1129	2014-03-07 01:20:10.23237	2014-03-07 02:01:34.443729
140978	583191	14:46:42	14:46:42	1061	22		0	0	6.4634999999999998	6014	1835	2014-03-07 01:20:10.24323	2014-03-07 02:01:34.456467
140979	583191	14:47:36	14:47:36	1089	23		0	0	6.77890000000000015	6014	1862	2014-03-07 01:20:10.254986	2014-03-07 02:01:34.466233
140980	583191	14:48:47	14:48:47	1090	24		0	0	7.19069999999999965	6014	1863	2014-03-07 01:20:10.265912	2014-03-07 02:01:34.477632
140981	583191	14:49:07	14:49:07	1091	25		0	0	7.30940000000000012	6014	1864	2014-03-07 01:20:10.27653	2014-03-07 02:01:34.491192
140982	583191	14:50:00	14:50:00	1092	26		0	0	7.59109999999999996	6014	1865	2014-03-07 01:20:10.288335	2014-03-07 02:01:34.514705
140984	583191	14:52:57	14:52:57	62	28		0	0	8.45279999999999987	6014	1033	2014-03-07 01:20:10.309882	2014-03-07 02:01:34.558496
140985	583191	14:53:26	14:53:26	741	29		0	0	8.59539999999999971	6014	1548	2014-03-07 01:20:10.321191	2014-03-07 02:01:34.579177
140986	583191	14:54:06	14:54:06	742	30		0	0	8.79069999999999929	6014	1549	2014-03-07 01:20:10.332357	2014-03-07 02:01:34.590956
140987	583191	14:55:20	14:55:20	743	31		0	0	9.15339999999999954	6014	1550	2014-03-07 01:20:10.34317	2014-03-07 02:01:34.614428
140988	583191	14:55:54	14:55:54	744	32		0	0	9.31869999999999976	6014	1551	2014-03-07 01:20:10.35498	2014-03-07 02:01:34.63775
140989	583191	14:56:30	14:56:30	745	33		0	0	9.4953000000000003	6014	1552	2014-03-07 01:20:10.366007	2014-03-07 02:01:34.658871
140990	583191	14:57:36	14:57:36	746	34		0	0	9.81509999999999927	6014	1553	2014-03-07 01:20:10.444779	2014-03-07 02:01:34.682693
140991	583191	14:58:26	14:58:26	747	35		0	0	10.0592000000000006	6014	1554	2014-03-07 01:20:10.454703	2014-03-07 02:01:34.704221
140992	583191	14:59:16	14:59:16	748	36		0	0	10.3028999999999993	6014	1555	2014-03-07 01:20:10.465999	2014-03-07 02:01:34.725932
140993	583191	15:00:34	15:00:34	749	37		0	0	10.6806000000000001	6014	1556	2014-03-07 01:20:10.477349	2014-03-07 02:01:34.800533
140994	583191	15:01:33	15:01:33	750	38		0	0	10.9672000000000001	6014	1557	2014-03-07 01:20:10.488051	2014-03-07 02:01:34.812515
140995	583191	15:02:20	15:02:20	751	39		0	0	11.1963000000000008	6014	1558	2014-03-07 01:20:10.499254	2014-03-07 02:01:34.82427
140996	583191	15:02:52	15:02:52	752	40		0	0	11.3552999999999997	6014	1559	2014-03-07 01:20:10.51055	2014-03-07 02:01:34.837908
140997	583191	15:03:56	15:03:56	753	41		0	0	11.6694999999999993	6014	1560	2014-03-07 01:20:10.520685	2014-03-07 02:01:34.858387
140998	583191	15:04:38	15:04:38	754	42		0	0	11.8758999999999997	6014	1561	2014-03-07 01:20:10.53176	2014-03-07 02:01:34.879641
140999	583191	15:05:30	15:05:30	755	43		0	0	12.1316000000000006	6014	1562	2014-03-07 01:20:10.542971	2014-03-07 02:01:34.890807
141000	583191	15:06:57	15:06:57	756	44		0	0	12.5543999999999993	6014	1563	2014-03-07 01:20:10.554274	2014-03-07 02:01:34.904076
141001	583191	15:08:00	15:08:00	63	45		0	0	12.8175000000000008	6014	1034	2014-03-07 01:20:10.565132	2014-03-07 02:01:34.925143
141137	583195	 6:54:00	 6:54:00	63	1		0	0	\N	6018	1034	2014-03-07 01:20:12.379482	2014-03-07 02:01:37.21661
141138	583195	 6:54:24	 6:54:24	767	2		0	0	0.153400000000000009	6018	1570	2014-03-07 01:20:12.390871	2014-03-07 02:01:37.238185
141139	583195	 6:55:20	 6:55:20	768	3		0	0	0.506099999999999994	6018	1571	2014-03-07 01:20:12.402241	2014-03-07 02:01:37.250536
141140	583195	 6:55:54	 6:55:54	208	4		0	0	0.719799999999999995	6018	1105	2014-03-07 01:20:12.412708	2014-03-07 02:01:37.271856
141141	583195	 6:56:26	 6:56:26	769	5		0	0	0.925000000000000044	6018	1572	2014-03-07 01:20:12.423076	2014-03-07 02:01:37.283909
141142	583195	 6:57:15	 6:57:15	770	6		0	0	1.23530000000000006	6018	1573	2014-03-07 01:20:12.435268	2014-03-07 02:01:37.305038
141143	583195	 6:57:48	 6:57:48	771	7		0	0	1.4476	6018	1574	2014-03-07 01:20:12.447941	2014-03-07 02:01:37.31683
141144	583195	 6:58:17	 6:58:17	772	8		0	0	1.63240000000000007	6018	1575	2014-03-07 01:20:12.490939	2014-03-07 02:01:37.339116
141145	583195	 6:59:17	 6:59:17	773	9		0	0	2.01359999999999983	6018	1576	2014-03-07 01:20:12.501995	2014-03-07 02:01:37.350388
141146	583195	 7:00:02	 7:00:02	774	10		0	0	2.29689999999999994	6018	1577	2014-03-07 01:20:12.513016	2014-03-07 02:01:37.372366
141147	583195	 7:01:00	 7:01:00	775	11		0	0	2.66420000000000012	6018	1578	2014-03-07 01:20:12.523897	2014-03-07 02:01:37.383828
141148	583195	 7:01:27	 7:01:27	776	12		0	0	2.83499999999999996	6018	1579	2014-03-07 01:20:12.535158	2014-03-07 02:01:37.405726
141149	583195	 7:02:09	 7:02:09	777	13		0	0	3.10090000000000021	6018	1580	2014-03-07 01:20:12.546631	2014-03-07 02:01:37.417216
141151	583195	 7:03:12	 7:03:12	779	15		0	0	3.5017999999999998	6018	1582	2014-03-07 01:20:12.56871	2014-03-07 02:01:37.451074
141152	583195	 7:04:01	 7:04:01	1139	16		0	0	3.81309999999999993	6018	1899	2014-03-07 01:20:12.579443	2014-03-07 02:01:37.472624
141153	583195	 7:04:30	 7:04:30	780	17		0	0	4.00030000000000019	6018	1583	2014-03-07 01:20:12.590721	2014-03-07 02:01:37.484715
141154	583195	 7:05:12	 7:05:12	246	18		0	0	4.2652000000000001	6018	1128	2014-03-07 01:20:12.602221	2014-03-07 02:01:37.505744
141155	583195	 7:05:49	 7:05:49	782	19		0	0	4.49920000000000009	6018	1585	2014-03-07 01:20:12.613347	2014-03-07 02:01:37.51812
141156	583195	 7:07:00	 7:07:00	131	20		0	0	4.88269999999999982	6018	1067	2014-03-07 01:20:12.62398	2014-03-07 02:01:37.539931
141157	583195	 7:07:36	 7:07:36	1167	21		0	0	5.10329999999999995	6018	1909	2014-03-07 01:20:12.635877	2014-03-07 02:01:37.550512
141158	583195	 7:08:04	 7:08:04	1057	22		0	0	5.27799999999999958	6018	1831	2014-03-07 01:20:12.64653	2014-03-07 02:01:37.562077
141159	583195	 7:08:32	 7:08:32	1058	23		0	0	5.45199999999999996	6018	1832	2014-03-07 01:20:12.657562	2014-03-07 02:01:37.573534
141160	583195	 7:09:39	 7:09:39	1059	24		0	0	5.86099999999999977	6018	1833	2014-03-07 01:20:12.669203	2014-03-07 02:01:37.584847
141161	583195	 7:10:31	 7:10:31	1060	25		0	0	6.17630000000000035	6018	1834	2014-03-07 01:20:12.679775	2014-03-07 02:01:37.608364
141162	583195	 7:11:28	 7:11:28	239	26		0	0	6.5224000000000002	6018	1122	2014-03-07 01:20:12.690831	2014-03-07 02:01:37.628531
141163	583195	 7:12:26	 7:12:26	811	27		0	0	6.87560000000000038	6018	1613	2014-03-07 01:20:12.702456	2014-03-07 02:01:37.642
141164	583195	 7:13:15	 7:13:15	812	28		0	0	7.17319999999999958	6018	1614	2014-03-07 01:20:12.713069	2014-03-07 02:01:37.66256
141165	583195	 7:14:23	 7:14:23	813	29		0	0	7.59030000000000005	6018	1615	2014-03-07 01:20:12.724404	2014-03-07 02:01:37.674173
141166	583195	 7:14:55	 7:14:55	487	30		0	0	7.7878999999999996	6018	1319	2014-03-07 01:20:12.735188	2014-03-07 02:01:37.69585
141167	583195	 7:16:00	 7:16:00	132	31		0	0	8.15269999999999939	6018	1068	2014-03-07 01:20:12.746347	2014-03-07 02:01:37.706965
141168	583195	 7:16:44	 7:16:44	1062	32		0	0	8.43229999999999968	6018	1836	2014-03-07 01:20:12.75724	2014-03-07 02:01:37.718849
141169	583195	 7:17:59	 7:17:59	1064	33		0	0	8.90409999999999968	6018	1838	2014-03-07 01:20:12.76892	2014-03-07 02:01:37.741194
141170	583195	 7:18:41	 7:18:41	1065	34		0	0	9.17210000000000036	6018	1839	2014-03-07 01:20:12.779717	2014-03-07 02:01:37.763406
141171	583195	 7:19:16	 7:19:16	1066	35		0	0	9.39480000000000004	6018	1840	2014-03-07 01:20:12.857227	2014-03-07 02:01:37.785021
141173	583195	 7:20:42	 7:20:42	1068	37		0	0	9.93609999999999971	6018	1842	2014-03-07 01:20:12.87934	2014-03-07 02:01:37.807938
141174	583195	 7:21:22	 7:21:22	1069	38		0	0	10.1904000000000003	6018	1843	2014-03-07 01:20:12.89102	2014-03-07 02:01:37.830217
141175	583195	 7:22:01	 7:22:01	1070	39		0	0	10.4343000000000004	6018	1844	2014-03-07 01:20:12.901967	2014-03-07 02:01:37.840076
141176	583195	 7:23:02	 7:23:02	1071	40		0	0	10.8204999999999991	6018	1845	2014-03-07 01:20:12.912742	2014-03-07 02:01:37.851795
141177	583195	 7:23:51	 7:23:51	1072	41		0	0	11.1273	6018	1846	2014-03-07 01:20:12.924288	2014-03-07 02:01:37.862873
141178	583195	 7:24:25	 7:24:25	1073	42		0	0	11.3442000000000007	6018	1847	2014-03-07 01:20:12.934688	2014-03-07 02:01:37.873625
141179	583195	 7:25:24	 7:25:24	1075	43		0	0	11.7146000000000008	6018	1849	2014-03-07 01:20:12.945596	2014-03-07 02:01:37.885454
141180	583195	 7:28:00	 7:28:00	75	44		0	0	12.6418999999999997	6018	1043	2014-03-07 01:20:12.956887	2014-03-07 02:01:37.9181
145286	583469	15:29:00	15:29:00	236	10		0	0	4.50459999999999994	6152	1120	2014-03-07 01:21:08.303284	2014-03-07 02:03:05.783999
145287	583469	15:33:15	15:33:15	840	11		0	0	5.71159999999999979	6152	1640	2014-03-07 01:21:08.314431	2014-03-07 02:03:07.097113
145288	583469	15:35:08	15:35:08	1148	12		0	0	6.24960000000000004	6152	1903	2014-03-07 01:21:08.325012	2014-03-07 02:03:07.115822
145289	583469	15:37:52	15:37:52	206	13		0	0	7.02590000000000003	6152	1104	2014-03-07 01:21:08.336678	2014-03-07 02:03:07.129744
145290	583469	15:39:03	15:39:03	1048	14		0	0	7.3655999999999997	6152	1823	2014-03-07 01:21:08.347135	2014-03-07 02:03:07.151194
145291	583469	15:39:52	15:39:52	1049	15		0	0	7.5990000000000002	6152	1824	2014-03-07 01:21:08.358562	2014-03-07 02:03:07.172612
145292	583469	15:40:44	15:40:44	1050	16		0	0	7.84750000000000014	6152	1825	2014-03-07 01:21:08.370204	2014-03-07 02:03:07.184516
145293	583469	15:41:27	15:41:27	1025	17		0	0	8.05410000000000004	6152	1801	2014-03-07 01:21:08.380893	2014-03-07 02:03:07.206145
145294	583469	15:42:33	15:42:33	1051	18		0	0	8.3686000000000007	6152	1826	2014-03-07 01:21:08.392006	2014-03-07 02:03:07.229288
145295	583469	15:43:46	15:43:46	1053	19		0	0	8.71410000000000018	6152	1828	2014-03-07 01:21:08.402883	2014-03-07 02:03:07.250039
145296	583469	15:45:33	15:45:33	1265	20		0	0	9.22250000000000014	6152	1942	2014-03-07 01:21:08.413961	2014-03-07 02:03:07.264765
145297	583469	15:46:30	15:46:30	205	21		0	0	9.49600000000000044	6152	1103	2014-03-07 01:21:08.425095	2014-03-07 02:03:07.282319
145298	583469	15:49:00	15:49:00	1319	22		0	0	10.1699000000000002	6152	1970	2014-03-07 01:21:08.436238	2014-03-07 02:03:07.297954
145497	583479	 6:30:00	 6:30:00	1319	1		0	0	\N	6162	1970	2014-03-07 01:21:11.01559	2014-03-07 02:03:10.719748
145498	583479	 6:32:02	 6:32:02	1133	2		0	0	0.880199999999999982	6162	1895	2014-03-07 01:21:11.027159	2014-03-07 02:03:10.742191
145499	583479	 6:33:07	 6:33:07	1021	3		0	0	1.34949999999999992	6162	1797	2014-03-07 01:21:11.038203	2014-03-07 02:03:10.764863
145500	583479	 6:33:48	 6:33:48	1023	4		0	0	1.64999999999999991	6162	1799	2014-03-07 01:21:11.04958	2014-03-07 02:03:10.78715
145501	583479	 6:34:45	 6:34:45	1024	5		0	0	2.06519999999999992	6162	1800	2014-03-07 01:21:11.060436	2014-03-07 02:03:10.808646
145502	583479	 6:35:09	 6:35:09	1026	6		0	0	2.23919999999999986	6162	1802	2014-03-07 01:21:11.070335	2014-03-07 02:03:10.82955
145503	583479	 6:35:49	 6:35:49	1030	7		0	0	2.53440000000000021	6162	1805	2014-03-07 01:21:11.08157	2014-03-07 02:03:10.840823
145504	583479	 6:36:20	 6:36:20	1031	8		0	0	2.76049999999999995	6162	1806	2014-03-07 01:21:11.092798	2014-03-07 02:03:10.85305
145505	583479	 6:37:08	 6:37:08	1134	9		0	0	3.11370000000000013	6162	1896	2014-03-07 01:21:11.104503	2014-03-07 02:03:10.876369
145506	583479	 6:38:53	 6:38:53	1125	10		0	0	3.87650000000000006	6162	1889	2014-03-07 01:21:11.115492	2014-03-07 02:03:10.898074
145507	583479	 6:40:03	 6:40:03	881	11		0	0	4.38490000000000002	6162	1676	2014-03-07 01:21:11.127019	2014-03-07 02:03:10.919896
145508	583479	 6:43:00	 6:43:00	1307	12		0	0	5.6214000000000004	6162	1959	2014-03-07 01:21:11.193559	2014-03-07 02:03:10.9407
145509	583479	 6:44:51	 6:44:51	391	13		0	0	6.14440000000000008	6162	1247	2014-03-07 01:21:11.204581	2014-03-07 02:03:10.951711
145510	583479	 6:46:44	 6:46:44	393	14		0	0	6.67739999999999956	6162	1249	2014-03-07 01:21:11.21588	2014-03-07 02:03:10.961898
145511	583479	 6:47:57	 6:47:57	389	15		0	0	7.02200000000000024	6162	1246	2014-03-07 01:21:11.227042	2014-03-07 02:03:10.972305
145512	583479	 6:49:37	 6:49:37	396	16		0	0	7.49469999999999992	6162	1252	2014-03-07 01:21:11.238209	2014-03-07 02:03:10.98509
145513	583479	 6:50:38	 6:50:38	397	17		0	0	7.78279999999999994	6162	1253	2014-03-07 01:21:11.249356	2014-03-07 02:03:10.996666
145514	583479	 6:51:48	 6:51:48	398	18		0	0	8.11400000000000077	6162	1254	2014-03-07 01:21:11.260114	2014-03-07 02:03:11.008314
145516	583479	 6:53:23	 6:53:23	402	20		0	0	8.56610000000000049	6162	1258	2014-03-07 01:21:11.282668	2014-03-07 02:03:11.095964
145517	583479	 6:54:43	 6:54:43	1149	21		0	0	8.94239999999999924	6162	1904	2014-03-07 01:21:11.29348	2014-03-07 02:03:11.105409
145518	583479	 6:57:00	 6:57:00	1328	22		0	0	9.55560000000000009	6162	1975	2014-03-07 01:21:11.304954	2014-03-07 02:03:11.11672
146095	584728	 5:55:00	 5:55:00	38	1		0	0	\N	6179	1014	2014-03-07 01:21:19.21083	2014-03-07 02:03:23.716957
146096	584728	 6:00:29	 6:00:29	1193	2		0	0	3.69079999999999986	6179	1915	2014-03-07 01:21:19.221643	2014-03-07 02:03:23.730452
146097	584728	 6:01:08	 6:01:08	536	3		0	0	4.13320000000000043	6179	1362	2014-03-07 01:21:19.233059	2014-03-07 02:03:23.806077
146098	584728	 6:05:33	 6:05:33	1188	4		0	0	7.10909999999999975	6179	1912	2014-03-07 01:21:19.244113	2014-03-07 02:03:23.819287
146099	584728	 6:08:06	 6:08:06	549	5		0	0	8.83109999999999928	6179	1373	2014-03-07 01:21:19.255123	2014-03-07 02:03:23.839088
146100	584728	 6:09:57	 6:09:57	551	6		0	0	10.0753000000000004	6179	1375	2014-03-07 01:21:19.321844	2014-03-07 02:03:23.850364
146102	584728	 6:12:00	 6:12:00	41	8		0	0	11.4248999999999992	6179	1016	2014-03-07 01:21:19.343851	2014-03-07 02:03:23.873111
146103	584728	 6:13:44	 6:13:44	469	9		0	0	11.9957999999999991	6179	1306	2014-03-07 01:21:19.355198	2014-03-07 02:03:23.884967
146104	584728	 6:16:26	 6:16:26	1200	10		0	0	12.8874999999999993	6179	1920	2014-03-07 01:21:19.366599	2014-03-07 02:03:23.907512
146105	584728	 6:18:40	 6:18:40	557	11		0	0	13.6248000000000005	6179	1380	2014-03-07 01:21:19.376484	2014-03-07 02:03:23.919476
146106	584728	 6:21:39	 6:21:39	42	12		0	0	14.6084999999999994	6179	1017	2014-03-07 01:21:19.38784	2014-03-07 02:03:23.940598
146107	584728	 6:24:39	 6:24:39	72	13		0	0	15.5963999999999992	6179	1040	2014-03-07 01:21:19.398827	2014-03-07 02:03:23.965385
146108	584728	 6:28:00	 6:28:00	21	14		0	0	16.6765000000000008	6179	1007	2014-03-07 01:21:19.409826	2014-03-07 02:03:23.984608
146109	584728	 6:28:50	 6:28:50	4	15		0	0	17.0095999999999989	6179	997	2014-03-07 01:21:19.42152	2014-03-07 02:03:23.998654
146110	584728	 6:30:00	 6:30:00	43	16		0	0	17.4756999999999998	6179	1018	2014-03-07 01:21:19.432864	2014-03-07 02:03:24.01847
146575	585233	 6:20:00	 6:20:00	43	1		0	0	\N	6220	1018	2014-03-07 01:21:25.714562	2014-03-07 02:03:33.425643
146576	585233	 6:22:00	 6:22:00	50	2		0	0	0.630199999999999982	6220	1024	2014-03-07 01:21:25.72522	2014-03-07 02:03:33.445932
146577	585233	 6:22:34	 6:22:34	13	3		0	0	1.03899999999999992	6220	1003	2014-03-07 01:21:25.736817	2014-03-07 02:03:33.456995
146578	585233	 6:23:00	 6:23:00	34	4		0	0	1.34600000000000009	6220	1013	2014-03-07 01:21:25.747701	2014-03-07 02:03:33.478497
146579	585233	 6:24:49	 6:24:49	1186	5		0	0	2.56090000000000018	6220	1910	2014-03-07 01:21:25.758364	2014-03-07 02:03:33.492922
146580	585233	 6:26:05	 6:26:05	51	6		0	0	3.41319999999999979	6220	1025	2014-03-07 01:21:25.769583	2014-03-07 02:03:33.512194
146581	585233	 6:27:35	 6:27:35	598	7		0	0	4.41589999999999971	6220	1421	2014-03-07 01:21:25.781009	2014-03-07 02:03:33.525401
146582	585233	 6:28:34	 6:28:34	1201	8		0	0	5.07819999999999983	6220	1921	2014-03-07 01:21:25.79196	2014-03-07 02:03:33.54766
146583	585233	 6:29:54	 6:29:54	476	9		0	0	5.97149999999999981	6220	1311	2014-03-07 01:21:25.803388	2014-03-07 02:03:33.570612
146584	585233	 6:31:00	 6:31:00	52	10		0	0	6.67260000000000009	6220	1026	2014-03-07 01:21:25.814697	2014-03-07 02:03:33.594643
146585	585233	 6:32:15	 6:32:15	600	11		0	0	7.33779999999999966	6220	1423	2014-03-07 01:21:25.82549	2014-03-07 02:03:33.613568
146586	585233	 6:33:36	 6:33:36	602	12		0	0	8.0578000000000003	6220	1425	2014-03-07 01:21:25.836406	2014-03-07 02:03:33.627757
146587	585233	 6:35:49	 6:35:49	604	13		0	0	9.23610000000000042	6220	1427	2014-03-07 01:21:25.847986	2014-03-07 02:03:33.647352
146589	585233	 6:47:30	 6:47:30	1190	15		0	0	15.4430999999999994	6220	1913	2014-03-07 01:21:25.869751	2014-03-07 02:03:33.691839
146590	585233	 6:55:00	 6:55:00	38	16		0	0	19.4103999999999992	6220	1014	2014-03-07 01:21:25.88093	2014-03-07 02:03:33.700525
147215	584310	 5:56:00	 5:56:00	244	1		0	0	\N	6263	1126	2014-03-07 01:21:34.084646	2014-03-07 02:03:47.10949
147216	584310	 5:56:22	 5:56:22	22	2		0	0	0.188099999999999989	6263	1008	2014-03-07 01:21:34.096285	2014-03-07 02:03:47.120731
147217	584310	 5:56:34	 5:56:34	188	3		0	0	0.296300000000000008	6263	1096	2014-03-07 01:21:34.107743	2014-03-07 02:03:47.131044
147218	584310	 5:57:20	 5:57:20	291	4		0	0	0.689500000000000002	6263	1158	2014-03-07 01:21:34.118893	2014-03-07 02:03:47.14337
147219	584310	 5:58:44	 5:58:44	713	5		0	0	1.39999999999999991	6263	1521	2014-03-07 01:21:34.12953	2014-03-07 02:03:47.155537
147220	584310	 6:00:12	 6:00:12	245	6		0	0	2.14590000000000014	6263	1127	2014-03-07 01:21:34.140339	2014-03-07 02:03:47.167094
147221	584310	 6:02:43	 6:02:43	349	7		0	0	3.42430000000000012	6263	1208	2014-03-07 01:21:34.152322	2014-03-07 02:03:47.178883
147222	584310	 6:05:04	 6:05:04	354	8		0	0	4.61910000000000043	6263	1213	2014-03-07 01:21:34.163549	2014-03-07 02:03:47.20116
147223	584310	 6:07:12	 6:07:12	73	9		0	0	5.70340000000000025	6263	1041	2014-03-07 01:21:34.174366	2014-03-07 02:03:47.223943
147224	584310	 6:10:26	 6:10:26	762	10		0	0	7.34700000000000042	6263	1567	2014-03-07 01:21:34.185998	2014-03-07 02:03:47.244698
147225	584310	 6:12:00	 6:12:00	238	11		0	0	8.09379999999999988	6263	1121	2014-03-07 01:21:34.196531	2014-03-07 02:03:47.266222
147226	584310	 6:16:47	 6:16:47	489	12		0	0	10.2760999999999996	6263	1321	2014-03-07 01:21:34.208298	2014-03-07 02:03:47.276627
147227	584310	 6:22:06	 6:22:06	62	13		0	0	12.702	6263	1033	2014-03-07 01:21:34.219256	2014-03-07 02:03:47.288898
147228	584310	 6:23:38	 6:23:38	743	14		0	0	13.4026999999999994	6263	1550	2014-03-07 01:21:34.230128	2014-03-07 02:03:47.301126
147230	584310	 6:30:09	 6:30:09	755	16		0	0	16.3808000000000007	6263	1562	2014-03-07 01:21:34.252633	2014-03-07 02:03:47.323574
147231	584310	 6:31:22	 6:31:22	1308	17		0	0	16.9390999999999998	6263	1960	2014-03-07 01:21:34.263414	2014-03-07 02:03:47.345488
147232	584310	 6:33:47	 6:33:47	1310	18		0	0	18.0426000000000002	6263	1962	2014-03-07 01:21:34.274518	2014-03-07 02:03:47.358564
147233	584310	 6:35:32	 6:35:32	1311	19		0	0	18.8410000000000011	6263	1963	2014-03-07 01:21:34.286092	2014-03-07 02:03:47.379146
147234	584310	 6:37:31	 6:37:31	1312	20		0	0	19.7483000000000004	6263	1964	2014-03-07 01:21:34.29712	2014-03-07 02:03:47.401256
147235	584310	 6:40:00	 6:40:00	1301	21		0	0	20.8522999999999996	6263	1956	2014-03-07 01:21:34.363529	2014-03-07 02:03:47.411618
148262	584238	 5:36:00	 5:36:00	1302	1		0	0	\N	6342	1957	2014-03-07 01:21:47.80626	2014-03-07 02:04:09.17245
148263	584238	 5:37:35	 5:37:35	1313	2		0	0	0.95389999999999997	6342	1965	2014-03-07 01:21:47.817299	2014-03-07 02:04:09.193218
148264	584238	 5:39:00	 5:39:00	1314	3		0	0	1.80879999999999996	6342	1966	2014-03-07 01:21:47.828477	2014-03-07 02:04:09.224283
148265	584238	 5:40:23	 5:40:23	1315	4		0	0	2.6431	6342	1967	2014-03-07 01:21:47.839656	2014-03-07 02:04:09.248106
148266	584238	 5:41:44	 5:41:44	1309	5		0	0	3.45659999999999989	6342	1961	2014-03-07 01:21:47.85055	2014-03-07 02:04:09.270062
148267	584238	 5:43:04	 5:43:04	768	6		0	0	4.25539999999999985	6342	1571	2014-03-07 01:21:47.861075	2014-03-07 02:04:09.281215
148268	584238	 5:46:40	 5:46:40	775	7		0	0	6.41349999999999998	6342	1578	2014-03-07 01:21:47.872708	2014-03-07 02:04:09.303594
148269	584238	 5:48:04	 5:48:04	779	8		0	0	7.25100000000000033	6342	1582	2014-03-07 01:21:47.883736	2014-03-07 02:04:09.313125
148270	584238	 5:49:19	 5:49:19	65	9		0	0	8.00169999999999959	6342	1035	2014-03-07 01:21:47.895065	2014-03-07 02:04:09.324296
148271	584238	 5:53:09	 5:53:09	487	10		0	0	10.3010000000000002	6342	1319	2014-03-07 01:21:47.905831	2014-03-07 02:04:09.346569
148272	584238	 5:57:00	 5:57:00	75	11		0	0	12.5568000000000008	6342	1043	2014-03-07 01:21:47.917096	2014-03-07 02:04:09.35597
148274	584238	 6:05:17	 6:05:17	76	13		0	0	14.8911999999999995	6342	1044	2014-03-07 01:21:47.939317	2014-03-07 02:04:09.38287
148275	584238	 6:09:17	 6:09:17	1278	14		0	0	16.0198	6342	1945	2014-03-07 01:21:47.951828	2014-03-07 02:04:09.402829
148276	584238	 6:13:24	 6:13:24	829	15		0	0	17.1814	6342	1629	2014-03-07 01:21:47.961946	2014-03-07 02:04:09.413849
148277	584238	 6:18:19	 6:18:19	72	16		0	0	18.5669000000000004	6342	1040	2014-03-07 01:21:47.972741	2014-03-07 02:04:09.423955
148278	584238	 6:20:36	 6:20:36	287	17		0	0	19.2090999999999994	6342	1154	2014-03-07 01:21:47.983943	2014-03-07 02:04:09.437667
148279	584238	 6:23:03	 6:23:03	288	18		0	0	19.900500000000001	6342	1155	2014-03-07 01:21:47.995333	2014-03-07 02:04:09.447481
148280	584238	 6:24:33	 6:24:33	289	19		0	0	20.3228000000000009	6342	1156	2014-03-07 01:21:48.006138	2014-03-07 02:04:09.457329
148281	584238	 6:25:23	 6:25:23	259	20		1	0	20.5591000000000008	6342	1133	2014-03-07 01:21:48.072484	2014-03-07 02:04:09.47012
148282	584238	 6:25:40	 6:25:40	104	21		0	0	20.6397000000000013	6342	1052	2014-03-07 01:21:48.083818	2014-03-07 02:04:09.483611
148283	584238	 6:26:03	 6:26:03	227	22		0	0	20.7493000000000016	6342	1114	2014-03-07 01:21:48.095041	2014-03-07 02:04:09.505544
148284	584238	 6:26:42	 6:26:42	5	23		0	0	20.9353000000000016	6342	998	2014-03-07 01:21:48.107032	2014-03-07 02:04:09.513567
148285	584238	 6:28:00	 6:28:00	244	24		0	0	21.2741000000000007	6342	1126	2014-03-07 01:21:48.117485	2014-03-07 02:04:09.524905
150351	583747	 7:20:00	 7:20:00	195	1		0	0	\N	6426	1098	2014-03-07 01:22:15.78973	2014-03-07 02:04:52.519102
150352	583747	 7:20:26	 7:20:26	987	2		0	0	0.188500000000000001	6426	1765	2014-03-07 01:22:15.801005	2014-03-07 02:04:52.532602
150353	583747	 7:20:53	 7:20:53	988	3		0	0	0.384400000000000019	6426	1766	2014-03-07 01:22:15.812406	2014-03-07 02:04:52.554015
150354	583747	 7:21:47	 7:21:47	260	4		0	0	0.772299999999999986	6426	1134	2014-03-07 01:22:15.823064	2014-03-07 02:04:52.576983
150355	583747	 7:22:00	 7:22:00	115	5		0	0	0.861299999999999955	6426	1056	2014-03-07 01:22:15.834418	2014-03-07 02:04:52.597498
150356	583747	 7:22:59	 7:22:59	989	6		0	0	1.1774	6426	1767	2014-03-07 01:22:15.84576	2014-03-07 02:04:52.610356
150357	583747	 7:23:37	 7:23:37	990	7		0	0	1.38470000000000004	6426	1768	2014-03-07 01:22:15.856384	2014-03-07 02:04:52.63097
150358	583747	 7:24:28	 7:24:28	116	8		0	0	1.65989999999999993	6426	1057	2014-03-07 01:22:15.867921	2014-03-07 02:04:52.643418
150359	583747	 7:25:15	 7:25:15	991	9		0	0	1.9153	6426	1769	2014-03-07 01:22:15.879172	2014-03-07 02:04:52.665804
150360	583747	 7:25:52	 7:25:52	117	10		0	0	2.11410000000000009	6426	1058	2014-03-07 01:22:15.889859	2014-03-07 02:04:52.68727
150361	583747	 7:26:33	 7:26:33	992	11		0	0	2.33479999999999999	6426	1770	2014-03-07 01:22:15.901819	2014-03-07 02:04:52.709284
150362	583747	 7:27:08	 7:27:08	279	12		0	0	2.52499999999999991	6426	1147	2014-03-07 01:22:15.912023	2014-03-07 02:04:52.718259
150364	583747	 7:28:55	 7:28:55	994	14		0	0	3.10289999999999999	6426	1772	2014-03-07 01:22:15.934383	2014-03-07 02:04:52.745404
150365	583747	 7:29:33	 7:29:33	995	15		0	0	3.30949999999999989	6426	1773	2014-03-07 01:22:16.012223	2014-03-07 02:04:52.765079
150366	583747	 7:30:07	 7:30:07	566	16		0	0	3.49339999999999984	6426	1389	2014-03-07 01:22:16.023551	2014-03-07 02:04:52.777504
150367	583747	 7:31:00	 7:31:00	118	17		0	0	3.74650000000000016	6426	1059	2014-03-07 01:22:16.034271	2014-03-07 02:04:52.798576
150368	583747	 7:31:49	 7:31:49	45	18		0	0	4.05630000000000024	6426	1020	2014-03-07 01:22:16.045891	2014-03-07 02:04:52.811956
150369	583747	 7:32:30	 7:32:30	996	19		0	0	4.31869999999999976	6426	1774	2014-03-07 01:22:16.056917	2014-03-07 02:04:52.83241
150370	583747	 7:32:52	 7:32:52	997	20		0	0	4.45870000000000033	6426	1775	2014-03-07 01:22:16.067849	2014-03-07 02:04:52.853839
150371	583747	 7:33:25	 7:33:25	998	21		0	0	4.66809999999999992	6426	1776	2014-03-07 01:22:16.078921	2014-03-07 02:04:52.864876
150372	583747	 7:34:05	 7:34:05	422	22		0	0	4.92349999999999977	6426	1278	2014-03-07 01:22:16.090161	2014-03-07 02:04:52.877637
150373	583747	 7:34:33	 7:34:33	423	23		0	0	5.10099999999999998	6426	1279	2014-03-07 01:22:16.100902	2014-03-07 02:04:52.898051
150374	583747	 7:35:15	 7:35:15	119	24		0	0	5.36690000000000023	6426	1060	2014-03-07 01:22:16.112804	2014-03-07 02:04:52.908972
150375	583747	 7:35:37	 7:35:37	694	25		0	0	5.50699999999999967	6426	1504	2014-03-07 01:22:16.123662	2014-03-07 02:04:52.91901
150376	583747	 7:36:15	 7:36:15	695	26		0	0	5.75319999999999965	6426	1505	2014-03-07 01:22:16.134463	2014-03-07 02:04:52.931279
150377	583747	 7:36:51	 7:36:51	999	27		0	0	5.9836999999999998	6426	1777	2014-03-07 01:22:16.145792	2014-03-07 02:04:52.944782
150378	583747	 7:37:57	 7:37:57	1001	28		0	0	6.40420000000000034	6426	1778	2014-03-07 01:22:16.157044	2014-03-07 02:04:52.966058
150379	583747	 7:39:00	 7:39:00	120	29		0	0	6.77840000000000042	6426	1061	2014-03-07 01:22:16.167782	2014-03-07 02:04:52.985655
150380	583747	 7:40:20	 7:40:20	1002	30		0	0	7.08779999999999966	6426	1779	2014-03-07 01:22:16.179065	2014-03-07 02:04:52.998437
150381	583747	 7:42:08	 7:42:08	1003	31		0	0	7.50560000000000027	6426	1780	2014-03-07 01:22:16.190027	2014-03-07 02:04:53.009176
150382	583747	 7:43:10	 7:43:10	857	32		0	0	7.7455999999999996	6426	1655	2014-03-07 01:22:16.201444	2014-03-07 02:04:53.020267
150383	583747	 7:45:00	 7:45:00	195	33		0	0	8.16520000000000046	6426	1098	2014-03-07 01:22:16.212633	2014-03-07 02:04:53.030297
152094	583787	 7:03:00	 7:03:00	1238	1		0	0	\N	6466	1936	2014-03-07 01:22:39.248524	2014-03-07 02:05:29.874043
152096	583787	 7:05:21	 7:05:21	300	3		0	0	1.00499999999999989	6466	1165	2014-03-07 01:22:39.270661	2014-03-07 02:05:29.917136
152097	583787	 7:07:12	 7:07:12	185	4		0	0	1.79380000000000006	6466	1094	2014-03-07 01:22:39.282613	2014-03-07 02:05:29.938457
152098	583787	 7:08:12	 7:08:12	853	5		0	0	2.22449999999999992	6466	1651	2014-03-07 01:22:39.293432	2014-03-07 02:05:29.962686
152099	583787	 7:09:04	 7:09:04	854	6		0	0	2.59319999999999995	6466	1652	2014-03-07 01:22:39.304144	2014-03-07 02:05:29.983422
152100	583787	 7:09:44	 7:09:44	855	7		0	0	2.87840000000000007	6466	1653	2014-03-07 01:22:39.315544	2014-03-07 02:05:30.005122
152101	583787	 7:10:38	 7:10:38	856	8		0	0	3.2652000000000001	6466	1654	2014-03-07 01:22:39.326786	2014-03-07 02:05:30.024448
152102	583787	 7:11:08	 7:11:08	680	9		0	0	3.47969999999999979	6466	1493	2014-03-07 01:22:39.338083	2014-03-07 02:05:30.092919
152103	583787	 7:11:51	 7:11:51	857	10		0	0	3.78560000000000008	6466	1655	2014-03-07 01:22:39.349023	2014-03-07 02:05:30.138419
152104	583787	 7:12:48	 7:12:48	195	11		0	0	4.19529999999999959	6466	1098	2014-03-07 01:22:39.360129	2014-03-07 02:05:30.157597
152105	583787	 7:13:16	 7:13:16	987	12		0	0	4.39360000000000017	6466	1765	2014-03-07 01:22:39.370941	2014-03-07 02:05:30.171846
152106	583787	 7:14:27	 7:14:27	348	13		0	0	4.89759999999999973	6466	1207	2014-03-07 01:22:39.382139	2014-03-07 02:05:30.18164
152107	583787	 7:15:00	 7:15:00	349	14		0	0	5.0979000000000001	6466	1208	2014-03-07 01:22:39.392937	2014-03-07 02:05:30.19377
152108	583787	 7:16:00	 7:16:00	120	15		0	0	5.36340000000000039	6466	1061	2014-03-07 01:22:39.404167	2014-03-07 02:05:30.206939
152109	583787	 7:18:32	 7:18:32	679	16		0	0	6.18850000000000033	6466	1492	2014-03-07 01:22:39.415825	2014-03-07 02:05:30.228196
152110	583787	 7:19:20	 7:19:20	868	17		0	0	6.45319999999999983	6466	1665	2014-03-07 01:22:39.426499	2014-03-07 02:05:30.251043
152111	583787	 7:20:32	 7:20:32	869	18		0	0	6.84860000000000024	6466	1666	2014-03-07 01:22:39.438102	2014-03-07 02:05:30.274227
152112	583787	 7:21:23	 7:21:23	870	19		0	0	7.12579999999999991	6466	1667	2014-03-07 01:22:39.449035	2014-03-07 02:05:30.293953
152113	583787	 7:22:32	 7:22:32	871	20		0	0	7.50399999999999956	6466	1668	2014-03-07 01:22:39.460067	2014-03-07 02:05:30.306881
152114	583787	 7:23:38	 7:23:38	184	21		0	0	7.86289999999999978	6466	1093	2014-03-07 01:22:39.470572	2014-03-07 02:05:30.327522
152115	583787	 7:24:40	 7:24:40	298	22		0	0	8.20090000000000074	6466	1163	2014-03-07 01:22:39.481954	2014-03-07 02:05:30.342339
152116	583787	 7:26:07	 7:26:07	299	23		0	0	8.67329999999999934	6466	1164	2014-03-07 01:22:39.493205	2014-03-07 02:05:30.360592
152117	583787	 7:27:23	 7:27:23	490	24		0	0	9.08779999999999966	6466	1322	2014-03-07 01:22:39.504683	2014-03-07 02:05:30.374034
152118	583787	 7:28:00	 7:28:00	1238	25		0	0	9.26449999999999996	6466	1936	2014-03-07 01:22:39.51529	2014-03-07 02:05:30.392686
8549	580994	 7:41:28	 7:41:28	421	21		0	0	6.67799999999999994	3430	1277	2014-03-07 00:50:51.5594	2014-03-07 01:25:13.579531
8562	580994	 7:53:00	 7:53:00	1323	34		0	0	10.9650999999999996	3430	1972	2014-03-07 00:50:51.703916	2014-03-07 01:25:13.749429
14078	581289	 7:15:00	 7:15:00	301	4		0	0	0.973600000000000021	3541	1166	2014-03-07 00:52:05.522319	2014-03-07 01:26:40.049765
14087	581289	 7:23:35	 7:23:35	581	13		0	0	5.07150000000000034	3541	1404	2014-03-07 00:52:05.622579	2014-03-07 01:26:40.166365
14097	581289	 7:29:32	 7:29:32	590	23		0	0	7.87929999999999975	3541	1413	2014-03-07 00:52:05.733595	2014-03-07 01:26:40.278822
14126	581289	 7:49:57	 7:49:57	477	52		0	0	15.9610000000000003	3541	1312	2014-03-07 00:52:06.055837	2014-03-07 01:26:40.711962
19054	584949	 7:25:01	 7:25:01	1336	7		1	1	2.81280000000000019	3626	1981	2014-03-07 00:53:10.92483	2014-03-07 01:27:51.680913
19083	584949	 7:41:11	 7:41:11	728	36		0	0	11.5503	3626	1535	2014-03-07 00:53:11.380771	2014-03-07 01:27:52.504003
20703	584977	 6:35:35	 6:35:35	269	4		0	0	1.08549999999999991	3654	1139	2014-03-07 00:53:31.861852	2014-03-07 01:28:16.2919
20732	584977	 6:53:47	 6:53:47	797	33		0	0	8.93560000000000088	3654	1600	2014-03-07 00:53:32.183846	2014-03-07 01:28:16.680437
20752	584977	 7:05:07	 7:05:07	710	53		0	0	14.5890000000000004	3654	1520	2014-03-07 00:53:32.405805	2014-03-07 01:28:16.991556
22410	585392	 5:17:49	 5:17:49	188	3		0	0	0.296300000000000008	3682	1096	2014-03-07 00:53:53.93156	2014-03-07 01:28:40.958524
22437	585392	 5:34:39	 5:34:39	804	30		0	0	8.47540000000000049	3682	1607	2014-03-07 00:53:54.231711	2014-03-07 01:28:41.313817
22450	585392	 5:40:46	 5:40:46	739	43		0	0	12.0539000000000005	3682	1546	2014-03-07 00:53:54.376186	2014-03-07 01:28:41.525536
26743	585463	 5:33:00	 5:33:00	770	5		0	0	1.32309999999999994	3753	1573	2014-03-07 00:54:50.646075	2014-03-07 01:29:43.836363
26772	585463	 5:51:28	 5:51:28	621	34		0	0	9.5929000000000002	3753	1443	2014-03-07 00:54:51.135561	2014-03-07 01:29:44.681398
26802	585463	 6:12:00	 6:12:00	244	64		0	0	17.6252999999999993	3753	1126	2014-03-07 00:54:51.535466	2014-03-07 01:29:45.148043
45242	583443	19:55:00	19:55:00	431	3		0	0	10.5763999999999996	4127	1286	2014-03-07 00:58:57.669298	2014-03-07 01:34:21.401324
82936	580761	 6:32:49	 6:32:49	465	2		0	0	0.288700000000000012	4906	1302	2014-03-07 01:07:16.59918	2014-03-07 01:44:00.737448
82948	580761	 6:42:00	 6:42:00	1305	14		0	0	3.51929999999999987	4906	1958	2014-03-07 01:07:16.780405	2014-03-07 01:44:00.891913
82975	580761	 7:00:38	 7:00:38	375	41		0	0	10.0851000000000006	4906	1234	2014-03-07 01:07:17.277237	2014-03-07 01:44:01.260056
88350	580855	 6:19:00	 6:19:00	1327	1		0	0	\N	5000	1974	2014-03-07 01:08:27.724011	2014-03-07 01:45:25.309425
88373	580855	 6:34:44	 6:34:44	322	24		0	0	6.22060000000000013	5000	1182	2014-03-07 01:08:27.979569	2014-03-07 01:45:25.564329
88402	580855	 6:56:48	 6:56:48	452	53		0	0	14.3803000000000001	5000	1291	2014-03-07 01:08:28.379723	2014-03-07 01:45:25.887919
93749	581118	 6:43:00	 6:43:00	4	4		0	0	0.85299999999999998	5095	997	2014-03-07 01:09:39.705944	2014-03-07 01:46:51.051368
93763	581118	 6:52:10	 6:52:10	528	18		0	0	4.57469999999999999	5095	1354	2014-03-07 01:09:39.861374	2014-03-07 01:46:51.219959
97231	581472	 5:48:00	 5:48:00	529	2		0	0	0.417999999999999983	5200	1355	2014-03-07 01:10:26.049144	2014-03-07 01:47:47.246563
97258	581472	 6:16:52	 6:16:52	468	29		0	0	12.1915999999999993	5200	1305	2014-03-07 01:10:26.416126	2014-03-07 01:47:47.603356
97287	581472	 6:47:40	 6:47:40	566	58		0	0	20.2048999999999985	5200	1389	2014-03-07 01:10:26.80523	2014-03-07 01:47:47.936936
97298	581472	 6:56:43	 6:56:43	574	69		0	0	23.2552999999999983	5200	1397	2014-03-07 01:10:26.982879	2014-03-07 01:47:48.081619
97306	581472	 7:10:18	 7:10:18	170	77		0	0	27.0080999999999989	5200	1088	2014-03-07 01:10:27.138188	2014-03-07 01:47:48.171225
112361	581913	13:14:00	13:14:00	206	22		0	0	9.58089999999999975	5462	1104	2014-03-07 01:13:48.154456	2014-03-07 01:52:17.141889
112520	581918	 7:19:51	 7:19:51	1036	16		0	0	4.03120000000000012	5467	1811	2014-03-07 01:13:50.445621	2014-03-07 01:52:19.787705
123276	582512	 6:58:00	 6:58:00	1217	1		0	0	\N	5644	1922	2014-03-07 01:16:14.124457	2014-03-07 01:55:55.87445
123302	582512	 7:15:07	 7:15:07	873	27		0	0	7.15679999999999961	5644	1670	2014-03-07 01:16:14.447115	2014-03-07 01:55:56.218916
145277	583469	15:10:00	15:10:00	1328	1		0	0	\N	6152	1975	2014-03-07 01:21:08.147834	2014-03-07 02:03:05.604211
145278	583469	15:16:05	15:16:05	303	2		0	0	1.4444999999999999	6152	1168	2014-03-07 01:21:08.214461	2014-03-07 02:03:05.612961
145279	583469	15:17:35	15:17:35	304	3		0	0	1.80390000000000006	6152	1169	2014-03-07 01:21:08.225251	2014-03-07 02:03:05.628664
145280	583469	15:18:16	15:18:16	86	4		0	0	1.9677	6152	1046	2014-03-07 01:21:08.236504	2014-03-07 02:03:05.647641
145281	583469	15:19:24	15:19:24	306	5		0	0	2.23799999999999999	6152	1170	2014-03-07 01:21:08.247276	2014-03-07 02:03:05.658763
145282	583469	15:20:36	15:20:36	307	6		0	0	2.52510000000000012	6152	1171	2014-03-07 01:21:08.258436	2014-03-07 02:03:05.670595
145283	583469	15:22:55	15:22:55	309	7		0	0	3.0766	6152	1172	2014-03-07 01:21:08.269916	2014-03-07 02:03:05.680532
145284	583469	15:24:01	15:24:01	834	8		0	0	3.33829999999999982	6152	1634	2014-03-07 01:21:08.280688	2014-03-07 02:03:05.749068
145285	583469	15:26:32	15:26:32	836	9		0	0	3.93780000000000019	6152	1636	2014-03-07 01:21:08.291815	2014-03-07 02:03:05.762293
145515	583479	 6:52:09	 6:52:09	399	19		0	0	8.21610000000000085	6162	1255	2014-03-07 01:21:11.271382	2014-03-07 02:03:11.018235
146101	584728	 6:11:00	 6:11:00	553	7		0	0	10.7845999999999993	6179	1377	2014-03-07 01:21:19.333021	2014-03-07 02:03:23.862249
146588	585233	 6:39:07	 6:39:07	1187	14		0	0	10.9910999999999994	6220	1911	2014-03-07 01:21:25.859045	2014-03-07 02:03:33.670306
147229	584310	 6:25:37	 6:25:37	747	15		0	0	14.3084000000000007	6263	1554	2014-03-07 01:21:34.241232	2014-03-07 02:03:47.311925
148273	584238	 5:59:28	 5:59:28	621	12		0	0	13.2544000000000004	6342	1443	2014-03-07 01:21:47.927864	2014-03-07 02:04:09.369881
150363	583747	 7:27:51	 7:27:51	993	13		0	0	2.75919999999999987	6426	1771	2014-03-07 01:22:15.92303	2014-03-07 02:04:52.731181
152095	583787	 7:03:27	 7:03:27	1273	2		0	0	0.194500000000000006	6466	1943	2014-03-07 01:22:39.260042	2014-03-07 02:05:29.894432
\.


--
-- Name: stop_times_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kyle
--

SELECT pg_catalog.setval('stop_times_id_seq', 153088, true);


--
-- Data for Name: stops; Type: TABLE DATA; Schema: public; Owner: kyle
--

COPY stops (id, gtfs_stop_id, code, name, "desc", lat, lon, zone_id, url, location_type, parent_station, created_at, updated_at) FROM stdin;
1226	367	MNSBAYNN	Main Nb & Bay Ns	1900 Main St & Bay St	34.0070903000000015	-118.4887528	\N	\N	\N	\N	2014-03-07 00:48:46.051994	2014-03-07 00:48:46.051994
995	1	WNDMNSEN	Windward Eb & Main Ns	100 Windward Ave & Main St	33.9879238999999984	-118.471718100000004	\N	\N	\N	\N	2014-03-07 00:48:42.59234	2014-03-07 00:48:42.59234
996	3	OCEPCONF	Ocean Nb & Pico Fs	1900 Ocean Ave & Pico Blvd	34.0081199999999981	-118.490816800000005	\N	\N	\N	\N	2014-03-07 00:48:42.60575	2014-03-07 00:48:42.60575
997	4	004SMBNN	4Th Nb & Santa Monica Ns	1400 4Th St & Santa Monica Blvd	34.0163320999999996	-118.494924400000002	\N	\N	\N	\N	2014-03-07 00:48:42.616461	2014-03-07 00:48:42.616461
998	5	SMB006EN	Santa Monica Eb & 6Th Ns	600 Santa Monica Blvd & 6Th St	34.0178414000000018	-118.493422699999996	\N	\N	\N	\N	2014-03-07 00:48:42.627582	2014-03-07 00:48:42.627582
999	6	SMBCENEF	Santa Monica Eb & Centinela Fs	12400 Santa Monica Blvd & Centinela Ave	34.0386819000000003	-118.467293600000005	\N	\N	\N	\N	2014-03-07 00:48:42.638671	2014-03-07 00:48:42.638671
1000	7	SAWSMBSN	Sawtelle Sb & Santa Monica Ns	1600 Sawtelle Blvd & Santa Monica Blvd	34.0466355000000007	-118.448627099999996	\N	\N	\N	\N	2014-03-07 00:48:42.649891	2014-03-07 00:48:42.649891
1001	8	UCLA	Ucla Terminal	500 Hilgard Ave & Strathmore Dr	34.0710291999999981	-118.438559299999994	\N	\N	\N	\N	2014-03-07 00:48:42.66096	2014-03-07 00:48:42.66096
1002	11	SAWSMBNF	Sawtelle Nb & Santa Monica Fs	1600 Sawtelle Blvd & Santa Monica Blvd	34.0467611999999988	-118.448611999999997	\N	\N	\N	\N	2014-03-07 00:48:42.672346	2014-03-07 00:48:42.672346
1003	13	004SMBSF	4Th Sb & Santa Monica Fs	1300 4Th St & Santa Monica Blvd	34.0161265999999998	-118.494921199999993	\N	\N	\N	\N	2014-03-07 00:48:42.683177	2014-03-07 00:48:42.683177
1004	15	MNSPCOSN	Main Sb & Pico Ns	1800 Main St & Pico Blvd	34.0081478000000033	-118.489862700000003	\N	\N	\N	\N	2014-03-07 00:48:42.694355	2014-03-07 00:48:42.694355
1005	17	VENWLGWF	Venice Wb & Walgrove Fs	1600 Venice Blvd & Walgrove Ave	33.9971823999999998	-118.446800600000003	\N	\N	\N	\N	2014-03-07 00:48:42.70563	2014-03-07 00:48:42.70563
1006	20	PCO004EF	Pico Eb & 4Th Fs	400 Pico Blvd & 4Th St	34.0098575999999966	-118.486864299999993	\N	\N	\N	\N	2014-03-07 00:48:42.716747	2014-03-07 00:48:42.716747
1007	21	004COLNF	4Th Nb & Colorado Fs	1500 4Th St & Colorado Ave	34.0140930999999966	-118.492270099999999	\N	\N	\N	\N	2014-03-07 00:48:42.727818	2014-03-07 00:48:42.727818
1008	22	BWY004WF	Broadway Wb & 4Th Fs	400 Broadway & 4Th St	34.0148463000000021	-118.493862899999996	\N	\N	\N	\N	2014-03-07 00:48:42.738912	2014-03-07 00:48:42.738912
1009	26	WILBUNEN	Wilshire Eb & Bundy Ns	12100 Wilshire Blvd & Bundy Dr	34.0438416000000004	-118.467507400000002	\N	\N	\N	\N	2014-03-07 00:48:42.749826	2014-03-07 00:48:42.749826
1010	28	WILBSLEF	Wilshire Eb & Bonsall Fs	11300 Wilshire Blvd & Bonsall Ave	34.0542414000000022	-118.455349499999997	\N	\N	\N	\N	2014-03-07 00:48:42.761183	2014-03-07 00:48:42.761183
1011	29	VAHBSLEF	Va Hospital Eb & Bonsall Fs	11300 Dowlen Dr & Bonsall Ave	34.0534712999999982	-118.453407299999995	\N	\N	\N	\N	2014-03-07 00:48:42.772273	2014-03-07 00:48:42.772273
1012	30	VAHBSLWN	Va Hospital Wb & Bonsall Ns	11300 Dowlen Dr & Bonsall Ave	34.0532742999999982	-118.453875600000003	\N	\N	\N	\N	2014-03-07 00:48:42.783399	2014-03-07 00:48:42.783399
1013	34	004SMPSC	4Th Sb & Santa Monica Place Co	1500 4Th St & Santa Monica Blvd	34.0143598000000011	-118.492841499999997	\N	\N	\N	\N	2014-03-07 00:48:42.794434	2014-03-07 00:48:42.794434
1014	38	GRNL	Green Line Station	11600 Aviation Blvd & W 116Th St	33.9295297999999974	-118.376399500000005	\N	\N	\N	\N	2014-03-07 00:48:42.806003	2014-03-07 00:48:42.806003
1015	40	MANLINWN	Manchester Wb & Lincoln Ns	7100 W Manchester Ave & Lincoln Blvd	33.9598488999999972	-118.419105299999998	\N	\N	\N	\N	2014-03-07 00:48:42.817029	2014-03-07 00:48:42.817029
1016	41	LINWALNF	Lincoln Nb & Washington Bl (Ven) Fs	4000 Lincoln Blvd & Washington Blvd	33.9907718999999986	-118.448001599999998	\N	\N	\N	\N	2014-03-07 00:48:42.828066	2014-03-07 00:48:42.828066
1017	42	LINOPRNN	Lincoln Nb & Ocean Park Ns	2600 Lincoln Blvd & Ocean Park Blvd	34.0068302999999972	-118.4760378	\N	\N	\N	\N	2014-03-07 00:48:42.839202	2014-03-07 00:48:42.839202
1018	43	ARZ005EN	Arizona Eb & 5Th Ns	500 Arizona Ave & 5Th St	34.0183415999999994	-118.495958200000004	\N	\N	\N	\N	2014-03-07 00:48:42.850308	2014-03-07 00:48:42.850308
1019	44	004WILNN	4Th Nb & Wilshire Ns	1200 4Th St & Wilshire Blvd	34.019053900000003	-118.498096099999998	\N	\N	\N	\N	2014-03-07 00:48:42.86147	2014-03-07 00:48:42.86147
1020	45	MON020EN	Montana Eb & 20Th Ns	2000 Montana Ave & 20Th St	34.0365877999999995	-118.489678900000001	\N	\N	\N	\N	2014-03-07 00:48:42.872619	2014-03-07 00:48:42.872619
1021	46	SVSBAREN	San Vicente Eb & Barrington Ns	11600 W San Vicente Blvd & Barrington Ave	34.0534885000000003	-118.465649900000003	\N	\N	\N	\N	2014-03-07 00:48:42.883078	2014-03-07 00:48:42.883078
1022	47	SVSBARWN	San Vicente Wb & Barrington Ns	11600 W San Vicente Blvd & S Barrington Ave	34.0537861999999976	-118.465549199999998	\N	\N	\N	\N	2014-03-07 00:48:42.894756	2014-03-07 00:48:42.894756
1023	48	MON020WN	Montana Wb & 20Th Ns	2000 Montana Ave & 20Th St	34.0367559999999969	-118.489727000000002	\N	\N	\N	\N	2014-03-07 00:48:42.905555	2014-03-07 00:48:42.905555
1024	50	004WILSF	4Th Sb & Wilshire Fs	1200 4Th St & Wilshire Blvd	34.0185201000000035	-118.497635900000006	\N	\N	\N	\N	2014-03-07 00:48:42.983324	2014-03-07 00:48:42.983324
1025	51	LINOPRSF	Lincoln Sb & Ocean Park Fs	2600 Lincoln Blvd & Ocean Park Blvd	34.0066088000000022	-118.476053800000003	\N	\N	\N	\N	2014-03-07 00:48:43.005631	2014-03-07 00:48:43.005631
1026	52	LINWALSF	Lincoln Sb & Washington Bl (Ven) Fs	4000 Lincoln Blvd & Washington Blvd	33.990016500000003	-118.447562500000004	\N	\N	\N	\N	2014-03-07 00:48:43.016717	2014-03-07 00:48:43.016717
1027	53	MANLINEF	Manchester Eb & Lincoln Fs	7200 W Manchester Ave & Lincoln Blvd	33.9596936000000014	-118.418603500000003	\N	\N	\N	\N	2014-03-07 00:48:43.027809	2014-03-07 00:48:43.027809
1028	56	SVS026EF	San Vicente Eb & 26Th Fs	13000 San Vicente Blvd & 26Th St	34.0482988999999989	-118.491464300000004	\N	\N	\N	\N	2014-03-07 00:48:43.038894	2014-03-07 00:48:43.038894
1029	58	OLYSAWEF	Olympic Eb & Sawtelle Fs	11300 W Olympic Blvd & Sawtelle Blvd	34.0383877000000012	-118.440791599999997	\N	\N	\N	\N	2014-03-07 00:48:43.050128	2014-03-07 00:48:43.050128
1030	59	OLYWWOEF	Olympic Eb & Westwood Fs	10900 W Olympic Blvd & Westwood Blvd	34.0440031999999988	-118.431402700000007	\N	\N	\N	\N	2014-03-07 00:48:43.061349	2014-03-07 00:48:43.061349
1031	60	CONAVSEF	Constellation Eb & Ave Of Stars Fs	10200 Constellation Blvd & Ave Of The Stars	34.0589049000000017	-118.415435400000007	\N	\N	\N	\N	2014-03-07 00:48:43.072375	2014-03-07 00:48:43.072375
1032	61	PCOBEVEF	Pico Eb & Beverly Fs	9500 W Pico Blvd & S Beverly Dr	34.0552054999999996	-118.395021299999996	\N	\N	\N	\N	2014-03-07 00:48:43.083512	2014-03-07 00:48:43.083512
1033	62	PCOROBEF	Pico Eb & Robertson Fs	8800 W Pico Blvd & S Robertson Blvd	34.0546568999999977	-118.383322199999995	\N	\N	\N	\N	2014-03-07 00:48:43.094619	2014-03-07 00:48:43.094619
1034	63	RIMP	Rimpau Terminal	4646 San Vicente Blvd & W Pico Blvd	34.0478536999999974	-118.337269000000006	\N	\N	\N	\N	2014-03-07 00:48:43.105779	2014-03-07 00:48:43.105779
1035	65	PCOROBWF	Pico Wb & Robertson Fs	8800 W Pico Blvd & S Robertson Blvd	34.0549154999999999	-118.384060899999994	\N	\N	\N	\N	2014-03-07 00:48:43.116918	2014-03-07 00:48:43.116918
1036	66	PCOELMWN	Pico Wb & Elm Ns	9400 W Pico Blvd & S Elm Dr	34.0553162	-118.394681700000007	\N	\N	\N	\N	2014-03-07 00:48:43.127965	2014-03-07 00:48:43.127965
1037	67	CONAVSWF	Constellation Wb & Ave Of Stars Fs	10200 Constellation Blvd & Ave Of The Stars	34.0584982999999966	-118.416396399999996	\N	\N	\N	\N	2014-03-07 00:48:43.139066	2014-03-07 00:48:43.139066
1038	68	OLYWWOWF	Olympic Wb & Westwood Fs	10900 W Olympic Blvd & Westwood Blvd	34.0438256999999993	-118.432138600000002	\N	\N	\N	\N	2014-03-07 00:48:43.150122	2014-03-07 00:48:43.150122
1039	70	SAWOLYNF	Sawtelle Nb & Olympic Fs	2100 Sawtelle Blvd & W Olympic Blvd	34.0386633000000032	-118.4414953	\N	\N	\N	\N	2014-03-07 00:48:43.161332	2014-03-07 00:48:43.161332
1040	72	PCOLINWF	Pico Wb & Lincoln Fs	700 Pico Blvd & Whitworth Dr	34.0121291000000028	-118.483392600000002	\N	\N	\N	\N	2014-03-07 00:48:43.172685	2014-03-07 00:48:43.172685
1041	73	PCOBUNEN	Pico Eb & Bundy Ns	12100 W Pico Blvd & S Bundy Dr	34.0292302000000007	-118.450380199999998	\N	\N	\N	\N	2014-03-07 00:48:43.183501	2014-03-07 00:48:43.183501
1042	74	WWOPCOSN	Westwood Sb & Pico Ns	2300 Westwood Blvd & W Pico Blvd	34.0403890999999987	-118.428809700000002	\N	\N	\N	\N	2014-03-07 00:48:43.194524	2014-03-07 00:48:43.194524
1043	75	PCOWWOWN	Pico Wb & Westwood Ns	10900 W Pico Blvd & Westwood Blvd	34.0403576000000001	-118.428235099999995	\N	\N	\N	\N	2014-03-07 00:48:43.205783	2014-03-07 00:48:43.205783
1044	76	PCOBUNWN	Pico Wb & Bundy Ns	12000 W Pico Blvd & S Bundy Dr	34.0296907999999974	-118.449882700000003	\N	\N	\N	\N	2014-03-07 00:48:43.272396	2014-03-07 00:48:43.272396
1045	79	BWY006WF	Broadway Wb & 6Th Fs	600 Broadway & 6Th St	34.0164675999999986	-118.492002999999997	\N	\N	\N	\N	2014-03-07 00:48:43.283516	2014-03-07 00:48:43.283516
1046	86	WWOWILSF	Westwood Sb & Wilshire Fs	1200 Westwood Blvd & Wilshire Blvd	34.0584176999999997	-118.443738600000003	\N	\N	\N	\N	2014-03-07 00:48:43.294312	2014-03-07 00:48:43.294312
1047	94	ENTPCHWN	Entrada Wb & Pacific Coast Hwy Ns	100 Entrada Dr & Pacific Coast Hwy	34.0280597	-118.518578099999999	\N	\N	\N	\N	2014-03-07 00:48:43.305317	2014-03-07 00:48:43.305317
1048	95	SNTVLPWF	Sunset Wb & Via De La Paz Fs	15400 W Sunset Blvd & Via De La Paz	34.0481899999999982	-118.527186200000003	\N	\N	\N	\N	2014-03-07 00:48:43.317083	2014-03-07 00:48:43.317083
1049	98	SNTVLPEN	Sunset Eb & Via De La Paz Ns	15400 W Sunset Blvd & Via De La Paz	34.0479909000000021	-118.527270700000003	\N	\N	\N	\N	2014-03-07 00:48:43.327858	2014-03-07 00:48:43.327858
1050	99	WCHPCHEF	West Channel Eb & Pacific Coast Fs	100 W Channel Rd & Pacific Coast Highway	34.0286997999999983	-118.518529200000003	\N	\N	\N	\N	2014-03-07 00:48:43.339356	2014-03-07 00:48:43.339356
1051	103	OCEBWYNN	Ocean Nb & Broadway Ns	1500 Ocean Ave & Broadway	34.0126018999999999	-118.496137500000003	\N	\N	\N	\N	2014-03-07 00:48:43.35041	2014-03-07 00:48:43.35041
1052	104	SMB003EF	Santa Monica Eb & 3Rd Fs	300 Santa Monica Blvd & 3Rd St	34.0158941999999982	-118.495807299999996	\N	\N	\N	\N	2014-03-07 00:48:43.361598	2014-03-07 00:48:43.361598
1053	106	OLIVENNN	Olive Nb & Venice Ns	1600 S Olive St & Venice Blvd	34.0352025999999981	-118.265590799999998	\N	\N	\N	\N	2014-03-07 00:48:43.372739	2014-03-07 00:48:43.372739
1054	110	FLOL04SN	Flower Sb & 4Th Ns	400 S Flower St & W 4Th St	34.0526010999999968	-118.255982099999997	\N	\N	\N	\N	2014-03-07 00:48:43.383793	2014-03-07 00:48:43.383793
1055	111	GRAVENSN	Grand Sb & Venice Ns	1500 S Grand Ave & W 15Th St	34.036034800000003	-118.266314699999995	\N	\N	\N	\N	2014-03-07 00:48:43.394925	2014-03-07 00:48:43.394925
1056	115	014PCONF	14Th Nb & Pico Fs	1900 14Th St & Pico Blvd	34.016183599999998	-118.476399599999993	\N	\N	\N	\N	2014-03-07 00:48:43.406269	2014-03-07 00:48:43.406269
1057	116	014COLNN	14Th Nb & Colorado Ns	1600 14Th St & Colorado Ave	34.0212602000000004	-118.482286200000004	\N	\N	\N	\N	2014-03-07 00:48:43.417286	2014-03-07 00:48:43.417286
1058	117	014SMBNF	14Th Nb & Santa Monica Fs	1300 14Th St & Santa Monica Blvd	34.0244804000000016	-118.486011300000001	\N	\N	\N	\N	2014-03-07 00:48:43.428375	2014-03-07 00:48:43.428375
1059	118	MON017EF	Montana Eb & 17Th Fs	1700 Montana Ave & 17Th St	34.0345998000000023	-118.492111899999998	\N	\N	\N	\N	2014-03-07 00:48:43.439502	2014-03-07 00:48:43.439502
1060	119	020SMBSF	20Th Sb & Santa Monica Fs	1300 20Th St & Santa Monica Blvd	34.0283331999999987	-118.479736599999995	\N	\N	\N	\N	2014-03-07 00:48:43.450526	2014-03-07 00:48:43.450526
1061	120	020PCOSF	20Th Sb & Pico Fs	1900 20Th St & Pico Blvd	34.0192009000000013	-118.469319400000003	\N	\N	\N	\N	2014-03-07 00:48:43.461687	2014-03-07 00:48:43.461687
1062	123	SEPNATSF	Sepulveda Sb & National Fs	3000 S Sepulveda Blvd & National Blvd	34.0270129000000026	-118.428508300000004	\N	\N	\N	\N	2014-03-07 00:48:43.472815	2014-03-07 00:48:43.472815
1063	125	VENBAGEF	Venice Eb & Bagley Fs	9400 Venice Blvd & Bagley Ave	34.0255213000000012	-118.394671700000004	\N	\N	\N	\N	2014-03-07 00:48:43.483559	2014-03-07 00:48:43.483559
1064	126	VENBAGWN	Venice Wb & Bagley Ns	9400 Venice Blvd & Bagley Ave	34.0257028999999989	-118.3949566	\N	\N	\N	\N	2014-03-07 00:48:43.49504	2014-03-07 00:48:43.49504
1065	128	NATSEPEF	National Eb & Sepulveda Fs	11200 National Blvd & S Sepulveda Blvd	34.0274371000000002	-118.428188599999999	\N	\N	\N	\N	2014-03-07 00:48:43.561285	2014-03-07 00:48:43.561285
1066	129	MTRPCONN	Motor Nb & Pico Ns	2400 Motor Ave & W Pico Blvd	34.0498236999999975	-118.410389199999997	\N	\N	\N	\N	2014-03-07 00:48:43.572669	2014-03-07 00:48:43.572669
1067	131	ROBARDSN	Robertson Sb & Airdrome Ns	1700 S Robertson Blvd & Airdrome St	34.0490232000000006	-118.385475	\N	\N	\N	\N	2014-03-07 00:48:43.584021	2014-03-07 00:48:43.584021
1068	132	MTRPCOSF	Motor Sb & Pico Fs	2400 Motor Ave & Pico Blvd.	34.0496197000000009	-118.410462999999993	\N	\N	\N	\N	2014-03-07 00:48:43.594668	2014-03-07 00:48:43.594668
1069	133	CENWALNF	Centinela Nb & Washington Blvd Fs	4100 S Centinela Ave & Washington Blvd	33.9972835000000018	-118.428579799999994	\N	\N	\N	\N	2014-03-07 00:48:43.605988	2014-03-07 00:48:43.605988
1070	134	CENCULNF	Centinela Nb & Culver Fs	4600 S Centinela Ave & Culver Blvd	33.9914771999999985	-118.421328799999998	\N	\N	\N	\N	2014-03-07 00:48:43.61712	2014-03-07 00:48:43.61712
1071	135	CENVENNN	Centinela Nb & Venice Ns	3800 S Centinela Ave & Venice Blvd	34.0033810999999986	-118.4332019	\N	\N	\N	\N	2014-03-07 00:48:43.628179	2014-03-07 00:48:43.628179
1072	137	BARSNTNN	Barrington Nb & Sunset Ns	100 S Barrington Ave & W Sunset Blvd	34.0649463000000026	-118.469734599999995	\N	\N	\N	\N	2014-03-07 00:48:43.639293	2014-03-07 00:48:43.639293
1073	140	BARSNTSF	Barrington Sb & Sunset Fs	100 S Barrington Ave & W Sunset Blvd	34.0647692000000006	-118.469710899999995	\N	\N	\N	\N	2014-03-07 00:48:43.650274	2014-03-07 00:48:43.650274
1074	141	WILBUNWN	Wilshire Wb & Bundy Ns	12000 Wilshire Blvd & S Bundy Dr	34.0443957999999967	-118.467345399999999	\N	\N	\N	\N	2014-03-07 00:48:43.661527	2014-03-07 00:48:43.661527
1075	149	SMBYLEEF	Santa Monica Eb & Yale Fs	2900 Santa Monica Blvd & Yale  St	34.0357233000000008	-118.471163700000005	\N	\N	\N	\N	2014-03-07 00:48:43.672288	2014-03-07 00:48:43.672288
1076	150	SMBWGTEN	Santa Monica Eb & Westgate Ns	11800 Santa Monica Blvd & S Westgate Ave	34.042231000000001	-118.459280000000007	\N	\N	\N	\N	2014-03-07 00:48:43.683734	2014-03-07 00:48:43.683734
1077	151	SMBBUNEN	Santa Monica Eb & Bundy Ns	12000 Santa Monica Blvd & S Bundy Dr	34.0403835999999984	-118.463423399999996	\N	\N	\N	\N	2014-03-07 00:48:43.694427	2014-03-07 00:48:43.694427
1078	154	SMBBUNWN	Santa Monica Wb & Bundy Ns	12000 Santa Monica Blvd & S Bundy Dr	34.0406632999999985	-118.463115299999998	\N	\N	\N	\N	2014-03-07 00:48:43.705477	2014-03-07 00:48:43.705477
1079	155	SMBWLSWN	Santa Monica Wb & Wellesley Ns	12100 Santa Monica Blvd & Wellesley Ave	34.0397108000000017	-118.465389900000005	\N	\N	\N	\N	2014-03-07 00:48:43.716992	2014-03-07 00:48:43.716992
1080	157	OLDAVMEN	Olympic Dr Eb & Avenida Mazatlan Ns	300 Olympic Dr & Avenida Mazatlan	34.0114532999999994	-118.490786099999994	\N	\N	\N	\N	2014-03-07 00:48:43.728172	2014-03-07 00:48:43.728172
1081	158	PCOMDVWF	Pico Wb & Midvale Fs	10900 W Pico Blvd & Midvale Ave	34.0397052000000002	-118.429757199999997	\N	\N	\N	\N	2014-03-07 00:48:43.739427	2014-03-07 00:48:43.739427
1082	159	GRGLINWN	Georgina Wb & Lincoln Ns	800 Georgina Ave & Lincoln Blvd	34.0323329000000001	-118.506090700000001	\N	\N	\N	\N	2014-03-07 00:48:43.750543	2014-03-07 00:48:43.750543
1083	160	LINVICNN	Lincoln Nb & Victoria Ns	2200 Lincoln Blvd & Victoria Ave	33.9950728000000026	-118.454673900000003	\N	\N	\N	\N	2014-03-07 00:48:43.761663	2014-03-07 00:48:43.761663
1084	161	MON026EF	Montana Eb & 26Th Fs	2600 Montana Ave & 26Th St	34.0415294000000017	-118.483579000000006	\N	\N	\N	\N	2014-03-07 00:48:43.772824	2014-03-07 00:48:43.772824
1085	162	GORSVSWN	Gorham Wb & San Vicente Ns	11711 Gorham Ave & W San Vicente Blvd	34.0536147999999983	-118.466490800000003	\N	\N	\N	\N	2014-03-07 00:48:43.783822	2014-03-07 00:48:43.783822
1086	165	LINWASSF	Lincoln Sb & Washington (Sm) Fs	900 Lincoln Blvd & Washington Ave	34.0247317999999979	-118.497557799999996	\N	\N	\N	\N	2014-03-07 00:48:43.850467	2014-03-07 00:48:43.850467
1087	168	MNSVWYSN	Main Sb & Venice Way Ns	1600 Main St & Venice Way	33.987547499999998	-118.470893599999997	\N	\N	\N	\N	2014-03-07 00:48:43.861807	2014-03-07 00:48:43.861807
1088	170	WWOLCNNN	Westwood Nb & Le Conte Ns	900 Westwood Blvd & Le Conte Ave	34.0635231999999988	-118.445266500000002	\N	\N	\N	\N	2014-03-07 00:48:43.872808	2014-03-07 00:48:43.872808
1089	174	PCO006EN	Pico Eb & 6Th Ns	600 Pico Blvd & 6Th St	34.011030599999998	-118.485086600000002	\N	\N	\N	\N	2014-03-07 00:48:43.883785	2014-03-07 00:48:43.883785
1090	176	VICWLGEN	Victoria Eb & Walgrove Ns	1600 Victoria Ave & Walgrove Ave	33.999865800000002	-118.4486603	\N	\N	\N	\N	2014-03-07 00:48:43.89495	2014-03-07 00:48:43.89495
1091	178	OLYBUNEF	Olympic Eb & Bundy Fs	12000 W Olympic Blvd & S Bundy Dr	34.0323712	-118.453135000000003	\N	\N	\N	\N	2014-03-07 00:48:43.906133	2014-03-07 00:48:43.906133
1092	179	OLYBUNWN	Olympic Wb & Bundy Ns	12000 W Olympic Blvd & S Bundy Dr	34.0326049000000026	-118.453442999999993	\N	\N	\N	\N	2014-03-07 00:48:43.91714	2014-03-07 00:48:43.91714
1093	184	OPRCENEN	Ocean Park Eb & Centinela Ns	3400 Ocean Park Blvd & S Centinela Ave	34.0228176000000033	-118.448990300000006	\N	\N	\N	\N	2014-03-07 00:48:43.928348	2014-03-07 00:48:43.928348
1094	185	OPRCENWF	Ocean Park Wb & Centinela Fs	3400 Ocean Park Blvd & S Centinela Ave	34.022980699999998	-118.449152900000001	\N	\N	\N	\N	2014-03-07 00:48:43.939412	2014-03-07 00:48:43.939412
1095	187	MNSHLSNN	Main Nb & Hill Ns	2700 Main St & Hill St	34.0008843000000027	-118.482277300000007	\N	\N	\N	\N	2014-03-07 00:48:43.950657	2014-03-07 00:48:43.950657
1096	188	BWY003WF	Broadway Wb & 3Rd Fs	300 Broadway & 3Rd St	34.0139658000000011	-118.494803899999994	\N	\N	\N	\N	2014-03-07 00:48:43.961698	2014-03-07 00:48:43.961698
1097	194	ROBCATNN	Robertson Nb & Cattaraugus Ns	2900 S Robertson Blvd & Cattaraugus Ave	34.0346120999999968	-118.389276800000005	\N	\N	\N	\N	2014-03-07 00:48:43.972753	2014-03-07 00:48:43.972753
1098	195	017PRLNN	17Th Nb & Pearl Ns	2300 17Th St & Pearl St	34.0151200000000031	-118.469519599999998	\N	\N	\N	\N	2014-03-07 00:48:43.983612	2014-03-07 00:48:43.983612
1099	196	VENCULEN	Venice Eb & Culver Ns	9000 Venice Blvd & Culver Blvd	34.0266347999999965	-118.3928315	\N	\N	\N	\N	2014-03-07 00:48:43.994999	2014-03-07 00:48:43.994999
1100	198	HOPL04NF	Hope Nb & 4Th Fs	400 S Hope St & W 4Th St	34.052546300000003	-118.253281799999996	\N	\N	\N	\N	2014-03-07 00:48:44.006049	2014-03-07 00:48:44.006049
1101	202	MNSMARSN	Main Sb & Marine Ns	2900 Main St & Marine St	33.9982976000000008	-118.479958199999999	\N	\N	\N	\N	2014-03-07 00:48:44.01728	2014-03-07 00:48:44.01728
1102	203	002COLSN	2Nd Sb & Colorado Ns	1500 2Nd St & Colorado Ave	34.0128297999999987	-118.494674599999996	\N	\N	\N	\N	2014-03-07 00:48:44.028308	2014-03-07 00:48:44.028308
1103	205	NATVENSN	National Eb & Venice Ns	8900 National Blvd & Venice Blvd	34.0295763000000022	-118.388631599999997	\N	\N	\N	\N	2014-03-07 00:48:44.039425	2014-03-07 00:48:44.039425
1104	206	PLMOVLEF	Palms Eb & Overland Fs	10600 Palms Blvd & Overland Ave	34.0248163999999989	-118.411257399999997	\N	\N	\N	\N	2014-03-07 00:48:44.050615	2014-03-07 00:48:44.050615
1105	208	PCOORNWN	Pico Wb & Orange Ns	5000 W Pico Blvd & S Orange Dr	34.0478650000000016	-118.346814699999996	\N	\N	\N	\N	2014-03-07 00:48:44.061669	2014-03-07 00:48:44.061669
1106	210	ROBCATSF	Robertson Sb & Cattaraugus Fs	2900 S Robertson Blvd & Cattaraugus Ave	34.034653800000001	-118.3894801	\N	\N	\N	\N	2014-03-07 00:48:44.072994	2014-03-07 00:48:44.072994
1107	211	VENCULWF	Venice Wb & Culver Fs	9000 Venice Blvd & Culver Blvd	34.0269813000000028	-118.392856600000002	\N	\N	\N	\N	2014-03-07 00:48:44.150747	2014-03-07 00:48:44.150747
1108	213	CHUSNTSN	Church Sb & Sunset Ns	100 N Church Ln & W Sunset Blvd	34.0733701999999994	-118.468448100000003	\N	\N	\N	\N	2014-03-07 00:48:44.161869	2014-03-07 00:48:44.161869
1109	214	NATKLTEN	National Eb & Kelton Ns	10900 National Blvd & Kelton Ave	34.0295981000000012	-118.422883100000007	\N	\N	\N	\N	2014-03-07 00:48:44.172997	2014-03-07 00:48:44.172997
1110	216	NATVENWF	National Wb & Venice Fs	8900 National Blvd & Venice Blvd	34.0296832000000009	-118.388470400000003	\N	\N	\N	\N	2014-03-07 00:48:44.184051	2014-03-07 00:48:44.184051
1111	218	CENVENSN	Centinela Sb & Venice Fs	3814 S Centinela Ave & Venice Blvd	34.0039220999999969	-118.433923699999994	\N	\N	\N	\N	2014-03-07 00:48:44.195961	2014-03-07 00:48:44.195961
1112	219	WILMCNEN	Wilshire Eb & Mc Clellan Ns	12400 Wilshire Blvd & Mc Clellan Dr	34.042045899999998	-118.469858700000003	\N	\N	\N	\N	2014-03-07 00:48:44.205328	2014-03-07 00:48:44.205328
1113	225	WILBSLWN	Wilshire Wb & Bonsall Ns	11300 Wilshire Blvd & Bonsall Ave	34.0546125999999987	-118.455690300000001	\N	\N	\N	\N	2014-03-07 00:48:44.217224	2014-03-07 00:48:44.217224
1114	227	SMB004EF	Santa Monica Eb & 4Th Fs	400 Santa Monica Blvd & 4Th St	34.0166692999999967	-118.494933000000003	\N	\N	\N	\N	2014-03-07 00:48:44.227556	2014-03-07 00:48:44.227556
1115	228	BUNPCOSN	Bundy Sb & Pico Ns	2300 S Bundy Dr & W Pico Blvd	34.0296074999999973	-118.450577699999997	\N	\N	\N	\N	2014-03-07 00:48:44.238824	2014-03-07 00:48:44.238824
1116	229	BUNPCONF	Bundy Nb & Pico Fs	2300 S Bundy Dr & W Pico Blvd	34.0296737999999976	-118.450442600000002	\N	\N	\N	\N	2014-03-07 00:48:44.305653	2014-03-07 00:48:44.305653
1117	230	SMBBUNWF	Santa Monica Wb & Bundy Fs	12100 Santa Monica Blvd & S Bundy Dr	34.0404636000000025	-118.463784899999993	\N	\N	\N	\N	2014-03-07 00:48:44.327422	2014-03-07 00:48:44.327422
1118	231	OPRLINEF	Ocean Park Eb & Lincoln Fs	800 Ocean Park Blvd & Lincoln Blvd	34.0071731000000028	-118.475765999999993	\N	\N	\N	\N	2014-03-07 00:48:44.468197	2014-03-07 00:48:44.468197
1119	232	OPRLINWF	Ocean Park Wb & Lincoln Fs	800 Ocean Park Blvd & Lincoln Blvd	34.0068344999999965	-118.476798900000006	\N	\N	\N	\N	2014-03-07 00:48:44.495079	2014-03-07 00:48:44.495079
1120	236	WWOPCOSF	Westwood Sb & Pico Fs	2400 Westwood Blvd & Pico Blvd	34.039725599999997	-118.428217799999999	\N	\N	\N	\N	2014-03-07 00:48:44.506653	2014-03-07 00:48:44.506653
1121	238	PCOWWOEF	Pico Eb & Westwood Fs	10900 W Pico Blvd & Westwood Blvd	34.0402527999999975	-118.4280373	\N	\N	\N	\N	2014-03-07 00:48:44.517206	2014-03-07 00:48:44.517206
1122	239	BEVPCONN	Beverly Dr Nb & Pico Ns	1400 S Beverly Dr & W. Pico Blvd	34.0547380000000004	-118.395294199999995	\N	\N	\N	\N	2014-03-07 00:48:44.527781	2014-03-07 00:48:44.527781
1123	240	BUNWILNN	Bundy Nb & Wilshire Ns	1200 S Bundy Dr & Wilshire Blvd	34.0438497999999967	-118.467105099999998	\N	\N	\N	\N	2014-03-07 00:48:44.539267	2014-03-07 00:48:44.539267
1124	241	BUNWILSN	Bundy Sb & Wilshire Ns	1100 S Bundy Dr & Wilshire Blvd	34.0442989000000011	-118.467781799999997	\N	\N	\N	\N	2014-03-07 00:48:44.549793	2014-03-07 00:48:44.549793
1125	243	CHQCDMSN	Chautauqua Sb & Corona Del Mar Ns	300 Chautauqua Blvd & Corona Del Mar	34.0315879999999993	-118.519115299999996	\N	\N	\N	\N	2014-03-07 00:48:44.561694	2014-03-07 00:48:44.561694
1126	244	BWY006WG	Broadway Wb & 6Th Fs2	600 Broadway & 6Th St	34.016100299999998	-118.492476300000007	\N	\N	\N	\N	2014-03-07 00:48:44.572807	2014-03-07 00:48:44.572807
1127	245	PCOLINEN	Pico Eb & Lincoln Ns	800 Pico Blvd & Lincoln Blvd.	34.0119900999999984	-118.4833395	\N	\N	\N	\N	2014-03-07 00:48:44.584095	2014-03-07 00:48:44.584095
1128	246	ROBPCOSF	Robertson Sb & Pico Fs	1400 S Robertson Blvd & W Pico Blvd	34.0543410000000009	-118.3839057	\N	\N	\N	\N	2014-03-07 00:48:44.594474	2014-03-07 00:48:44.594474
1129	248	PCOBEVEN	Pico Eb & Beverly Ns	9500 W Pico Blvd & S Beverly Dr	34.0551784999999967	-118.395650500000002	\N	\N	\N	\N	2014-03-07 00:48:44.605302	2014-03-07 00:48:44.605302
1130	249	PLMOVLWF	Palms Wb & Overland Fs	10700 Palms Blvd & Overland Ave	34.0245779999999982	-118.411919499999996	\N	\N	\N	\N	2014-03-07 00:48:44.617794	2014-03-07 00:48:44.617794
1131	257	OLYSAWWN	Olympic Wb & Sawtelle Ns	11300 W Olympic Blvd & Sawtelle Blvd	34.0385058000000029	-118.441138499999994	\N	\N	\N	\N	2014-03-07 00:48:44.628154	2014-03-07 00:48:44.628154
1132	258	HLGWHMSF	Hilgard Sb & Westholme Fs	600 Hilgard Ave & Westholme Ave	34.0693344999999965	-118.439120799999998	\N	\N	\N	\N	2014-03-07 00:48:44.639961	2014-03-07 00:48:44.639961
1133	259	SMB003EN	Santa Monica Eb & 3Rd Ns	300 Santa Monica Blvd & 3Rd St	34.0154397000000017	-118.496358499999999	\N	\N	\N	\N	2014-03-07 00:48:44.651135	2014-03-07 00:48:44.651135
1134	260	014PCONN	14Th Nb & Pico Ns	2000 14Th St & Pico Blvd	34.0155493000000035	-118.475374599999995	\N	\N	\N	\N	2014-03-07 00:48:44.662175	2014-03-07 00:48:44.662175
1135	261	HLGMNDSF	Hilgard Sb & Manning Dr Fs	800 Hilgard Ave & Manning Dr	34.0669548999999989	-118.439443699999998	\N	\N	\N	\N	2014-03-07 00:48:44.673325	2014-03-07 00:48:44.673325
1136	262	LINPRLSN	Lincoln Sb & Pearl Ns	2300 Lincoln Blvd & Pearl St	34.0095859999999988	-118.479801699999996	\N	\N	\N	\N	2014-03-07 00:48:44.68439	2014-03-07 00:48:44.68439
1137	265	BUNOLYNN	Bundy Nb & Olympic Ns	2100 S Bundy Dr & W. Olympic Blvd	34.0320244999999986	-118.453165499999997	\N	\N	\N	\N	2014-03-07 00:48:44.695683	2014-03-07 00:48:44.695683
1138	268	002BWYSF	2Nd Sb & Broadway Fs	1500 2Nd St & Colorado Ave	34.0130414999999999	-118.495010100000002	\N	\N	\N	\N	2014-03-07 00:48:44.706662	2014-03-07 00:48:44.706662
1139	269	ROBKNCNF	Robertson Nb & Kincardine Fs	3000 S Robertson Blvd & Kincardine Ave	34.0331496000000016	-118.389704800000004	\N	\N	\N	\N	2014-03-07 00:48:44.717811	2014-03-07 00:48:44.717811
1140	272	ALALASSN	Alameda Sb & Los Angeles Ns	800 N Alameda St & N Los Angeles St	34.0566067999999973	-118.237511299999994	\N	\N	\N	\N	2014-03-07 00:48:44.728882	2014-03-07 00:48:44.728882
1141	273	LASALISN	Los Angeles Sb & Aliso Ns	500 N Los Angeles St & W Aliso St	34.0550112999999968	-118.239528100000001	\N	\N	\N	\N	2014-03-07 00:48:44.740149	2014-03-07 00:48:44.740149
1142	274	LASTMPSM	Los Angeles Sb & Temple (Aliso)  Mb	200 N Los Angeles St & E Temple St	34.0543158999999989	-118.240180699999996	\N	\N	\N	\N	2014-03-07 00:48:44.751139	2014-03-07 00:48:44.751139
1143	275	WIL014WN	Wilshire Wb & 14Th Ns	1400 Wilshire Blvd & 14Th St	34.0270337999999981	-118.488809599999996	\N	\N	\N	\N	2014-03-07 00:48:44.762233	2014-03-07 00:48:44.762233
1144	276	WIL011WF	Wilshire Wb & 11Th Fs	1100 Wilshire Blvd & 11Th St	34.0243989000000013	-118.492013900000003	\N	\N	\N	\N	2014-03-07 00:48:44.773504	2014-03-07 00:48:44.773504
1145	277	WIL011EN	Wilshire Eb & 11Th Ns	1100 Wilshire Blvd & 11Th St	34.0243201999999982	-118.491768800000003	\N	\N	\N	\N	2014-03-07 00:48:44.784761	2014-03-07 00:48:44.784761
1146	278	WIL014EN	Wilshire Eb & 14Th Ns	1400 Wilshire Blvd & 14Th St	34.0266134000000022	-118.488941800000006	\N	\N	\N	\N	2014-03-07 00:48:44.795746	2014-03-07 00:48:44.795746
1147	279	014WILNF	14Th Nb & Wilshire Fs	1200 14Th St & Wilshire Blvd	34.0269176999999985	-118.488989700000005	\N	\N	\N	\N	2014-03-07 00:48:44.806896	2014-03-07 00:48:44.806896
1148	280	ROBKNCSN	Robertson Sb & Kincardine Ns	3000 S Robertson Blvd & Kincardine Ave	34.0330067000000014	-118.389940100000004	\N	\N	\N	\N	2014-03-07 00:48:44.818049	2014-03-07 00:48:44.818049
1149	281	SNTWBUWN	Sunset Wb & Woodburn Ns	11500 W Sunset Blvd & N Woodburn Dr	34.070043400000003	-118.469638099999997	\N	\N	\N	\N	2014-03-07 00:48:44.829182	2014-03-07 00:48:44.829182
1150	282	BUNGOSNN	Bundy Nb & Goshen Ns	1100 S Bundy Dr & Goshen Ave	34.0450376000000006	-118.467999000000006	\N	\N	\N	\N	2014-03-07 00:48:44.840252	2014-03-07 00:48:44.840252
1151	283	004PCONF	4Th Nb & Pico Fs	1800 4Th St & Pico Blvd	34.009986099999999	-118.4875629	\N	\N	\N	\N	2014-03-07 00:48:44.928802	2014-03-07 00:48:44.928802
1152	285	PCO006WN	Pico Wb & 6Th Ns	600 Pico Blvd & 6Th St	34.0112497000000005	-118.484945600000003	\N	\N	\N	\N	2014-03-07 00:48:44.939173	2014-03-07 00:48:44.939173
1153	286	PCO004WF	Pico Wb & 4Th Fs	400 Pico Blvd & 4Th St	34.0094988000000029	-118.4876364	\N	\N	\N	\N	2014-03-07 00:48:44.95026	2014-03-07 00:48:44.95026
1154	287	PCOMNSWN	Pico Wb & Main Ns	200 Pico Blvd & Main St	34.0084863000000013	-118.489077399999999	\N	\N	\N	\N	2014-03-07 00:48:44.961932	2014-03-07 00:48:44.961932
1155	288	OCECOLNN	Ocean Nb & Colorado Ns	1600 Ocean Ave & Colorado Ave	34.0112340000000017	-118.494504000000006	\N	\N	\N	\N	2014-03-07 00:48:44.973306	2014-03-07 00:48:44.973306
1156	289	OCESMBNN	Ocean Nb & Santa Monica Ns	1400 Ocean Ave & Santa Monica Blvd	34.0140090000000015	-118.497764099999998	\N	\N	\N	\N	2014-03-07 00:48:44.98423	2014-03-07 00:48:44.98423
1157	290	OCEBWYSF	Ocean Sb & Broadway Fs	1500 Ocean Ave & Broadway	34.0124422000000024	-118.496352400000006	\N	\N	\N	\N	2014-03-07 00:48:44.995323	2014-03-07 00:48:44.995323
1158	291	OCECOLSN	Ocean Sb & Colorado Ns	1500 Ocean Ave & Colorado Ave	34.011671800000002	-118.495434099999997	\N	\N	\N	\N	2014-03-07 00:48:45.005902	2014-03-07 00:48:45.005902
1159	292	002BWYNN	2Nd Nb & Broadway Ns	1500 2Nd St & Broadway	34.0133921999999984	-118.495295499999997	\N	\N	\N	\N	2014-03-07 00:48:45.017445	2014-03-07 00:48:45.017445
1160	293	002SMBNN	2Nd Nb & Santa Monica Ns	1400 2Nd St & Santa Monica Blvd	34.0147963000000004	-118.496816999999993	\N	\N	\N	\N	2014-03-07 00:48:45.028935	2014-03-07 00:48:45.028935
1161	296	OLYSEPWN	Olympic Wb & Sepulveda Ns	11000 W Olympic Blvd & S Sepulveda Blvd	34.0404918999999992	-118.437734899999995	\N	\N	\N	\N	2014-03-07 00:48:45.03938	2014-03-07 00:48:45.03938
1162	297	BUNOPRNN	Bundy Nb & Ocean Park Ns	2600 S Bundy Dr & Ocean Park Blvd	34.0243705999999975	-118.4460871	\N	\N	\N	\N	2014-03-07 00:48:45.117429	2014-03-07 00:48:45.117429
1163	298	BUNOPRSF	Bundy Sb & Ocean Park Fs	2600 S Bundy Dr & Ocean Park Blvd	34.0240358000000001	-118.446125800000004	\N	\N	\N	\N	2014-03-07 00:48:45.128899	2014-03-07 00:48:45.128899
1164	299	BUNNATSN	Bundy Sb & National Ns	3000 S Bundy Dr & National Blvd	34.0202065000000005	-118.445020900000003	\N	\N	\N	\N	2014-03-07 00:48:45.139786	2014-03-07 00:48:45.139786
1165	300	BUNNATNF	Bundy Nb & National Fs	3000 S Bundy Dr & National Blvd	34.020392600000001	-118.444868200000002	\N	\N	\N	\N	2014-03-07 00:48:45.151193	2014-03-07 00:48:45.151193
1166	301	LCNHLGWF	Le Conte Wb & Hilgard Fs	10800 Le Conte Ave & Hilgard Ave	34.0641377000000034	-118.441354700000005	\N	\N	\N	\N	2014-03-07 00:48:45.162463	2014-03-07 00:48:45.162463
1167	302	LCNTIVWF	Le Conte Wb & Tiverton Fs	10800 Le Conte Ave & Tiverton Ave	34.0637913999999995	-118.442829000000003	\N	\N	\N	\N	2014-03-07 00:48:45.17357	2014-03-07 00:48:45.17357
1168	303	WWOWEYSN	Westwood Sb & Weyburn Ns	1000 Westwood Blvd & Weyburn Ave	34.0627880999999988	-118.445454799999993	\N	\N	\N	\N	2014-03-07 00:48:45.184213	2014-03-07 00:48:45.184213
1169	304	WWOLNDSN	Westwood Sb & Lindbrook Ns	1100 Westwood Blvd & Lindbrook Dr	34.0598912999999968	-118.444879	\N	\N	\N	\N	2014-03-07 00:48:45.195343	2014-03-07 00:48:45.195343
1170	306	WWORCHSN	Westwood Sb & Rochester Ns	1400 Westwood Blvd & Rochester Ave	34.0562946000000011	-118.442476799999994	\N	\N	\N	\N	2014-03-07 00:48:45.206303	2014-03-07 00:48:45.206303
1171	307	WWOOHISN	Westwood Sb & Ohio Ns	1400 Westwood Blvd & Ohio Ave	34.0541730999999999	-118.440918499999995	\N	\N	\N	\N	2014-03-07 00:48:45.217666	2014-03-07 00:48:45.217666
1172	309	WWOSMBSN	Westwood Sb & Santa Monica Ns	1700 Westwood Blvd & Santa Monica Blvd	34.0504518999999988	-118.4376161	\N	\N	\N	\N	2014-03-07 00:48:45.229279	2014-03-07 00:48:45.229279
1173	310	SMBWWOWF	Santa Monica Wb & Westwood Fs	10800 Santa Monica Blvd & Westwood Blvd	34.0496593000000018	-118.437595099999996	\N	\N	\N	\N	2014-03-07 00:48:45.240046	2014-03-07 00:48:45.240046
1174	314	SMBSAWWN	Santa Monica Wb & Sawtelle Ns	11300 Santa Monica Blvd & Sawtelle Blvd	34.0466325000000012	-118.448006399999997	\N	\N	\N	\N	2014-03-07 00:48:45.251474	2014-03-07 00:48:45.251474
1175	315	SMBCRNWN	Santa Monica Wb & Corinth Ns	11300 Santa Monica Blvd & Corinth Ave	34.0462612999999976	-118.449529200000001	\N	\N	\N	\N	2014-03-07 00:48:45.262511	2014-03-07 00:48:45.262511
1176	316	SMBPRDWN	Santa Monica Wb & Purdue Ns	11400 Santa Monica Blvd & Purdue Ave	34.0459357000000011	-118.450589399999998	\N	\N	\N	\N	2014-03-07 00:48:45.273231	2014-03-07 00:48:45.273231
1177	317	SMBFEDWN	Santa Monica Wb & Federal Ns	11500 Santa Monica Blvd & Federal Ave	34.0447691999999975	-118.453913999999997	\N	\N	\N	\N	2014-03-07 00:48:45.28478	2014-03-07 00:48:45.28478
1178	318	SMBBARWN	Santa Monica Wb & Barrington Ns	11600 Santa Monica Blvd & S Barrington Ave	34.0438288	-118.455933599999994	\N	\N	\N	\N	2014-03-07 00:48:45.295688	2014-03-07 00:48:45.295688
1179	319	SMBWGTWN	Santa Monica Wb & Westgate Ns	11800 Santa Monica Blvd & S Westgate Ave	34.0424071999999995	-118.459117000000006	\N	\N	\N	\N	2014-03-07 00:48:45.306862	2014-03-07 00:48:45.306862
1180	320	SMBBTNWN	Santa Monica Wb & Brockton Ns	11900 Santa Monica Blvd & Brockton Ave	34.0415361000000019	-118.461174400000004	\N	\N	\N	\N	2014-03-07 00:48:45.317886	2014-03-07 00:48:45.317886
1181	321	SMBCENWF	Santa Monica Wb & Centinela Fs	3200 Santa Monica Blvd & Centinela Ave	34.0383921000000029	-118.468121400000001	\N	\N	\N	\N	2014-03-07 00:48:45.3292	2014-03-07 00:48:45.3292
1182	322	SMBBRKWN	Santa Monica Wb & Berkeley Ns	3000 Santa Monica Blvd & Berkeley St	34.0372398000000018	-118.469567699999999	\N	\N	\N	\N	2014-03-07 00:48:45.340101	2014-03-07 00:48:45.340101
1183	323	SMBYLEWF	Santa Monica Wb & Yale Fs	2900 Santa Monica Blvd & Yale St	34.0354980999999981	-118.471743200000006	\N	\N	\N	\N	2014-03-07 00:48:45.417882	2014-03-07 00:48:45.417882
1184	324	SMB026WN	Santa Monica Wb & 26Th Ns	2600 Santa Monica Blvd & 26Th St	34.0335156000000012	-118.474170999999998	\N	\N	\N	\N	2014-03-07 00:48:45.429035	2014-03-07 00:48:45.429035
1185	325	SMBCLVWN	Santa Monica Wb & Cloverfield Ns	2400 Santa Monica Blvd & Cloverfield Blvd	34.0313313999999991	-118.4768914	\N	\N	\N	\N	2014-03-07 00:48:45.440087	2014-03-07 00:48:45.440087
1186	326	SMB022WN	Santa Monica Wb & 22Nd Ns	2200 Santa Monica Blvd & 22Nd St	34.0303481999999988	-118.478210399999995	\N	\N	\N	\N	2014-03-07 00:48:45.450683	2014-03-07 00:48:45.450683
1187	327	SMB020WF	Santa Monica Wb & 20Th Fs	2000 Santa Monica Blvd & 20Th St	34.0284255999999985	-118.480428399999994	\N	\N	\N	\N	2014-03-07 00:48:45.461952	2014-03-07 00:48:45.461952
1188	328	SMB018WN	Santa Monica Wb & 18Th Ns	1800 Santa Monica Blvd & 18Th St	34.0273123999999996	-118.481856699999994	\N	\N	\N	\N	2014-03-07 00:48:45.472915	2014-03-07 00:48:45.472915
1189	329	SMB016WN	Santa Monica Wb & 16Th Ns	1600 Santa Monica Blvd & 16Th St	34.0257440999999972	-118.483758300000005	\N	\N	\N	\N	2014-03-07 00:48:45.48417	2014-03-07 00:48:45.48417
1190	330	SMB014WN	Santa Monica Wb & 14Th Ns	1400 Santa Monica Blvd & 14Th St	34.0242124000000032	-118.485649600000002	\N	\N	\N	\N	2014-03-07 00:48:45.495779	2014-03-07 00:48:45.495779
1191	331	SMB011WF	Santa Monica Wb & 11Th Fs	1100 Santa Monica Blvd & 11Th St	34.0216733999999974	-118.488766200000001	\N	\N	\N	\N	2014-03-07 00:48:45.506335	2014-03-07 00:48:45.506335
1192	332	SMBLINWN	Santa Monica Wb & Lincoln Ns	800 Santa Monica Blvd & Lincoln Blvd	34.0196431999999973	-118.491271800000007	\N	\N	\N	\N	2014-03-07 00:48:45.517783	2014-03-07 00:48:45.517783
1193	333	MNSBAYSN	Main Sb & Bay Ns	1900 Main St & Bay St	34.0072672000000011	-118.489125200000004	\N	\N	\N	\N	2014-03-07 00:48:45.550411	2014-03-07 00:48:45.550411
1194	334	MNSPCSSN	Main Sb & Pacific Ns	2200 Main St & Pacific St.	34.0057000999999985	-118.4876115	\N	\N	\N	\N	2014-03-07 00:48:45.583614	2014-03-07 00:48:45.583614
1195	335	MNSHOLSN	Main Sb & Hollister Ns	2500 Main St & Hollister Ave	34.004413900000003	-118.486286000000007	\N	\N	\N	\N	2014-03-07 00:48:45.594724	2014-03-07 00:48:45.594724
1196	336	MNSOPRSF	Main Sb & Ocean Park Fs	2600 Main St & Ocean Park Blvd	34.0019215000000017	-118.483617899999999	\N	\N	\N	\N	2014-03-07 00:48:45.607034	2014-03-07 00:48:45.607034
1197	337	OPRMNSEF	Ocean Park Eb & Main Fs	200 Ocean Park Blvd & Main St	34.002461799999999	-118.483567300000004	\N	\N	\N	\N	2014-03-07 00:48:45.617877	2014-03-07 00:48:45.617877
1198	338	MNSOPRNF	Main Nb & Ocean Park Fs	2600 Main St & Ocean Park Blvd	34.0025143000000014	-118.483971100000005	\N	\N	\N	\N	2014-03-07 00:48:45.629105	2014-03-07 00:48:45.629105
1199	339	OPRMNSWN	Ocean Park Wb & Main Ns	200 Ocean Park Blvd & Main St	34.0025417000000019	-118.483737700000006	\N	\N	\N	\N	2014-03-07 00:48:45.639343	2014-03-07 00:48:45.639343
1200	340	MNSHLSSN	Main Sb & Hill Ns	2700 Main St & Hill St	34.0010452000000001	-118.482739199999997	\N	\N	\N	\N	2014-03-07 00:48:45.650259	2014-03-07 00:48:45.650259
1201	341	MNSASLSN	Main Sb & Ashland Ns	2800 Main St & Ashland Ave	33.9995996000000034	-118.481334899999993	\N	\N	\N	\N	2014-03-07 00:48:45.662173	2014-03-07 00:48:45.662173
1202	343	MNSRSESF	Main Sb & Rose Fs	300 Main St & Rose Ave	33.9958870999999974	-118.477630700000006	\N	\N	\N	\N	2014-03-07 00:48:45.729081	2014-03-07 00:48:45.729081
1203	344	MNSSNVSF	Main Sb & Sunset Fs	400 Main St & Sunset Ave	33.9941461000000018	-118.476004099999997	\N	\N	\N	\N	2014-03-07 00:48:45.739766	2014-03-07 00:48:45.739766
1204	345	MNSBKSSF	Main Sb & Brooks Fs	800 Main St & Brooks Ave	33.9919976999999989	-118.473974100000007	\N	\N	\N	\N	2014-03-07 00:48:45.751186	2014-03-07 00:48:45.751186
1205	346	MNSWSMSN	Main Sb & Westminster Ns	1100 Main St & Westminster Ave	33.9901765999999981	-118.472750000000005	\N	\N	\N	\N	2014-03-07 00:48:45.76235	2014-03-07 00:48:45.76235
1206	347	PCO014EF	Pico Eb & 14Th Fs	1400 Pico Blvd & 14Th St	34.0161771000000002	-118.475524500000006	\N	\N	\N	\N	2014-03-07 00:48:45.773254	2014-03-07 00:48:45.773254
1207	348	PCO016EF	Pico Eb & 16Th Fs	1600 Pico Blvd & 16Th St	34.0171987000000016	-118.473603699999998	\N	\N	\N	\N	2014-03-07 00:48:45.784698	2014-03-07 00:48:45.784698
1208	349	PCO018EF	Pico Eb & 18Th Fs	1800 Pico Blvd & 18Th St	34.0184297999999998	-118.471244400000003	\N	\N	\N	\N	2014-03-07 00:48:45.795962	2014-03-07 00:48:45.795962
1209	350	PCO020EN	Pico Eb & 20Th Ns	2000 Pico Blvd & 20Th St	34.0192793000000009	-118.469726899999998	\N	\N	\N	\N	2014-03-07 00:48:45.8069	2014-03-07 00:48:45.8069
1210	351	PCO023EN	Pico Eb & 23Rd Ns	2300 Pico Blvd & 23Rd St	34.020917500000003	-118.466684400000005	\N	\N	\N	\N	2014-03-07 00:48:45.818068	2014-03-07 00:48:45.818068
1211	352	PCOCLVEF	Pico Eb & Cloverfield Fs	2400 Pico Blvd & Cloverfield Blvd	34.0217761999999979	-118.465059999999994	\N	\N	\N	\N	2014-03-07 00:48:45.829174	2014-03-07 00:48:45.829174
1212	353	PCO026EF	Pico Eb & 26Th Fs	2600 Pico Blvd & 26Th St	34.0233557999999974	-118.462144800000004	\N	\N	\N	\N	2014-03-07 00:48:45.840221	2014-03-07 00:48:45.840221
1213	354	PCO028EN	Pico Eb & 28Th Ns	2800 Pico Blvd & 28Th St	34.0241497000000024	-118.460623799999993	\N	\N	\N	\N	2014-03-07 00:48:45.850982	2014-03-07 00:48:45.850982
1214	355	PCO030EN	Pico Eb & 30Th Ns	3000 Pico Blvd & 30Th St	34.0252377999999993	-118.458571000000006	\N	\N	\N	\N	2014-03-07 00:48:45.862596	2014-03-07 00:48:45.862596
1215	356	PCO033EN	Pico Eb & 33Rd Ns	3300 Pico Blvd & 33Rd St	34.0267898000000031	-118.4554531	\N	\N	\N	\N	2014-03-07 00:48:45.873001	2014-03-07 00:48:45.873001
1216	357	PCOCENEF	Pico Eb & Centinela Fs	12200 W Pico Blvd & S Centinela Ave	34.0282344000000023	-118.452393299999997	\N	\N	\N	\N	2014-03-07 00:48:45.8844	2014-03-07 00:48:45.8844
1217	358	PCOBAREN	Pico Eb & Barrington Ns	11700 W Pico Blvd & S Barrington Ave	34.0314301000000015	-118.445901899999996	\N	\N	\N	\N	2014-03-07 00:48:45.895441	2014-03-07 00:48:45.895441
1218	359	PCOBARWN	Pico Wb & Barrington Ns	11600 W Pico Blvd & S Barrington Ave	34.031839699999999	-118.445505999999995	\N	\N	\N	\N	2014-03-07 00:48:45.906842	2014-03-07 00:48:45.906842
1219	360	MNSWSMNF	Main Nb & Westminster Fs	1100 Main St & Westminster Ave	33.9903138000000027	-118.472601699999998	\N	\N	\N	\N	2014-03-07 00:48:45.918086	2014-03-07 00:48:45.918086
1220	361	MNSABKNN	Main Nb & Abbot Kinney Ns	800 Main St & Abbot Kinney Blvd	33.9921514999999985	-118.473901100000006	\N	\N	\N	\N	2014-03-07 00:48:45.929038	2014-03-07 00:48:45.929038
1221	362	MNSSNVNF	Main Nb & Sunset Fs	400 Main St & Sunset Ave	33.9947943000000024	-118.476420099999999	\N	\N	\N	\N	2014-03-07 00:48:45.940116	2014-03-07 00:48:45.940116
1222	363	MNSRSENN	Main Nb & Rose Ns	300 Main St & Rose Ave	33.9959788999999972	-118.477465899999999	\N	\N	\N	\N	2014-03-07 00:48:45.951032	2014-03-07 00:48:45.951032
1223	364	MNSASLNN	Main Nb & Ashland Ns	2800 Main St & Ashland Ave	33.9994908999999979	-118.480899199999996	\N	\N	\N	\N	2014-03-07 00:48:46.018114	2014-03-07 00:48:46.018114
1224	365	MNSHOLNN	Main Nb & Hollister Ns	2400 Main St & Hollister Ave	34.004034500000003	-118.485521199999994	\N	\N	\N	\N	2014-03-07 00:48:46.029651	2014-03-07 00:48:46.029651
1225	366	MNSPCSNN	Main Nb & Pacific Ns	2200 Main St & Pacific St	34.005547700000001	-118.487167600000006	\N	\N	\N	\N	2014-03-07 00:48:46.040182	2014-03-07 00:48:46.040182
1227	368	SMBLINEN	Santa Monica Eb & Lincoln Ns	800 Santa Monica Blvd & Lincoln Blvd	34.0193167999999986	-118.491536800000006	\N	\N	\N	\N	2014-03-07 00:48:46.062345	2014-03-07 00:48:46.062345
1228	369	SMB011EN	Santa Monica Eb & 11Th Ns	1100 Santa Monica Blvd & 11Th St	34.0215978000000021	-118.488693400000002	\N	\N	\N	\N	2014-03-07 00:48:46.073496	2014-03-07 00:48:46.073496
1229	370	SMB014EN	Santa Monica Eb & 14Th Ns	1400 Santa Monica Blvd & 14Th St	34.0238372999999967	-118.485905500000001	\N	\N	\N	\N	2014-03-07 00:48:46.084303	2014-03-07 00:48:46.084303
1230	371	SMB016EN	Santa Monica Eb & 16Th Ns	1600 Santa Monica Blvd & 16Th St	34.025464999999997	-118.483931900000002	\N	\N	\N	\N	2014-03-07 00:48:46.095971	2014-03-07 00:48:46.095971
1231	372	SMB018EN	Santa Monica Eb & 18Th Ns	1800 Santa Monica Blvd & 18Th St	34.0270281999999966	-118.482040799999993	\N	\N	\N	\N	2014-03-07 00:48:46.107277	2014-03-07 00:48:46.107277
1232	373	SMB020EF	Santa Monica Eb & 20Th Fs	2000 Santa Monica Blvd & 20Th St	34.0290577000000027	-118.479774699999993	\N	\N	\N	\N	2014-03-07 00:48:46.118	2014-03-07 00:48:46.118
1233	374	SMB022EF	Santa Monica Eb & 22Nd Fs	2200 Santa Monica Blvd & 22Nd St	34.0301831000000021	-118.478065799999996	\N	\N	\N	\N	2014-03-07 00:48:46.129303	2014-03-07 00:48:46.129303
1234	375	SMBCLVEF	Santa Monica Eb & Cloverfield Fs	2400 Santa Monica Blvd & Cloverfield Blvd	34.0313688000000028	-118.476633800000002	\N	\N	\N	\N	2014-03-07 00:48:46.140445	2014-03-07 00:48:46.140445
1235	376	SMB026EN	Santa Monica Eb & 26Th Ns	2600 Santa Monica Blvd & 26Th St	34.0331430999999967	-118.474415300000004	\N	\N	\N	\N	2014-03-07 00:48:46.15113	2014-03-07 00:48:46.15113
1236	377	NATBAREF	National Eb & Barrington Fs	11600 National Blvd & S Barrington Ave	34.0228581000000005	-118.438248700000003	\N	\N	\N	\N	2014-03-07 00:48:46.162671	2014-03-07 00:48:46.162671
1237	378	SMBBRKEN	Santa Monica Eb & Berkeley Ns	3000 Santa Monica Blvd & Berkeley St	34.036958300000002	-118.469626300000002	\N	\N	\N	\N	2014-03-07 00:48:46.173624	2014-03-07 00:48:46.173624
1238	379	SMBWLSEN	Santa Monica Eb & Wellesley Ns	12100 Santa Monica Blvd & Wellesley Ave	34.0395065000000017	-118.4655439	\N	\N	\N	\N	2014-03-07 00:48:46.184456	2014-03-07 00:48:46.184456
1239	380	SMBBTNEN	Santa Monica Eb & Brockton Ns	11900 Santa Monica Blvd & Brockton Ave	34.0412411000000006	-118.461476899999994	\N	\N	\N	\N	2014-03-07 00:48:46.195621	2014-03-07 00:48:46.195621
1240	381	SMBBAREN	Santa Monica Eb & Barrington Ns	11600 Santa Monica Blvd & S Barrington Ave	34.0436241000000024	-118.456139399999998	\N	\N	\N	\N	2014-03-07 00:48:46.206893	2014-03-07 00:48:46.206893
1241	382	SMBFEDEF	Santa Monica Eb & Federal Fs	11500 Santa Monica Blvd & Federal Ave	34.0447941999999983	-118.453559400000003	\N	\N	\N	\N	2014-03-07 00:48:46.218064	2014-03-07 00:48:46.218064
1242	384	SMBCRNEN	Santa Monica Eb & Corinth Ns	11300 Santa Monica Blvd & Corinth Ave	34.0460356000000033	-118.449696599999996	\N	\N	\N	\N	2014-03-07 00:48:46.229524	2014-03-07 00:48:46.229524
1243	385	SMBSAWEN	Santa Monica Eb & Sawtelle Ns	11300 Santa Monica Blvd & Sawtelle Blvd	34.046391100000001	-118.448538799999994	\N	\N	\N	\N	2014-03-07 00:48:46.240472	2014-03-07 00:48:46.240472
1244	387	SMBSEPEF	Santa Monica Eb & Sepulveda Fs	11100 Santa Monica Blvd & Southern Pacific Railroad	34.0477089000000035	-118.4435225	\N	\N	\N	\N	2014-03-07 00:48:46.251723	2014-03-07 00:48:46.251723
1245	388	SMBVETEN	Santa Monica Eb & Veteran Ns	11000 Santa Monica Blvd & Greenfield Ave	34.0486207000000007	-118.440216599999999	\N	\N	\N	\N	2014-03-07 00:48:46.263178	2014-03-07 00:48:46.263178
1246	389	WWOSMBNF	Westwood Nb & Santa Monica Fs	1800 Westwood Blvd & Santa Monica Blvd	34.0503071999999989	-118.437283600000001	\N	\N	\N	\N	2014-03-07 00:48:46.273749	2014-03-07 00:48:46.273749
1247	391	WWOOLYNF	Westwood Nb & Olympic Fs	2200 Westwood Blvd & W Olympic Blvd	34.044226799999997	-118.431886000000006	\N	\N	\N	\N	2014-03-07 00:48:46.285109	2014-03-07 00:48:46.285109
1248	392	WWOLGRNN	Westwood Nb & La Grange Ns	2000 Westwood Blvd & La Grange Ave	34.0466083000000026	-118.433967300000006	\N	\N	\N	\N	2014-03-07 00:48:46.29614	2014-03-07 00:48:46.29614
1249	393	WWOMISNN	Westwood Nb & Missouri Ns	1900 Westwood Blvd & Missouri Ave	34.0480883000000034	-118.435258300000001	\N	\N	\N	\N	2014-03-07 00:48:46.384573	2014-03-07 00:48:46.384573
1250	394	NATBARWN	National Wb & Barrington Ns	11600 National Blvd & S Barrington Ave	34.0229782999999983	-118.438375800000003	\N	\N	\N	\N	2014-03-07 00:48:46.395416	2014-03-07 00:48:46.395416
1251	395	WWOMASNN	Westwood Nb & Massachusetts Ns	1700 Westwood Blvd & Massachusetts Ave	34.0517224000000027	-118.438513299999997	\N	\N	\N	\N	2014-03-07 00:48:46.407001	2014-03-07 00:48:46.407001
1252	396	WWOOHINN	Westwood Nb & Ohio Ns	1500 Westwood Blvd & Ohio Ave	34.0539790999999994	-118.440479400000001	\N	\N	\N	\N	2014-03-07 00:48:46.418527	2014-03-07 00:48:46.418527
1253	397	WWORCHNN	Westwood Nb & Rochester Ns	1300 Westwood Blvd & Rochester Ave	34.0559543999999974	-118.442034800000002	\N	\N	\N	\N	2014-03-07 00:48:46.429153	2014-03-07 00:48:46.429153
1254	398	WWOWILNN	Westwood Nb & Wilshire Ns	1200 Westwood Blvd & Wilshire Blvd	34.058562000000002	-118.443575899999999	\N	\N	\N	\N	2014-03-07 00:48:46.44051	2014-03-07 00:48:46.44051
1255	399	WWOLNDNN	Westwood Nb & Lindbrook Ns	1100 Westwood Blvd & Lindbrook Dr	34.0594547000000034	-118.444370699999993	\N	\N	\N	\N	2014-03-07 00:48:46.451602	2014-03-07 00:48:46.451602
1256	400	WILVETEN	Wilshire Eb & Veteran Ns	11000 Wilshire Blvd & Veteran Ave	34.0575799000000004	-118.447905199999994	\N	\N	\N	\N	2014-03-07 00:48:46.462682	2014-03-07 00:48:46.462682
1257	401	WILVETWN	Wilshire Wb & Veteran Ns	11000 Wilshire Blvd & Veteran Ave	34.0579795000000018	-118.447519	\N	\N	\N	\N	2014-03-07 00:48:46.473597	2014-03-07 00:48:46.473597
1258	402	WWOWEYNN	Westwood Nb & Weyburn Ns	1000 Westwood Blvd & Weyburn Ave	34.0624205000000018	-118.445406599999998	\N	\N	\N	\N	2014-03-07 00:48:46.484863	2014-03-07 00:48:46.484863
1259	403	LCNTIVEN	Le Conte Eb & Tiverton Ns	10800 Le Conte Ave & Tiverton Ave	34.0636709999999994	-118.442728000000002	\N	\N	\N	\N	2014-03-07 00:48:46.496369	2014-03-07 00:48:46.496369
1260	404	HLGLCNNF	Hilgard Nb & Le Conte Fs	900 Hilgard Ave & Le Conte Ave	34.0645011000000011	-118.440903599999999	\N	\N	\N	\N	2014-03-07 00:48:46.507002	2014-03-07 00:48:46.507002
1261	405	HLGMNGNN	Hilgard Nb & Manning Ave Ns	800 Hilgard Ave & Manning Ave	34.0664398999999989	-118.439665500000004	\N	\N	\N	\N	2014-03-07 00:48:46.518165	2014-03-07 00:48:46.518165
1262	406	HLGWHMNN	Hilgard Nb & Westholme Ns	600 Hilgard Ave & Westholme Ave	34.0694032000000036	-118.438928599999997	\N	\N	\N	\N	2014-03-07 00:48:46.529599	2014-03-07 00:48:46.529599
1263	407	WILSVSWF	Wilshire Wb & San Vicente Fs	11600 Wilshire Blvd & W San Vicente Blvd	34.0507898999999981	-118.459649900000002	\N	\N	\N	\N	2014-03-07 00:48:46.54034	2014-03-07 00:48:46.54034
1264	408	WILFEDEN	Wilshire Eb & Federal Ns	11600 Wilshire Blvd & Federal Ave	34.0506805999999997	-118.459521499999994	\N	\N	\N	\N	2014-03-07 00:48:46.55171	2014-03-07 00:48:46.55171
1265	409	WILBARWF	Wilshire Wb & Barrington Fs	11600 Wilshire Blvd & S Barrington Ave	34.0494801999999979	-118.461183899999995	\N	\N	\N	\N	2014-03-07 00:48:46.562869	2014-03-07 00:48:46.562869
1266	410	WILBAREN	Wilshire Eb & Barrington Ns	11600 Wilshire Blvd & S Barrington Ave	34.0492064000000028	-118.461051299999994	\N	\N	\N	\N	2014-03-07 00:48:46.574241	2014-03-07 00:48:46.574241
1267	411	WILWGTWN	Wilshire Wb & Westgate Ns	11800 Wilshire Blvd & S Westgate Ave	34.0475338999999977	-118.463465200000002	\N	\N	\N	\N	2014-03-07 00:48:46.585266	2014-03-07 00:48:46.585266
1268	412	WILWGTEN	Wilshire Eb & Westgate Ns	11800 Wilshire Blvd & S Westgate Ave	34.0472090000000023	-118.463567400000002	\N	\N	\N	\N	2014-03-07 00:48:46.595933	2014-03-07 00:48:46.595933
1269	413	WILBTNWN	Wilshire Wb & Brockton Ns	11900 Wilshire Blvd & Brockton Ave	34.0461651999999972	-118.465051099999997	\N	\N	\N	\N	2014-03-07 00:48:46.607562	2014-03-07 00:48:46.607562
1270	414	WILBTNEN	Wilshire Eb & Brockton Ns	11900 Wilshire Blvd & Brockton Ave	34.0457622999999998	-118.465254000000002	\N	\N	\N	\N	2014-03-07 00:48:46.618205	2014-03-07 00:48:46.618205
1271	415	WILCRMWN	Wilshire Wb & Carmelina Ns	12200 Wilshire Blvd & S Carmelina Ave	34.0419899999999984	-118.470303900000005	\N	\N	\N	\N	2014-03-07 00:48:46.630142	2014-03-07 00:48:46.630142
1272	416	WILBRKWN	Wilshire Wb & Berkeley Ns	3100 Wilshire Blvd & Berkeley St	34.0399875000000023	-118.472738300000003	\N	\N	\N	\N	2014-03-07 00:48:46.640695	2014-03-07 00:48:46.640695
1273	417	WILYLEWN	Wilshire Wb & Yale Ns	2900 Wilshire Blvd & Yale St	34.0383615000000006	-118.474556800000002	\N	\N	\N	\N	2014-03-07 00:48:46.65185	2014-03-07 00:48:46.65185
1274	418	WIL026WN	Wilshire Wb & 26Th Ns	2600 Wilshire Blvd & 26Th St	34.0362982999999986	-118.477333400000006	\N	\N	\N	\N	2014-03-07 00:48:46.662973	2014-03-07 00:48:46.662973
1275	419	WIL024WN	Wilshire Wb & 24Th Ns	2400 Wilshire Blvd & 24Th St	34.0342585	-118.479812199999998	\N	\N	\N	\N	2014-03-07 00:48:46.674152	2014-03-07 00:48:46.674152
1276	420	WIL022WN	Wilshire Wb & 22Nd Ns	2200 Wilshire Blvd & 22Nd St	34.0329082000000014	-118.481453400000007	\N	\N	\N	\N	2014-03-07 00:48:46.68527	2014-03-07 00:48:46.68527
1277	421	WIL020WN	Wilshire Wb & 20Th Ns	2000 Wilshire Blvd & 20Th St	34.0316234000000009	-118.483154299999995	\N	\N	\N	\N	2014-03-07 00:48:46.696265	2014-03-07 00:48:46.696265
1278	422	020WILSF	20Th Sb & Wilshire Fs	1200 20Th St & Wilshire Blvd	34.031154800000003	-118.4830434	\N	\N	\N	\N	2014-03-07 00:48:46.707454	2014-03-07 00:48:46.707454
1279	423	020ARZSN	20Th Sb & Arizona Ns	1200 20Th St & Arizona Ave	34.0301375000000021	-118.481843100000006	\N	\N	\N	\N	2014-03-07 00:48:46.718561	2014-03-07 00:48:46.718561
1280	424	WIL018WN	Wilshire Wb & 18Th Ns	1800 Wilshire Blvd & 18Th St	34.0300780999999972	-118.485066700000004	\N	\N	\N	\N	2014-03-07 00:48:46.72971	2014-03-07 00:48:46.72971
1281	425	WIL016WN	Wilshire Wb & 16Th Ns	1600 Wilshire Blvd & 16Th St	34.0285887000000002	-118.486873700000004	\N	\N	\N	\N	2014-03-07 00:48:46.740791	2014-03-07 00:48:46.740791
1282	426	WILLINWN	Wilshire Wb & Lincoln Ns	800 Wilshire Blvd & Lincoln Blvd	34.0224357999999967	-118.494483200000005	\N	\N	\N	\N	2014-03-07 00:48:46.751916	2014-03-07 00:48:46.751916
1283	427	WIL006WN	Wilshire Wb & 6Th Ns	600 Wilshire Blvd & 6Th St	34.0208432000000016	-118.496360699999997	\N	\N	\N	\N	2014-03-07 00:48:46.818156	2014-03-07 00:48:46.818156
1284	428	LINWILSN	Lincoln Sb & Wilshire Ns	1100 Lincoln Blvd & Wilshire Blvd	34.0223341000000019	-118.494801300000006	\N	\N	\N	\N	2014-03-07 00:48:46.829621	2014-03-07 00:48:46.829621
1285	430	004BWYSN	4Th Sb & Broadway Ns	1400 4Th St & Broadway	34.015149000000001	-118.493762700000005	\N	\N	\N	\N	2014-03-07 00:48:46.84064	2014-03-07 00:48:46.84064
1286	431	004BWYNN	4Th Nb & Broadway Ns	1500 4Th St & Broadway	34.0150203000000033	-118.493362500000003	\N	\N	\N	\N	2014-03-07 00:48:46.851673	2014-03-07 00:48:46.851673
1287	432	004ARZNF	4Th Nb & Arizona Fs	1200 4Th St & Arizona Ave	34.0179524999999998	-118.496885000000006	\N	\N	\N	\N	2014-03-07 00:48:46.862449	2014-03-07 00:48:46.862449
1288	439	OPR004WF	Ocean Park Wb & 4Th Fs	400 Ocean Park Blvd & 4Th St	34.003906299999997	-118.481815600000004	\N	\N	\N	\N	2014-03-07 00:48:46.873851	2014-03-07 00:48:46.873851
1289	440	OPR004EF	Ocean Park Eb & 4Th Fs	400 Ocean Park Blvd & 4Th St	34.004010700000002	-118.481005300000007	\N	\N	\N	\N	2014-03-07 00:48:46.885221	2014-03-07 00:48:46.885221
1290	441	MNSPCONF	Main Nb & Pico Fs	1800 Main St & Pico Blvd.	34.0083178000000004	-118.4897536	\N	\N	\N	\N	2014-03-07 00:48:46.896449	2014-03-07 00:48:46.896449
1291	452	RIVWNDNF	Riviera Nb & Windward Fs	1300 Riviera Ave & Windward Ave	33.9895344999999978	-118.469458500000002	\N	\N	\N	\N	2014-03-07 00:48:46.907541	2014-03-07 00:48:46.907541
1292	453	WSMABKNN	Westminster Nb & Abbot Kinney Ns	300 Westminster Ave & Abbot Kinney Blvd	33.9916839999999993	-118.4706853	\N	\N	\N	\N	2014-03-07 00:48:46.919	2014-03-07 00:48:46.919
1293	455	CLLSHLEN	California Eb & Shell Ns	600 California Ave & Shell Ave	33.9929425999999992	-118.464429699999997	\N	\N	\N	\N	2014-03-07 00:48:46.929659	2014-03-07 00:48:46.929659
1294	456	CLLOAKEN	California Eb & Oakwood Ns	700 California Ave & Oakwood Ave	33.9946462999999994	-118.463237899999996	\N	\N	\N	\N	2014-03-07 00:48:46.940732	2014-03-07 00:48:46.940732
1295	457	CLLLDNEN	California Eb & Linden Ns	900 California Ave & Linden Ave	33.9963131000000018	-118.462110899999999	\N	\N	\N	\N	2014-03-07 00:48:46.952121	2014-03-07 00:48:46.952121
1296	458	CLLLINEN	California Eb & Lincoln Ns	900 California Ave & Lincoln Blvd	33.9978426999999996	-118.461010400000006	\N	\N	\N	\N	2014-03-07 00:48:46.963138	2014-03-07 00:48:46.963138
1297	459	SPBLINEF	Superba Eb & Lincoln Fs	1000 Superba Ave & Lincoln Blvd	33.9966042000000002	-118.457290999999998	\N	\N	\N	\N	2014-03-07 00:48:46.974201	2014-03-07 00:48:46.974201
1298	460	LINSPBNN	Lincoln Nb & Superba Ns	1800 Lincoln Blvd & Superba Ave	33.9963570000000033	-118.457272200000006	\N	\N	\N	\N	2014-03-07 00:48:46.985024	2014-03-07 00:48:46.985024
1299	462	SPBPNMEN	Superba Eb & Penmar Ns	1100 Superba Ave & Penmar Ave	33.9997642000000013	-118.455074999999994	\N	\N	\N	\N	2014-03-07 00:48:46.996006	2014-03-07 00:48:46.996006
1300	463	VICPNMEF	Victoria Eb & Penmar Fs	1200 Victoria Ave & Penmar Ave	33.9976308999999972	-118.452929900000001	\N	\N	\N	\N	2014-03-07 00:48:47.007343	2014-03-07 00:48:47.007343
1301	464	VICLOUEN	Victoria Eb & Louella Ns	1300 Victoria Ave & Louella Ave	33.998915199999999	-118.450479799999997	\N	\N	\N	\N	2014-03-07 00:48:47.018545	2014-03-07 00:48:47.018545
1302	465	VENGLYWN	Venice Wb & Glyndon Ns	1400 N Venice Blvd & Glyndon Ave	33.9960158000000021	-118.449145400000006	\N	\N	\N	\N	2014-03-07 00:48:47.02985	2014-03-07 00:48:47.02985
1303	466	VENLINWN	Venice Wb & Lincoln Ns	1100 N Venice Blvd & Lincoln Blvd	33.9942998000000003	-118.452619999999996	\N	\N	\N	\N	2014-03-07 00:48:47.040337	2014-03-07 00:48:47.040337
1304	467	CLLLINWF	California Wb & Lincoln Fs	900 California Ave & Lincoln Blvd	33.997632099999997	-118.461275499999999	\N	\N	\N	\N	2014-03-07 00:48:47.051992	2014-03-07 00:48:47.051992
1305	468	LINZNJNN	Lincoln Nb & Zanja Ns	2500 Lincoln Blvd & Zanja St	33.9922887000000031	-118.449266199999997	\N	\N	\N	\N	2014-03-07 00:48:47.06273	2014-03-07 00:48:47.06273
1306	469	LINVENNN	Lincoln Nb & Venice Ns	2400 Lincoln Blvd & Venice Blvd	33.9939070000000001	-118.452276699999999	\N	\N	\N	\N	2014-03-07 00:48:47.074436	2014-03-07 00:48:47.074436
1307	470	LINPLMNN	Lincoln Nb & Palms Ns	1600 Lincoln Blvd & Palms Blvd	33.9971330999999992	-118.458964499999993	\N	\N	\N	\N	2014-03-07 00:48:47.085061	2014-03-07 00:48:47.085061
1308	473	LINPLMSN	Lincoln Sb & Palms Ns	1500 Lincoln Blvd & Palms Blvd	33.9970889000000014	-118.459265799999997	\N	\N	\N	\N	2014-03-07 00:48:47.096218	2014-03-07 00:48:47.096218
1309	474	LINSPNSN	Lincoln Sb & Superba Ns	1800 Lincoln Blvd & Superba Ave	33.9964234999999988	-118.457843400000002	\N	\N	\N	\N	2014-03-07 00:48:47.10781	2014-03-07 00:48:47.10781
1310	475	LINVICSN	Lincoln Sb & Victoria Ns	2100 Lincoln Blvd & Victoria Ave	33.9950811000000002	-118.455083000000002	\N	\N	\N	\N	2014-03-07 00:48:47.118416	2014-03-07 00:48:47.118416
1311	476	LINVENSN	Lincoln Sb & Venice Ns	2300 Lincoln Blvd & N Venice Blvd	33.9942174999999978	-118.453258099999999	\N	\N	\N	\N	2014-03-07 00:48:47.129865	2014-03-07 00:48:47.129865
1312	477	LINCDASF	Lincoln Sb & Couer D'Alene Fs	2400 Lincoln Blvd & Coeur D Alene Ave	33.9930846999999972	-118.450963599999994	\N	\N	\N	\N	2014-03-07 00:48:47.140885	2014-03-07 00:48:47.140885
1313	478	CLLLDNWF	California Wb & Linden Fs	900 California Ave & Linden Ave	33.9963375999999968	-118.462171299999994	\N	\N	\N	\N	2014-03-07 00:48:47.15141	2014-03-07 00:48:47.15141
1314	479	CLLOAKWN	California Wb & Oakwood Ns	700 California Ave & Oakwood Ave	33.9949202000000028	-118.463170599999998	\N	\N	\N	\N	2014-03-07 00:48:47.162715	2014-03-07 00:48:47.162715
1315	480	CLLSHLWN	California Wb & Shell Ns	600 California Ave & Shell Ave	33.9931516999999985	-118.464408399999996	\N	\N	\N	\N	2014-03-07 00:48:47.174247	2014-03-07 00:48:47.174247
1316	481	CLLV06WN	California Wb & 6Th Ave (Venice) Ns	600 California Ave & 6Th Ave	33.9914545000000032	-118.465536099999994	\N	\N	\N	\N	2014-03-07 00:48:47.196896	2014-03-07 00:48:47.196896
1317	485	WSMABKSF	Westminster Sb & Abbot Kinney Fs	400 Westminster Ave & Abbot Kinney Blvd	33.9915902999999986	-118.470849900000005	\N	\N	\N	\N	2014-03-07 00:48:47.208227	2014-03-07 00:48:47.208227
1318	486	PCOMTRWF	Pico Wb & Motor Fs	10100 W Pico Blvd & Motor Ave	34.0500106000000002	-118.410877499999998	\N	\N	\N	\N	2014-03-07 00:48:47.218236	2014-03-07 00:48:47.218236
1319	487	PCOAVSWN	Pico Wb & Ave Of The Stars Ns	10100 W Pico Blvd & Ave Of The Stars	34.0514787999999982	-118.408329300000005	\N	\N	\N	\N	2014-03-07 00:48:47.229411	2014-03-07 00:48:47.229411
1320	488	PCOMTREN	Pico Eb & Motor Ns	10100 W Pico Blvd & Motor Ave	34.0497882000000018	-118.410875599999997	\N	\N	\N	\N	2014-03-07 00:48:47.240506	2014-03-07 00:48:47.240506
1321	489	PCOAVSEN	Pico Eb & Ave Of The Stars Ns	10100 W Pico Blvd & Ave Of The Stars	34.0510000000000019	-118.408768800000004	\N	\N	\N	\N	2014-03-07 00:48:47.251612	2014-03-07 00:48:47.251612
1322	490	BUNSMOSF	Bundy Sb & Airport Fs	3100 S Bundy Dr & S Centinela Ave	34.0164901999999998	-118.443442500000003	\N	\N	\N	\N	2014-03-07 00:48:47.262911	2014-03-07 00:48:47.262911
1323	491	CENRSESF	Centinela Sb & Rose Fs	3200 S Centinela Ave & Rose Ave	34.0144991000000019	-118.441921699999995	\N	\N	\N	\N	2014-03-07 00:48:47.27436	2014-03-07 00:48:47.27436
1324	492	CENRSENN	Centinela Nb & Rose Ns	3200 S Centinela Ave & Rose Ave	34.014713399999998	-118.441826399999997	\N	\N	\N	\N	2014-03-07 00:48:47.285567	2014-03-07 00:48:47.285567
1325	493	BUNSMONN	Bundy Nb & Airport Ns	3100 S Bundy Dr & Airport Ave	34.01708	-118.443641499999998	\N	\N	\N	\N	2014-03-07 00:48:47.296595	2014-03-07 00:48:47.296595
1326	494	CENWPLNM	Centinela Nb & Washington Place Mb	4000 S Centinela Ave & Washington Pl	33.9986999999999995	-118.429638299999993	\N	\N	\N	\N	2014-03-07 00:48:47.307227	2014-03-07 00:48:47.307227
1327	495	CENBRBNF	Centinela Nb & Barbara Fs	3900 S Centinela Ave & Barbara Ave	34.0016651999999979	-118.431921799999998	\N	\N	\N	\N	2014-03-07 00:48:47.318278	2014-03-07 00:48:47.318278
1328	496	CENWPLSN	Centinela Sb & Washington Place Ns	4000 S Centinela Ave & Washington Pl	33.9996821000000011	-118.430674800000006	\N	\N	\N	\N	2014-03-07 00:48:47.329797	2014-03-07 00:48:47.329797
1329	497	CENBRBSN	Centinela Sb & Barbara Ns	3900 S Centinela Ave & Barbara Ave	34.0015762000000024	-118.432115699999997	\N	\N	\N	\N	2014-03-07 00:48:47.341165	2014-03-07 00:48:47.341165
1330	498	WALCENEF	Washington Blvd Eb & Centinela Fs	12200 Washington Blvd & S Centinela Ave	33.9969076000000001	-118.427929300000002	\N	\N	\N	\N	2014-03-07 00:48:47.351528	2014-03-07 00:48:47.351528
1331	499	LINCLSNF	Lincoln Nb & California (Sm) Fs	1000 Lincoln Blvd & California Ave	34.0237392000000014	-118.496326499999995	\N	\N	\N	\N	2014-03-07 00:48:47.363174	2014-03-07 00:48:47.363174
1332	500	LINWASNF	Lincoln Nb & Washington (Sm) Fs	900 Lincoln Blvd & Washington Ave	34.025108000000003	-118.497900000000001	\N	\N	\N	\N	2014-03-07 00:48:47.374112	2014-03-07 00:48:47.374112
1333	501	LINCLSSF	Lincoln Sb & California (Sm) Fs	1100 Lincoln Blvd & California Ave	34.0233322999999999	-118.495908299999996	\N	\N	\N	\N	2014-03-07 00:48:47.38545	2014-03-07 00:48:47.38545
1334	502	004WASSF	4Th Sb & Washington Fs	1000 4Th St & Washington Ave	34.0216599999999971	-118.501332700000006	\N	\N	\N	\N	2014-03-07 00:48:47.39643	2014-03-07 00:48:47.39643
1335	503	004CLSSN	4Th Sb & California Ns	1100 4Th St & California Ave	34.0206149999999994	-118.500076800000002	\N	\N	\N	\N	2014-03-07 00:48:47.407579	2014-03-07 00:48:47.407579
1336	504	004CLSNF	4Th Nb & California Fs	1100 4Th St & California Ave	34.0207704000000035	-118.500082599999999	\N	\N	\N	\N	2014-03-07 00:48:47.419061	2014-03-07 00:48:47.419061
1337	505	004WASNF	4Th Nb & Washington Fs	1000 4Th St & Washington Ave	34.0220618999999971	-118.501649299999997	\N	\N	\N	\N	2014-03-07 00:48:47.429671	2014-03-07 00:48:47.429671
1338	506	006WASSN	6Th Sb & Washington Ns	1000 6Th St & Washington Ave	34.023454700000002	-118.499801899999994	\N	\N	\N	\N	2014-03-07 00:48:47.441093	2014-03-07 00:48:47.441093
1339	507	006CLSSN	6Th Sb & California Ns	1000 6Th St & California Ave	34.022136500000002	-118.498191000000006	\N	\N	\N	\N	2014-03-07 00:48:47.452026	2014-03-07 00:48:47.452026
1340	508	006WILSN	6Th Sb & Wilshire Ns	1100 6Th St & Wilshire Blvd	34.0207808999999983	-118.496593099999998	\N	\N	\N	\N	2014-03-07 00:48:47.463346	2014-03-07 00:48:47.463346
1341	509	006CLSNN	6Th Nb & California Ns	1100 6Th St & California Ave	34.0219742999999966	-118.497836000000007	\N	\N	\N	\N	2014-03-07 00:48:47.474581	2014-03-07 00:48:47.474581
1342	510	006WASNN	6Th Nb & Washington Ns	1000 6Th St & Washington Ave	34.0233392000000023	-118.499462699999995	\N	\N	\N	\N	2014-03-07 00:48:47.485502	2014-03-07 00:48:47.485502
1343	511	006WILNF	6Th Nb & Wilshire Fs	1100 6Th St & Wilshire Blvd	34.0208885999999993	-118.496566099999995	\N	\N	\N	\N	2014-03-07 00:48:47.49675	2014-03-07 00:48:47.49675
1344	512	RIVWNDSN	Riviera Sb & Windward Ns	1300 Riviera Ave & Windward Ave	33.9893968000000015	-118.469464700000003	\N	\N	\N	\N	2014-03-07 00:48:47.507813	2014-03-07 00:48:47.507813
1345	519	WIL006EN	Wilshire Eb & 6Th Ns	600 Wilshire Blvd & 6Th St	34.0203918999999999	-118.496538400000006	\N	\N	\N	\N	2014-03-07 00:48:47.51884	2014-03-07 00:48:47.51884
1346	520	WILLINEF	Wilshire Eb & Lincoln Fs	800 Wilshire Blvd & Lincoln Blvd	34.0224148	-118.494132699999994	\N	\N	\N	\N	2014-03-07 00:48:47.529886	2014-03-07 00:48:47.529886
1347	521	WIL016EN	Wilshire Eb & 16Th Ns	1600 Wilshire Blvd & 16Th St	34.0281258999999991	-118.487084699999997	\N	\N	\N	\N	2014-03-07 00:48:47.54103	2014-03-07 00:48:47.54103
1348	522	WIL018EN	Wilshire Eb & 18Th Ns	1800 Wilshire Blvd & 18Th St	34.0296862000000004	-118.485140799999996	\N	\N	\N	\N	2014-03-07 00:48:47.552068	2014-03-07 00:48:47.552068
1349	523	WIL020EN	Wilshire Eb & 20Th Ns	2000 Wilshire Blvd & 20Th St	34.0312113000000025	-118.483247199999994	\N	\N	\N	\N	2014-03-07 00:48:47.563289	2014-03-07 00:48:47.563289
1350	524	WIL022EN	Wilshire Eb & 22Nd Ns	2200 Wilshire Blvd & 22Nd St	34.0326100999999994	-118.481537700000004	\N	\N	\N	\N	2014-03-07 00:48:47.573961	2014-03-07 00:48:47.573961
1351	525	WIL024EN	Wilshire Eb & 24Th Ns	2400 Wilshire Blvd & 24Th St	34.0338263000000012	-118.480001400000006	\N	\N	\N	\N	2014-03-07 00:48:47.585057	2014-03-07 00:48:47.585057
1352	526	WIL026EF	Wilshire Eb & 26Th Fs	2600 Wilshire Blvd & 26Th St	34.0362314999999995	-118.477062700000005	\N	\N	\N	\N	2014-03-07 00:48:47.596812	2014-03-07 00:48:47.596812
1353	527	WILYLEEF	Wilshire Eb & Yale Fs	2900 Wilshire Blvd & Yale St	34.0383654000000035	-118.474398699999995	\N	\N	\N	\N	2014-03-07 00:48:47.607746	2014-03-07 00:48:47.607746
1354	528	WILBRKEN	Wilshire Eb & Berkeley Ns	3000 Wilshire Blvd & Berkeley St	34.039580100000002	-118.472891200000007	\N	\N	\N	\N	2014-03-07 00:48:47.618853	2014-03-07 00:48:47.618853
1355	529	AVIIMPNF	Aviation Nb & Imperial Fs	11300 Aviation Blvd & W Imperial Hwy	33.9312562	-118.378303000000002	\N	\N	\N	\N	2014-03-07 00:48:47.62991	2014-03-07 00:48:47.62991
1356	530	AVI111NN	Aviation Nb & 111Th Ns	11100 Aviation Blvd & W 111Th St	33.9342427999999998	-118.378347300000001	\N	\N	\N	\N	2014-03-07 00:48:47.640966	2014-03-07 00:48:47.640966
1357	531	AVI104NN	Aviation Nb & 104Th Ns	10400 Aviation Blvd & W 104Th St	33.9417635000000004	-118.378371900000005	\N	\N	\N	\N	2014-03-07 00:48:47.652217	2014-03-07 00:48:47.652217
1358	532	CNTAVIWF	Century Wb & Aviaton Fs	5600 W Century Blvd & Aviation Blvd	33.9455989000000002	-118.379143099999993	\N	\N	\N	\N	2014-03-07 00:48:47.663015	2014-03-07 00:48:47.663015
1359	533	CNTINTWN	Century Wb & International Ns	5700 W Century Blvd & International Rd	33.9455349999999996	-118.381586900000002	\N	\N	\N	\N	2014-03-07 00:48:47.674126	2014-03-07 00:48:47.674126
1360	534	ARPCNTNF	Airport Nb & Century Fs	9900 Airport Blvd & W Century Blvd	33.9463651000000013	-118.385898900000001	\N	\N	\N	\N	2014-03-07 00:48:47.685692	2014-03-07 00:48:47.685692
1361	535	096ARPWF	96Th Wb & Airport Fs	5900 W 96Th St & Airport Blvd	33.9492696000000009	-118.387109699999996	\N	\N	\N	\N	2014-03-07 00:48:47.696696	2014-03-07 00:48:47.696696
1362	536	096SEPWN	96Th Wb & Sepulveda Ns	6200 W 96Th St & Vicksburg Ave	33.9488192000000026	-118.395718599999995	\N	\N	\N	\N	2014-03-07 00:48:47.707741	2014-03-07 00:48:47.707741
1363	537	SEPWSTNN	Sepulveda Nb & Westchester Pkwy Ns	9100 Sepulveda Blvd & Westchester Pkwy	33.954324800000002	-118.396088700000007	\N	\N	\N	\N	2014-03-07 00:48:47.71888	2014-03-07 00:48:47.71888
1364	538	SEPLATNF	Sepulveda Nb & La Tijera Fs	8700 Sepulveda Blvd & La Tijera Blvd	33.9576277000000033	-118.396134000000004	\N	\N	\N	\N	2014-03-07 00:48:47.730086	2014-03-07 00:48:47.730086
1365	539	MANSEPWF	Manchester Wb & Sepulveda Fs	6300 W Manchester Ave & Sepulveda Blvd	33.9599376000000035	-118.396665400000003	\N	\N	\N	\N	2014-03-07 00:48:47.740786	2014-03-07 00:48:47.740786
1366	540	MANKENWF	Manchester Wb & Kentwood Fs	6400 W Manchester Ave & Kentwood Ave	33.9599100000000007	-118.400629199999997	\N	\N	\N	\N	2014-03-07 00:48:47.752252	2014-03-07 00:48:47.752252
1367	541	MANEMNWN	Manchester Wb & Emerson Ns	6600 W Manchester Ave & Emerson Ave.	33.9599041999999969	-118.404154199999994	\N	\N	\N	\N	2014-03-07 00:48:47.76357	2014-03-07 00:48:47.76357
1368	542	MANMCLWN	Manchester Wb & Mc Connell Ns	6700 W Manchester Ave & Mc Connell Ave	33.9598769999999988	-118.409616400000004	\N	\N	\N	\N	2014-03-07 00:48:47.774419	2014-03-07 00:48:47.774419
1369	543	MANGTNWN	Manchester Wb & Georgetown Ns	6800 W Manchester Ave & Georgetown Ave	33.9598786999999973	-118.413385000000005	\N	\N	\N	\N	2014-03-07 00:48:47.785752	2014-03-07 00:48:47.785752
1370	544	MANLYLWF	Manchester Wb & Loyola Fs	7000 W Manchester Ave & Loyola Blvd	33.9598670000000027	-118.417000599999994	\N	\N	\N	\N	2014-03-07 00:48:47.796612	2014-03-07 00:48:47.796612
1371	545	LIN083NN	Lincoln Nb & 83Rd Ns	8300 Lincoln Blvd & W 83Rd St	33.9624851000000021	-118.421420699999999	\N	\N	\N	\N	2014-03-07 00:48:47.808259	2014-03-07 00:48:47.808259
1372	546	LINLMUNN	Lincoln Nb & Lmu Dr Ns	7900 Lincoln Blvd & Lmu Dr	33.9654079000000024	-118.424094100000005	\N	\N	\N	\N	2014-03-07 00:48:47.818642	2014-03-07 00:48:47.818642
1373	549	LINJEFNF	Lincoln Nb & Jefferson Fs	6000 Lincoln Blvd & W Jefferson Blvd	33.9725497000000018	-118.430346200000002	\N	\N	\N	\N	2014-03-07 00:48:47.830187	2014-03-07 00:48:47.830187
1374	550	LINFIJNF	Lincoln Nb & Fiji Fs	4800 Lincoln Blvd & Fiji Way	33.9788171000000006	-118.436781499999995	\N	\N	\N	\N	2014-03-07 00:48:47.841509	2014-03-07 00:48:47.841509
1375	551	LINMINNF	Lincoln Nb & Mindanao Fs	4700 Lincoln Blvd & Mindanao Way	33.980894499999998	-118.439215599999997	\N	\N	\N	\N	2014-03-07 00:48:47.852394	2014-03-07 00:48:47.852394
1376	552	LINBALNN	Lincoln Nb & Bali Ns	4500 Lincoln Blvd & Bali Way	33.9823975999999988	-118.440742099999994	\N	\N	\N	\N	2014-03-07 00:48:47.863537	2014-03-07 00:48:47.863537
1377	553	LINMAXNF	Lincoln Nb & Maxella Fs	4300 Lincoln Blvd & Maxella Ave	33.9859493000000015	-118.443529699999999	\N	\N	\N	\N	2014-03-07 00:48:47.874505	2014-03-07 00:48:47.874505
1378	554	LINLAKNN	Lincoln Nb & Lake Ns	800 Lincoln Blvd & Lake St	33.9987317000000004	-118.462275000000005	\N	\N	\N	\N	2014-03-07 00:48:47.885826	2014-03-07 00:48:47.885826
1379	556	LINSNVNN	Lincoln Nb & Sunset Ns	600 Lincoln Blvd & Sunset Ave	34.0000994999999975	-118.465105600000001	\N	\N	\N	\N	2014-03-07 00:48:47.89622	2014-03-07 00:48:47.89622
1380	557	LINRSENN	Lincoln Nb & Rose Ns	300 Lincoln Blvd & Rose Ave	34.0011871999999968	-118.467390899999998	\N	\N	\N	\N	2014-03-07 00:48:47.907986	2014-03-07 00:48:47.907986
1381	558	LINMRNNN	Lincoln Nb & Marine Ns	3100 Lincoln Blvd & Marine St	34.0030399999999986	-118.470919199999997	\N	\N	\N	\N	2014-03-07 00:48:47.919075	2014-03-07 00:48:47.919075
1382	559	LINASLNF	Lincoln Nb & Ashland Fs	2700 Lincoln Blvd & Ashland Ave	34.0051024999999996	-118.473730200000006	\N	\N	\N	\N	2014-03-07 00:48:47.930257	2014-03-07 00:48:47.930257
1383	560	LINPRLNF	Lincoln Nb & Pearl Fs	2300 Lincoln Blvd & Pearl St	34.0097645000000028	-118.479724200000007	\N	\N	\N	\N	2014-03-07 00:48:48.007964	2014-03-07 00:48:48.007964
1384	561	LINWILNF	Lincoln Nb & Wilshire Fs	1100 Lincoln Blvd & Wilshire Blvd	34.0224061999999989	-118.494676299999995	\N	\N	\N	\N	2014-03-07 00:48:48.019094	2014-03-07 00:48:48.019094
1385	562	LINIDSNF	Lincoln Nb & Idaho Fs	900 Lincoln Blvd & Idaho Ave	34.0264458999999988	-118.4994552	\N	\N	\N	\N	2014-03-07 00:48:48.030242	2014-03-07 00:48:48.030242
1386	563	LINMONNN	Lincoln Nb & Montana Ns	800 Lincoln Blvd & Montana Ave	34.0274029999999996	-118.500708500000002	\N	\N	\N	\N	2014-03-07 00:48:48.041264	2014-03-07 00:48:48.041264
1387	564	MON011EF	Montana Eb & 11Th Fs	1100 Montana Ave & 11Th St	34.0300259999999994	-118.497761100000005	\N	\N	\N	\N	2014-03-07 00:48:48.052345	2014-03-07 00:48:48.052345
1388	565	MONEULEF	Montana Eb & Euclid Fs	1300 Montana Ave & Euclid St	34.0315470000000033	-118.495887800000006	\N	\N	\N	\N	2014-03-07 00:48:48.06336	2014-03-07 00:48:48.06336
1389	566	MON015EF	Montana Eb & 15Th Fs	1500 Montana Ave & 15Th St	34.0330736000000016	-118.494009000000005	\N	\N	\N	\N	2014-03-07 00:48:48.480556	2014-03-07 00:48:48.480556
1390	567	MON022EN	Montana Eb & 22Nd Ns	2200 Montana Ave & 22Nd St	34.0382425000000026	-118.487721800000003	\N	\N	\N	\N	2014-03-07 00:48:48.791148	2014-03-07 00:48:48.791148
1391	568	MON024EF	Montana Eb & 24Th Fs	2400 Montana Ave & 24Th St	34.0400862999999987	-118.485340600000001	\N	\N	\N	\N	2014-03-07 00:48:48.807955	2014-03-07 00:48:48.807955
1392	569	MONHRVEN	Montana Eb & Harvard Ns	2800 Montana Ave & Harvard St	34.0428169999999994	-118.482003300000002	\N	\N	\N	\N	2014-03-07 00:48:48.819592	2014-03-07 00:48:48.819592
1393	570	MONSFDEN	Montana Eb & Stanford Ns	2900 Montana Ave & Stanford St	34.0443459999999973	-118.480152700000005	\N	\N	\N	\N	2014-03-07 00:48:48.830313	2014-03-07 00:48:48.830313
1394	571	MONCENEN	Montana Eb & Centinela Ns	12500 Montana Ave & Centinela Ave	34.0462453999999966	-118.478028600000002	\N	\N	\N	\N	2014-03-07 00:48:48.841437	2014-03-07 00:48:48.841437
1395	572	MONAMHEN	Montana Eb & Amherst Ns	12300 Montana Ave & S Amherst Ave	34.0480822000000032	-118.4755325	\N	\N	\N	\N	2014-03-07 00:48:48.85269	2014-03-07 00:48:48.85269
1396	573	MONGGREN	Montana Eb & Gretna Green Ns	12100 Montana Ave & Gretna Green Way	34.0493351000000004	-118.473892800000002	\N	\N	\N	\N	2014-03-07 00:48:48.863605	2014-03-07 00:48:48.863605
1397	574	MONBUNEF	Montana Eb & Bundy Fs	12000 Montana Ave & S Bundy Dr	34.0507175999999987	-118.472282300000003	\N	\N	\N	\N	2014-03-07 00:48:48.874757	2014-03-07 00:48:48.874757
1398	575	BUNMONNN	Bundy Nb & Montana Ns	800 S Bundy Dr & Montana Ave	34.0504005000000021	-118.472233599999996	\N	\N	\N	\N	2014-03-07 00:48:48.88588	2014-03-07 00:48:48.88588
1399	576	BUNMONSF	Bundy Sb & Montana Fs	800 S Bundy Dr & Montana Ave	34.050213399999997	-118.472027100000005	\N	\N	\N	\N	2014-03-07 00:48:48.896996	2014-03-07 00:48:48.896996
1400	577	MONSVSEN	Montana Eb & San Vicente Ns	11900 Montana Ave & W San Vicente Blvd	34.0524770999999973	-118.470060799999999	\N	\N	\N	\N	2014-03-07 00:48:48.908056	2014-03-07 00:48:48.908056
1401	578	SVSMAYSF	San Vicente Sb & Mayfield Fs	11500 W San Vicente Blvd & Mayfield Ave	34.0531811999999974	-118.461430899999996	\N	\N	\N	\N	2014-03-07 00:48:48.91917	2014-03-07 00:48:48.91917
1402	579	SVSBHMWF	San Vicente Wb & Bringham Fs	11600 W San Vicente Blvd & Bringham Ave	34.0540311000000031	-118.462514200000001	\N	\N	\N	\N	2014-03-07 00:48:48.930261	2014-03-07 00:48:48.930261
1403	580	MONSVSWF	Montana Wb & San Vicente Fs	11900 Montana Ave & W San Vicente Blvd	34.0524121999999991	-118.470379899999998	\N	\N	\N	\N	2014-03-07 00:48:48.941464	2014-03-07 00:48:48.941464
1404	581	MONBUNWN	Montana Wb & Bundy Ns	12000 Montana Ave & S Bundy Dr	34.0506913999999981	-118.472514000000004	\N	\N	\N	\N	2014-03-07 00:48:48.952532	2014-03-07 00:48:48.952532
1405	582	MONGGRWN	Montana Wb & Gretna Green Ns	12100 Montana Ave & Gretna Green Way	34.0497269000000031	-118.473682299999993	\N	\N	\N	\N	2014-03-07 00:48:48.963628	2014-03-07 00:48:48.963628
1406	583	MONAMHWN	Montana Wb & Amherst Ns	12300 Montana Ave & S Amherst Ave	34.0483205000000027	-118.475386700000001	\N	\N	\N	\N	2014-03-07 00:48:48.974756	2014-03-07 00:48:48.974756
1407	584	MONCENWN	Montana Wb & Centinela Ns	12500 Montana Ave & Centinela Ave	34.0464685000000031	-118.477780699999997	\N	\N	\N	\N	2014-03-07 00:48:48.985874	2014-03-07 00:48:48.985874
1408	585	MONSFDSN	Montana Sb & Stanford Ns	2900 Montana Ave & Stanford St	34.0446093999999988	-118.480332500000003	\N	\N	\N	\N	2014-03-07 00:48:48.997042	2014-03-07 00:48:48.997042
1409	586	MONBGMWN	Montana Wb & Burlingame Ns	2800 Montana Ave & Burlingame Ave	34.0430107000000035	-118.4819727	\N	\N	\N	\N	2014-03-07 00:48:49.00807	2014-03-07 00:48:49.00807
1410	587	MON026WF	Montana Wb & 26Th Fs	2600 Montana Ave & 26Th St	34.0412899999999965	-118.484098000000003	\N	\N	\N	\N	2014-03-07 00:48:49.019173	2014-03-07 00:48:49.019173
1411	588	MON024WF	Montana Wb & 24Th Fs	2400 Montana Ave & 24Th St	34.0399358000000021	-118.4857765	\N	\N	\N	\N	2014-03-07 00:48:49.030303	2014-03-07 00:48:49.030303
1412	589	MON022WN	Montana Wb & 22Nd Ns	2200 Montana Ave & 22Nd St	34.0388239999999982	-118.487151299999994	\N	\N	\N	\N	2014-03-07 00:48:49.041306	2014-03-07 00:48:49.041306
1413	590	MON017WN	Montana Wb & 17Th Ns	1700 Montana Ave & 17Th St	34.0346844999999973	-118.492284600000005	\N	\N	\N	\N	2014-03-07 00:48:49.052514	2014-03-07 00:48:49.052514
1414	591	MON015WN	Montana Wb & 15Th Ns	1500 Montana Ave & 15Th St	34.0331120000000027	-118.494128000000003	\N	\N	\N	\N	2014-03-07 00:48:49.063585	2014-03-07 00:48:49.063585
1415	592	MONEULWN	Montana Wb & Euclid Ns	1300 Montana Ave & Euclid St	34.0315786000000031	-118.496046899999996	\N	\N	\N	\N	2014-03-07 00:48:49.118498	2014-03-07 00:48:49.118498
1416	593	MON011WN	Montana Wb & 11Th Ns	1100 Montana Ave & 11Th St	34.0300798999999969	-118.497952100000006	\N	\N	\N	\N	2014-03-07 00:48:49.129596	2014-03-07 00:48:49.129596
1417	594	LINMONSF	Lincoln Sb & Montana Fs	800 Lincoln Blvd & Montana Ave	34.0273336999999998	-118.500605199999995	\N	\N	\N	\N	2014-03-07 00:48:49.141034	2014-03-07 00:48:49.141034
1418	595	LINIDSSF	Lincoln Sb & Idaho Fs	900 Lincoln Blvd & Idaho Ave	34.0261076999999972	-118.499164899999997	\N	\N	\N	\N	2014-03-07 00:48:49.152773	2014-03-07 00:48:49.152773
1419	596	LINASLSN	Lincoln Sb & Ashland Ns	2700 Lincoln Blvd & Ashland Ave	34.004888600000001	-118.473757399999997	\N	\N	\N	\N	2014-03-07 00:48:49.163823	2014-03-07 00:48:49.163823
1420	597	LINNAVSN	Lincoln Sb & Navy Ns	3100 Lincoln Blvd & Navy St	34.0031299999999987	-118.471355000000003	\N	\N	\N	\N	2014-03-07 00:48:49.174942	2014-03-07 00:48:49.174942
1421	598	LINRSESF	Lincoln Sb & Rose Fs	300 Lincoln Blvd & Rose Ave	34.0011042000000003	-118.467535999999996	\N	\N	\N	\N	2014-03-07 00:48:49.186034	2014-03-07 00:48:49.186034
1422	599	LINSNVSN	Lincoln Sb & Sunset Ns	600 Lincoln Blvd & Sunset Ave	34.0002785000000003	-118.465820300000004	\N	\N	\N	\N	2014-03-07 00:48:49.197211	2014-03-07 00:48:49.197211
1423	600	LINMRPSF	Lincoln Sb & Marina Pointe Fs	4300 Lincoln Blvd & Marina Pointe Dr	33.9853272000000004	-118.443402699999993	\N	\N	\N	\N	2014-03-07 00:48:49.20824	2014-03-07 00:48:49.20824
1424	601	LINBALSN	Lincoln Sb & Bali Ns	4500 Lincoln Blvd & Bali Way	33.9826623000000012	-118.441273100000004	\N	\N	\N	\N	2014-03-07 00:48:49.219349	2014-03-07 00:48:49.219349
1425	602	LINMINSF	Lincoln Sb & Mindanao Fs	4700 Lincoln Blvd & Mindanao Way	33.9801696999999976	-118.438845799999996	\N	\N	\N	\N	2014-03-07 00:48:49.230337	2014-03-07 00:48:49.230337
1426	603	LINFIJSN	Lincoln Sb & Fiji Ns	4800 Lincoln Blvd & Fiji Way	33.9785911000000027	-118.436849699999996	\N	\N	\N	\N	2014-03-07 00:48:49.241547	2014-03-07 00:48:49.241547
1427	604	LINJEFSN	Lincoln Sb & Jefferson Ns	6000 Lincoln Blvd & W Jefferson Blvd	33.9723371999999983	-118.430669399999999	\N	\N	\N	\N	2014-03-07 00:48:49.341936	2014-03-07 00:48:49.341936
1428	605	LIN083SF	Lincoln Sb & 83Rd Fs	8300 Lincoln Blvd & W 83Rd St	33.9625018999999995	-118.421688000000003	\N	\N	\N	\N	2014-03-07 00:48:49.397541	2014-03-07 00:48:49.397541
1429	606	MANLYLEF	Manchester Eb & Loyola Fs	7100 W Manchester Ave & Loyola Blvd	33.9596869000000012	-118.416295700000006	\N	\N	\N	\N	2014-03-07 00:48:49.430665	2014-03-07 00:48:49.430665
1430	607	MANGTNEN	Manchester Eb & Georgetown Ns	6900 W Manchester Ave & Georgetown Ave	33.9597142000000005	-118.413851800000003	\N	\N	\N	\N	2014-03-07 00:48:49.486298	2014-03-07 00:48:49.486298
1431	608	MANMCLEF	Manchester Eb & Mc Connell Ns	6800 W Manchester Ave & Mc Connell Ave	33.9597288000000006	-118.409603200000006	\N	\N	\N	\N	2014-03-07 00:48:49.519431	2014-03-07 00:48:49.519431
1432	609	MANEMNEF	Manchester Eb & Emerson Fs	6600 W Manchester Ave & Emerson Ave	33.9597089999999966	-118.404030300000002	\N	\N	\N	\N	2014-03-07 00:48:49.61408	2014-03-07 00:48:49.61408
1433	610	MANKENEN	Manchester Eb & Kentwood Ns	6400 W Manchester Ave & Kentwood Ave	33.9597509999999971	-118.400575099999998	\N	\N	\N	\N	2014-03-07 00:48:49.641737	2014-03-07 00:48:49.641737
1434	612	SEPLATSF	Sepulveda Sb & La Tijera Fs	8800 Sepulveda Blvd & La Tijera Blvd	33.9568709999999996	-118.396383599999993	\N	\N	\N	\N	2014-03-07 00:48:49.652852	2014-03-07 00:48:49.652852
1435	613	096ARPEN	96Th Eb & Airport Ns	5900 W 96Th St & Airport Blvd	33.9493281000000025	-118.386232899999996	\N	\N	\N	\N	2014-03-07 00:48:49.663737	2014-03-07 00:48:49.663737
1436	614	CNTARPEF	Century Eb & Airport Fs	5900 W Century Blvd & Airport Blvd	33.9452724000000003	-118.385686899999996	\N	\N	\N	\N	2014-03-07 00:48:49.674973	2014-03-07 00:48:49.674973
1437	615	CNTINTEN	Century Eb & International Ns	5600 W Century Blvd & International Rd	33.945293999999997	-118.381837099999998	\N	\N	\N	\N	2014-03-07 00:48:49.686028	2014-03-07 00:48:49.686028
1438	616	CNTAVIEN	Century Eb & Aviation Ns	5500 W Century Blvd & Aviation Blvd	33.9453709000000003	-118.378680599999996	\N	\N	\N	\N	2014-03-07 00:48:49.697339	2014-03-07 00:48:49.697339
1439	617	AVI104SN	Aviation Sb & 104Th Ns	10400 Aviation Blvd & W 104Th St	33.9421697000000009	-118.378569799999994	\N	\N	\N	\N	2014-03-07 00:48:49.708433	2014-03-07 00:48:49.708433
1440	618	AVI111SN	Aviation Sb & 111Th Ns	11100 Aviation Blvd & W 111Th St	33.9347155000000029	-118.378570199999999	\N	\N	\N	\N	2014-03-07 00:48:49.71965	2014-03-07 00:48:49.71965
1441	619	PCOVETWF	Pico Wb & Veteran Fs	10900 W Pico Blvd & Veteran Ave	34.0386560000000031	-118.431641200000001	\N	\N	\N	\N	2014-03-07 00:48:49.730716	2014-03-07 00:48:49.730716
1442	620	PCOCAMWN	Pico Wb & Camden Ave Ns	11000 W Pico Blvd & Camden Ave	34.0380139000000028	-118.433195499999997	\N	\N	\N	\N	2014-03-07 00:48:49.741966	2014-03-07 00:48:49.741966
1443	621	PCOSEPWN	Pico Wb & Sepulveda Ns	11100 W Pico Blvd & S Sepulveda Blvd	34.0372051000000013	-118.434897500000005	\N	\N	\N	\N	2014-03-07 00:48:49.75301	2014-03-07 00:48:49.75301
1444	622	PCOSAWWN	Pico Wb & Sawtelle Ns	11300 W Pico Blvd & Sawtelle Blvd	34.0354138000000006	-118.438539899999995	\N	\N	\N	\N	2014-03-07 00:48:49.764119	2014-03-07 00:48:49.764119
1445	623	SAWNEBNF	Sawtelle Nb & Nebraska Fs	1700 Sawtelle Blvd & Nebraska Ave	34.0440560999999988	-118.4462312	\N	\N	\N	\N	2014-03-07 00:48:49.774872	2014-03-07 00:48:49.774872
1446	624	SAWLGRNN	Sawtelle Nb & La Grange Ns	2000 Sawtelle Blvd & La Grange Ave	34.0408704999999969	-118.443546799999993	\N	\N	\N	\N	2014-03-07 00:48:49.786362	2014-03-07 00:48:49.786362
1447	625	SAWLGRSN	Sawtelle Sb & La Grange Ns	1900 Sawtelle Blvd & La Grange Ave	34.0411293000000015	-118.443901100000005	\N	\N	\N	\N	2014-03-07 00:48:49.797506	2014-03-07 00:48:49.797506
1448	626	SAWNEBSN	Sawtelle Sb & Nebraska Ns	1800 Sawtelle Blvd & Nebraska Ave	34.0439939999999979	-118.446339699999996	\N	\N	\N	\N	2014-03-07 00:48:49.808518	2014-03-07 00:48:49.808518
1449	627	SAWOHINF	Sawtelle Nb & Ohio Fs	1200 Sawtelle Blvd & Ohio Ave	34.0486598000000029	-118.450212300000004	\N	\N	\N	\N	2014-03-07 00:48:49.819747	2014-03-07 00:48:49.819747
1450	628	BSLDOWNN	Bonsall Nb & Dowlen Ns	1100 Bonsall Ave & Dowlen Dr	34.0494150000000033	-118.450856000000002	\N	\N	\N	\N	2014-03-07 00:48:49.830055	2014-03-07 00:48:49.830055
1451	629	SAWOHISN	Sawtelle Sb & Ohio Ns	1200 Sawtelle Blvd & Ohio Ave	34.0484814	-118.450198200000003	\N	\N	\N	\N	2014-03-07 00:48:49.841888	2014-03-07 00:48:49.841888
1452	630	BSLWILNN	Bonsall Nb & Wilshire Ns	Bonsall Ave & Hadley Ln	34.0540238999999971	-118.454663699999998	\N	\N	\N	\N	2014-03-07 00:48:49.853072	2014-03-07 00:48:49.853072
1453	640	BSLWILSF	Bonsall Sb & Wilshire Fs	1221 Bonsall Ave & Wilshire Blvd	34.0540234999999996	-118.454791900000004	\N	\N	\N	\N	2014-03-07 00:48:49.864148	2014-03-07 00:48:49.864148
1454	641	SVSMONWN	San Vicente Wb & Montana Ns	11800 W San Vicente Blvd & Montana Ave	34.0531172000000026	-118.469136399999996	\N	\N	\N	\N	2014-03-07 00:48:49.875368	2014-03-07 00:48:49.875368
1455	642	SVSBUNWF	San Vicente Wb & Bundy Fs	12000 W San Vicente Blvd & S Bundy Dr	34.0518922999999987	-118.475004900000002	\N	\N	\N	\N	2014-03-07 00:48:49.886374	2014-03-07 00:48:49.886374
1456	643	SVSBUNEN	San Vicente Eb & Bundy Ns	12000 W San Vicente Blvd & S Bundy Dr	34.0516701999999967	-118.474670399999994	\N	\N	\N	\N	2014-03-07 00:48:49.897483	2014-03-07 00:48:49.897483
1457	644	SVSANIWN	San Vicente Wb & Anita Ns	12500 W San Vicente Blvd & S Anita Ave	34.0508334000000019	-118.4804855	\N	\N	\N	\N	2014-03-07 00:48:49.908633	2014-03-07 00:48:49.908633
1458	645	SVSBSTWN	San Vicente Wb & Bristol Ns	12700 W San Vicente Blvd & S Bristol Ave	34.049902000000003	-118.484985800000004	\N	\N	\N	\N	2014-03-07 00:48:49.919686	2014-03-07 00:48:49.919686
1459	646	SVSAVNWN	San Vicente Wb & Avondale Ns	12900 W San Vicente Blvd & Avondale Ave	34.0489823999999999	-118.489527699999996	\N	\N	\N	\N	2014-03-07 00:48:49.9308	2014-03-07 00:48:49.9308
1460	647	CYL026WF	Carlyle Wb & 26Th Fs	2600 Carlyle Ave & 26Th St	34.0457030999999972	-118.489106000000007	\N	\N	\N	\N	2014-03-07 00:48:49.941905	2014-03-07 00:48:49.941905
1461	648	CYL024WN	Carlyle Wb & 24Th Ns	2400 Carlyle Ave & 24Th St	34.0445542000000003	-118.490505299999995	\N	\N	\N	\N	2014-03-07 00:48:49.953025	2014-03-07 00:48:49.953025
1462	649	CYL022WN	Carlyle Wb & 22Nd Ns	2200 Carlyle Ave & 22Nd St	34.0432058000000026	-118.492193999999998	\N	\N	\N	\N	2014-03-07 00:48:49.964048	2014-03-07 00:48:49.964048
1463	650	CYL020WN	Carlyle Wb & 20Th Ns	2000 Carlyle Ave & 20Th St	34.0411430999999993	-118.494788299999996	\N	\N	\N	\N	2014-03-07 00:48:49.975266	2014-03-07 00:48:49.975266
1464	651	CYL017WN	Carlyle Wb & 17Th Ns	1700 Carlyle Ave & 17Th St	34.0390439000000029	-118.497335399999997	\N	\N	\N	\N	2014-03-07 00:48:49.986385	2014-03-07 00:48:49.986385
1465	652	CYL014WN	Carlyle Wb & 14Th Ns	1400 Carlyle Ave & 14Th St	34.0365645999999984	-118.500024400000001	\N	\N	\N	\N	2014-03-07 00:48:49.99772	2014-03-07 00:48:49.99772
1466	653	CYL011WN	Carlyle Wb & 11Th Ns	1100 Carlyle Ave & 11Th St	34.0343075999999982	-118.502856100000002	\N	\N	\N	\N	2014-03-07 00:48:50.00851	2014-03-07 00:48:50.00851
1467	654	CYL009WN	Carlyle Wb & 9Th Ns	900 Carlyle Ave & 9Th St	34.0327629000000016	-118.504743199999993	\N	\N	\N	\N	2014-03-07 00:48:50.019621	2014-03-07 00:48:50.019621
1468	655	SVS007WF	San Vicente Wb & 7Th Fs	700 San Vicente Blvd & 7Th St	34.0319586000000029	-118.508135999999993	\N	\N	\N	\N	2014-03-07 00:48:50.030499	2014-03-07 00:48:50.030499
1469	656	007SVSSN	7Th Sb & San Vicente Ns	200 7Th St & San Vicente Blvd	34.0321848000000031	-118.508101699999997	\N	\N	\N	\N	2014-03-07 00:48:50.041963	2014-03-07 00:48:50.041963
1470	657	004SVSSF	4Th Sb & San Vicente Fs	300 4Th St & San Vicente Blvd	34.0290129999999991	-118.510726399999996	\N	\N	\N	\N	2014-03-07 00:48:50.052773	2014-03-07 00:48:50.052773
1471	658	004GRGSF	4Th Sb & Georgina Fs	400 4Th St & Georgina Ave	34.0280258000000018	-118.509313500000005	\N	\N	\N	\N	2014-03-07 00:48:50.064536	2014-03-07 00:48:50.064536
1472	659	004MRGSF	4Th Sb & Marguerita Fs	500 4Th St & Marguerita Ave	34.0270567000000028	-118.507952500000002	\N	\N	\N	\N	2014-03-07 00:48:50.075273	2014-03-07 00:48:50.075273
1473	660	004ALTSF	4Th Sb & Alta Fs	600 4Th St & Alta Ave	34.0260626999999971	-118.506557200000003	\N	\N	\N	\N	2014-03-07 00:48:50.086405	2014-03-07 00:48:50.086405
1474	661	004MONSF	4Th Sb & Montana Fs	800 4Th St & Montana Ave	34.0243109000000032	-118.504470100000006	\N	\N	\N	\N	2014-03-07 00:48:50.097349	2014-03-07 00:48:50.097349
1475	662	004IDSSF	4Th Sb & Idaho Fs	900 4Th St & Idaho Ave	34.0230312999999995	-118.502948200000006	\N	\N	\N	\N	2014-03-07 00:48:50.108649	2014-03-07 00:48:50.108649
1476	663	004IDSNF	4Th Nb & Idaho Fs	900 4Th St & Idaho Ave	34.0234111999999982	-118.503216100000003	\N	\N	\N	\N	2014-03-07 00:48:50.119757	2014-03-07 00:48:50.119757
1477	664	004MONNF	4Th Nb & Montana Fs	800 4Th St & Montana Ave	34.0247719999999987	-118.504722900000004	\N	\N	\N	\N	2014-03-07 00:48:50.130588	2014-03-07 00:48:50.130588
1478	665	004ALTNF	4Th Nb & Alta Fs	600 4Th St & Alta Ave	34.0265294000000011	-118.506847500000006	\N	\N	\N	\N	2014-03-07 00:48:50.141967	2014-03-07 00:48:50.141967
1479	666	004MRGNF	4Th Nb & Marguerita Fs	500 4Th St & Marguerita Ave	34.0275494999999992	-118.508289000000005	\N	\N	\N	\N	2014-03-07 00:48:50.153274	2014-03-07 00:48:50.153274
1480	667	004GRGNF	4Th Nb & Georgina Fs	400 4Th St & Georgina Ave	34.0284994000000012	-118.509659099999993	\N	\N	\N	\N	2014-03-07 00:48:50.164161	2014-03-07 00:48:50.164161
1481	668	004SVSNN	4Th Nb & San Vicente Ns	300 4Th St & San Vicente Blvd	34.0291509999999988	-118.510610099999994	\N	\N	\N	\N	2014-03-07 00:48:50.175265	2014-03-07 00:48:50.175265
1482	669	SVS007EN	San Vicente Eb & 7Th Ns	700 San Vicente Blvd & 7Th St	34.0318149000000005	-118.5079365	\N	\N	\N	\N	2014-03-07 00:48:50.186419	2014-03-07 00:48:50.186419
1483	670	SVS009EN	San Vicente Eb & 9Th Ns	900 San Vicente Blvd & 9Th St	34.0339010000000002	-118.506660299999993	\N	\N	\N	\N	2014-03-07 00:48:50.197667	2014-03-07 00:48:50.197667
1484	671	SVS011EN	San Vicente Eb & 11Th Ns	1100 San Vicente Blvd & 11Th St	34.0363625000000027	-118.505855100000005	\N	\N	\N	\N	2014-03-07 00:48:50.208819	2014-03-07 00:48:50.208819
1485	672	SVS014EN	San Vicente Eb & 14Th Ns	1400 San Vicente Blvd & 14Th St	34.0395613999999966	-118.504025499999997	\N	\N	\N	\N	2014-03-07 00:48:50.219834	2014-03-07 00:48:50.219834
1486	673	SVS017EN	San Vicente Eb & 17Th Ns	1700 San Vicente Blvd & 17Th St	34.0417826999999988	-118.501151300000004	\N	\N	\N	\N	2014-03-07 00:48:50.230771	2014-03-07 00:48:50.230771
1487	674	SVS019EN	San Vicente Eb & 19Th Ns	1900 San Vicente Blvd & 19Th St	34.0431477999999998	-118.499363399999993	\N	\N	\N	\N	2014-03-07 00:48:50.241891	2014-03-07 00:48:50.241891
1488	675	SVS21PEN	San Vicente Eb & 21St Pl Ns	2200 San Vicente Blvd & 21St Pl	34.0451832999999979	-118.496822600000002	\N	\N	\N	\N	2014-03-07 00:48:50.253197	2014-03-07 00:48:50.253197
1489	676	SVS023EN	San Vicente Eb & 23Rd Ns	2300 San Vicente Blvd & 23Rd St	34.0466647000000009	-118.494974200000001	\N	\N	\N	\N	2014-03-07 00:48:50.264363	2014-03-07 00:48:50.264363
1490	677	SVSAVNEN	San Vicente Eb & Avondale Ns	12900 W San Vicente Blvd & Avondale Ave	34.0486877000000021	-118.4897615	\N	\N	\N	\N	2014-03-07 00:48:50.27546	2014-03-07 00:48:50.27546
1491	678	SVSBSTEN	San Vicente Eb & Bristol Ns	12700 W San Vicente Blvd & S Bristol Ave	34.0495280000000022	-118.485453699999994	\N	\N	\N	\N	2014-03-07 00:48:50.353274	2014-03-07 00:48:50.353274
1492	679	OPR021EN	Ocean Park Eb & 21St Ns	2100 Ocean Park Blvd & 21St St	34.014166699999997	-118.463816800000004	\N	\N	\N	\N	2014-03-07 00:48:50.363293	2014-03-07 00:48:50.363293
1493	680	OPR021WF	Ocean Park Wb & 21St Fs	2100 Ocean Park Blvd & 21St St	34.014262500000001	-118.463987200000005	\N	\N	\N	\N	2014-03-07 00:48:50.374394	2014-03-07 00:48:50.374394
1494	682	BARMONNF	Barrington Nb & Montana Fs	700 S Barrington Ave & Montana Ave	34.0552240000000026	-118.467218500000001	\N	\N	\N	\N	2014-03-07 00:48:50.386427	2014-03-07 00:48:50.386427
1495	683	BARCHNNN	Barrington Nb & Chenault Ns	700 S Barrington Ave & Chenault St	34.0562414999999987	-118.467568700000001	\N	\N	\N	\N	2014-03-07 00:48:50.397395	2014-03-07 00:48:50.397395
1496	684	BARCHNSN	Barrington Sb & Chenault Ns	700 S Barrington Ave & Chenault St	34.0563768999999965	-118.467703799999995	\N	\N	\N	\N	2014-03-07 00:48:50.408222	2014-03-07 00:48:50.408222
1497	685	BARMONSN	Barrington Sb & Montana Ns	700 S Barrington Ave & Montana Ave	34.0551259000000002	-118.467322100000004	\N	\N	\N	\N	2014-03-07 00:48:50.419427	2014-03-07 00:48:50.419427
1498	686	OLYSEPEN	Olympic Eb & Sepulveda Ns	11000 W Olympic Blvd & S Sepulveda Blvd	34.0400575000000032	-118.437994700000004	\N	\N	\N	\N	2014-03-07 00:48:50.430976	2014-03-07 00:48:50.430976
1499	687	OLYCAMEN	Olympic Eb & Camden Ave Ns	10960 W Olympic Blvd & Camden Ave	34.0410692000000026	-118.4362998	\N	\N	\N	\N	2014-03-07 00:48:50.442177	2014-03-07 00:48:50.442177
1500	688	OLYVETEN	Olympic Eb & Veteran Ns	10940 W Olympic Blvd & Veteran Ave	34.0421560999999997	-118.434510399999994	\N	\N	\N	\N	2014-03-07 00:48:50.452866	2014-03-07 00:48:50.452866
1501	689	WWOOLYSF	Westwood Sb & Olympic Fs	2200 Westwood Blvd & W Olympic Blvd	34.0436698000000035	-118.431678700000006	\N	\N	\N	\N	2014-03-07 00:48:50.464058	2014-03-07 00:48:50.464058
1502	690	OLYVETWN	Olympic Wb & Veteran Ns	10940 W Olympic Blvd & Veteran Ave	34.0425303000000028	-118.434328500000007	\N	\N	\N	\N	2014-03-07 00:48:50.474817	2014-03-07 00:48:50.474817
1503	691	OLYCAMWN	Olympic Wb & Camden Ave Ns	10960 W Olympic Blvd & Camden Ave	34.0414698000000016	-118.436116799999994	\N	\N	\N	\N	2014-03-07 00:48:50.486293	2014-03-07 00:48:50.486293
1504	694	020BWYSN	20Th Sb & Broadway Ns	1400 20Th St & Broadway	34.0275211000000013	-118.478732699999995	\N	\N	\N	\N	2014-03-07 00:48:50.497442	2014-03-07 00:48:50.497442
1505	695	020COLSF	20Th Sb & Colorado Fs	1600 20Th St & Colorado Ave	34.0256601999999972	-118.476645500000004	\N	\N	\N	\N	2014-03-07 00:48:50.50877	2014-03-07 00:48:50.50877
1506	696	COLCLVEF	Colorado Eb & Cloverfield Fs	2200 Colorado Ave & Cloverfield Blvd	34.0285557999999995	-118.473567700000004	\N	\N	\N	\N	2014-03-07 00:48:50.519856	2014-03-07 00:48:50.519856
1507	697	COL026EN	Colorado Eb & 26Th Ns	2602 Colorado Ave & 26Th St	34.030426300000002	-118.471350299999997	\N	\N	\N	\N	2014-03-07 00:48:50.530585	2014-03-07 00:48:50.530585
1508	698	OLY026EF	Olympic Eb & 26Th Fs	2600 Olympic Blvd & 26Th St	34.0281316000000018	-118.469318900000005	\N	\N	\N	\N	2014-03-07 00:48:50.54188	2014-03-07 00:48:50.54188
1509	699	OLYSTWEF	Olympic Eb & Stewart Fs	2800 Olympic Blvd & Stewart St	34.0297669999999997	-118.464925399999998	\N	\N	\N	\N	2014-03-07 00:48:50.552903	2014-03-07 00:48:50.552903
1510	700	OLYLAFEM	Olympic Eb & La Farm Restaurant Mb	3000 Olympic Blvd & La Farm Restaurant	34.0307711999999967	-118.461615199999997	\N	\N	\N	\N	2014-03-07 00:48:50.564676	2014-03-07 00:48:50.564676
1511	701	OLYCENEN	Olympic Eb & Centinela (West) Ns	3200 Olympic Blvd & S Centinela Ave West	34.0312312000000006	-118.459377200000006	\N	\N	\N	\N	2014-03-07 00:48:50.575441	2014-03-07 00:48:50.575441
1512	702	OLYCENEF	Olympic Eb & Centinela (East) Fs	12100 W Olympic Blvd & S Centinela Ave East	34.0316291999999976	-118.457408900000004	\N	\N	\N	\N	2014-03-07 00:48:50.586217	2014-03-07 00:48:50.586217
1513	703	OLYCENWN	Olympic Wb & Centinela (East) Ns	12300 W Olympic Blvd & S Centinela Ave East	34.0318497000000022	-118.457451199999994	\N	\N	\N	\N	2014-03-07 00:48:50.59753	2014-03-07 00:48:50.59753
1514	704	OLYCENWO	Olympic Wb & Centinela (West) Ns	12300 W Olympic Blvd & S Centinela Ave West	34.0315360999999967	-118.459049699999994	\N	\N	\N	\N	2014-03-07 00:48:50.608884	2014-03-07 00:48:50.608884
1515	705	OLYNRSWM	Olympic Wb & New Roads School Mb	3000 Olympic Blvd & New Roads School	34.0309685000000002	-118.461797200000007	\N	\N	\N	\N	2014-03-07 00:48:50.619861	2014-03-07 00:48:50.619861
1516	706	OLYSTWWN	Olympic Wb & Stewart Ns	2800 Olympic Blvd & Stewart St	34.0299485999999973	-118.465161199999997	\N	\N	\N	\N	2014-03-07 00:48:50.631121	2014-03-07 00:48:50.631121
1517	707	OLY026WN	Olympic Wb & 26Th Ns	2600 Olympic Blvd & 26Th St	34.0283365000000018	-118.469461600000002	\N	\N	\N	\N	2014-03-07 00:48:50.641746	2014-03-07 00:48:50.641746
1518	708	COL026WF	Colorado Wb & 26Th Fs	2600 Colorado Ave & 26Th St	34.0303865999999999	-118.471777399999993	\N	\N	\N	\N	2014-03-07 00:48:50.653706	2014-03-07 00:48:50.653706
1519	709	COLCLVWF	Colorado Wb & Cloverfield Fs	2235 Colorado Ave & Cloverfield Blvd	34.0283312999999978	-118.474203000000003	\N	\N	\N	\N	2014-03-07 00:48:50.664225	2014-03-07 00:48:50.664225
1520	710	COL020WN	Colorado Wb & 20Th Ns	2000 Colorado Ave & 20Th St	34.0261887999999999	-118.476832400000006	\N	\N	\N	\N	2014-03-07 00:48:50.675138	2014-03-07 00:48:50.675138
1521	713	PCOMNSEF	Pico Eb & Main Fs	200 Pico Blvd & Main St	34.008060399999998	-118.489422099999999	\N	\N	\N	\N	2014-03-07 00:48:50.686449	2014-03-07 00:48:50.686449
1522	714	OLYGVLEN	Olympic Eb & Granville Ns	11800 W Olympic Blvd & Granville Ave	34.033089099999998	-118.449927099999996	\N	\N	\N	\N	2014-03-07 00:48:50.697848	2014-03-07 00:48:50.697848
1523	715	OLYBAREN	Olympic Eb & Barrington Ns	11700 W Olympic Blvd & S Barrington Ave	34.0340089000000035	-118.448085899999995	\N	\N	\N	\N	2014-03-07 00:48:50.708413	2014-03-07 00:48:50.708413
1524	716	OLYCBYEN	Olympic Eb & Colby Ns	11500 W Olympic Blvd & Colby Ave	34.0357810000000001	-118.445083699999998	\N	\N	\N	\N	2014-03-07 00:48:50.72003	2014-03-07 00:48:50.72003
1525	717	OLYPRDEN	Olympic Eb & Purdue Ns	11400 W Olympic Blvd & Purdue Ave	34.0368674999999996	-118.443303799999995	\N	\N	\N	\N	2014-03-07 00:48:50.730983	2014-03-07 00:48:50.730983
1526	718	OLYMLCEN	Olympic Eb & Malcolm Ns	10800 W Olympic Blvd & Malcolm Ave	34.0448267000000016	-118.4300408	\N	\N	\N	\N	2014-03-07 00:48:50.764157	2014-03-07 00:48:50.764157
1527	719	OLYOVLEN	Olympic Eb & Overland Ns	10700 W Olympic Blvd & Overland Ave	34.0458471999999972	-118.428284199999993	\N	\N	\N	\N	2014-03-07 00:48:50.797818	2014-03-07 00:48:50.797818
1528	720	OLYMNGEN	Olympic Eb & Manning Ns	10600 W Olympic Blvd & Manning Ave	34.0468985999999987	-118.426517899999993	\N	\N	\N	\N	2014-03-07 00:48:50.808393	2014-03-07 00:48:50.808393
1529	721	OLYPRSEN	Olympic Eb & Prosser Ns	10500 W Olympic Blvd & Prosser Ave	34.0479203000000012	-118.424734799999996	\N	\N	\N	\N	2014-03-07 00:48:50.819678	2014-03-07 00:48:50.819678
1530	722	OLYPATEN	Olympic Eb & Patricia Ns	10500 W Olympic Blvd & Patricia Ave	34.0491451999999981	-118.422534600000006	\N	\N	\N	\N	2014-03-07 00:48:50.831093	2014-03-07 00:48:50.831093
1531	723	OLYBVGEN	Olympic Eb & Beverly Glen Ns	10400 W Olympic Blvd & S Beverly Glen Blvd	34.0501639000000011	-118.420700199999999	\N	\N	\N	\N	2014-03-07 00:48:50.842375	2014-03-07 00:48:50.842375
1532	725	CPWOLYNF	Century Park West Nb & Olympic Fs	2100 Century Park W & W Olympic Blvd	34.0535935999999992	-118.416391300000001	\N	\N	\N	\N	2014-03-07 00:48:50.853564	2014-03-07 00:48:50.853564
1533	726	CONMGMEM	Constellation Eb & Mgm Dr Mb	10200 Constellation Blvd & Mgm Dr	34.057535399999999	-118.417417900000004	\N	\N	\N	\N	2014-03-07 00:48:50.864782	2014-03-07 00:48:50.864782
1534	727	CONCPEEN	Constellation Eb & Cent Pk East Ns	10100 Constellation Blvd & Century Park E	34.0600985000000023	-118.413825900000006	\N	\N	\N	\N	2014-03-07 00:48:50.875729	2014-03-07 00:48:50.875729
1535	728	OLYCPEEF	Olympic Eb & Century Park East Fs	10000 W Olympic Blvd & Century Park E	34.058767600000003	-118.411590899999993	\N	\N	\N	\N	2014-03-07 00:48:50.886849	2014-03-07 00:48:50.886849
1536	729	OLYSPLEF	Olympic Eb & Spalding Fs	9900 W Olympic Blvd & S Spalding Dr	34.0596833999999973	-118.408239399999999	\N	\N	\N	\N	2014-03-07 00:48:50.89807	2014-03-07 00:48:50.89807
1537	730	OLYROXEN	Olympic Eb & Roxbury Ns	9700 W Olympic Blvd & S Roxbury Dr	34.0596267000000026	-118.405874600000004	\N	\N	\N	\N	2014-03-07 00:48:50.908973	2014-03-07 00:48:50.908973
1538	731	OLYCMDEF	Olympic Eb & Camden Dr Fs	9500 W Olympic Blvd & S Camden Dr	34.0596366999999987	-118.402167800000001	\N	\N	\N	\N	2014-03-07 00:48:50.920201	2014-03-07 00:48:50.920201
1539	732	OLYCMDWF	Olympic Wb & Camden Dr Fs	9500 W Olympic Blvd & S Camden Dr	34.0598699000000025	-118.402589800000001	\N	\N	\N	\N	2014-03-07 00:48:50.931293	2014-03-07 00:48:50.931293
1540	733	OLYBVLEN	Olympic Eb & Beverwil Ns	9400 W Olympic Blvd & Beverwil Dr	34.0596314000000007	-118.399535	\N	\N	\N	\N	2014-03-07 00:48:50.941704	2014-03-07 00:48:50.941704
1541	734	BEVWHTSN	Beverly Dr Sb & Whitworth Ns	400 S Beverly Dr & Whitworth Dr	34.0577560999999989	-118.397263699999996	\N	\N	\N	\N	2014-03-07 00:48:50.953699	2014-03-07 00:48:50.953699
1542	735	PCOGLVEF	Pico Eb & Glenville Fs	9200 W Pico Blvd & Glenville Dr	34.0552398000000025	-118.392969100000002	\N	\N	\N	\N	2014-03-07 00:48:50.964809	2014-03-07 00:48:50.964809
1543	736	PCOCPEEN	Pico Eb & Century Park East Ns	10000 W Pico Blvd & Century Park E	34.0523146999999966	-118.406484500000005	\N	\N	\N	\N	2014-03-07 00:48:50.975862	2014-03-07 00:48:50.975862
1544	737	PCOROXEN	Pico Eb & Roxbury Ns	9800 W Pico Blvd & S Roxbury Dr	34.0538503000000006	-118.402392300000002	\N	\N	\N	\N	2014-03-07 00:48:50.986958	2014-03-07 00:48:50.986958
1545	738	PCOBVLEF	Pico Eb & Beverwil Fs	9700 W Pico Blvd & Beverwil Dr	34.0548576999999995	-118.399268599999999	\N	\N	\N	\N	2014-03-07 00:48:50.998121	2014-03-07 00:48:50.998121
1546	739	PCODHYEN	Pico Eb & Doheny Ns	9100 W Pico Blvd & S Doheny Dr	34.0551940000000002	-118.390109300000006	\N	\N	\N	\N	2014-03-07 00:48:51.008853	2014-03-07 00:48:51.008853
1547	740	PCOLIVEN	Pico Eb & Livonia Ns	8900 W Pico Blvd & Livonia Ave	34.0552436999999983	-118.386607900000001	\N	\N	\N	\N	2014-03-07 00:48:51.019968	2014-03-07 00:48:51.019968
1548	741	PCOSHNEN	Pico Eb & Shenandoah Ns	8700 W Pico Blvd & S Shenandoah St	34.0543897000000015	-118.381741700000006	\N	\N	\N	\N	2014-03-07 00:48:51.031059	2014-03-07 00:48:51.031059
1549	742	PCOSHREN	Pico Eb & Sherbourne Ns	8600 W Pico Blvd & S Sherbourne Dr	34.0539415000000005	-118.379695799999993	\N	\N	\N	\N	2014-03-07 00:48:51.042536	2014-03-07 00:48:51.042536
1550	743	PCOLAXEF	Pico Eb & La Cienega Fs	8500 W Pico Blvd & S La Cienega Blvd	34.0531301999999982	-118.375623399999995	\N	\N	\N	\N	2014-03-07 00:48:51.053334	2014-03-07 00:48:51.053334
1551	744	PCOALVEN	Pico Eb & Alvira Ns	6500 W Pico Blvd & Alvira St	34.0527821000000017	-118.373963700000004	\N	\N	\N	\N	2014-03-07 00:48:51.064826	2014-03-07 00:48:51.064826
1552	745	PCOCRSEN	Pico Eb & Crescent Hts Ns	6300 W Pico Blvd & S Crescent Hts Blvd	34.0525289999999998	-118.372352199999995	\N	\N	\N	\N	2014-03-07 00:48:51.075877	2014-03-07 00:48:51.075877
1553	746	PCOHIPEN	Pico Eb & Hi Point Ns	6000 W Pico Blvd & Hi Point St	34.0518690999999976	-118.368957899999998	\N	\N	\N	\N	2014-03-07 00:48:51.086953	2014-03-07 00:48:51.086953
1554	747	PCOFRXEF	Pico Eb & Fairfax Fs	5900 W Pico Blvd & S Fairfax Ave	34.0512939999999986	-118.366183100000001	\N	\N	\N	\N	2014-03-07 00:48:51.098209	2014-03-07 00:48:51.098209
1555	748	PCOGNSEN	Pico Eb & Genesee Ns	5700 W Pico Blvd & S Genesee Ave	34.0508418000000006	-118.363652400000007	\N	\N	\N	\N	2014-03-07 00:48:51.108729	2014-03-07 00:48:51.108729
1556	749	PCOCSNEN	Pico Eb & Curson Ns	5600 W Pico Blvd & S Curson Ave	34.0497286000000017	-118.360106999999999	\N	\N	\N	\N	2014-03-07 00:48:51.120306	2014-03-07 00:48:51.120306
1557	750	PCOHAUEN	Pico Eb & Hauser Ns	5500 W Pico Blvd & Hauser Blvd	34.0492198999999971	-118.360085499999997	\N	\N	\N	\N	2014-03-07 00:48:51.130972	2014-03-07 00:48:51.130972
1558	751	PCOBSDEF	Pico Eb & Burnside Fs	5300 W Pico Blvd & S Burnside Ave	34.0482585000000029	-118.354598199999998	\N	\N	\N	\N	2014-03-07 00:48:51.141983	2014-03-07 00:48:51.141983
1559	752	PCOCCNEN	Pico Eb & Cochran Ns	5200 W Pico Blvd & S Cochran Ave	34.0481307000000015	-118.352930900000004	\N	\N	\N	\N	2014-03-07 00:48:51.154069	2014-03-07 00:48:51.154069
1560	753	PCOREDEN	Pico Eb & Redondo Ns	5100 W Pico Blvd & S Redondo Blvd	34.047906900000001	-118.349817599999994	\N	\N	\N	\N	2014-03-07 00:48:51.16465	2014-03-07 00:48:51.16465
1561	754	PCOORNEN	Pico Eb & Orange Ns	5000 W Pico Blvd & S Orange Dr	34.0477301000000026	-118.347218699999999	\N	\N	\N	\N	2014-03-07 00:48:51.17517	2014-03-07 00:48:51.17517
1562	755	PCOLABEF	Pico Eb & La Brea Fs	4900 W Pico Blvd & S La Brea Ave	34.0478194000000016	-118.344335999999998	\N	\N	\N	\N	2014-03-07 00:48:51.186489	2014-03-07 00:48:51.186489
1563	756	PCOSVLEN	Pico Eb & San Vicente Ns	4800 W Pico Blvd & San Vicente Blvd	34.0482703999999998	-118.340206800000004	\N	\N	\N	\N	2014-03-07 00:48:51.19792	2014-03-07 00:48:51.19792
1564	757	PCO010EF	Pico Eb & 10Th Fs	1000 Pico Blvd & 10Th St	34.0134162000000018	-118.480721500000001	\N	\N	\N	\N	2014-03-07 00:48:51.208662	2014-03-07 00:48:51.208662
1565	758	PCOEULEN	Pico Eb & Euclid Ns	1300 Pico Blvd & Euclid St	34.0149893000000034	-118.477779499999997	\N	\N	\N	\N	2014-03-07 00:48:51.219525	2014-03-07 00:48:51.219525
1566	761	PCOSAWEF	Pico Eb & Sawtelle Fs	11300 W Pico Blvd & Sawtelle Blvd	34.0353348000000011	-118.438280199999994	\N	\N	\N	\N	2014-03-07 00:48:51.231425	2014-03-07 00:48:51.231425
1567	762	PCOSEPEN	Pico Eb & Sepulveda Ns	11000 W Pico Blvd & S Sepulveda Blvd	34.0367598999999998	-118.435356900000002	\N	\N	\N	\N	2014-03-07 00:48:51.242619	2014-03-07 00:48:51.242619
1568	764	PCOVETEN	Pico Eb & Veteran Ns	10900 W Pico Blvd & Veteran Ave	34.0386166999999986	-118.431511400000005	\N	\N	\N	\N	2014-03-07 00:48:51.253765	2014-03-07 00:48:51.253765
1569	765	PCOPRDWN	Pico Wb & Purdue Ns	11400 W Pico Blvd & Purdue Ave	34.0344009000000014	-118.440590900000004	\N	\N	\N	\N	2014-03-07 00:48:51.264464	2014-03-07 00:48:51.264464
1570	767	PCOTRMWN	Pico Wb & Tremaine Ns	4800 W Pico Blvd & S Tremaine Ave	34.0483933000000007	-118.340705299999996	\N	\N	\N	\N	2014-03-07 00:48:51.275825	2014-03-07 00:48:51.275825
1571	768	PCOLABWN	Pico Wb & La Brea Ns	4900 W Pico Blvd & S La Brea Ave	34.0479898999999975	-118.344198500000005	\N	\N	\N	\N	2014-03-07 00:48:51.287115	2014-03-07 00:48:51.287115
1572	769	PCOREDWN	Pico Wb & Redondo Ns	5100 W Pico Blvd & S Redondo Blvd	34.0480147000000031	-118.349048100000005	\N	\N	\N	\N	2014-03-07 00:48:51.298092	2014-03-07 00:48:51.298092
1573	770	PCOCCNWN	Pico Wb & Cochran Ns	5200 W Pico Blvd & S Cochran Ave	34.0482976999999991	-118.352475900000002	\N	\N	\N	\N	2014-03-07 00:48:51.308953	2014-03-07 00:48:51.308953
1574	771	PCOBSDWN	Pico Wb & Burnside Ns	5300 W Pico Blvd & S Burnside Ave	34.0484547000000006	-118.354568499999999	\N	\N	\N	\N	2014-03-07 00:48:51.319941	2014-03-07 00:48:51.319941
1575	772	PCOHAUWN	Pico Wb & Hauser Ns	5500 W Pico Blvd & Hauser Blvd	34.0486392999999978	-118.356498000000002	\N	\N	\N	\N	2014-03-07 00:48:51.330877	2014-03-07 00:48:51.330877
1576	773	PCOCSNWF	Pico Wb & Curson Fs	5600 W Pico Blvd & S Curson Ave	34.0499751999999987	-118.360236299999997	\N	\N	\N	\N	2014-03-07 00:48:51.342502	2014-03-07 00:48:51.342502
1577	774	PCOGNSWN	Pico Wb & Genesee Ns	5700 W Pico Blvd & S Genesee Ave	34.0509050000000002	-118.363068400000003	\N	\N	\N	\N	2014-03-07 00:48:51.353609	2014-03-07 00:48:51.353609
1578	775	PCOFRXWF	Pico Wb & Fairfax Fs	5900 W Pico Blvd & S Fairfax Ave	34.0516798000000023	-118.367189600000003	\N	\N	\N	\N	2014-03-07 00:48:51.364812	2014-03-07 00:48:51.364812
1579	776	PCOHIPWN	Pico Wb & Hi Point Ns	6000 W Pico Blvd & Hi Point St	34.0519861000000006	-118.368741200000002	\N	\N	\N	\N	2014-03-07 00:48:51.375497	2014-03-07 00:48:51.375497
1580	777	PCOCRSWN	Pico Wb & Crescent Heights Ns	6300 W Pico Blvd & S Crescent Hts Blvd	34.0525583000000012	-118.371754600000003	\N	\N	\N	\N	2014-03-07 00:48:51.386374	2014-03-07 00:48:51.386374
1581	778	PCOLJLWN	Pico Wb & La Jolla Ns	6500 W Pico Blvd & S La Jolla Ave	34.052970700000003	-118.373881299999994	\N	\N	\N	\N	2014-03-07 00:48:51.397486	2014-03-07 00:48:51.397486
1582	779	PCOLAXWN	Pico Wb & La Cienega Ns	8500 W Pico Blvd & S La Cienega Blvd	34.0533562999999972	-118.3758658	\N	\N	\N	\N	2014-03-07 00:48:51.409174	2014-03-07 00:48:51.409174
1583	780	PCOSHNWN	Pico Wb & Shenandoah Ns	8700 W Pico Blvd & S Shenandoah St	34.0544203999999979	-118.381419300000005	\N	\N	\N	\N	2014-03-07 00:48:51.420488	2014-03-07 00:48:51.420488
1584	781	PCOLAPWN	Pico Wb & La Peer Ns	8900 W Pico Blvd & S La Peer Dr	34.0553487000000032	-118.386635400000003	\N	\N	\N	\N	2014-03-07 00:48:51.431618	2014-03-07 00:48:51.431618
1585	782	ROBCSHSN	Robertson Sb & Cashio Ns	1500 S Robertson Blvd & Cashio St	34.0524126999999979	-118.384151599999996	\N	\N	\N	\N	2014-03-07 00:48:51.442971	2014-03-07 00:48:51.442971
1586	783	PCODHYWN	Pico Wb & Doheny Ns	9100 W Pico Blvd & S Doheny Dr	34.0553244999999976	-118.389692199999999	\N	\N	\N	\N	2014-03-07 00:48:51.453283	2014-03-07 00:48:51.453283
1587	784	PCOGLVWN	Pico Wb & Glenville Ns	9200 W Pico Blvd & Glenville Dr	34.0553246999999999	-118.392652999999996	\N	\N	\N	\N	2014-03-07 00:48:51.464791	2014-03-07 00:48:51.464791
1588	785	BEVWHTNN	Beverly Dr Nb & Whitworth Dr	400 S Beverly Dr & Whitworth Dr	34.0566663000000034	-118.396320099999997	\N	\N	\N	\N	2014-03-07 00:48:51.475487	2014-03-07 00:48:51.475487
1589	786	OLYBEVWF	Olympic Wb & Beverly Fs	9400 W Olympic Blvd & Beverly Dr	34.0598756999999992	-118.399668199999994	\N	\N	\N	\N	2014-03-07 00:48:51.486552	2014-03-07 00:48:51.486552
1590	787	OLYROXWF	Olympic Wb & Roxbury Fs	9700 W Olympic Blvd & S Roxbury Dr	34.0598370000000017	-118.4058347	\N	\N	\N	\N	2014-03-07 00:48:51.497482	2014-03-07 00:48:51.497482
1591	788	OLYSPLWF	Olympic Wb & Spalding Fs	9900 W Olympic Blvd & S Spalding Dr	34.0598357000000007	-118.409295400000005	\N	\N	\N	\N	2014-03-07 00:48:51.509184	2014-03-07 00:48:51.509184
1592	789	OLYCPEWN	Olympic Wb & Century Park East Ns	10000 W Olympic Blvd & Century Park E	34.0587626000000014	-118.411856400000005	\N	\N	\N	\N	2014-03-07 00:48:51.520396	2014-03-07 00:48:51.520396
1593	790	CONCPEWF	Constellation Wb & Cent Pk East Fs	10100 Constellation Blvd & Century Park E	34.0602976999999996	-118.414020800000003	\N	\N	\N	\N	2014-03-07 00:48:51.531511	2014-03-07 00:48:51.531511
1594	791	CONCPWWM	Constellation Wb & Cent Pk West Mb	10200 Constellation Blvd & Century Park W	34.0568895999999981	-118.418177200000002	\N	\N	\N	\N	2014-03-07 00:48:51.54264	2014-03-07 00:48:51.54264
1595	792	CPWOLYSN	Century Park West Sb & Olympic Ns	2100 Century Park W & W Olympic Blvd	34.0533343999999971	-118.416461100000006	\N	\N	\N	\N	2014-03-07 00:48:51.553797	2014-03-07 00:48:51.553797
1596	793	OLYKERWF	Olympic Wb & Kerwood Fs	10300 W Olympic Blvd & Kerwood Ave	34.0513951000000006	-118.419066099999995	\N	\N	\N	\N	2014-03-07 00:48:51.56488	2014-03-07 00:48:51.56488
1597	794	OLYBVGWN	Olympic Wb & Beverly Glen Ns	10400 W Olympic Blvd & S Beverly Glen Blvd	34.0505931000000004	-118.420434900000004	\N	\N	\N	\N	2014-03-07 00:48:51.575982	2014-03-07 00:48:51.575982
1598	795	OLYPATWN	Olympic Wb & Patricia Ns	10400 W Olympic Blvd & Patricia Ave	34.0495233999999982	-118.422314	\N	\N	\N	\N	2014-03-07 00:48:51.587091	2014-03-07 00:48:51.587091
1599	796	OLYPRSWN	Olympic Wb & Prosser Ns	10500 W Olympic Blvd & Prosser Ave	34.0483641000000006	-118.424456500000005	\N	\N	\N	\N	2014-03-07 00:48:51.598121	2014-03-07 00:48:51.598121
1600	797	OLYMNGWN	Olympic Wb & Manning Ns	10600 W Olympic Blvd & Manning Ave	34.0472898000000015	-118.426296100000002	\N	\N	\N	\N	2014-03-07 00:48:51.609382	2014-03-07 00:48:51.609382
1601	798	OLYOVLWN	Olympic Wb & Overland Ns	10700 W Olympic Blvd & Overland Ave	34.0462355000000017	-118.428083999999998	\N	\N	\N	\N	2014-03-07 00:48:51.620398	2014-03-07 00:48:51.620398
1602	799	OLYMLCWN	Olympic Wb & Malcolm Ns	10800 W Olympic Blvd & Malcolm Ave	34.0451941999999974	-118.429848699999994	\N	\N	\N	\N	2014-03-07 00:48:51.631509	2014-03-07 00:48:51.631509
1603	800	OLYPRDWN	Olympic Wb & Purdue Ns	11400 W Olympic Blvd & Purdue Ave	34.0373834999999971	-118.443054700000005	\N	\N	\N	\N	2014-03-07 00:48:51.642647	2014-03-07 00:48:51.642647
1604	801	OLYCBYWN	Olympic Wb & Colby Ns	11500 W Olympic Blvd & Colby Ave	34.0361698999999973	-118.444884099999996	\N	\N	\N	\N	2014-03-07 00:48:51.653786	2014-03-07 00:48:51.653786
1605	802	OLYBARWN	Olympic Wb & Barrington Ns	11700 W Olympic Blvd & S Barrington Ave	34.0346357999999967	-118.447596700000005	\N	\N	\N	\N	2014-03-07 00:48:51.664873	2014-03-07 00:48:51.664873
1606	803	OLYGVLWN	Olympic Wb & Granville Ns	11800 W Olympic Blvd & Granville Ave	34.0333973999999984	-118.449743100000006	\N	\N	\N	\N	2014-03-07 00:48:51.675985	2014-03-07 00:48:51.675985
1607	804	PCOOVLEF	Pico Eb & Overland Fs	10700 W Pico Blvd & Overland Ave	34.0419939000000014	-118.424316599999997	\N	\N	\N	\N	2014-03-07 00:48:51.687104	2014-03-07 00:48:51.687104
1608	805	PCOMNGEN	Pico Eb & Manning Ns	10600 W Pico Blvd & Manning Ave	34.0428062000000011	-118.422941399999999	\N	\N	\N	\N	2014-03-07 00:48:51.698251	2014-03-07 00:48:51.698251
1609	806	PCOPRSEN	Pico Eb & Prosser Ns	10550 W Pico Blvd & Prosser Ave	34.0438126999999966	-118.421259300000003	\N	\N	\N	\N	2014-03-07 00:48:51.709351	2014-03-07 00:48:51.709351
1610	807	PCOPATEF	Pico Eb & Patricia Fs	10500 W Pico Blvd & Patricia Ave	34.0452940999999996	-118.4186859	\N	\N	\N	\N	2014-03-07 00:48:51.720395	2014-03-07 00:48:51.720395
1611	809	PCOKEREN	Pico Eb & Kerwood Ns	10300 W Pico Blvd & Kerwood Ave	34.0471849999999989	-118.415415999999993	\N	\N	\N	\N	2014-03-07 00:48:51.731878	2014-03-07 00:48:51.731878
1612	810	PCOFXHEN	Pico Eb & Fox Hills Dr Ns	10200 W Pico Blvd & Fox Hills Dr	34.0484355999999977	-118.413239399999995	\N	\N	\N	\N	2014-03-07 00:48:51.742196	2014-03-07 00:48:51.742196
1613	811	PCOBVLWN	Pico Wb & Beverwil Ns	9700 W Pico Blvd & Beverwil Dr	34.0551437000000021	-118.398771999999994	\N	\N	\N	\N	2014-03-07 00:48:51.753912	2014-03-07 00:48:51.753912
1614	812	PCOROXWN	Pico Wb & Roxbury Ns	9800 W Pico Blvd & S Roxbury Dr	34.0541812000000021	-118.401893799999996	\N	\N	\N	\N	2014-03-07 00:48:51.764936	2014-03-07 00:48:51.764936
1615	813	PCOCPEWF	Pico Wb & Century Park East Fs	10000 W Pico Blvd & Century Park E	34.0524619999999985	-118.406627599999993	\N	\N	\N	\N	2014-03-07 00:48:51.776044	2014-03-07 00:48:51.776044
1616	814	PCOFXHWF	Pico Wb & Fox Hills Dr Fs	10200 W Pico Blvd & Fox Hills Dr	34.0485735999999974	-118.413383300000007	\N	\N	\N	\N	2014-03-07 00:48:51.787423	2014-03-07 00:48:51.787423
1617	815	PCOKERWN	Pico Wb & Kerwood Ns	10300 W Pico Blvd & Kerwood Ave	34.0475411999999977	-118.415152500000005	\N	\N	\N	\N	2014-03-07 00:48:51.798474	2014-03-07 00:48:51.798474
1618	817	PCOPATWN	Pico Wb & Patricia Ns	10500 W Pico Blvd & Patricia Ave	34.045446400000003	-118.418793100000002	\N	\N	\N	\N	2014-03-07 00:48:51.809967	2014-03-07 00:48:51.809967
1619	818	PCOPRSWN	Pico Wb & Prosser Ns	10550 W Pico Blvd & Prosser Ave	34.0442156000000011	-118.420929700000002	\N	\N	\N	\N	2014-03-07 00:48:51.820845	2014-03-07 00:48:51.820845
1620	819	PCOMNGWN	Pico Wb & Manning Ns	10600 W Pico Blvd & Manning Ave	34.0431542999999976	-118.422639599999997	\N	\N	\N	\N	2014-03-07 00:48:51.832073	2014-03-07 00:48:51.832073
1621	820	PCOOVLWN	Pico Wb & Overland Ns	10700 W Pico Blvd & Overland Ave	34.0421425999999983	-118.424539699999997	\N	\N	\N	\N	2014-03-07 00:48:51.842761	2014-03-07 00:48:51.842761
1622	821	PCOCENWN	Pico Wb & Centinela Ns	12300 W Pico Blvd & S Centinela Ave	34.0283081999999979	-118.452672300000003	\N	\N	\N	\N	2014-03-07 00:48:51.853341	2014-03-07 00:48:51.853341
1623	822	PCO033WN	Pico Wb & 33Rd (Urban Ave) Ns	3300 Pico Blvd & 33Rd St	34.0270038000000028	-118.455360900000002	\N	\N	\N	\N	2014-03-07 00:48:51.865198	2014-03-07 00:48:51.865198
1624	823	PCODCHWN	Pico Wb & Dorchester (30Th) Ns	3000 Pico Blvd & Dorchester Ave	34.0255484999999993	-118.458268399999994	\N	\N	\N	\N	2014-03-07 00:48:51.876186	2014-03-07 00:48:51.876186
1625	825	PCO026WN	Pico Wb & 26Th Ns	2600 Pico Blvd & 26Th St	34.0233980000000003	-118.462362299999995	\N	\N	\N	\N	2014-03-07 00:48:51.886882	2014-03-07 00:48:51.886882
1626	826	PCOCLVWN	Pico Wb & Cloverfield Ns	2400 Pico Blvd & Cloverfield Blvd	34.021983800000001	-118.464986800000005	\N	\N	\N	\N	2014-03-07 00:48:51.898585	2014-03-07 00:48:51.898585
1627	827	PCO021WN	Pico Wb & 21St Ns	2100 Pico Blvd & 21St St	34.0204486000000017	-118.467888299999998	\N	\N	\N	\N	2014-03-07 00:48:51.909645	2014-03-07 00:48:51.909645
1628	828	PCO020WN	Pico Wb & 20Th Ns	2000 Pico Blvd & 20Th St	34.0197657000000007	-118.469149700000003	\N	\N	\N	\N	2014-03-07 00:48:51.92078	2014-03-07 00:48:51.92078
1629	829	PCO018WN	Pico Wb & 18Th Ns	1800 Pico Blvd & 18Th St	34.0187916000000001	-118.470986600000003	\N	\N	\N	\N	2014-03-07 00:48:51.931847	2014-03-07 00:48:51.931847
1630	830	PCO017WN	Pico Wb & 17Th Ns	1700 Pico Blvd & 17Th St	34.0180298000000008	-118.4724054	\N	\N	\N	\N	2014-03-07 00:48:51.94297	2014-03-07 00:48:51.94297
1631	831	PCO014WN	Pico Wb & 14Th Ns	1400 Pico Blvd & 14Th St	34.0162532000000013	-118.475770800000006	\N	\N	\N	\N	2014-03-07 00:48:51.95417	2014-03-07 00:48:51.95417
1632	832	PCO012WN	Pico Wb & 12Th Ns	1200 Pico Blvd & 12Th St	34.0149155000000007	-118.478250200000005	\N	\N	\N	\N	2014-03-07 00:48:51.965458	2014-03-07 00:48:51.965458
1633	833	PCO010WN	Pico Wb & 10Th Ns	1000 Pico Blvd & 10Th St	34.0137381999999988	-118.480467700000005	\N	\N	\N	\N	2014-03-07 00:48:51.976116	2014-03-07 00:48:51.976116
1634	834	WWOMISSN	Westwood Sb & Missouri Ns	1800 Westwood Blvd & Missouri Ave	34.0483497999999969	-118.435576499999996	\N	\N	\N	\N	2014-03-07 00:48:51.987343	2014-03-07 00:48:51.987343
1635	835	WWOLGRSN	Westwood Sb & La Grange Ns	2000 Westwood Blvd & La Grange Ave	34.0468246000000008	-118.434334500000006	\N	\N	\N	\N	2014-03-07 00:48:51.998088	2014-03-07 00:48:51.998088
1636	836	WWOOLYSN	Westwood Sb & Olympic Ns	2100 Westwood Blvd & W Olympic Blvd	34.0441235999999989	-118.432037800000003	\N	\N	\N	\N	2014-03-07 00:48:52.009061	2014-03-07 00:48:52.009061
1637	837	WWOEXPSN	Westwood Sb & Exposition Ns	2600 Westwood Blvd & Exposition Blvd	34.0369492000000022	-118.426078599999997	\N	\N	\N	\N	2014-03-07 00:48:52.020374	2014-03-07 00:48:52.020374
1638	838	WWOBVNSN	Westwood Sb & Brookhaven Ns	2700 Westwood Blvd & Brookhaven Ave	34.0351367999999965	-118.424658199999996	\N	\N	\N	\N	2014-03-07 00:48:52.031442	2014-03-07 00:48:52.031442
1639	839	WWOCVTSN	Westwood Sb & Coventry Ns	2700 Westwood Blvd & Coventry Pl	34.0334654999999984	-118.423330899999996	\N	\N	\N	\N	2014-03-07 00:48:52.042684	2014-03-07 00:48:52.042684
1640	840	WWONATSN	Westwood Sb & National Ns	2900 Westwood Blvd & National Blvd	34.0308417999999975	-118.421235300000006	\N	\N	\N	\N	2014-03-07 00:48:52.054241	2014-03-07 00:48:52.054241
1641	841	NATKLTWN	National Wb & Kelton Ns	10900 National Blvd & Kelton Ave	34.0298773000000025	-118.422562900000003	\N	\N	\N	\N	2014-03-07 00:48:52.064749	2014-03-07 00:48:52.064749
1642	842	NATCVTWN	Natl Wb & Coventry (Military) Ns	11000 National Blvd & Coventry Pl	34.028897299999997	-118.425089499999999	\N	\N	\N	\N	2014-03-07 00:48:52.076276	2014-03-07 00:48:52.076276
1643	843	NATSEPWN	National Wb & Sepulveda Ns	11200 National Blvd & S Sepulveda Blvd	34.027624000000003	-118.428361800000005	\N	\N	\N	\N	2014-03-07 00:48:52.087105	2014-03-07 00:48:52.087105
1644	844	NATSAWWF	National Wb & Sawtelle Fs	11300 National Blvd & Sawtelle Blvd	34.026017600000003	-118.432131100000007	\N	\N	\N	\N	2014-03-07 00:48:52.09862	2014-03-07 00:48:52.09862
1645	846	NATFEDWN	National Wb & Federal Ns	11500 National Blvd & Federal Ave	34.0239430000000027	-118.436416800000003	\N	\N	\N	\N	2014-03-07 00:48:52.109344	2014-03-07 00:48:52.109344
1646	848	BARBVNNN	Barrington Nb & Brookhaven Ns	2700 S Barrington Ave & Brookhaven Ave	34.0255267000000003	-118.440778100000003	\N	\N	\N	\N	2014-03-07 00:48:52.120454	2014-03-07 00:48:52.120454
1647	849	BARRCHNN	Barrington Nb & Richland Ns	2500 S Barrington Ave & Richland Ave	34.0273967999999982	-118.442214100000001	\N	\N	\N	\N	2014-03-07 00:48:52.132247	2014-03-07 00:48:52.132247
1648	850	GTYBARWF	Gateway Wb & Barrington Fs	11700 Gateway Blvd & S Barrington Ave	34.0283731000000031	-118.443478400000004	\N	\N	\N	\N	2014-03-07 00:48:52.142646	2014-03-07 00:48:52.142646
1649	851	GTYGVLWN	Gateway Wb & Granville Ns	11800 Gateway Blvd & Granville Ave	34.0265789999999981	-118.4440046	\N	\N	\N	\N	2014-03-07 00:48:52.153384	2014-03-07 00:48:52.153384
1650	852	OPRBUNWN	Ocean Park Wb & Bundy Ns	11800 Ocean Park Blvd & S Bundy Dr	34.0246678000000031	-118.446153100000004	\N	\N	\N	\N	2014-03-07 00:48:52.165131	2014-03-07 00:48:52.165131
1651	853	OPR031WN	Ocean Park Wb & 31St Ns	3100 Ocean Park Blvd & 31St St	34.0207606000000027	-118.452815599999994	\N	\N	\N	\N	2014-03-07 00:48:52.176298	2014-03-07 00:48:52.176298
1652	854	OPR028WF	Ocean Park Wb & 28Th Fs	2800 Ocean Park Blvd & 28Th St	34.0187153999999978	-118.456340699999998	\N	\N	\N	\N	2014-03-07 00:48:52.242822	2014-03-07 00:48:52.242822
1653	855	OPR025WN	Ocean Park Wb & 25Th Ns	2500 Ocean Park Blvd & 25Th St	34.0175309999999982	-118.458387200000004	\N	\N	\N	\N	2014-03-07 00:48:52.253915	2014-03-07 00:48:52.253915
1654	856	OPR023WF	Ocean Park Wb & 23Rd Fs	2300 Ocean Park Blvd & 23Rd St	34.0153677999999999	-118.4620946	\N	\N	\N	\N	2014-03-07 00:48:52.265101	2014-03-07 00:48:52.265101
1655	857	OPR017WN	Ocean Park Wb & 17Th Ns	1700 Ocean Park Blvd & 17Th St	34.0125961999999973	-118.466773000000003	\N	\N	\N	\N	2014-03-07 00:48:52.27623	2014-03-07 00:48:52.27623
1656	859	OPREULWN	Ocean Park Wb & Euclid Ns	1300 Ocean Park Blvd & Euclid St	34.0096516999999992	-118.471830100000005	\N	\N	\N	\N	2014-03-07 00:48:52.287316	2014-03-07 00:48:52.287316
1657	860	OPR011WF	Ocean Park Wb & 11Th Fs	1100 Ocean Park Blvd & 11Th St	34.0083683000000008	-118.474035999999998	\N	\N	\N	\N	2014-03-07 00:48:52.298454	2014-03-07 00:48:52.298454
1658	861	OPR005WN	Ocean Park Wb & 5Th Ns	500 Ocean Park Blvd & 5Th St	34.0047719000000015	-118.480254299999999	\N	\N	\N	\N	2014-03-07 00:48:52.309638	2014-03-07 00:48:52.309638
1659	862	OPR005EF	Ocean Park Eb & 5Th Fs	500 Ocean Park Blvd & 5Th St	34.0047578000000001	-118.480003999999994	\N	\N	\N	\N	2014-03-07 00:48:52.320706	2014-03-07 00:48:52.320706
1660	863	OPRHIGEN	Ocean Park Eb & Highland Ns	600 Ocean Park Blvd & Highland Ave	34.0054406	-118.478807099999997	\N	\N	\N	\N	2014-03-07 00:48:52.331835	2014-03-07 00:48:52.331835
1661	864	OPR011EN	Ocean Park Eb & 11Th Ns	1100 Ocean Park Blvd & 11Th St	34.0082974999999976	-118.473927900000007	\N	\N	\N	\N	2014-03-07 00:48:52.342916	2014-03-07 00:48:52.342916
1662	865	OPREULEF	Ocean Park Eb & Euclid Fs	1300 Ocean Park Blvd & Euclid St	34.0095743999999982	-118.471721400000007	\N	\N	\N	\N	2014-03-07 00:48:52.354064	2014-03-07 00:48:52.354064
1663	866	OPR014EN	Ocean Park Eb & 14Th Ns	1400 Ocean Park Blvd & 14Th St	34.0103349999999978	-118.470389400000002	\N	\N	\N	\N	2014-03-07 00:48:52.365188	2014-03-07 00:48:52.365188
1664	867	OPR017EN	Ocean Park Eb & 17Th Ns	1700 Ocean Park Blvd & 17Th St	34.0122195000000005	-118.467130999999995	\N	\N	\N	\N	2014-03-07 00:48:52.376269	2014-03-07 00:48:52.376269
1665	868	OPR023EF	Ocean Park Eb & 23Rd Fs	2300 Ocean Park Blvd & 23Rd St	34.0154761000000008	-118.461608699999999	\N	\N	\N	\N	2014-03-07 00:48:52.387367	2014-03-07 00:48:52.387367
1666	869	OPR025EF	Ocean Park Eb & 25Th Fs	2500 Ocean Park Blvd & 25Th St	34.0174419000000015	-118.458123900000004	\N	\N	\N	\N	2014-03-07 00:48:52.398441	2014-03-07 00:48:52.398441
1667	870	OPR028EF	Ocean Park Eb & 28Th Fs	2800 Ocean Park Blvd & 28Th St	34.0189395000000019	-118.455549099999999	\N	\N	\N	\N	2014-03-07 00:48:52.409585	2014-03-07 00:48:52.409585
1668	871	OPR031EF	Ocean Park Eb & 31St Fs	3100 Ocean Park Blvd & 31St St	34.0209503000000026	-118.452066700000003	\N	\N	\N	\N	2014-03-07 00:48:52.420821	2014-03-07 00:48:52.420821
1669	872	GTYGVLEF	Gateway Eb & Granville Fs	11800 Gateway Blvd & Granville Ave	34.0262154999999993	-118.443805600000005	\N	\N	\N	\N	2014-03-07 00:48:52.43193	2014-03-07 00:48:52.43193
1670	873	GTYBAREN	Gateway Eb & Barrington Ns	11700 Gateway Blvd & S Barrington Ave	34.0278392999999966	-118.443353999999999	\N	\N	\N	\N	2014-03-07 00:48:52.443005	2014-03-07 00:48:52.443005
1671	874	BARBVNSN	Barrington Sb & Brookhaven Ns	2700 S Barrington Ave & Brookhaven Ave	34.0258731999999995	-118.441278499999996	\N	\N	\N	\N	2014-03-07 00:48:52.454189	2014-03-07 00:48:52.454189
1672	876	NATFEDEN	National Eb & Federal Ns	11500 National Blvd & Federal Ave	34.0235441000000023	-118.436824299999998	\N	\N	\N	\N	2014-03-07 00:48:52.465277	2014-03-07 00:48:52.465277
1673	877	NATBTLEN	National Eb & Butler Ns	11400 National Blvd & Butler Ave	34.0247783000000013	-118.434301599999998	\N	\N	\N	\N	2014-03-07 00:48:52.531933	2014-03-07 00:48:52.531933
1674	878	NATSAWEN	National Eb & Sawtelle Ns	11300 National Blvd & Sawtelle Blvd	34.0260973000000035	-118.431611399999994	\N	\N	\N	\N	2014-03-07 00:48:52.543027	2014-03-07 00:48:52.543027
1675	879	NATMILEF	National Eb & Military Fs	11000 National Blvd & Military Ave	34.0286262999999991	-118.425283199999996	\N	\N	\N	\N	2014-03-07 00:48:52.554176	2014-03-07 00:48:52.554176
1676	881	WWONATNF	Westwood Nb & National Fs	2900 Westwood Blvd & National Blvd	34.0308291999999994	-118.421046200000006	\N	\N	\N	\N	2014-03-07 00:48:52.565285	2014-03-07 00:48:52.565285
1677	882	WWOCVTNN	Westwood Nb & Coventry Ns	2800 Westwood Blvd & Coventry Pl	34.0333466000000016	-118.422984999999997	\N	\N	\N	\N	2014-03-07 00:48:52.576364	2014-03-07 00:48:52.576364
1678	883	WWOBVNNN	Westwood Nb & Brookhaven Ns	2700 Westwood Blvd & Brookhaven Ave	34.0349848999999978	-118.424305399999994	\N	\N	\N	\N	2014-03-07 00:48:52.587456	2014-03-07 00:48:52.587456
1679	884	WWOASBNN	Westwood Nb & Ashby Ns	2500 Westwood Blvd & Ashby Ave	34.0370345999999984	-118.425913300000005	\N	\N	\N	\N	2014-03-07 00:48:52.631241	2014-03-07 00:48:52.631241
1680	885	SNTSLREF	Sunset Eb & Salerno Fs	16900 W Sunset Blvd & Salerno Dr	34.0428964999999977	-118.546005100000002	\N	\N	\N	\N	2014-03-07 00:48:52.642392	2014-03-07 00:48:52.642392
1681	886	SNTANOEN	Sunset Eb & Arno Ns	16800 W Sunset Blvd & Arno Way	34.0434557000000027	-118.544673000000003	\N	\N	\N	\N	2014-03-07 00:48:52.65415	2014-03-07 00:48:52.65415
1682	887	SNTLVREN	Sunset Eb & Livorno Ns	16700 W Sunset Blvd & Livorno Dr	34.0450978000000006	-118.543676300000001	\N	\N	\N	\N	2014-03-07 00:48:52.664658	2014-03-07 00:48:52.664658
1683	888	SNTBLREF	Sunset Eb & Baylor (Marquez E) Fs	16600 W Sunset Blvd & N Baylor St	34.0481526000000017	-118.543050500000007	\N	\N	\N	\N	2014-03-07 00:48:52.676387	2014-03-07 00:48:52.676387
1684	889	SNTLCSEN	Sunset Eb & Las Casas Ns	16500 W Sunset Blvd & Las Casas Ave	34.0483910000000023	-118.541896199999996	\N	\N	\N	\N	2014-03-07 00:48:52.687447	2014-03-07 00:48:52.687447
1685	890	SNTBDAEN	Sunset Eb & Bienvenida Ns	16300 W Sunset Blvd & Bienvenida Ave	34.0488221000000024	-118.539920800000004	\N	\N	\N	\N	2014-03-07 00:48:52.698696	2014-03-07 00:48:52.698696
1686	891	SNTNFDEF	Sunset Eb & Northfield Fs	16200 W Sunset Blvd & W Northfield St	34.0485182999999978	-118.538069300000004	\N	\N	\N	\N	2014-03-07 00:48:52.70979	2014-03-07 00:48:52.70979
1687	892	SNTMSKEN	Sunset Eb & Muskingum Ns	16100 W Sunset Blvd & Muskingum Ave	34.0488716999999994	-118.535987599999999	\N	\N	\N	\N	2014-03-07 00:48:52.720817	2014-03-07 00:48:52.720817
1688	893	SNTELOEF	Sunset Eb & El Medio Fs	15900 W Sunset Blvd & El Medio Ave	34.0486766000000003	-118.533128599999998	\N	\N	\N	\N	2014-03-07 00:48:52.73177	2014-03-07 00:48:52.73177
1689	894	SNTTMLEN	Sunset Eb & Temescal Cyn Ns	15600 W Sunset Blvd & Temescal Canyon Rd	34.0497753000000003	-118.529751700000006	\N	\N	\N	\N	2014-03-07 00:48:52.743237	2014-03-07 00:48:52.743237
1690	895	SNTSWREF	Sunset Eb & Swarthmore Fs	15300 W Sunset Blvd & Swarthmore Ave	34.0471530000000016	-118.525614099999999	\N	\N	\N	\N	2014-03-07 00:48:52.75422	2014-03-07 00:48:52.75422
1691	896	SNTLCZEN	Sunset Eb & La Cruz (Monument) Ns	15200 W Sunset Blvd & La Cruz Dr	34.0462917999999988	-118.5245903	\N	\N	\N	\N	2014-03-07 00:48:52.765361	2014-03-07 00:48:52.765361
1692	897	SNTCREEN	Sunset Eb & Carey Ns	15100 W Sunset Blvd & Carey St	34.0452148999999977	-118.523247299999994	\N	\N	\N	\N	2014-03-07 00:48:52.776405	2014-03-07 00:48:52.776405
1693	898	SNTDRUEN	Sunset Eb & Drummond Ns	14900 W Sunset Blvd & Drummond St	34.0431276999999994	-118.520748499999996	\N	\N	\N	\N	2014-03-07 00:48:52.787623	2014-03-07 00:48:52.787623
1694	899	SNTPPREF	Sunset Eb & Pampas Ricas Fs	14800 W Sunset Blvd & Pampas Ricas Blvd	34.0412040000000005	-118.518464600000001	\N	\N	\N	\N	2014-03-07 00:48:52.798798	2014-03-07 00:48:52.798798
1695	900	CHQBRGSN	Chautauqua Sb & Borgos Ns	600 Chautauqua Blvd & Borgos Pl	34.0386728000000005	-118.518209499999998	\N	\N	\N	\N	2014-03-07 00:48:52.809883	2014-03-07 00:48:52.809883
1696	901	CHQALMSN	Chautauqua Sb & Almoloya Ns	500 Chautauqua Blvd & Almoloya Dr	34.0362998000000019	-118.519153599999996	\N	\N	\N	\N	2014-03-07 00:48:52.821025	2014-03-07 00:48:52.821025
1697	902	CHQLBRSN	Chautauqua Sb & La Cumbre Ns	400 Chautauqua Blvd & La Cumbre Dr	34.0342780000000005	-118.519662600000004	\N	\N	\N	\N	2014-03-07 00:48:52.832111	2014-03-07 00:48:52.832111
1698	903	WCHMSAEN	West Channel Eb & Mesa Ns	300 W Channel Rd & Mesa Rd	34.0301675999999986	-118.515454099999999	\N	\N	\N	\N	2014-03-07 00:48:52.84291	2014-03-07 00:48:52.84291
1699	904	ENTSTSEN	Entrada Eb & Stassi Ns	500 Entrada Dr & Stassi Ln	34.0336363999999989	-118.510241800000003	\N	\N	\N	\N	2014-03-07 00:48:52.854001	2014-03-07 00:48:52.854001
1700	905	007MRGSN	7Th Sb & Marguerita Ns	500 7Th St & Marguerita Ave	34.0298507999999984	-118.505399400000002	\N	\N	\N	\N	2014-03-07 00:48:52.92095	2014-03-07 00:48:52.92095
1701	906	007ALTSN	7Th Sb & Alta Ns	600 7Th St & Alta Ave	34.0287330000000026	-118.504146300000002	\N	\N	\N	\N	2014-03-07 00:48:52.932127	2014-03-07 00:48:52.932127
1702	907	007MONSN	7Th Sb & Montana Ns	800 7Th St & Montana Ave	34.0269843000000023	-118.502050199999999	\N	\N	\N	\N	2014-03-07 00:48:52.94319	2014-03-07 00:48:52.94319
1703	908	006MONSF	6Th Sb & Montana Fs	800 6Th St & Montana Ave	34.025881499999997	-118.5026096	\N	\N	\N	\N	2014-03-07 00:48:52.954413	2014-03-07 00:48:52.954413
1704	909	006IDSSN	6Th Sb & Idaho Ns	900 6Th St & Idaho Ave	34.0248101999999975	-118.501362999999998	\N	\N	\N	\N	2014-03-07 00:48:52.965499	2014-03-07 00:48:52.965499
1705	910	006IDSNN	6Th Nb & Idaho Ns	900 6Th St & Idaho Ave	34.024676300000003	-118.5009862	\N	\N	\N	\N	2014-03-07 00:48:52.976534	2014-03-07 00:48:52.976534
1706	911	006MONNN	6Th Nb & Montana Ns	800 6Th St & Montana Ave	34.0259937000000008	-118.502565599999997	\N	\N	\N	\N	2014-03-07 00:48:52.987582	2014-03-07 00:48:52.987582
1707	912	007MONNF	7Th Nb & Montana Fs	700 7Th St & Montana Ave	34.0270433999999966	-118.501974300000001	\N	\N	\N	\N	2014-03-07 00:48:52.998812	2014-03-07 00:48:52.998812
1708	913	007MRGNN	7Th Nb & Marguerita Ns	500 7Th St & Marguerita Ave	34.0297872000000012	-118.505240799999996	\N	\N	\N	\N	2014-03-07 00:48:53.009918	2014-03-07 00:48:53.009918
1709	914	007ALTNN	7Th Nb & Alta Ns	600 7Th St & Alta Ave	34.028557499999998	-118.503705100000005	\N	\N	\N	\N	2014-03-07 00:48:53.021009	2014-03-07 00:48:53.021009
1710	915	007SVSNN	7Th Nb & San Vicente Ns	300 7Th St & San Vicente Blvd	34.0318553999999978	-118.507648399999994	\N	\N	\N	\N	2014-03-07 00:48:53.032108	2014-03-07 00:48:53.032108
1711	916	ENTSTSWN	Entrada Wb & Stassi Ns	500 Entrada Dr & Stassi Ln	34.0340504999999993	-118.5100731	\N	\N	\N	\N	2014-03-07 00:48:53.043199	2014-03-07 00:48:53.043199
1712	917	ENTECHWN	Entrada Wb & East Channel Ns	400 Entrada Dr & East Channel Rd	34.0311986000000033	-118.512265900000003	\N	\N	\N	\N	2014-03-07 00:48:53.054347	2014-03-07 00:48:53.054347
1713	918	MSAENTSN	Mesa Sb & Entrada Ns	300 Mesa Rd & Entrada Dr	34.0299272999999971	-118.515337400000007	\N	\N	\N	\N	2014-03-07 00:48:53.065459	2014-03-07 00:48:53.065459
1714	919	CHQCDMNN	Chautauqua Nb & Corona Del Mar Ns	300 Chautauqua Blvd & Corona Del Mar	34.031282400000002	-118.518591799999996	\N	\N	\N	\N	2014-03-07 00:48:53.076536	2014-03-07 00:48:53.076536
1715	920	CHQLBRNN	Chautauqua Nb & La Cumbre Ns	400 Chautauqua Blvd & La Cumbre Dr	34.0339304000000027	-118.519547200000005	\N	\N	\N	\N	2014-03-07 00:48:53.087658	2014-03-07 00:48:53.087658
1716	921	CHQALMNN	Chautauqua Nb & Almoloya Ns	500 Chautauqua Blvd & Almoloya Dr	34.0359782999999965	-118.519248300000001	\N	\N	\N	\N	2014-03-07 00:48:53.098786	2014-03-07 00:48:53.098786
1717	922	CHQBRGNF	Chautauqua Nb & Borgos Fs	600 Chautauqua Blvd & Borgos Pl	34.0387083000000032	-118.518146000000002	\N	\N	\N	\N	2014-03-07 00:48:53.10987	2014-03-07 00:48:53.10987
1718	923	CHQSNTNN	Chautauqua Nb & Sunset Ns	700 Chautauqua Blvd & W Sunset Blvd	34.0411320999999987	-118.518142800000007	\N	\N	\N	\N	2014-03-07 00:48:53.120986	2014-03-07 00:48:53.120986
1719	924	SNTHTZWF	Sunset Wb & Hartzell Fs	14800 W Sunset Blvd & Hartzell St	34.042018800000001	-118.519156199999998	\N	\N	\N	\N	2014-03-07 00:48:53.132257	2014-03-07 00:48:53.132257
1720	925	SNTDRUWF	Sunset Wb & Drummond Fs	14900 W Sunset Blvd & Drummond St	34.0431787999999997	-118.520557600000004	\N	\N	\N	\N	2014-03-07 00:48:53.143298	2014-03-07 00:48:53.143298
1721	926	SNTCREWF	Sunset Wb & Carey Fs	15100 W Sunset Blvd & Carey St	34.0452651000000017	-118.523093399999993	\N	\N	\N	\N	2014-03-07 00:48:53.22102	2014-03-07 00:48:53.22102
1722	927	SNTMNUWN	Sunset Wb & Monument (La Cruz) Ns	15200 W Sunset Blvd & Monument St	34.0460718	-118.524084799999997	\N	\N	\N	\N	2014-03-07 00:48:53.231881	2014-03-07 00:48:53.231881
1723	928	SNTSWRWF	Sunset Wb & Swarthmore Fs	15300 W Sunset Blvd & Swarthmore Ave	34.0477301999999966	-118.525981900000005	\N	\N	\N	\N	2014-03-07 00:48:53.243517	2014-03-07 00:48:53.243517
1724	929	SNTTMLWN	Sunset Wb Temescal Cyn Ns	15600 W Sunset Blvd & Temescal Canyon Rd	34.0496412999999976	-118.5289231	\N	\N	\N	\N	2014-03-07 00:48:53.254536	2014-03-07 00:48:53.254536
1725	930	SNTELOWF	Sunset Wb & El Medio Fs	15900 W Sunset Blvd & El Medio Ave	34.0489052000000001	-118.533503699999997	\N	\N	\N	\N	2014-03-07 00:48:53.265493	2014-03-07 00:48:53.265493
1726	931	SNTMSKWF	Sunset Wb & Muskingum Fs	16100 W Sunset Blvd & Muskingum Ave	34.0490198000000035	-118.535854200000003	\N	\N	\N	\N	2014-03-07 00:48:53.276953	2014-03-07 00:48:53.276953
1727	932	SNTLMSWF	Sunset Wb & Las Lomas Fs	16200 W Sunset Blvd & Las Lomas Ave	34.0485715000000013	-118.538364400000006	\N	\N	\N	\N	2014-03-07 00:48:53.287705	2014-03-07 00:48:53.287705
1728	933	SNTBDAWF	Sunset Wb & Bienvenida Fs	16300 W Sunset Blvd & Bienvenida Ave	34.0490186999999978	-118.540286499999993	\N	\N	\N	\N	2014-03-07 00:48:53.298384	2014-03-07 00:48:53.298384
1729	934	SNTLCSWN	Sunset Wb & Las Casas Ns	16500 W Sunset Blvd & Las Casas Ave	34.0486385999999968	-118.541536899999997	\N	\N	\N	\N	2014-03-07 00:48:53.309952	2014-03-07 00:48:53.309952
1730	935	SNTMRQWF	Sunset Wb & Marquez E (Baylor) Fs	16600 W Sunset Blvd & Marquez Ave	34.0478342999999981	-118.543774799999994	\N	\N	\N	\N	2014-03-07 00:48:53.321112	2014-03-07 00:48:53.321112
1731	936	SNTLVRWN	Sunset Wb & Livorno Ns	16700 W Sunset Blvd & Livorno Dr	34.0454836999999984	-118.543777700000007	\N	\N	\N	\N	2014-03-07 00:48:53.331878	2014-03-07 00:48:53.331878
1732	937	SNTANOWN	Sunset Wb & Arno Ns	16800 W Sunset Blvd & Arno Way	34.0436527000000027	-118.544567200000003	\N	\N	\N	\N	2014-03-07 00:48:53.354446	2014-03-07 00:48:53.354446
1733	938	SNTSLRWF	Sunset Wb & Salerno Fs	16900 W Sunset Blvd & Salerno Dr	34.0428525000000022	-118.546501399999997	\N	\N	\N	\N	2014-03-07 00:48:53.3877	2014-03-07 00:48:53.3877
1734	939	BUNIDLSN	Bundy Sb & Idaho Ns	1600 S Bundy Dr & Idaho Ave	34.0389668999999984	-118.461556400000006	\N	\N	\N	\N	2014-03-07 00:48:53.398709	2014-03-07 00:48:53.398709
1735	940	BUNNEBSN	Bundy Sb & Nebraska Ns	1800 S Bundy Dr & Nebraska Ave	34.0361691000000022	-118.458273599999998	\N	\N	\N	\N	2014-03-07 00:48:53.410315	2014-03-07 00:48:53.410315
1736	941	BUNLGRSN	Bundy Sb & La Grange Ns	2000 S Bundy Dr & La Grange Ave	34.0340654000000029	-118.455856600000004	\N	\N	\N	\N	2014-03-07 00:48:53.420949	2014-03-07 00:48:53.420949
1737	942	BUNRCHSN	Bundy Sb & Rochester Ns	1400 S Bundy Dr & Rochester Ave	34.0423051000000001	-118.465461300000001	\N	\N	\N	\N	2014-03-07 00:48:53.432011	2014-03-07 00:48:53.432011
1738	943	BUNSMBSN	Bundy Sb & Santa Monica Ns	1400 S Bundy Dr & Santa Monica Blvd	34.0406473000000034	-118.463603699999993	\N	\N	\N	\N	2014-03-07 00:48:53.443258	2014-03-07 00:48:53.443258
1739	944	BUNDORSN	Bundy Sb & Dorothy Ns	900 S Bundy Dr & Dorothy St	34.0485012999999981	-118.471249200000003	\N	\N	\N	\N	2014-03-07 00:48:53.454406	2014-03-07 00:48:53.454406
1740	945	BUNMAYSN	Bundy Sb & Mayfield Ns	1000 S Bundy Dr & Mayfield Ave	34.047257100000003	-118.469334500000002	\N	\N	\N	\N	2014-03-07 00:48:53.465545	2014-03-07 00:48:53.465545
1741	946	BUNMAYNN	Bundy Nb & Mayfield Ns	1000 S Bundy Dr & Mayfield Ave	34.0471038000000021	-118.468907700000003	\N	\N	\N	\N	2014-03-07 00:48:53.476956	2014-03-07 00:48:53.476956
1742	947	BUNDORNN	Bundy Nb & Dorothy Ns	900 S Bundy Dr & Dorothy St	34.0484434999999976	-118.470855599999993	\N	\N	\N	\N	2014-03-07 00:48:53.487986	2014-03-07 00:48:53.487986
1743	948	OLIPCONN	Olive Nb & Pico Ns	1300 S Olive St & Pico Blvd	34.0380857999999975	-118.263297300000005	\N	\N	\N	\N	2014-03-07 00:48:53.499099	2014-03-07 00:48:53.499099
1744	951	OLIOLYNN	Olive Nb & Olympic Ns	1000 S Olive St & W Olympic Blvd	34.0421206999999981	-118.259661100000002	\N	\N	\N	\N	2014-03-07 00:48:53.510377	2014-03-07 00:48:53.510377
1745	955	FIGL06NF	Figueroa Nb & 6Th Fs	600 S Figueroa St & W 6Th St	34.0510444000000021	-118.258266599999999	\N	\N	\N	\N	2014-03-07 00:48:53.521529	2014-03-07 00:48:53.521529
1746	956	FIGL05NN	Figueroa Nb & 5Th Ns	500 S Figueroa St & W 5Th St	34.0521519999999995	-118.257639800000007	\N	\N	\N	\N	2014-03-07 00:48:53.532615	2014-03-07 00:48:53.532615
1747	957	HOP001NF	Hope Nb & 1St Fs	100 N Hope St & W 1St Street	34.0569012999999998	-118.249308299999996	\N	\N	\N	\N	2014-03-07 00:48:53.599385	2014-03-07 00:48:53.599385
1748	958	HOPTMPNN	Hope Nb & Temple Ns	100 N Hope St & W Temple St	34.0587821000000019	-118.247628500000005	\N	\N	\N	\N	2014-03-07 00:48:53.610191	2014-03-07 00:48:53.610191
1749	960	TMPHLLEF	Temple Eb & Hill Fs	300 W Temple St & N Hill St	34.0563159000000013	-118.244399900000005	\N	\N	\N	\N	2014-03-07 00:48:53.621269	2014-03-07 00:48:53.621269
1750	961	TMPSPREN	Temple Eb & Spring Ns	100 W Temple St & N Spring St	34.0551821000000032	-118.242902099999995	\N	\N	\N	\N	2014-03-07 00:48:53.632596	2014-03-07 00:48:53.632596
1751	962	LASTMPNF	Los Angeles Nb & Temple Fs	200 N Los Angeles St & E Temple St	34.053887600000003	-118.240228099999996	\N	\N	\N	\N	2014-03-07 00:48:53.643703	2014-03-07 00:48:53.643703
1752	964	ALALASNF	Alameda Nb & Los Angeles Fs	800 N Alameda St & N Los Angeles St	34.0566056999999986	-118.237322000000006	\N	\N	\N	\N	2014-03-07 00:48:53.654809	2014-03-07 00:48:53.654809
1753	966	TMPSPRWN	Temple Wb & Spring Ns	100 W Temple St & N Spring St	34.0548017999999999	-118.242447299999995	\N	\N	\N	\N	2014-03-07 00:48:53.666023	2014-03-07 00:48:53.666023
1754	967	TMPHLLWN	Temple Wb & Hill Ns	300 W Temple St & N Hill St	34.0563542000000012	-118.244276400000004	\N	\N	\N	\N	2014-03-07 00:48:53.677004	2014-03-07 00:48:53.677004
1755	969	HOP001SF	Hope Sb & 1St Fs	100 S Hope St & W 1St St	34.0562322999999978	-118.250167200000007	\N	\N	\N	\N	2014-03-07 00:48:53.68721	2014-03-07 00:48:53.68721
1756	971	FLOL05SF	Flower Sb & 5Th Fs	500 S Flower St & W 5Th St	34.0511126000000033	-118.256529900000004	\N	\N	\N	\N	2014-03-07 00:48:53.698995	2014-03-07 00:48:53.698995
1757	974	GRAL07SM	Grand Sb & 7Th (8Th) Mb	700 S Grand Ave & W 7Th St	34.0463244999999972	-118.256759099999996	\N	\N	\N	\N	2014-03-07 00:48:53.710106	2014-03-07 00:48:53.710106
1758	980	GRAPCOSN	Grand Sb & Pico Ns	1300 S Grand Ave & W Pico Blvd	34.0391607999999977	-118.264308900000003	\N	\N	\N	\N	2014-03-07 00:48:53.721699	2014-03-07 00:48:53.721699
1759	981	GRAL14SN	Grand Sb & 14Th Ns	1400 S Grand Ave & W 14Th St	34.0371892000000003	-118.265546999999998	\N	\N	\N	\N	2014-03-07 00:48:53.732429	2014-03-07 00:48:53.732429
1760	982	BUNLGRNN	Bundy Nb & La Grange Ns	2000 S Bundy Dr & La Grange Ave	34.0338027999999966	-118.455267800000001	\N	\N	\N	\N	2014-03-07 00:48:53.743494	2014-03-07 00:48:53.743494
1761	983	BUNNEBNN	Bundy Nb & Nebraska Ns	1800 S Bundy Dr & Nebraska Ave	34.0364026999999965	-118.458327499999996	\N	\N	\N	\N	2014-03-07 00:48:53.754132	2014-03-07 00:48:53.754132
1762	984	BUNIDLNN	Bundy Nb & Idaho Ns	1600 S Bundy Dr & Idaho Ave	34.0387495000000015	-118.461034799999993	\N	\N	\N	\N	2014-03-07 00:48:53.765609	2014-03-07 00:48:53.765609
1763	985	BUNSMBNF	Bundy Nb & Santa Monica Fs	1400 S Bundy Dr & Santa Monica Blvd	34.0407934999999995	-118.463414499999999	\N	\N	\N	\N	2014-03-07 00:48:53.776737	2014-03-07 00:48:53.776737
1764	986	BUNRCHNM	Bundy Nb & Rochester (Rhode Isl) Mb	1400 S Bundy Dr & Rochester Ave	34.0421824000000015	-118.4650666	\N	\N	\N	\N	2014-03-07 00:48:53.787788	2014-03-07 00:48:53.787788
1765	987	PRL016WN	Pearl Wb & 16Th Ns	1600 Pearl St & 16Th St	34.0143855999999971	-118.471417700000003	\N	\N	\N	\N	2014-03-07 00:48:53.798901	2014-03-07 00:48:53.798901
1766	988	PRL014WN	Pearl Wb & 14Th Ns	1400 Pearl St & 14Th St	34.0134222000000008	-118.473061000000001	\N	\N	\N	\N	2014-03-07 00:48:53.810039	2014-03-07 00:48:53.810039
1767	989	014MCHNN	14Th Nb & Michigan Ns	1800 14Th St & Michigan Ave	34.018363800000003	-118.478933299999994	\N	\N	\N	\N	2014-03-07 00:48:53.821393	2014-03-07 00:48:53.821393
1768	990	014OLYNN	14Th Nb & Olympic Ns	1700 14Th St & Olympic Blvd	34.019582800000002	-118.480318100000005	\N	\N	\N	\N	2014-03-07 00:48:53.832532	2014-03-07 00:48:53.832532
1769	991	014BWYNF	14Th Nb & Broadway Fs	1400 14Th St & Broadway	34.0230208999999988	-118.484290700000003	\N	\N	\N	\N	2014-03-07 00:48:53.843349	2014-03-07 00:48:53.843349
1770	992	014ARZNF	14Th Nb & Arizona Fs	1300 14Th St & Arizona Ave	34.0256635000000003	-118.4874212	\N	\N	\N	\N	2014-03-07 00:48:53.854883	2014-03-07 00:48:53.854883
1771	993	014CLSNF	14Th Nb & California Fs	1000 14Th St & California Ave	34.0283481000000023	-118.4905203	\N	\N	\N	\N	2014-03-07 00:48:53.865865	2014-03-07 00:48:53.865865
1772	994	014IDSNN	14Th Nb & Idaho Ns	900 14Th St & Idaho Ave	34.0308069000000017	-118.493475799999999	\N	\N	\N	\N	2014-03-07 00:48:53.877132	2014-03-07 00:48:53.877132
1773	995	014MONNN	14Th Nb & Montana Ns	800 14Th St & Montana Ave	34.0321096999999995	-118.494973299999998	\N	\N	\N	\N	2014-03-07 00:48:53.888005	2014-03-07 00:48:53.888005
1774	996	020IDSSF	20Th Sb & Idaho Fs	900 20Th St & Idaho Ave	34.0353515999999985	-118.4879064	\N	\N	\N	\N	2014-03-07 00:48:53.898978	2014-03-07 00:48:53.898978
1775	997	020WASSN	20Th Sb & Washington Ns	900 20Th St & Washington Ave	34.0342442000000034	-118.486581200000003	\N	\N	\N	\N	2014-03-07 00:48:53.909944	2014-03-07 00:48:53.909944
1776	998	020CLSSN	20Th Sb & California Ns	1000 20Th St & California Ave	34.032827300000001	-118.484966299999996	\N	\N	\N	\N	2014-03-07 00:48:53.921299	2014-03-07 00:48:53.921299
1777	999	020OLYSN	20Th Sb & Olympic Ns	1600 20Th St & Olympic Blvd	34.0244679999999988	-118.475251200000002	\N	\N	\N	\N	2014-03-07 00:48:53.932773	2014-03-07 00:48:53.932773
1778	1001	020DLWSF	20Th Sb & Delaware Fs	1900 20Th St & Delaware Ave	34.0217410999999998	-118.472052199999993	\N	\N	\N	\N	2014-03-07 00:48:53.943704	2014-03-07 00:48:53.943704
1779	1002	020PRLSN	20Th Sb & Pearl Ns	2200 20Th St & Pearl St	34.0168865999999994	-118.467352199999993	\N	\N	\N	\N	2014-03-07 00:48:53.954537	2014-03-07 00:48:53.954537
1780	1003	020OPRSN	20Th Sb & Ocean Park Ns	2500 20Th St & Ocean Park Blvd	34.0139368999999974	-118.4648878	\N	\N	\N	\N	2014-03-07 00:48:53.966167	2014-03-07 00:48:53.966167
1781	1004	ROBMTMSF	Robertson Sb & Monte Mar (18Th) Fs	1800 S Robertson Blvd & Monte Mar Dr	34.0465546000000003	-118.386242999999993	\N	\N	\N	\N	2014-03-07 00:48:53.976629	2014-03-07 00:48:53.976629
1782	1005	ROBL18NN	Robertson Nb & 18Th (Monte Mar) Ns	1800 S Robertson Blvd & W 18Th St	34.0465727999999999	-118.386044999999996	\N	\N	\N	\N	2014-03-07 00:48:53.988134	2014-03-07 00:48:53.988134
1783	1006	ROBSWYSF	Robertson Sb & Sawyer Fs	1900 S Robertson Blvd & Sawyer St	34.0446936000000022	-118.386724299999997	\N	\N	\N	\N	2014-03-07 00:48:53.99883	2014-03-07 00:48:53.99883
1784	1007	ROBHLBSN	Robertson Sb & Hillsboro (Cadlc) Ns	2000 S Robertson Blvd & Hillsboro Ave	34.0414636000000002	-118.387624099999996	\N	\N	\N	\N	2014-03-07 00:48:54.01032	2014-03-07 00:48:54.01032
1785	1008	ROBCADNN	Robertson Nb & Cadillac (Hlsbro) Ns	2000 S Robertson Blvd & Cadillac Ave	34.0409269000000023	-118.387577800000003	\N	\N	\N	\N	2014-03-07 00:48:54.021737	2014-03-07 00:48:54.021737
1786	1009	ROBL24SN	Robertson Sb & 24Th Ns	2400 S Robertson Blvd & W 24Th St	34.0397944999999993	-118.388062700000006	\N	\N	\N	\N	2014-03-07 00:48:54.032648	2014-03-07 00:48:54.032648
1787	1010	ROBBWDSN	Robertson Sb & Beverlywood Ns	2600 S Robertson Blvd & Beverlywood St	34.0383854000000028	-118.388455199999996	\N	\N	\N	\N	2014-03-07 00:48:54.043606	2014-03-07 00:48:54.043606
1788	1011	ROBOLNSN	Robertson Sb & Olin Ns	2700 S Robertson Blvd & Olin St	34.0368558999999991	-118.388875100000007	\N	\N	\N	\N	2014-03-07 00:48:54.054596	2014-03-07 00:48:54.054596
1789	1012	ROBOLNNN	Robertson Nb & Olin Ns	2700 S Robertson Blvd & Olin St	34.0363173000000003	-118.388847600000005	\N	\N	\N	\N	2014-03-07 00:48:54.066348	2014-03-07 00:48:54.066348
1790	1013	ROBBWDNN	Robertson Nb & Beverlywood Ns	2600 S Robertson Blvd & Beverlywood St	34.0381708999999972	-118.388330999999994	\N	\N	\N	\N	2014-03-07 00:48:54.076757	2014-03-07 00:48:54.076757
1791	1014	ROBL24NN	Robertson Nb & 24Th Ns	2400 S Robertson Blvd & W 24Th St	34.0395412000000022	-118.387947600000004	\N	\N	\N	\N	2014-03-07 00:48:54.088168	2014-03-07 00:48:54.088168
1792	1015	ROBSWYNN	Robertson Nb & Sawyer Ns	1900 S Robertson Blvd & Sawyer St	34.0446275999999983	-118.386550600000007	\N	\N	\N	\N	2014-03-07 00:48:54.099378	2014-03-07 00:48:54.099378
1793	1016	ROBARDNN	Robertson Nb & Airdrome Ns	1700 S Robertson Blvd & Airdrome St	34.0486006000000003	-118.385512300000002	\N	\N	\N	\N	2014-03-07 00:48:54.110266	2014-03-07 00:48:54.110266
1794	1017	ROBCSHNN	Robertson Nb & Cashio Ns	1500 S Robertson Blvd & Cashio St	34.0519162000000009	-118.384051400000004	\N	\N	\N	\N	2014-03-07 00:48:54.121728	2014-03-07 00:48:54.121728
1795	1019	VENROBWN	Venice Wb & Robertson Ns	9000 Venice Blvd & S Robertson Blvd	34.0284884000000005	-118.390093800000002	\N	\N	\N	\N	2014-03-07 00:48:54.132793	2014-03-07 00:48:54.132793
1796	1020	BAGEXPNN	Bagley Nb & Exposition Ns	3600 Bagley Ave & Exposition Blvd	34.028357800000002	-118.397042400000004	\N	\N	\N	\N	2014-03-07 00:48:54.143852	2014-03-07 00:48:54.143852
1797	1021	NATBAGWF	National Wb & Bagley Fs	9400 National Blvd & Bagley Ave	34.0313968000000031	-118.396205499999994	\N	\N	\N	\N	2014-03-07 00:48:54.154267	2014-03-07 00:48:54.154267
1798	1022	NATCRDWN	National Wb & Cardiff Ns	9500 National Blvd & Cardiff Ave	34.0314102999999974	-118.397686500000006	\N	\N	\N	\N	2014-03-07 00:48:54.166031	2014-03-07 00:48:54.166031
1799	1023	NATCSLWN	National Wb & Castle Heights Ns	9700 National Blvd & Castle Heights Ave	34.0314166	-118.399501999999998	\N	\N	\N	\N	2014-03-07 00:48:54.177361	2014-03-07 00:48:54.177361
1800	1024	NATMNGWN	National Wb & Manning Ns	9900 National Blvd & Manning Ave	34.030170499999997	-118.402788799999996	\N	\N	\N	\N	2014-03-07 00:48:54.254942	2014-03-07 00:48:54.254942
1801	1025	NATMNGEF	National Eb & Manning Fs	9900 National Blvd & Manning Ave	34.030080599999998	-118.402609799999993	\N	\N	\N	\N	2014-03-07 00:48:54.26611	2014-03-07 00:48:54.26611
1802	1026	PLMNATWF	Palms Wb & National Fs	10000 Palms Blvd & National Blvd	34.0288613000000026	-118.404144500000001	\N	\N	\N	\N	2014-03-07 00:48:54.277236	2014-03-07 00:48:54.277236
1803	1027	OPRBVEWN	Ocean Park Wb & Beverley Ns	600 Ocean Park Blvd & Beverley Ave	34.0056829999999977	-118.478718599999993	\N	\N	\N	\N	2014-03-07 00:48:54.288281	2014-03-07 00:48:54.288281
1804	1028	OLIL09NF	Olive Nb & 9Th Fs	900 S Olive St & W 9Th St	34.043993399999998	-118.257941799999998	\N	\N	\N	\N	2014-03-07 00:48:54.299299	2014-03-07 00:48:54.299299
1805	1030	PLMJASWF	Palms Wb & Jasmine Fs	10100 Palms Blvd & Jasmine Ave	34.0275320000000008	-118.406621900000005	\N	\N	\N	\N	2014-03-07 00:48:54.310469	2014-03-07 00:48:54.310469
1806	1031	PLMMTRWF	Palms Wb & Motor Fs	10300 Palms Blvd & Motor Ave	34.0263143999999969	-118.408864199999996	\N	\N	\N	\N	2014-03-07 00:48:54.321661	2014-03-07 00:48:54.321661
1807	1032	GLNPLMSF	Glendon Sb & Palms Fs	3500 Glendon Ave & Palms Blvd	34.0231665000000021	-118.413704600000003	\N	\N	\N	\N	2014-03-07 00:48:54.332871	2014-03-07 00:48:54.332871
1808	1033	GLNCNKSN	Glendon Sb & Charnock Ns	3600 Glendon Ave & Charnock Rd	34.021418599999997	-118.412362200000004	\N	\N	\N	\N	2014-03-07 00:48:54.343884	2014-03-07 00:48:54.343884
1809	1034	CNKKLTWN	Charnock Wb & Kelton Ns	10800 Charnock Rd & Kelton Ave	34.019956999999998	-118.414704700000001	\N	\N	\N	\N	2014-03-07 00:48:54.355064	2014-03-07 00:48:54.355064
1810	1035	CNKGLDWN	Charnock Wb & Greenfield Ns	10900 Charnock Rd & Greenfield Ave	34.0191123999999974	-118.416239700000006	\N	\N	\N	\N	2014-03-07 00:48:54.36577	2014-03-07 00:48:54.36577
1811	1036	CNKTLDWN	Charnock Wb & Tilden Ns	11000 Charnock Rd & Tilden Ave	34.0181508000000008	-118.417961599999998	\N	\N	\N	\N	2014-03-07 00:48:54.377161	2014-03-07 00:48:54.377161
1812	1037	CNKSEPWN	Charnock Wb & Sepulveda Ns	11100 Charnock Rd & S Sepulveda Blvd	34.016976200000002	-118.420113400000005	\N	\N	\N	\N	2014-03-07 00:48:54.387847	2014-03-07 00:48:54.387847
1813	1038	SEPPLMNF	Sepulveda Nb & Palms Fs	3500 S Sepulveda Blvd & Palms Blvd	34.0195450000000008	-118.422311800000003	\N	\N	\N	\N	2014-03-07 00:48:54.398304	2014-03-07 00:48:54.398304
1814	1039	SEPQUNNN	Sepulveda Nb & Queensland Ns	3200 S Sepulveda Blvd & Queensland St	34.023775999999998	-118.425650399999995	\N	\N	\N	\N	2014-03-07 00:48:54.410464	2014-03-07 00:48:54.410464
1815	1040	SEPQUNSN	Sepulveda Sb & Queensland Ns	3200 S Sepulveda Blvd & Queensland St	34.0238756999999978	-118.4260424	\N	\N	\N	\N	2014-03-07 00:48:54.421501	2014-03-07 00:48:54.421501
1816	1041	SEPPLMSN	Sepulveda Sb & Palms Ns	3500 S Sepulveda Blvd & Palms Blvd	34.0193821000000014	-118.422479800000005	\N	\N	\N	\N	2014-03-07 00:48:54.432899	2014-03-07 00:48:54.432899
1817	1042	CNKSEPEF	Charnock Eb & Sepulveda Fs	11100 Charnock Rd & S Sepulveda Blvd	34.0169587000000035	-118.419931000000005	\N	\N	\N	\N	2014-03-07 00:48:54.466107	2014-03-07 00:48:54.466107
1818	1043	CNKTLDEN	Charnock Eb & Tilden Ns	11000 Charnock Rd & Tilden Ave	34.0179326000000017	-118.418168800000004	\N	\N	\N	\N	2014-03-07 00:48:54.477231	2014-03-07 00:48:54.477231
1819	1044	CNKGLDEN	Charnock Eb & Greenfield Ns	10900 Charnock Rd & Greenfield Ave	34.0189165999999972	-118.4163918	\N	\N	\N	\N	2014-03-07 00:48:54.556206	2014-03-07 00:48:54.556206
1820	1045	CNKKLTEN	Charnock Eb & Kelton Ns	10800 Charnock Rd & Kelton Ave	34.0197012000000001	-118.414934700000003	\N	\N	\N	\N	2014-03-07 00:48:54.599842	2014-03-07 00:48:54.599842
1821	1046	GLNCNKNF	Glendon Nb & Charnock Fs	3600 Glendon Ave & Charnock Rd	34.0215418000000014	-118.412390000000002	\N	\N	\N	\N	2014-03-07 00:48:54.610451	2014-03-07 00:48:54.610451
1822	1047	GLNPLMNN	Glendon Nb & Palms Ns	3500 Glendon Ave & Palms Blvd	34.0231971999999985	-118.413673500000002	\N	\N	\N	\N	2014-03-07 00:48:54.621704	2014-03-07 00:48:54.621704
1823	1048	PLMMTREF	Palms Eb & Motor Fs	10300 Palms Blvd & Motor Ave	34.0264596999999966	-118.408209799999995	\N	\N	\N	\N	2014-03-07 00:48:54.632823	2014-03-07 00:48:54.632823
1824	1049	PLMJASEF	Palms Eb & Jasmine Fs	10100 Palms Blvd & Jasmine Ave	34.0275436000000013	-118.406210000000002	\N	\N	\N	\N	2014-03-07 00:48:54.643914	2014-03-07 00:48:54.643914
1825	1050	PLMEXPEN	Palms Eb & Exposition Ns	10000 Palms Blvd & Exposition Blvd	34.0288954999999973	-118.4037328	\N	\N	\N	\N	2014-03-07 00:48:54.654342	2014-03-07 00:48:54.654342
1826	1051	NATCSLEN	National Eb & Castle Heights Ns	9800 National Blvd & Castle Heights Ave	34.0312906999999996	-118.400370699999996	\N	\N	\N	\N	2014-03-07 00:48:54.666146	2014-03-07 00:48:54.666146
1827	1052	NATCRDEN	National Eb & Cardiff Ns	9600 National Blvd & Cardiff Ave	34.0312722999999977	-118.398094099999994	\N	\N	\N	\N	2014-03-07 00:48:54.677286	2014-03-07 00:48:54.677286
1828	1053	NATBAGEN	National Eb & Bagley Ns	9400 National Blvd & Bagley Ave	34.0312703000000027	-118.396362300000007	\N	\N	\N	\N	2014-03-07 00:48:54.68846	2014-03-07 00:48:54.68846
1829	1054	BAGEXPSN	Bagley Sb & Exposition Ns	3600 Bagley Ave & Exposition Blvd	34.0288796000000033	-118.396877099999998	\N	\N	\N	\N	2014-03-07 00:48:54.699492	2014-03-07 00:48:54.699492
1830	1056	NATROBWN	National Wb & Robertson Ns	9000 National Blvd & S Robertson Blvd	34.0312339999999978	-118.390633100000002	\N	\N	\N	\N	2014-03-07 00:48:54.710393	2014-03-07 00:48:54.710393
1831	1057	ARDCNFWN	Airdrome Wb & Canfield Ns	9200 Airdrome St & S Canfield Ave	34.0495644000000013	-118.389372800000004	\N	\N	\N	\N	2014-03-07 00:48:54.722267	2014-03-07 00:48:54.722267
1832	1058	BAGMTMWN	Bagley Wb & Monte Mar Ns	1700 Bagley Ave & Monte Mar Dr	34.0488027000000031	-118.390850700000001	\N	\N	\N	\N	2014-03-07 00:48:54.733058	2014-03-07 00:48:54.733058
1833	1059	MTMBEVWN	Monte Mar Wb & Beverly Dr Ns	9400 Monte Mar Dr & S Beverly Dr	34.049485500000003	-118.395023100000003	\N	\N	\N	\N	2014-03-07 00:48:54.744145	2014-03-07 00:48:54.744145
1834	1060	BEVCSHNN	Beverly Dr Nb & Cashio Ns	1500 S Beverly Dr & Cashio St	34.0522816000000006	-118.395297299999996	\N	\N	\N	\N	2014-03-07 00:48:54.755269	2014-03-07 00:48:54.755269
1835	1061	BEVCSHSF	Beverly Dr Sb & Cashio Fs	1500 S Beverly Dr & Cashio St	34.0522597000000005	-118.395398999999998	\N	\N	\N	\N	2014-03-07 00:48:54.766441	2014-03-07 00:48:54.766441
1836	1062	MTRPLGSM	Motor Sb & Cheviot Playground Mb	2500 Motor Ave & Cheviot Playground	34.0471403000000024	-118.408394999999999	\N	\N	\N	\N	2014-03-07 00:48:54.777533	2014-03-07 00:48:54.777533
1837	1063	MTRPLGNM	Motor Nb & Cheviot Playground Mb	2500 Motor Ave & Cheviot Playground	34.0472656000000029	-118.4082832	\N	\N	\N	\N	2014-03-07 00:48:54.788611	2014-03-07 00:48:54.788611
1838	1064	MTRMTMSN	Motor Sb & Monte Mar Ns	2600 Motor Ave & Monte Mar Dr	34.0439323000000016	-118.405691899999994	\N	\N	\N	\N	2014-03-07 00:48:54.799502	2014-03-07 00:48:54.799502
1839	1065	MTRCTASN	Motor Sb & Cresta Ns	2700 Motor Ave & Cresta Dr	34.0421842000000012	-118.403920099999993	\N	\N	\N	\N	2014-03-07 00:48:54.810578	2014-03-07 00:48:54.810578
1840	1066	MTRCLBSN	Motor Sb & Club Ns	2800 Motor Ave & Club Dr	34.0404947999999976	-118.404015599999994	\N	\N	\N	\N	2014-03-07 00:48:54.821738	2014-03-07 00:48:54.821738
1841	1067	MTRGLBSN	Motor Sb & Glenbarr Ns	2900 Motor Ave & Glenbarr Ave	34.0394847000000027	-118.407126700000006	\N	\N	\N	\N	2014-03-07 00:48:54.832845	2014-03-07 00:48:54.832845
1842	1068	MTRCHVSN	Motor Sb & Cheviot Ns	3000 Motor Ave & Cheviot Dr	34.0377556999999982	-118.407995200000002	\N	\N	\N	\N	2014-03-07 00:48:54.843907	2014-03-07 00:48:54.843907
1843	1069	MTRBANSN	Motor Sb & Bannockburn Ns	3000 Motor Ave & Bannockburn Dr	34.0356463000000034	-118.409312700000001	\N	\N	\N	\N	2014-03-07 00:48:54.855015	2014-03-07 00:48:54.855015
1844	1070	MTRMNGSN	Motor Sb & Manning Ns	3000 Motor Ave & Manning Ave	34.0339918000000026	-118.410657200000003	\N	\N	\N	\N	2014-03-07 00:48:54.866178	2014-03-07 00:48:54.866178
1845	1071	MNGDUNNN	Manning Nb & Dunleer Ns	2900 Manning Ave & Dunleer Dr	34.0356542000000033	-118.413873699999996	\N	\N	\N	\N	2014-03-07 00:48:54.877452	2014-03-07 00:48:54.877452
1846	1072	MNGBTFNN	Manning Nb & Butterfield Ns	2800 Manning Ave & Butterfield Rd	34.0371019000000032	-118.416418100000001	\N	\N	\N	\N	2014-03-07 00:48:54.888468	2014-03-07 00:48:54.888468
1847	1073	MNGRNTNN	Manning Nb & Rountree Ns	2700 Manning Ave & Rountree Rd	34.0381236999999999	-118.418253899999996	\N	\N	\N	\N	2014-03-07 00:48:54.898898	2014-03-07 00:48:54.898898
1848	1074	MNGRNTSF	Manning Sb & Rountree Fs	2700 Manning Ave & Rountree Rd	34.0380103999999974	-118.418273400000004	\N	\N	\N	\N	2014-03-07 00:48:54.910708	2014-03-07 00:48:54.910708
1849	1075	ASBOVLWN	Ashby Wb & Overland Ns	10700 Ashby Ave & Overland Ave	34.0382735999999966	-118.421720699999995	\N	\N	\N	\N	2014-03-07 00:48:54.921845	2014-03-07 00:48:54.921845
1850	1077	OVLPCOSF	Overland Sb & Pico Fs	2400 Overland Ave & Pico Blvd	34.0415385000000015	-118.424758299999993	\N	\N	\N	\N	2014-03-07 00:48:54.932999	2014-03-07 00:48:54.932999
1851	1078	ASBOVLEF	Ashby Eb & Overland Fs	10700 Ashby Ave & Overland Ave	34.0382908999999998	-118.421641699999995	\N	\N	\N	\N	2014-03-07 00:48:54.943996	2014-03-07 00:48:54.943996
1852	1079	ASBMNGEN	Ashby Eb & Manning Ns	10600 Ashby Ave & Manning Ave	34.0390036000000009	-118.420230900000007	\N	\N	\N	\N	2014-03-07 00:48:54.95515	2014-03-07 00:48:54.95515
1853	1080	MNGBTFSN	Manning Sb & Butterfield Ns	2800 Manning Ave & Butterfield Rd	34.0372912999999997	-118.416891800000002	\N	\N	\N	\N	2014-03-07 00:48:54.96629	2014-03-07 00:48:54.96629
1854	1081	MNGDUNSN	Manning Sb & Dunleer Ns	2900 Manning Ave & Dunleer Dr	34.0357757000000021	-118.414283699999999	\N	\N	\N	\N	2014-03-07 00:48:54.977456	2014-03-07 00:48:54.977456
1855	1082	MTRMNGNF	Motor Nb & Manning Fs	3200 Motor Ave & Manning Ave	34.0340889000000004	-118.410495299999994	\N	\N	\N	\N	2014-03-07 00:48:54.988484	2014-03-07 00:48:54.988484
1856	1083	MTRBANNN	Motor Nb & Bannockburn Ns	3100 Motor Ave & Bannockburn Dr	34.0352828999999986	-118.4093965	\N	\N	\N	\N	2014-03-07 00:48:54.999488	2014-03-07 00:48:54.999488
1857	1084	MTRCHVNN	Motor Nb & Cheviot Ns	3000 Motor Ave & Cheviot Dr	34.0372654000000026	-118.408391800000004	\N	\N	\N	\N	2014-03-07 00:48:55.01071	2014-03-07 00:48:55.01071
1858	1085	MTRGLBNF	Motor Nb & Glenbarr Fs	2900 Motor Ave & Glenbarr Ave	34.0395697000000013	-118.406782699999994	\N	\N	\N	\N	2014-03-07 00:48:55.02187	2014-03-07 00:48:55.02187
1859	1086	MTRCLBNN	Motor Nb & Club Ns	2800 Motor Ave & Club Dr	34.0402594999999977	-118.404409999999999	\N	\N	\N	\N	2014-03-07 00:48:55.03298	2014-03-07 00:48:55.03298
1860	1087	MTRCTANN	Motor Nb & Cresta Ns	2700 Motor Ave & Cresta Dr	34.0418730999999966	-118.403399800000003	\N	\N	\N	\N	2014-03-07 00:48:55.044053	2014-03-07 00:48:55.044053
1861	1088	MTRMTMNN	Motor Nb & Monte Mar Ns	2600 Motor Ave & Monte Mar Dr	34.0437036000000006	-118.405326400000007	\N	\N	\N	\N	2014-03-07 00:48:55.055171	2014-03-07 00:48:55.055171
1862	1089	MTMBEVEF	Monte Mar Eb & Beverly Dr Fs	9400 Monte Mar Dr & S Beverly Dr	34.0493985000000023	-118.394911500000006	\N	\N	\N	\N	2014-03-07 00:48:55.066295	2014-03-07 00:48:55.066295
1863	1090	BAGMTMEF	Bagley Eb & Monte Mar Fs	1700 Bagley Ave & Monte Mar Dr	34.0488169999999997	-118.390705100000005	\N	\N	\N	\N	2014-03-07 00:48:55.077438	2014-03-07 00:48:55.077438
1864	1091	BAGARDEN	Bagley Eb & Airdrome Ns	1700 Bagley Ave & Airdrome St	34.0494727000000026	-118.389739800000001	\N	\N	\N	\N	2014-03-07 00:48:55.087698	2014-03-07 00:48:55.087698
1865	1092	ARDLIVEN	Airdrome Eb & Livonia Ns	9000 Airdrome St & Livonia Ave	34.0490324000000015	-118.386821299999994	\N	\N	\N	\N	2014-03-07 00:48:55.099602	2014-03-07 00:48:55.099602
1866	1093	CENSRTNF	Centinela Nb & Short Fs	4500 S Centinela Ave & Short Ave	33.9931734999999975	-118.423487600000001	\N	\N	\N	\N	2014-03-07 00:48:55.110816	2014-03-07 00:48:55.110816
1867	1094	CENLSENF	Centinela Nb & Louise Fs	4300 S Centinela Ave & Louise Ave	33.9949067000000014	-118.425711100000001	\N	\N	\N	\N	2014-03-07 00:48:55.121925	2014-03-07 00:48:55.121925
1868	1095	CENCNKNF	Centinela Nb & Charnock Fs	3600 S Centinela Ave & Charnock Rd	34.0079333999999989	-118.436678400000005	\N	\N	\N	\N	2014-03-07 00:48:55.132988	2014-03-07 00:48:55.132988
1869	1096	CENPLMNN	Centinela Nb & Palms Ns	3500 S Centinela Ave & Palms Blvd	34.0104218999999972	-118.438568500000002	\N	\N	\N	\N	2014-03-07 00:48:55.144037	2014-03-07 00:48:55.144037
1870	1097	CENWBINF	Centinela Nb & Woodbine Fs	3400 S Centinela Ave & Woodbine St	34.0122655999999992	-118.439982900000004	\N	\N	\N	\N	2014-03-07 00:48:55.155284	2014-03-07 00:48:55.155284
1871	1098	BUNPRLNN	Bundy Nb & Pearl Ns	2500 S Bundy Dr & Pearl St	34.026865100000002	-118.448119000000005	\N	\N	\N	\N	2014-03-07 00:48:55.166473	2014-03-07 00:48:55.166473
1872	1099	BARTRYNF	Barrington Nb & Terryhill Fs	600 S Barrington Ave & Terryhill Pl	34.0579318999999998	-118.468120200000001	\N	\N	\N	\N	2014-03-07 00:48:55.177534	2014-03-07 00:48:55.177534
1873	1100	BAR400NN	Barrington Nb & 400 Bl (Rec Ctr) Ns	400 S Barrington Ave & Barrington Rec Center	34.0611533000000009	-118.468520699999999	\N	\N	\N	\N	2014-03-07 00:48:55.188661	2014-03-07 00:48:55.188661
1874	1101	BAR400SM	Barrington Sb & 400 Bk (Rec Ctr) Mb	400 S Barrington Ave & Barrington Rec Center	34.0609275999999994	-118.468477300000004	\N	\N	\N	\N	2014-03-07 00:48:55.199917	2014-03-07 00:48:55.199917
1875	1102	BAR200NF	Barrington Nb & 200 Bk (Post Of) Fs	200 S Barrington Ave & Post Office	34.0637065000000021	-118.468546200000006	\N	\N	\N	\N	2014-03-07 00:48:55.210826	2014-03-07 00:48:55.210826
1876	1103	BAR200SF	Barrington Sb & 200 Bk (Post Of) Fs	200 S Barrington Ave & Unnamed St	34.0635540000000034	-118.468628499999994	\N	\N	\N	\N	2014-03-07 00:48:55.22203	2014-03-07 00:48:55.22203
1877	1104	CHUSEPWF	Church Wb & Sepulveda Fs	100 N Church Ln & N Sepulveda Blvd	34.0753155000000021	-118.468818799999994	\N	\N	\N	\N	2014-03-07 00:48:55.233108	2014-03-07 00:48:55.233108
1878	1105	SNTWBUEN	Sunset Eb & Woodburn Ns	11500 W Sunset Blvd & S Woodburn Dr	34.0696075999999977	-118.469597300000004	\N	\N	\N	\N	2014-03-07 00:48:55.244179	2014-03-07 00:48:55.244179
1879	1106	BARTRYSN	Barrington Sb & Terryhill Ns	600 S Barrington Ave & Terryhill Pl	34.0578032000000022	-118.468237099999996	\N	\N	\N	\N	2014-03-07 00:48:55.255301	2014-03-07 00:48:55.255301
1880	1107	BUNPRLSN	Bundy Sb & Pearl Ns	2500 S Bundy Dr & Pearl St	34.0270981999999975	-118.448480500000002	\N	\N	\N	\N	2014-03-07 00:48:55.266403	2014-03-07 00:48:55.266403
1881	1108	CENWBISN	Centinela Sb & Woodbine Ns	3400 S Centinela Ave & Woodbine St	34.012270700000002	-118.440190599999994	\N	\N	\N	\N	2014-03-07 00:48:55.277591	2014-03-07 00:48:55.277591
1882	1109	CENPLMSN	Centinela Sb & Palms Ns	3500 S Centinela Ave & Palms Blvd	34.0107080000000011	-118.439034199999995	\N	\N	\N	\N	2014-03-07 00:48:55.288604	2014-03-07 00:48:55.288604
1883	1110	CENCNKSN	Centinela Sb & Charnock Ns	3600 S Centinela Ave & Charnock Rd	34.0077821	-118.436807299999998	\N	\N	\N	\N	2014-03-07 00:48:55.299723	2014-03-07 00:48:55.299723
1884	1111	WALGVWEN	Washington Blvd Eb & Grandview Ns	12100 Washington Blvd & Grand View Blvd	33.9971238999999983	-118.425692499999997	\N	\N	\N	\N	2014-03-07 00:48:55.310918	2014-03-07 00:48:55.310918
1885	1112	WALINGEN	Washington Blvd Eb & Inglewood Ns	12000 Washington Blvd & Inglewood Blvd	33.997480000000003	-118.422471900000005	\N	\N	\N	\N	2014-03-07 00:48:55.322012	2014-03-07 00:48:55.322012
1886	1113	INGLSESN	Inglewood Sb & Louise Ns	4300 Inglewood Blvd & Louise Ave	33.9966822000000022	-118.420776700000005	\N	\N	\N	\N	2014-03-07 00:48:55.333193	2014-03-07 00:48:55.333193
1887	1114	INGCULSN	Inglewood Sb & Culver Ns	4500 Inglewood Blvd & Culver Blvd	33.994992400000001	-118.418187799999998	\N	\N	\N	\N	2014-03-07 00:48:55.344155	2014-03-07 00:48:55.344155
1888	1115	MNSMRNNN	Main Nb & Marine Ns	2900 Main St & Marine St	33.9979309000000001	-118.4794421	\N	\N	\N	\N	2014-03-07 00:48:55.3553	2014-03-07 00:48:55.3553
1889	1125	NLPOVLWF	National Place Wb & Overland Fs	10700 National Pl & Overland Ave	34.0308318000000014	-118.416731999999996	\N	\N	\N	\N	2014-03-07 00:48:55.366409	2014-03-07 00:48:55.366409
1890	1126	004CVCSM	4Th Sb & Civic Center Mb	1700 4Th St & Civic Center	34.0109801999999988	-118.4888677	\N	\N	\N	\N	2014-03-07 00:48:55.377559	2014-03-07 00:48:55.377559
1891	1128	MNSCTYSM	Main Sb & City Hall Mb	1600 Main St	34.0113105000000004	-118.492016899999996	\N	\N	\N	\N	2014-03-07 00:48:55.388492	2014-03-07 00:48:55.388492
1892	1129	MNSCTYNM	Main Nb & City Hall Mb	1600 Main St & S Bundy Dr	34.0119076000000007	-118.492518500000003	\N	\N	\N	\N	2014-03-07 00:48:55.399927	2014-03-07 00:48:55.399927
1893	1131	CLLABKEF	California Eb & Abbot Kinney Fs	600 California Ave & Abbot Kinney Blvd	33.9909461000000022	-118.465802400000001	\N	\N	\N	\N	2014-03-07 00:48:55.410479	2014-03-07 00:48:55.410479
1894	1132	PNMAMOSN	Penmar Sb & Amoroso Ns	2000 Penmar Ave & Amoroso Pl	33.9986966000000024	-118.4540729	\N	\N	\N	\N	2014-03-07 00:48:55.422406	2014-03-07 00:48:55.422406
1895	1133	NATROBWF	National Wb & Robertson Fs	9000 National Blvd & Robertson Blvd	34.031323399999998	-118.391228799999993	\N	\N	\N	\N	2014-03-07 00:48:55.433219	2014-03-07 00:48:55.433219
1896	1134	OVLPLMNF	Overland Nb & Palms Fs	3400 Overland Ave & Palms Blvd	34.0249572000000029	-118.411637499999998	\N	\N	\N	\N	2014-03-07 00:48:55.444331	2014-03-07 00:48:55.444331
1897	1136	CHUSNTNF	Church Nb & Sunset Fs	100 N Church Ln & W Sunset Blvd	34.0735071000000005	-118.4683998	\N	\N	\N	\N	2014-03-07 00:48:55.455428	2014-03-07 00:48:55.455428
1898	1138	LINLMUSF	Lincoln Sb & Lmu Dr Fs	7900 Lincoln Blvd & Lmu Dr	33.9652241000000004	-118.424452200000005	\N	\N	\N	\N	2014-03-07 00:48:55.466462	2014-03-07 00:48:55.466462
1899	1139	PCOSHRWN	Pico Wb & Sherbourne Ns	8600 W Pico Blvd & S Sherbourne Dr	34.0540209999999988	-118.379367299999998	\N	\N	\N	\N	2014-03-07 00:48:55.477466	2014-03-07 00:48:55.477466
1900	1145	SNTMQPEF	Sunset Eb & Marquez Pl Fs	17100 W Sunset Blvd & Salerno Dr	34.0418149999999997	-118.548952099999994	\N	\N	\N	\N	2014-03-07 00:48:55.488793	2014-03-07 00:48:55.488793
1901	1146	SNTMQPWN	Sunset Wb & Marquez Pl Ns	17100 W Sunset Blvd & Marquez Pl	34.041920300000001	-118.549044300000006	\N	\N	\N	\N	2014-03-07 00:48:55.49961	2014-03-07 00:48:55.49961
1902	1147	ENTOCEEN	Entrada Eb & Ocean Ns	400 W Channel Rd & Entrada Dr	34.0307279000000023	-118.5129321	\N	\N	\N	\N	2014-03-07 00:48:55.510659	2014-03-07 00:48:55.510659
1903	1148	OVLNLPSF	Overland Sb & National Place Fs	3100 Overland Ave & National Pl	34.0305073999999976	-118.416204100000002	\N	\N	\N	\N	2014-03-07 00:48:55.522116	2014-03-07 00:48:55.522116
1904	1149	WWPJSENF	Westwood Plaza Nb & J Stein Eye Fs	100 Westwood Plaza & Ucla Medical Center	34.0654334999999975	-118.445231199999995	\N	\N	\N	\N	2014-03-07 00:48:55.533282	2014-03-07 00:48:55.533282
1905	1151	SVSANIEN	San Vicente Eb & Anita Ns	12500 W San Vicente Blvd & Anita Ave	34.0504443000000023	-118.480779699999999	\N	\N	\N	\N	2014-03-07 00:48:55.544052	2014-03-07 00:48:55.544052
1906	1152	MORSEPEF	Moraga Eb & Sepulveda Fs	800 Moraga Dr & N. Sepulveda Blvd.	34.0778115999999969	-118.469040500000006	\N	\N	\N	\N	2014-03-07 00:48:55.555052	2014-03-07 00:48:55.555052
1907	1156	PRL017WN	Pearl Wb & 17Th Ns	1700 Pearl St & 17Th St	34.0156735999999995	-118.469221399999995	\N	\N	\N	\N	2014-03-07 00:48:55.566519	2014-03-07 00:48:55.566519
1908	1164	ABKSCLWN	Abbot Kinney Wb & Santa Clara Ns	1200 Abbot Kinney Blvd & Santa Clara Ave	33.9912782999999976	-118.468085599999995	\N	\N	\N	\N	2014-03-07 00:48:55.577395	2014-03-07 00:48:55.577395
1909	1167	ARDCSTWN	Airdrome Wb & Crest Ns	9100 Airdrome St & S Crest Dr	34.0492114999999984	-118.387362699999997	\N	\N	\N	\N	2014-03-07 00:48:55.588689	2014-03-07 00:48:55.588689
1910	1186	LINPCOSF	Lincoln Sb & Pico Fs	1900 Lincoln Blvd & Pico Blvd	34.0120744999999971	-118.482848000000004	\N	\N	\N	\N	2014-03-07 00:48:55.599935	2014-03-07 00:48:55.599935
1911	1187	LINMANSN	Lincoln Sb & Manchester Ns	8600 Lincoln Blvd & W Manchester Ave	33.9601490000000013	-118.419687300000007	\N	\N	\N	\N	2014-03-07 00:48:55.610695	2014-03-07 00:48:55.610695
1912	1188	LINMANNF	Lincoln Nb & Manchester Fs	8600 Lincoln Blvd & W Manchester Ave	33.960451599999999	-118.419659800000005	\N	\N	\N	\N	2014-03-07 00:48:55.622172	2014-03-07 00:48:55.622172
1913	1190	LAXB11	Lax Transit Center Bay 11	6111 W 96Th St & Jenny Ave	33.9491240999999988	-118.391926400000003	\N	\N	\N	\N	2014-03-07 00:48:55.633041	2014-03-07 00:48:55.633041
1914	1192	096AVTWN	96Th Wb & Alverstone Ns	6300 W 96Th St & Alverstone Ave	33.9487164000000021	-118.396886499999994	\N	\N	\N	\N	2014-03-07 00:48:55.64395	2014-03-07 00:48:55.64395
1915	1193	LAXB12	Lax Transit Center Bay 12	6111 W 96Th St & Unnamed St	33.9490648000000022	-118.392146999999994	\N	\N	\N	\N	2014-03-07 00:48:55.655235	2014-03-07 00:48:55.655235
1916	1196	OPR014WF	Ocean Park Wb & 14Th Fs	1400 Ocean Park Blvd & 14Th St	34.0103316000000007	-118.470573099999996	\N	\N	\N	\N	2014-03-07 00:48:55.666628	2014-03-07 00:48:55.666628
1917	1197	GRA008SF	Grand Sb & 8Th Fs	800 S Grand Ave & W 8Th St	34.0456509999999994	-118.258288699999994	\N	\N	\N	\N	2014-03-07 00:48:55.677762	2014-03-07 00:48:55.677762
1918	1198	GRAL09SF	Grand Sb & 9Th Fs	900 S Grand Ave & W 9Th St	34.0442678000000001	-118.259673000000006	\N	\N	\N	\N	2014-03-07 00:48:55.689008	2014-03-07 00:48:55.689008
1919	1199	SMBSEPWF	Santa Monica Wb & Sepulveda Fs	11100 Santa Monica Blvd & S Sepulveda Blvd	34.0476299999999981	-118.444680099999999	\N	\N	\N	\N	2014-03-07 00:48:55.766515	2014-03-07 00:48:55.766515
1920	1200	LINCLLNN	Lincoln Nb & California (Ven) Ns	1400 Lincoln Blvd & California Ave	33.9979465999999988	-118.460669300000006	\N	\N	\N	\N	2014-03-07 00:48:55.778028	2014-03-07 00:48:55.778028
1921	1201	LINBDYSN	Lincoln Sb & Broadway (Ven) Ns	900 Lincoln Blvd & Broadway	33.998345999999998	-118.4618818	\N	\N	\N	\N	2014-03-07 00:48:55.788587	2014-03-07 00:48:55.788587
1922	1217	007BWYSN	7Th Sb & Broadway Ns	1400 7Th St & Broadway	34.0174822999999975	-118.490944999999996	\N	\N	\N	\N	2014-03-07 00:48:55.800237	2014-03-07 00:48:55.800237
1923	1221	SEPCNKSF	Sepulveda Sb & Charnock Fs	3600 S Sepulveda Blvd & Charnock Rd	34.0162151999999978	-118.419923499999996	\N	\N	\N	\N	2014-03-07 00:48:55.810887	2014-03-07 00:48:55.810887
1924	1224	VENGVWEF	Venice Eb & Grand View Fs	12100 Venice Blvd & Grand View Blvd	34.0049205999999984	-118.430869400000006	\N	\N	\N	\N	2014-03-07 00:48:55.822081	2014-03-07 00:48:55.822081
1925	1225	VENINGEN	Venice Eb & Inglewood Ns	12000 Venice Blvd & Inglewood Blvd	34.0060726999999972	-118.428978599999994	\N	\N	\N	\N	2014-03-07 00:48:55.833752	2014-03-07 00:48:55.833752
1926	1226	VENMCGEN	Venice Eb & Mc Laughlin Ns	11700 Venice Blvd & Mc Laughlin Ave	34.0084510000000009	-118.424668299999993	\N	\N	\N	\N	2014-03-07 00:48:55.844503	2014-03-07 00:48:55.844503
1927	1227	VENMNVEN	Venice Eb & Minerva Ns	11400 Venice Blvd & Minerva Ave	34.009715700000001	-118.422402000000005	\N	\N	\N	\N	2014-03-07 00:48:55.85514	2014-03-07 00:48:55.85514
1928	1229	VENSAWWF	Venice Wb & Sawtelle Fs	11300 Venice Blvd & Sawtelle Blvd	34.0114601000000008	-118.420084500000002	\N	\N	\N	\N	2014-03-07 00:48:55.866545	2014-03-07 00:48:55.866545
1929	1230	VENBTLWF	Venice Wb & Butler Fs	11400 Venice Blvd & Butler Ave	34.0099137999999996	-118.422802700000005	\N	\N	\N	\N	2014-03-07 00:48:55.877924	2014-03-07 00:48:55.877924
1930	1231	VENMCGWF	Venice Wb & Mc Laughlin Fs	11700 Venice Blvd & Mc Laughlin Ave	34.0086484999999996	-118.424965099999994	\N	\N	\N	\N	2014-03-07 00:48:55.888459	2014-03-07 00:48:55.888459
1931	1232	VENINGWN	Venice Wb & Inglewood Ns	11900 Venice Blvd & Inglewood Blvd	34.0064343000000022	-118.428900799999994	\N	\N	\N	\N	2014-03-07 00:48:55.89979	2014-03-07 00:48:55.89979
1932	1233	VENGVWWF	Venice Wb & Grand View Fs	12200 Venice Blvd & Grand View Blvd	34.0048790999999966	-118.431674400000006	\N	\N	\N	\N	2014-03-07 00:48:55.910881	2014-03-07 00:48:55.910881
1933	1234	SMB017EF	Santa Monica Eb & 17Th Fs	1700 Santa Monica Blvd & 17Th St	34.0265097999999995	-118.482593100000003	\N	\N	\N	\N	2014-03-07 00:48:55.922512	2014-03-07 00:48:55.922512
1934	1235	GRAOLYSF	Grand Sb & Olympic Fs	1100 S Grand Ave & W Olympic Blvd	34.0428657000000001	-118.260881100000006	\N	\N	\N	\N	2014-03-07 00:48:55.933656	2014-03-07 00:48:55.933656
1935	1236	SMBVETWF	Santa Monica Wb & Veteran Fs	11000 Santa Monica Blvd & Veteran Ave	34.0488234000000034	-118.440674599999994	\N	\N	\N	\N	2014-03-07 00:48:55.944266	2014-03-07 00:48:55.944266
1936	1238	SMCBUNPL	Smc Bundy Campus Parking Lot	3200 Airport Ave & Donald Douglas Loop Sou	34.0152345999999994	-118.445987200000005	\N	\N	\N	\N	2014-03-07 00:48:55.966614	2014-03-07 00:48:55.966614
1937	1258	L07OLIWF	7Th Wb & Olive Fs	500 W 7Th St & S Olive St	34.0469026000000028	-118.255762799999999	\N	\N	\N	\N	2014-03-07 00:48:56.000271	2014-03-07 00:48:56.000271
1938	1260	L07HOPWF	7Th Wb & Hope Ns	600 W 7Th St & S Hope St	34.0481412999999975	-118.257342300000005	\N	\N	\N	\N	2014-03-07 00:48:56.011272	2014-03-07 00:48:56.011272
1939	1261	L07FIGWN	7Th Wb & Figueroa Ns	800 W 7Th St & S Figueroa St	34.0493738999999991	-118.259662399999996	\N	\N	\N	\N	2014-03-07 00:48:56.023165	2014-03-07 00:48:56.023165
1940	1262	WILHOPEN	Wilshire Eb & Hope Ns	700 Wilshire Blvd & S Flower St	34.0492986000000002	-118.257141300000001	\N	\N	\N	\N	2014-03-07 00:48:56.066347	2014-03-07 00:48:56.066347
1941	1263	WILGRAEN	Wilshire Eb & Grand Ns	600 Wilshire Blvd & S Grand Ave	34.0485078999999971	-118.256103899999999	\N	\N	\N	\N	2014-03-07 00:48:56.077589	2014-03-07 00:48:56.077589
1942	1265	NATROBEF	National Eb & Robertson Fs	9000 National Blvd & S Robertson Blvd	34.0307542999999981	-118.390294299999994	\N	\N	\N	\N	2014-03-07 00:48:56.088953	2014-03-07 00:48:56.088953
1943	1273	DDLSMONN	Donald Douglas Loop Nb & Airport Ns	3200 Donald Douglas Loop South & Airport Ave	34.0150600999999995	-118.447124500000001	\N	\N	\N	\N	2014-03-07 00:48:56.143818	2014-03-07 00:48:56.143818
1944	1275	ABKCDZEN	Abbot Kinney Eb & Cadiz Court Ns	1200 Abbot Kinney Blvd & Cadiz Ct	33.991183300000003	-118.468201800000003	\N	\N	\N	\N	2014-03-07 00:48:56.15534	2014-03-07 00:48:56.15534
1945	1278	PCOSTWWF	Pico Wb & Stewart Fs	2700 Pico Blvd & Stewart St	34.0240545999999995	-118.461094299999999	\N	\N	\N	\N	2014-03-07 00:48:56.166428	2014-03-07 00:48:56.166428
1946	1279	LINBLFNF	Lincoln Nb & Bluff Creek Fs	7900 Lincoln Blvd & W Jefferson Blvd	33.9680181000000019	-118.427548400000006	\N	\N	\N	\N	2014-03-07 00:48:56.233603	2014-03-07 00:48:56.233603
1947	1280	LINBLFSF	Lincoln Sb & Bluff Creek Fs	7900 Lincoln Blvd & Hughes Way	33.9672048999999987	-118.427528199999998	\N	\N	\N	\N	2014-03-07 00:48:56.244735	2014-03-07 00:48:56.244735
1948	1281	CNKMDVWN	Charnock Wb & Midvale Ns	10869 Charnock Rd & Midvale Ave	34.0204656000000014	-118.413865599999994	\N	\N	\N	\N	2014-03-07 00:48:56.255981	2014-03-07 00:48:56.255981
1949	1282	MANSEPEN	Manchester Eb & Sepulveda Ns	6400 W Manchester Ave & Sepulveda Blvd	33.9597456999999991	-118.396618000000004	\N	\N	\N	\N	2014-03-07 00:48:56.266964	2014-03-07 00:48:56.266964
1950	1286	ARP098SF	Airport Sb & 98Th Fs	9800 Airport Blvd & W 98Th St	33.9470353999999972	-118.386146100000005	\N	\N	\N	\N	2014-03-07 00:48:56.278101	2014-03-07 00:48:56.278101
1951	1287	006SMBSF	6Th Sb & Santa Monica Fs	1414 6Th St & Santa Monica Blvd	34.0177750000000003	-118.493148599999998	\N	\N	\N	\N	2014-03-07 00:48:56.288961	2014-03-07 00:48:56.288961
1952	1288	LINJEFSF	Lincoln Sb & Jefferson Fs	6008 Unit Blvd & W Jefferson Blvd	33.9715259000000032	-118.430140800000004	\N	\N	\N	\N	2014-03-07 00:48:56.300382	2014-03-07 00:48:56.300382
1953	1290	BUNOLYSF	Bundy Sb & Olympic Fs	2108 S Bundy Dr & W Olympic Blvd	34.0321478999999982	-118.453578300000004	\N	\N	\N	\N	2014-03-07 00:48:56.311223	2014-03-07 00:48:56.311223
1954	1291	026SVSSM	26Th & San Vicente Mb	232 26Th St	34.0476811999999995	-118.491233100000002	\N	\N	\N	\N	2014-03-07 00:48:56.321907	2014-03-07 00:48:56.321907
1955	1300	CLLFREWF	California Wb & Frederick Fs	1091 California Ave & Frederick St	33.9988548999999978	-118.4606584	\N	\N	\N	\N	2014-03-07 00:48:56.33366	2014-03-07 00:48:56.33366
1956	1301	WESWILNF	Western Nb Wilshire Fs	646 S Western Ave & Wilshire Blvd	34.0624058000000005	-118.308894899999999	\N	\N	\N	\N	2014-03-07 00:48:56.344782	2014-03-07 00:48:56.344782
1957	1302	WILWESWF	Wilshire Wb Western Fs	3807 Wilshire Blvd & S Western Ave	34.0618452000000005	-118.309532300000001	\N	\N	\N	\N	2014-03-07 00:48:56.355128	2014-03-07 00:48:56.355128
1958	1305	MNSMKTNN	Main Nb & Market Ns	1513 Main St & Market St	33.9886583999999985	-118.471358800000004	\N	\N	\N	\N	2014-03-07 00:48:56.366888	2014-03-07 00:48:56.366888
1959	1307	WWOPCONF	Westwood Nb & Pico Fs	2399 Westwood Blvd & W Pico Blvd	34.0403980000000033	-118.428702099999995	\N	\N	\N	\N	2014-03-07 00:48:56.378027	2014-03-07 00:48:56.378027
1960	1308	PCOSVSEF	Pico Eb & San Vicente Fs	4700 W Pico Blvd & S Hudson Ave	34.0484778000000006	-118.338454100000007	\N	\N	\N	\N	2014-03-07 00:48:56.388817	2014-03-07 00:48:56.388817
1961	1309	PCOMLNWN	Pico Wb & Mullen Ns	4579 W Pico Blvd & S Mullen Ave	34.0487930999999975	-118.335561299999995	\N	\N	\N	\N	2014-03-07 00:48:56.399602	2014-03-07 00:48:56.399602
1962	1310	CREPCONF	Crenshaw Nb & Pico Fs	1262 Crenshaw Blvd & W Pico Blvd	34.0480646999999976	-118.326502300000001	\N	\N	\N	\N	2014-03-07 00:48:56.411473	2014-03-07 00:48:56.411473
1963	1311	CREOLYNN	Crenshaw Nb & Olympic Ns	1020 Crenshaw Blvd & W Olympic Blvd	34.0543440000000004	-118.323064000000002	\N	\N	\N	\N	2014-03-07 00:48:56.422611	2014-03-07 00:48:56.422611
1964	1312	WILCREEF	Wilshire Eb & Crenshaw Fs	4188 Wilshire Blvd & Crenshaw Blvd	34.0616483000000017	-118.318635	\N	\N	\N	\N	2014-03-07 00:48:56.433714	2014-03-07 00:48:56.433714
1965	1313	CREWILSF	Crenshaw Sb & Wilshire Fs	673 Crenshaw Blvd & Wilshire Blvd	34.0613236000000015	-118.319422700000004	\N	\N	\N	\N	2014-03-07 00:48:56.444746	2014-03-07 00:48:56.444746
1966	1314	CREOLYSF	Crenshaw Sb & Olympic Fs	1023 Crenshaw Blvd & W Olympic Blvd	34.0543745000000015	-118.323263699999998	\N	\N	\N	\N	2014-03-07 00:48:56.455828	2014-03-07 00:48:56.455828
1967	1315	PCOCREWF	Pico Wb & Crenshaw Fs	4207 W Pico Blvd & Crenshaw Blvd	34.0479448000000033	-118.327091899999999	\N	\N	\N	\N	2014-03-07 00:48:56.46725	2014-03-07 00:48:56.46725
1968	1317	MNLALANN	Main (La) Nb & Alameda Ns	N Main St & N Alameda St	34.0588161000000014	-118.237286600000004	\N	\N	\N	\N	2014-03-07 00:48:56.477538	2014-03-07 00:48:56.477538
1969	1318	NATVENEF	National Eb & Venice Fs	8882 National Blvd & Venice Blvd	34.0291139999999999	-118.387952600000006	\N	\N	\N	\N	2014-03-07 00:48:56.488699	2014-03-07 00:48:56.488699
1970	1319	ROBVENNN	Robertson Bl Nb & Venice Bl Ns	3700 Robertson Blvd & Washington Blvd	34.026618599999999	-118.390129299999998	\N	\N	\N	\N	2014-03-07 00:48:56.499252	2014-03-07 00:48:56.499252
1971	1322	VENROBEN	Venice Eb & Robertson Ns	9018 Venice Blvd & S Robertson Blvd	34.0278993000000014	-118.390615800000006	\N	\N	\N	\N	2014-03-07 00:48:56.511301	2014-03-07 00:48:56.511301
1972	1323	004CV3NN	4Th Nb & Civic Ctr Ns 3	1717 4Th St & Olympic Blvd	34.0113780000000006	-118.489104999999995	\N	\N	\N	\N	2014-03-07 00:48:56.522817	2014-03-07 00:48:56.522817
1973	1325	SVSMONEN	San Vicente Eb & Montana Ns	11900 W San Vicente Blvd & Montana Ave	34.052549599999999	-118.470437500000003	\N	\N	\N	\N	2014-03-07 00:48:56.534066	2014-03-07 00:48:56.534066
1974	1327	CYGATERM	Charles E Young Term A	602 Charles E Young Dr & Westholme Ave	34.0689550999999966	-118.440365099999994	\N	\N	\N	\N	2014-03-07 00:48:56.545163	2014-03-07 00:48:56.545163
1975	1328	CYGBTERM	Charles E Young Term B	602 Charles E Young Dr & Manning Dr	34.0682928000000018	-118.440318099999999	\N	\N	\N	\N	2014-03-07 00:48:56.556169	2014-03-07 00:48:56.556169
1976	1329	WILBSLWF	Wilshire Wb & Bonsall Fs	11300 Wilshire Blvd & Bonsall Ave	34.0547630000000012	-118.455240000000003	\N	\N	\N	\N	2014-03-07 00:48:56.567247	2014-03-07 00:48:56.567247
1977	1330	PCOGTYEN	PICO EB & GATEWAY NS	11510 W PICO BLVD & GATEWAY BLVD	34.0335839999999976	-118.442017000000007	\N	\N	\N	\N	2014-03-07 00:48:56.578435	2014-03-07 00:48:56.578435
1978	1333	BWY011EN	BROADWAY EB & 11TH NS	1032 BROADWAY & 11TH ST	34.020347000000001	-118.486935000000003	\N	\N	\N	\N	2014-03-07 00:48:56.589527	2014-03-07 00:48:56.589527
1979	1334	BWYLINEN	BROADWAY EB & LINCOLN NS	710 BROADWAY & LINCOLN BLVD	34.0180069999999972	-118.489819999999995	\N	\N	\N	\N	2014-03-07 00:48:56.600596	2014-03-07 00:48:56.600596
1980	1335	BWY014EN	BROADWAY EB & 14TH NS	1320 BROADWAY & 14TH ST	34.0226070000000007	-118.484137000000004	\N	\N	\N	\N	2014-03-07 00:48:56.611689	2014-03-07 00:48:56.611689
1981	1336	BWY017EF	BROADWAY EB & 17TH FS	1700 BROADWAY & 17TH ST	34.0250630000000029	-118.481110000000001	\N	\N	\N	\N	2014-03-07 00:48:56.622512	2014-03-07 00:48:56.622512
1982	1337	BWY020EN	BROADWAY EB & 20TH NS	1958 BROADWAY & 20TH ST	34.0272059999999996	-118.478464000000002	\N	\N	\N	\N	2014-03-07 00:48:56.633434	2014-03-07 00:48:56.633434
1983	1338	BWY020WF	BROADWAY WB & 20TH FS	1955 BROADWAY & 20TH ST	34.0273309999999967	-118.478617	\N	\N	\N	\N	2014-03-07 00:48:56.645142	2014-03-07 00:48:56.645142
1984	1339	BWY017WN	BROADWAY WB & 17TH NS	1701 BROADWAY & 17TH ST	34.025188	-118.481262999999998	\N	\N	\N	\N	2014-03-07 00:48:56.655883	2014-03-07 00:48:56.655883
1985	1340	BWY014WN	BROADWAY WB & 14TH NS	1453 BROADWAY & 14TH ST	34.0228839999999977	-118.484105	\N	\N	\N	\N	2014-03-07 00:48:56.666949	2014-03-07 00:48:56.666949
1986	1341	BWY011WF	BROADWAY WB & 11TH FS	1027 BROADWAY & 11TH ST	34.0204450000000023	-118.487110000000001	\N	\N	\N	\N	2014-03-07 00:48:56.678188	2014-03-07 00:48:56.678188
1987	1342	BWYLINWN	BROADWAY WB & LINCOLN NS	809 BROADWAY & LINCOLN BLVD	34.0182840000000013	-118.489777000000004	\N	\N	\N	\N	2014-03-07 00:48:56.689283	2014-03-07 00:48:56.689283
1988	1343	OPRBUNEF	OCEAN PARK EB & BUNDY FS	12010 OCEAN PARK BLVD & S BUNDY DR	34.0246300000000019	-118.446123999999998	\N	\N	\N	\N	2014-03-07 00:48:56.700016	2014-03-07 00:48:56.700016
\.


--
-- Name: stops_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kyle
--

SELECT pg_catalog.setval('stops_id_seq', 1988, true);


--
-- Data for Name: trips; Type: TABLE DATA; Schema: public; Owner: kyle
--

COPY trips (id, gtfs_route_id, gtfs_service_id, gtfs_trip_id, headsign, short_name, direction_id, block_id, shape_id, route_id, created_at, updated_at) FROM stdin;
3654	1948	1	584977		\N	1	64970	 	24	2014-03-07 00:47:20.949662	2014-03-07 00:48:04.044871
4127	1958	1	583443	Rapid 20 Santa Monica/ 4th and Broadway 	\N	1	64970	 	33	2014-03-07 00:47:27.018877	2014-03-07 00:48:09.892438
5351	1947	10	581682	Line 4 Westide Pavilion/ Sawtelle and Olympic 	\N	0	64982	 	23	2014-03-07 00:47:43.084651	2014-03-07 00:48:26.659163
6220	1960	10	585233	Rapid 3 LAX/ Metro Green Line Station 	\N	1	64770	 	35	2014-03-07 00:47:54.466817	2014-03-07 00:48:38.668125
3430	1945	1	580994	Line 2 Santa Monica/ 4th and Civic Center	\N	1	64514	 	21	2014-03-07 00:47:18.27042	2014-03-07 00:48:00.751732
3541	1946	1	581289	Line 3 Green Line Station	\N	1	65035	 	22	2014-03-07 00:47:19.637973	2014-03-07 00:48:02.185963
3626	1948	1	584949		\N	0	64970	 	24	2014-03-07 00:47:20.638353	2014-03-07 00:48:03.587248
3682	1950	1	585392		\N	0	65112	 	26	2014-03-07 00:47:21.260798	2014-03-07 00:48:04.367191
3753	1950	1	585463		\N	1	65111	 	26	2014-03-07 00:47:22.205824	2014-03-07 00:48:05.200462
3858	1951	1	582408	Line 8 Santa Monica / Ocean Park	\N	1	64670	 	27	2014-03-07 00:47:23.528798	2014-03-07 00:48:06.445722
3892	1952	1	582609	Line 9 Pacific Palisades / Sunset and Marquez	\N	0	64687	 	28	2014-03-07 00:47:24.017666	2014-03-07 00:48:06.823945
3916	1952	1	582634	Santa Monica/ 4th and Civic Center 	\N	1	64687	 	28	2014-03-07 00:47:24.351236	2014-03-07 00:48:07.157699
3941	1953	1	584557		\N	0	64882	 	29	2014-03-07 00:47:24.629108	2014-03-07 00:48:07.568702
3966	1953	1	584582		\N	1	64882	 	29	2014-03-07 00:47:24.962702	2014-03-07 00:48:07.902178
3991	1955	1	582956	Line 12 Expo- Culver City	\N	0	64717	 	30	2014-03-07 00:47:25.318366	2014-03-07 00:48:08.235734
4047	1957	1	583215	Line 14 Bundy/Sepulveda and Moraga	\N	0	64737	 	32	2014-03-07 00:47:25.996781	2014-03-07 00:48:08.957111
4090	1957	1	583249	Line 14 Bundy/ Culver and Centinela 	\N	1	64737	 	32	2014-03-07 00:47:26.474556	2014-03-07 00:48:09.48005
4124	1958	1	583440	Rapid 20 Expo-Culver City	\N	0	64717	 	33	2014-03-07 00:47:26.985707	2014-03-07 00:48:09.85886
4906	1944	10	580761	Line 1 UCLA	\N	0	64503	 	20	2014-03-07 00:47:37.281845	2014-03-07 00:48:20.967096
5000	1944	10	580855	Line 1 Venice and Walgrove	\N	1	64499	 	20	2014-03-07 00:47:38.503402	2014-03-07 00:48:22.300386
5095	1945	10	581118	Line 2 UCLA	\N	0	64524	 	21	2014-03-07 00:47:39.637486	2014-03-07 00:48:23.479833
5200	1946	10	581472	Line 3  UCLA	\N	0	65126	 	22	2014-03-07 00:47:41.01678	2014-03-07 00:48:24.835059
5360	1947	10	581691	Line 4 4th and Santa Monica Civic Center 	\N	1	64979	 	23	2014-03-07 00:47:43.18458	2014-03-07 00:48:26.781374
5462	1949	10	581913	Line 6 SMC Commuter	\N	0	64895	 	25	2014-03-07 00:47:44.473724	2014-03-07 00:48:27.98083
5467	1949	54710	581918	Line 6 SMC Commuter	\N	1	64615	 	25	2014-03-07 00:47:44.530041	2014-03-07 00:48:28.037503
5644	1951	10	582512	Line 8 UCLA	\N	0	64680	 	27	2014-03-07 00:47:46.930786	2014-03-07 00:48:30.582972
5954	1955	10	583138	Line 12 UCLA	\N	1	64730	 	30	2014-03-07 00:47:51.043194	2014-03-07 00:48:35.265472
6014	1956	10	583191	Line 13 Cheviot Hills/Rimpau Terminal 	\N	0	64636	 	31	2014-03-07 00:47:51.865568	2014-03-07 00:48:36.053182
6018	1956	10	583195	Line 13 Cheviot Hills 	\N	1	64659	 	31	2014-03-07 00:47:51.911001	2014-03-07 00:48:36.097613
6152	1959	10	583469	Rapid 12 Expo-Culver City	\N	0	64757	 	34	2014-03-07 00:47:53.566599	2014-03-07 00:48:37.743449
6162	1959	10	583479	Rapid 12 UCLA	\N	1	65158	 	34	2014-03-07 00:47:53.689169	2014-03-07 00:48:37.95436
6179	1960	10	584728	Rapid 3 Santa Monica	\N	0	64772	 	35	2014-03-07 00:47:54.011992	2014-03-07 00:48:38.210039
6263	1961	10	584310		\N	0	65085	 	36	2014-03-07 00:47:55.079169	2014-03-07 00:48:39.268167
6342	1961	10	584238		\N	1	65083	 	36	2014-03-07 00:47:56.102106	2014-03-07 00:48:40.546133
6426	1962	10	583747	Line 41 Crosstown Ride 	\N	0	64797	 	37	2014-03-07 00:47:57.102466	2014-03-07 00:48:41.4799
6466	1963	10	583787	Line 44 Sunset Ride	\N	0	64798	 	38	2014-03-07 00:47:57.669547	2014-03-07 00:48:42.03653
\.


--
-- Name: trips_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kyle
--

SELECT pg_catalog.setval('trips_id_seq', 6506, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: kyle
--

COPY users (id, email, name, password_salt, password_hash, created_at, updated_at) FROM stdin;
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kyle
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Name: agencies_pkey; Type: CONSTRAINT; Schema: public; Owner: kyle; Tablespace: 
--

ALTER TABLE ONLY agencies
    ADD CONSTRAINT agencies_pkey PRIMARY KEY (id);


--
-- Name: journeys_pkey; Type: CONSTRAINT; Schema: public; Owner: kyle; Tablespace: 
--

ALTER TABLE ONLY journeys
    ADD CONSTRAINT journeys_pkey PRIMARY KEY (id);


--
-- Name: routes_pkey; Type: CONSTRAINT; Schema: public; Owner: kyle; Tablespace: 
--

ALTER TABLE ONLY routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);


--
-- Name: stop_times_pkey; Type: CONSTRAINT; Schema: public; Owner: kyle; Tablespace: 
--

ALTER TABLE ONLY stop_times
    ADD CONSTRAINT stop_times_pkey PRIMARY KEY (id);


--
-- Name: stops_pkey; Type: CONSTRAINT; Schema: public; Owner: kyle; Tablespace: 
--

ALTER TABLE ONLY stops
    ADD CONSTRAINT stops_pkey PRIMARY KEY (id);


--
-- Name: trips_pkey; Type: CONSTRAINT; Schema: public; Owner: kyle; Tablespace: 
--

ALTER TABLE ONLY trips
    ADD CONSTRAINT trips_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: kyle; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_journeys_on_stop_id; Type: INDEX; Schema: public; Owner: kyle; Tablespace: 
--

CREATE INDEX index_journeys_on_stop_id ON journeys USING btree (stop_id);


--
-- Name: index_journeys_on_trip_id; Type: INDEX; Schema: public; Owner: kyle; Tablespace: 
--

CREATE INDEX index_journeys_on_trip_id ON journeys USING btree (trip_id);


--
-- Name: index_journeys_on_user_id; Type: INDEX; Schema: public; Owner: kyle; Tablespace: 
--

CREATE INDEX index_journeys_on_user_id ON journeys USING btree (user_id);


--
-- Name: index_routes_on_agency_id; Type: INDEX; Schema: public; Owner: kyle; Tablespace: 
--

CREATE INDEX index_routes_on_agency_id ON routes USING btree (agency_id);


--
-- Name: index_stop_times_on_stop_id; Type: INDEX; Schema: public; Owner: kyle; Tablespace: 
--

CREATE INDEX index_stop_times_on_stop_id ON stop_times USING btree (stop_id);


--
-- Name: index_stop_times_on_trip_id; Type: INDEX; Schema: public; Owner: kyle; Tablespace: 
--

CREATE INDEX index_stop_times_on_trip_id ON stop_times USING btree (trip_id);


--
-- Name: index_trips_on_route_id; Type: INDEX; Schema: public; Owner: kyle; Tablespace: 
--

CREATE INDEX index_trips_on_route_id ON trips USING btree (route_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: kyle; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

