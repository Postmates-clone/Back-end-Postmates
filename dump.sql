--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.2

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

--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: dev_postmates
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO dev_postmates;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: dev_postmates
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO dev_postmates;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev_postmates
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: dev_postmates
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO dev_postmates;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: dev_postmates
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO dev_postmates;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev_postmates
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: dev_postmates
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO dev_postmates;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: dev_postmates
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO dev_postmates;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev_postmates
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: dev_postmates
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO dev_postmates;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: dev_postmates
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO dev_postmates;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev_postmates
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: dev_postmates
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO dev_postmates;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: dev_postmates
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO dev_postmates;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev_postmates
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: dev_postmates
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO dev_postmates;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: dev_postmates
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO dev_postmates;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev_postmates
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: dev_postmates
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO dev_postmates;

--
-- Name: members_favorite; Type: TABLE; Schema: public; Owner: dev_postmates
--

CREATE TABLE public.members_favorite (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    store_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.members_favorite OWNER TO dev_postmates;

--
-- Name: members_favorite_id_seq; Type: SEQUENCE; Schema: public; Owner: dev_postmates
--

CREATE SEQUENCE public.members_favorite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.members_favorite_id_seq OWNER TO dev_postmates;

--
-- Name: members_favorite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev_postmates
--

ALTER SEQUENCE public.members_favorite_id_seq OWNED BY public.members_favorite.id;


--
-- Name: members_user; Type: TABLE; Schema: public; Owner: dev_postmates
--

CREATE TABLE public.members_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    username character varying(30) NOT NULL,
    phone character varying(16) NOT NULL,
    address text NOT NULL
);


ALTER TABLE public.members_user OWNER TO dev_postmates;

--
-- Name: members_user_groups; Type: TABLE; Schema: public; Owner: dev_postmates
--

CREATE TABLE public.members_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.members_user_groups OWNER TO dev_postmates;

--
-- Name: members_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: dev_postmates
--

CREATE SEQUENCE public.members_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.members_user_groups_id_seq OWNER TO dev_postmates;

--
-- Name: members_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev_postmates
--

ALTER SEQUENCE public.members_user_groups_id_seq OWNED BY public.members_user_groups.id;


--
-- Name: members_user_id_seq; Type: SEQUENCE; Schema: public; Owner: dev_postmates
--

CREATE SEQUENCE public.members_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.members_user_id_seq OWNER TO dev_postmates;

--
-- Name: members_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev_postmates
--

ALTER SEQUENCE public.members_user_id_seq OWNED BY public.members_user.id;


--
-- Name: members_user_user_permissions; Type: TABLE; Schema: public; Owner: dev_postmates
--

CREATE TABLE public.members_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.members_user_user_permissions OWNER TO dev_postmates;

--
-- Name: members_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: dev_postmates
--

CREATE SEQUENCE public.members_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.members_user_user_permissions_id_seq OWNER TO dev_postmates;

--
-- Name: members_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev_postmates
--

ALTER SEQUENCE public.members_user_user_permissions_id_seq OWNED BY public.members_user_user_permissions.id;


--
-- Name: stores_badge; Type: TABLE; Schema: public; Owner: dev_postmates
--

CREATE TABLE public.stores_badge (
    id integer NOT NULL,
    text text NOT NULL
);


ALTER TABLE public.stores_badge OWNER TO dev_postmates;

--
-- Name: stores_badge_id_seq; Type: SEQUENCE; Schema: public; Owner: dev_postmates
--

CREATE SEQUENCE public.stores_badge_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_badge_id_seq OWNER TO dev_postmates;

--
-- Name: stores_badge_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev_postmates
--

ALTER SEQUENCE public.stores_badge_id_seq OWNED BY public.stores_badge.id;


--
-- Name: stores_hour; Type: TABLE; Schema: public; Owner: dev_postmates
--

CREATE TABLE public.stores_hour (
    id integer NOT NULL,
    start text NOT NULL,
    "end" text NOT NULL,
    day integer NOT NULL,
    open_hour_id integer NOT NULL
);


ALTER TABLE public.stores_hour OWNER TO dev_postmates;

--
-- Name: stores_hour_id_seq; Type: SEQUENCE; Schema: public; Owner: dev_postmates
--

CREATE SEQUENCE public.stores_hour_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_hour_id_seq OWNER TO dev_postmates;

--
-- Name: stores_hour_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev_postmates
--

ALTER SEQUENCE public.stores_hour_id_seq OWNED BY public.stores_hour.id;


--
-- Name: stores_menu; Type: TABLE; Schema: public; Owner: dev_postmates
--

CREATE TABLE public.stores_menu (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    price double precision,
    image_url text
);


ALTER TABLE public.stores_menu OWNER TO dev_postmates;

--
-- Name: stores_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: dev_postmates
--

CREATE SEQUENCE public.stores_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_menu_id_seq OWNER TO dev_postmates;

--
-- Name: stores_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev_postmates
--

ALTER SEQUENCE public.stores_menu_id_seq OWNED BY public.stores_menu.id;


--
-- Name: stores_menu_option_categories; Type: TABLE; Schema: public; Owner: dev_postmates
--

CREATE TABLE public.stores_menu_option_categories (
    id integer NOT NULL,
    menu_id integer NOT NULL,
    optioncategory_id integer NOT NULL
);


ALTER TABLE public.stores_menu_option_categories OWNER TO dev_postmates;

--
-- Name: stores_menu_option_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: dev_postmates
--

CREATE SEQUENCE public.stores_menu_option_categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_menu_option_categories_id_seq OWNER TO dev_postmates;

--
-- Name: stores_menu_option_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev_postmates
--

ALTER SEQUENCE public.stores_menu_option_categories_id_seq OWNED BY public.stores_menu_option_categories.id;


--
-- Name: stores_menucategory; Type: TABLE; Schema: public; Owner: dev_postmates
--

CREATE TABLE public.stores_menucategory (
    id integer NOT NULL,
    name text NOT NULL,
    store_id integer NOT NULL
);


ALTER TABLE public.stores_menucategory OWNER TO dev_postmates;

--
-- Name: stores_menucategory_id_seq; Type: SEQUENCE; Schema: public; Owner: dev_postmates
--

CREATE SEQUENCE public.stores_menucategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_menucategory_id_seq OWNER TO dev_postmates;

--
-- Name: stores_menucategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev_postmates
--

ALTER SEQUENCE public.stores_menucategory_id_seq OWNED BY public.stores_menucategory.id;


--
-- Name: stores_menucategory_menu; Type: TABLE; Schema: public; Owner: dev_postmates
--

CREATE TABLE public.stores_menucategory_menu (
    id integer NOT NULL,
    menucategory_id integer NOT NULL,
    menu_id integer NOT NULL
);


ALTER TABLE public.stores_menucategory_menu OWNER TO dev_postmates;

--
-- Name: stores_menucategory_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: dev_postmates
--

CREATE SEQUENCE public.stores_menucategory_menu_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_menucategory_menu_id_seq OWNER TO dev_postmates;

--
-- Name: stores_menucategory_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev_postmates
--

ALTER SEQUENCE public.stores_menucategory_menu_id_seq OWNED BY public.stores_menucategory_menu.id;


--
-- Name: stores_openhour; Type: TABLE; Schema: public; Owner: dev_postmates
--

CREATE TABLE public.stores_openhour (
    id integer NOT NULL,
    store_id integer NOT NULL
);


ALTER TABLE public.stores_openhour OWNER TO dev_postmates;

--
-- Name: stores_openhour_id_seq; Type: SEQUENCE; Schema: public; Owner: dev_postmates
--

CREATE SEQUENCE public.stores_openhour_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_openhour_id_seq OWNER TO dev_postmates;

--
-- Name: stores_openhour_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev_postmates
--

ALTER SEQUENCE public.stores_openhour_id_seq OWNED BY public.stores_openhour.id;


--
-- Name: stores_option; Type: TABLE; Schema: public; Owner: dev_postmates
--

CREATE TABLE public.stores_option (
    id integer NOT NULL,
    name text NOT NULL,
    price double precision NOT NULL,
    category_id integer NOT NULL
);


ALTER TABLE public.stores_option OWNER TO dev_postmates;

--
-- Name: stores_option_id_seq; Type: SEQUENCE; Schema: public; Owner: dev_postmates
--

CREATE SEQUENCE public.stores_option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_option_id_seq OWNER TO dev_postmates;

--
-- Name: stores_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev_postmates
--

ALTER SEQUENCE public.stores_option_id_seq OWNED BY public.stores_option.id;


--
-- Name: stores_optioncategory; Type: TABLE; Schema: public; Owner: dev_postmates
--

CREATE TABLE public.stores_optioncategory (
    id integer NOT NULL,
    name text NOT NULL,
    is_required boolean NOT NULL,
    option_category_id integer
);


ALTER TABLE public.stores_optioncategory OWNER TO dev_postmates;

--
-- Name: stores_optioncategory_id_seq; Type: SEQUENCE; Schema: public; Owner: dev_postmates
--

CREATE SEQUENCE public.stores_optioncategory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_optioncategory_id_seq OWNER TO dev_postmates;

--
-- Name: stores_optioncategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev_postmates
--

ALTER SEQUENCE public.stores_optioncategory_id_seq OWNED BY public.stores_optioncategory.id;


--
-- Name: stores_store; Type: TABLE; Schema: public; Owner: dev_postmates
--

CREATE TABLE public.stores_store (
    id integer NOT NULL,
    url text NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    delivery_message text,
    last_order_time double precision,
    is_delivery boolean NOT NULL,
    is_pickup boolean,
    delivery_fee double precision NOT NULL,
    estimated_prep_time integer,
    is_partner boolean,
    store_img text,
    address text NOT NULL,
    lat double precision NOT NULL,
    lng double precision NOT NULL,
    latlng public.geometry(Point,4326),
    food_type text NOT NULL,
    city text NOT NULL
);


ALTER TABLE public.stores_store OWNER TO dev_postmates;

--
-- Name: stores_store_badges; Type: TABLE; Schema: public; Owner: dev_postmates
--

CREATE TABLE public.stores_store_badges (
    id integer NOT NULL,
    store_id integer NOT NULL,
    badge_id integer NOT NULL
);


ALTER TABLE public.stores_store_badges OWNER TO dev_postmates;

--
-- Name: stores_store_badges_id_seq; Type: SEQUENCE; Schema: public; Owner: dev_postmates
--

CREATE SEQUENCE public.stores_store_badges_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_store_badges_id_seq OWNER TO dev_postmates;

--
-- Name: stores_store_badges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev_postmates
--

ALTER SEQUENCE public.stores_store_badges_id_seq OWNED BY public.stores_store_badges.id;


--
-- Name: stores_store_id_seq; Type: SEQUENCE; Schema: public; Owner: dev_postmates
--

CREATE SEQUENCE public.stores_store_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stores_store_id_seq OWNER TO dev_postmates;

--
-- Name: stores_store_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev_postmates
--

ALTER SEQUENCE public.stores_store_id_seq OWNED BY public.stores_store.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: members_favorite id; Type: DEFAULT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.members_favorite ALTER COLUMN id SET DEFAULT nextval('public.members_favorite_id_seq'::regclass);


--
-- Name: members_user id; Type: DEFAULT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.members_user ALTER COLUMN id SET DEFAULT nextval('public.members_user_id_seq'::regclass);


--
-- Name: members_user_groups id; Type: DEFAULT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.members_user_groups ALTER COLUMN id SET DEFAULT nextval('public.members_user_groups_id_seq'::regclass);


--
-- Name: members_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.members_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.members_user_user_permissions_id_seq'::regclass);


--
-- Name: stores_badge id; Type: DEFAULT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_badge ALTER COLUMN id SET DEFAULT nextval('public.stores_badge_id_seq'::regclass);


--
-- Name: stores_hour id; Type: DEFAULT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_hour ALTER COLUMN id SET DEFAULT nextval('public.stores_hour_id_seq'::regclass);


--
-- Name: stores_menu id; Type: DEFAULT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_menu ALTER COLUMN id SET DEFAULT nextval('public.stores_menu_id_seq'::regclass);


--
-- Name: stores_menu_option_categories id; Type: DEFAULT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_menu_option_categories ALTER COLUMN id SET DEFAULT nextval('public.stores_menu_option_categories_id_seq'::regclass);


--
-- Name: stores_menucategory id; Type: DEFAULT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_menucategory ALTER COLUMN id SET DEFAULT nextval('public.stores_menucategory_id_seq'::regclass);


--
-- Name: stores_menucategory_menu id; Type: DEFAULT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_menucategory_menu ALTER COLUMN id SET DEFAULT nextval('public.stores_menucategory_menu_id_seq'::regclass);


--
-- Name: stores_openhour id; Type: DEFAULT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_openhour ALTER COLUMN id SET DEFAULT nextval('public.stores_openhour_id_seq'::regclass);


--
-- Name: stores_option id; Type: DEFAULT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_option ALTER COLUMN id SET DEFAULT nextval('public.stores_option_id_seq'::regclass);


--
-- Name: stores_optioncategory id; Type: DEFAULT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_optioncategory ALTER COLUMN id SET DEFAULT nextval('public.stores_optioncategory_id_seq'::regclass);


--
-- Name: stores_store id; Type: DEFAULT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_store ALTER COLUMN id SET DEFAULT nextval('public.stores_store_id_seq'::regclass);


--
-- Name: stores_store_badges id; Type: DEFAULT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_store_badges ALTER COLUMN id SET DEFAULT nextval('public.stores_store_badges_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: dev_postmates
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: dev_postmates
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: dev_postmates
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
21	Can add 유저	6	add_user
22	Can change 유저	6	change_user
23	Can delete 유저	6	delete_user
24	Can view 유저	6	view_user
25	Can add 좋아요	7	add_favorite
26	Can change 좋아요	7	change_favorite
27	Can delete 좋아요	7	delete_favorite
28	Can view 좋아요	7	view_favorite
29	Can add 가게 뱃지	8	add_badge
30	Can change 가게 뱃지	8	change_badge
31	Can delete 가게 뱃지	8	delete_badge
32	Can view 가게 뱃지	8	view_badge
33	Can add 메뉴	9	add_menu
34	Can change 메뉴	9	change_menu
35	Can delete 메뉴	9	delete_menu
36	Can view 메뉴	9	view_menu
37	Can add 가게	10	add_store
38	Can change 가게	10	change_store
39	Can delete 가게	10	delete_store
40	Can view 가게	10	view_store
41	Can add 옵션 카테고리	11	add_optioncategory
42	Can change 옵션 카테고리	11	change_optioncategory
43	Can delete 옵션 카테고리	11	delete_optioncategory
44	Can view 옵션 카테고리	11	view_optioncategory
45	Can add 옵션	12	add_option
46	Can change 옵션	12	change_option
47	Can delete 옵션	12	delete_option
48	Can view 옵션	12	view_option
49	Can add 가게 오픈 시간	13	add_openhour
50	Can change 가게 오픈 시간	13	change_openhour
51	Can delete 가게 오픈 시간	13	delete_openhour
52	Can view 가게 오픈 시간	13	view_openhour
53	Can add 메뉴 카테고리	14	add_menucategory
54	Can change 메뉴 카테고리	14	change_menucategory
55	Can delete 메뉴 카테고리	14	delete_menucategory
56	Can view 메뉴 카테고리	14	view_menucategory
57	Can add 가게  요일별 오픈 시간	15	add_hour
58	Can change 가게  요일별 오픈 시간	15	change_hour
59	Can delete 가게  요일별 오픈 시간	15	delete_hour
60	Can view 가게  요일별 오픈 시간	15	view_hour
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: dev_postmates
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: dev_postmates
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	members	user
7	members	favorite
8	stores	badge
9	stores	menu
10	stores	store
11	stores	optioncategory
12	stores	option
13	stores	openhour
14	stores	menucategory
15	stores	hour
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: dev_postmates
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	stores	0001_initial	2020-07-13 18:02:37.789286+09
2	contenttypes	0001_initial	2020-07-13 18:02:37.880061+09
3	contenttypes	0002_remove_content_type_name	2020-07-13 18:02:37.934842+09
4	auth	0001_initial	2020-07-13 18:02:37.99222+09
5	auth	0002_alter_permission_name_max_length	2020-07-13 18:02:38.02935+09
6	auth	0003_alter_user_email_max_length	2020-07-13 18:02:38.051574+09
7	auth	0004_alter_user_username_opts	2020-07-13 18:02:38.076789+09
8	auth	0005_alter_user_last_login_null	2020-07-13 18:02:38.10143+09
9	auth	0006_require_contenttypes_0002	2020-07-13 18:02:38.114118+09
10	auth	0007_alter_validators_add_error_messages	2020-07-13 18:02:38.144121+09
11	auth	0008_alter_user_username_max_length	2020-07-13 18:02:38.166615+09
12	auth	0009_alter_user_last_name_max_length	2020-07-13 18:02:38.192005+09
13	auth	0010_alter_group_name_max_length	2020-07-13 18:02:38.2144+09
14	auth	0011_update_proxy_permissions	2020-07-13 18:02:38.254511+09
15	members	0001_initial	2020-07-13 18:02:38.40923+09
16	admin	0001_initial	2020-07-13 18:02:38.485927+09
17	admin	0002_logentry_remove_auto_add	2020-07-13 18:02:38.525359+09
18	admin	0003_logentry_add_action_flag_choices	2020-07-13 18:02:38.566758+09
19	sessions	0001_initial	2020-07-13 18:02:38.585684+09
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: dev_postmates
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: members_favorite; Type: TABLE DATA; Schema: public; Owner: dev_postmates
--

COPY public.members_favorite (id, created, store_id, user_id) FROM stdin;
\.


--
-- Data for Name: members_user; Type: TABLE DATA; Schema: public; Owner: dev_postmates
--

COPY public.members_user (id, password, last_login, is_superuser, first_name, last_name, email, is_staff, is_active, date_joined, username, phone, address) FROM stdin;
\.


--
-- Data for Name: members_user_groups; Type: TABLE DATA; Schema: public; Owner: dev_postmates
--

COPY public.members_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: members_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: dev_postmates
--

COPY public.members_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: dev_postmates
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: stores_badge; Type: TABLE DATA; Schema: public; Owner: dev_postmates
--

COPY public.stores_badge (id, text) FROM stdin;
\.


--
-- Data for Name: stores_hour; Type: TABLE DATA; Schema: public; Owner: dev_postmates
--

COPY public.stores_hour (id, start, "end", day, open_hour_id) FROM stdin;
\.


--
-- Data for Name: stores_menu; Type: TABLE DATA; Schema: public; Owner: dev_postmates
--

COPY public.stores_menu (id, name, description, price, image_url) FROM stdin;
\.


--
-- Data for Name: stores_menu_option_categories; Type: TABLE DATA; Schema: public; Owner: dev_postmates
--

COPY public.stores_menu_option_categories (id, menu_id, optioncategory_id) FROM stdin;
\.


--
-- Data for Name: stores_menucategory; Type: TABLE DATA; Schema: public; Owner: dev_postmates
--

COPY public.stores_menucategory (id, name, store_id) FROM stdin;
\.


--
-- Data for Name: stores_menucategory_menu; Type: TABLE DATA; Schema: public; Owner: dev_postmates
--

COPY public.stores_menucategory_menu (id, menucategory_id, menu_id) FROM stdin;
\.


--
-- Data for Name: stores_openhour; Type: TABLE DATA; Schema: public; Owner: dev_postmates
--

COPY public.stores_openhour (id, store_id) FROM stdin;
\.


--
-- Data for Name: stores_option; Type: TABLE DATA; Schema: public; Owner: dev_postmates
--

COPY public.stores_option (id, name, price, category_id) FROM stdin;
\.


--
-- Data for Name: stores_optioncategory; Type: TABLE DATA; Schema: public; Owner: dev_postmates
--

COPY public.stores_optioncategory (id, name, is_required, option_category_id) FROM stdin;
\.


--
-- Data for Name: stores_store; Type: TABLE DATA; Schema: public; Owner: dev_postmates
--

COPY public.stores_store (id, url, name, description, delivery_message, last_order_time, is_delivery, is_pickup, delivery_fee, estimated_prep_time, is_partner, store_img, address, lat, lng, latlng, food_type, city) FROM stdin;
\.


--
-- Data for Name: stores_store_badges; Type: TABLE DATA; Schema: public; Owner: dev_postmates
--

COPY public.stores_store_badges (id, store_id, badge_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev_postmates
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev_postmates
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev_postmates
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 60, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev_postmates
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev_postmates
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 15, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev_postmates
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- Name: members_favorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev_postmates
--

SELECT pg_catalog.setval('public.members_favorite_id_seq', 1, false);


--
-- Name: members_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev_postmates
--

SELECT pg_catalog.setval('public.members_user_groups_id_seq', 1, false);


--
-- Name: members_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev_postmates
--

SELECT pg_catalog.setval('public.members_user_id_seq', 1, false);


--
-- Name: members_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev_postmates
--

SELECT pg_catalog.setval('public.members_user_user_permissions_id_seq', 1, false);


--
-- Name: stores_badge_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev_postmates
--

SELECT pg_catalog.setval('public.stores_badge_id_seq', 1, false);


--
-- Name: stores_hour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev_postmates
--

SELECT pg_catalog.setval('public.stores_hour_id_seq', 1, false);


--
-- Name: stores_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev_postmates
--

SELECT pg_catalog.setval('public.stores_menu_id_seq', 1, false);


--
-- Name: stores_menu_option_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev_postmates
--

SELECT pg_catalog.setval('public.stores_menu_option_categories_id_seq', 1, false);


--
-- Name: stores_menucategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev_postmates
--

SELECT pg_catalog.setval('public.stores_menucategory_id_seq', 1, false);


--
-- Name: stores_menucategory_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev_postmates
--

SELECT pg_catalog.setval('public.stores_menucategory_menu_id_seq', 1, false);


--
-- Name: stores_openhour_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev_postmates
--

SELECT pg_catalog.setval('public.stores_openhour_id_seq', 1, false);


--
-- Name: stores_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev_postmates
--

SELECT pg_catalog.setval('public.stores_option_id_seq', 1, false);


--
-- Name: stores_optioncategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev_postmates
--

SELECT pg_catalog.setval('public.stores_optioncategory_id_seq', 1, false);


--
-- Name: stores_store_badges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev_postmates
--

SELECT pg_catalog.setval('public.stores_store_badges_id_seq', 1, false);


--
-- Name: stores_store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev_postmates
--

SELECT pg_catalog.setval('public.stores_store_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: members_favorite members_favorite_pkey; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.members_favorite
    ADD CONSTRAINT members_favorite_pkey PRIMARY KEY (id);


--
-- Name: members_user_groups members_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.members_user_groups
    ADD CONSTRAINT members_user_groups_pkey PRIMARY KEY (id);


--
-- Name: members_user_groups members_user_groups_user_id_group_id_e4658dba_uniq; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.members_user_groups
    ADD CONSTRAINT members_user_groups_user_id_group_id_e4658dba_uniq UNIQUE (user_id, group_id);


--
-- Name: members_user members_user_pkey; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.members_user
    ADD CONSTRAINT members_user_pkey PRIMARY KEY (id);


--
-- Name: members_user_user_permissions members_user_user_permis_user_id_permission_id_290733df_uniq; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.members_user_user_permissions
    ADD CONSTRAINT members_user_user_permis_user_id_permission_id_290733df_uniq UNIQUE (user_id, permission_id);


--
-- Name: members_user_user_permissions members_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.members_user_user_permissions
    ADD CONSTRAINT members_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: members_user members_user_username_key; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.members_user
    ADD CONSTRAINT members_user_username_key UNIQUE (username);


--
-- Name: stores_badge stores_badge_pkey; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_badge
    ADD CONSTRAINT stores_badge_pkey PRIMARY KEY (id);


--
-- Name: stores_badge stores_badge_text_key; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_badge
    ADD CONSTRAINT stores_badge_text_key UNIQUE (text);


--
-- Name: stores_hour stores_hour_pkey; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_hour
    ADD CONSTRAINT stores_hour_pkey PRIMARY KEY (id);


--
-- Name: stores_menu_option_categories stores_menu_option_categ_menu_id_optioncategory_i_c03ea41b_uniq; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_menu_option_categories
    ADD CONSTRAINT stores_menu_option_categ_menu_id_optioncategory_i_c03ea41b_uniq UNIQUE (menu_id, optioncategory_id);


--
-- Name: stores_menu_option_categories stores_menu_option_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_menu_option_categories
    ADD CONSTRAINT stores_menu_option_categories_pkey PRIMARY KEY (id);


--
-- Name: stores_menu stores_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_menu
    ADD CONSTRAINT stores_menu_pkey PRIMARY KEY (id);


--
-- Name: stores_menucategory_menu stores_menucategory_menu_menucategory_id_menu_id_c6ce686c_uniq; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_menucategory_menu
    ADD CONSTRAINT stores_menucategory_menu_menucategory_id_menu_id_c6ce686c_uniq UNIQUE (menucategory_id, menu_id);


--
-- Name: stores_menucategory_menu stores_menucategory_menu_pkey; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_menucategory_menu
    ADD CONSTRAINT stores_menucategory_menu_pkey PRIMARY KEY (id);


--
-- Name: stores_menucategory stores_menucategory_pkey; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_menucategory
    ADD CONSTRAINT stores_menucategory_pkey PRIMARY KEY (id);


--
-- Name: stores_openhour stores_openhour_pkey; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_openhour
    ADD CONSTRAINT stores_openhour_pkey PRIMARY KEY (id);


--
-- Name: stores_openhour stores_openhour_store_id_key; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_openhour
    ADD CONSTRAINT stores_openhour_store_id_key UNIQUE (store_id);


--
-- Name: stores_option stores_option_pkey; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_option
    ADD CONSTRAINT stores_option_pkey PRIMARY KEY (id);


--
-- Name: stores_optioncategory stores_optioncategory_name_key; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_optioncategory
    ADD CONSTRAINT stores_optioncategory_name_key UNIQUE (name);


--
-- Name: stores_optioncategory stores_optioncategory_pkey; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_optioncategory
    ADD CONSTRAINT stores_optioncategory_pkey PRIMARY KEY (id);


--
-- Name: stores_store_badges stores_store_badges_pkey; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_store_badges
    ADD CONSTRAINT stores_store_badges_pkey PRIMARY KEY (id);


--
-- Name: stores_store_badges stores_store_badges_store_id_badge_id_3fb6e87b_uniq; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_store_badges
    ADD CONSTRAINT stores_store_badges_store_id_badge_id_3fb6e87b_uniq UNIQUE (store_id, badge_id);


--
-- Name: stores_store stores_store_pkey; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_store
    ADD CONSTRAINT stores_store_pkey PRIMARY KEY (id);


--
-- Name: stores_store stores_store_url_key; Type: CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_store
    ADD CONSTRAINT stores_store_url_key UNIQUE (url);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: members_favorite_store_id_011878fb; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX members_favorite_store_id_011878fb ON public.members_favorite USING btree (store_id);


--
-- Name: members_favorite_user_id_d7ed7b2d; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX members_favorite_user_id_d7ed7b2d ON public.members_favorite USING btree (user_id);


--
-- Name: members_user_groups_group_id_39b83d85; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX members_user_groups_group_id_39b83d85 ON public.members_user_groups USING btree (group_id);


--
-- Name: members_user_groups_user_id_db5cba0f; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX members_user_groups_user_id_db5cba0f ON public.members_user_groups USING btree (user_id);


--
-- Name: members_user_user_permissions_permission_id_5f80148e; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX members_user_user_permissions_permission_id_5f80148e ON public.members_user_user_permissions USING btree (permission_id);


--
-- Name: members_user_user_permissions_user_id_3371a207; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX members_user_user_permissions_user_id_3371a207 ON public.members_user_user_permissions USING btree (user_id);


--
-- Name: members_user_username_c7299158_like; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX members_user_username_c7299158_like ON public.members_user USING btree (username varchar_pattern_ops);


--
-- Name: stores_badge_text_ff6392f0_like; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX stores_badge_text_ff6392f0_like ON public.stores_badge USING btree (text text_pattern_ops);


--
-- Name: stores_hour_open_hour_id_7512200f; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX stores_hour_open_hour_id_7512200f ON public.stores_hour USING btree (open_hour_id);


--
-- Name: stores_menu_option_categories_menu_id_e5578349; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX stores_menu_option_categories_menu_id_e5578349 ON public.stores_menu_option_categories USING btree (menu_id);


--
-- Name: stores_menu_option_categories_optioncategory_id_e1d140e5; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX stores_menu_option_categories_optioncategory_id_e1d140e5 ON public.stores_menu_option_categories USING btree (optioncategory_id);


--
-- Name: stores_menucategory_menu_menu_id_3e0536d4; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX stores_menucategory_menu_menu_id_3e0536d4 ON public.stores_menucategory_menu USING btree (menu_id);


--
-- Name: stores_menucategory_menu_menucategory_id_d2949b54; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX stores_menucategory_menu_menucategory_id_d2949b54 ON public.stores_menucategory_menu USING btree (menucategory_id);


--
-- Name: stores_menucategory_store_id_13a753ff; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX stores_menucategory_store_id_13a753ff ON public.stores_menucategory USING btree (store_id);


--
-- Name: stores_option_category_id_f86730f7; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX stores_option_category_id_f86730f7 ON public.stores_option USING btree (category_id);


--
-- Name: stores_optioncategory_name_858be228_like; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX stores_optioncategory_name_858be228_like ON public.stores_optioncategory USING btree (name text_pattern_ops);


--
-- Name: stores_optioncategory_option_category_id_870f830d; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX stores_optioncategory_option_category_id_870f830d ON public.stores_optioncategory USING btree (option_category_id);


--
-- Name: stores_store_badges_badge_id_55b71341; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX stores_store_badges_badge_id_55b71341 ON public.stores_store_badges USING btree (badge_id);


--
-- Name: stores_store_badges_store_id_75bfa916; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX stores_store_badges_store_id_75bfa916 ON public.stores_store_badges USING btree (store_id);


--
-- Name: stores_store_latlng_id; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX stores_store_latlng_id ON public.stores_store USING gist (latlng);


--
-- Name: stores_store_url_478330a0_like; Type: INDEX; Schema: public; Owner: dev_postmates
--

CREATE INDEX stores_store_url_478330a0_like ON public.stores_store USING btree (url text_pattern_ops);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_members_user_id; Type: FK CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_members_user_id FOREIGN KEY (user_id) REFERENCES public.members_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: members_favorite members_favorite_store_id_011878fb_fk_stores_store_id; Type: FK CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.members_favorite
    ADD CONSTRAINT members_favorite_store_id_011878fb_fk_stores_store_id FOREIGN KEY (store_id) REFERENCES public.stores_store(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: members_favorite members_favorite_user_id_d7ed7b2d_fk_members_user_id; Type: FK CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.members_favorite
    ADD CONSTRAINT members_favorite_user_id_d7ed7b2d_fk_members_user_id FOREIGN KEY (user_id) REFERENCES public.members_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: members_user_groups members_user_groups_group_id_39b83d85_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.members_user_groups
    ADD CONSTRAINT members_user_groups_group_id_39b83d85_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: members_user_groups members_user_groups_user_id_db5cba0f_fk_members_user_id; Type: FK CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.members_user_groups
    ADD CONSTRAINT members_user_groups_user_id_db5cba0f_fk_members_user_id FOREIGN KEY (user_id) REFERENCES public.members_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: members_user_user_permissions members_user_user_pe_permission_id_5f80148e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.members_user_user_permissions
    ADD CONSTRAINT members_user_user_pe_permission_id_5f80148e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: members_user_user_permissions members_user_user_pe_user_id_3371a207_fk_members_u; Type: FK CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.members_user_user_permissions
    ADD CONSTRAINT members_user_user_pe_user_id_3371a207_fk_members_u FOREIGN KEY (user_id) REFERENCES public.members_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stores_hour stores_hour_open_hour_id_7512200f_fk_stores_openhour_id; Type: FK CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_hour
    ADD CONSTRAINT stores_hour_open_hour_id_7512200f_fk_stores_openhour_id FOREIGN KEY (open_hour_id) REFERENCES public.stores_openhour(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stores_menu_option_categories stores_menu_option_c_menu_id_e5578349_fk_stores_me; Type: FK CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_menu_option_categories
    ADD CONSTRAINT stores_menu_option_c_menu_id_e5578349_fk_stores_me FOREIGN KEY (menu_id) REFERENCES public.stores_menu(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stores_menu_option_categories stores_menu_option_c_optioncategory_id_e1d140e5_fk_stores_op; Type: FK CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_menu_option_categories
    ADD CONSTRAINT stores_menu_option_c_optioncategory_id_e1d140e5_fk_stores_op FOREIGN KEY (optioncategory_id) REFERENCES public.stores_optioncategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stores_menucategory_menu stores_menucategory__menucategory_id_d2949b54_fk_stores_me; Type: FK CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_menucategory_menu
    ADD CONSTRAINT stores_menucategory__menucategory_id_d2949b54_fk_stores_me FOREIGN KEY (menucategory_id) REFERENCES public.stores_menucategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stores_menucategory_menu stores_menucategory_menu_menu_id_3e0536d4_fk_stores_menu_id; Type: FK CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_menucategory_menu
    ADD CONSTRAINT stores_menucategory_menu_menu_id_3e0536d4_fk_stores_menu_id FOREIGN KEY (menu_id) REFERENCES public.stores_menu(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stores_menucategory stores_menucategory_store_id_13a753ff_fk_stores_store_id; Type: FK CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_menucategory
    ADD CONSTRAINT stores_menucategory_store_id_13a753ff_fk_stores_store_id FOREIGN KEY (store_id) REFERENCES public.stores_store(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stores_openhour stores_openhour_store_id_97f89ebc_fk_stores_store_id; Type: FK CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_openhour
    ADD CONSTRAINT stores_openhour_store_id_97f89ebc_fk_stores_store_id FOREIGN KEY (store_id) REFERENCES public.stores_store(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stores_option stores_option_category_id_f86730f7_fk_stores_optioncategory_id; Type: FK CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_option
    ADD CONSTRAINT stores_option_category_id_f86730f7_fk_stores_optioncategory_id FOREIGN KEY (category_id) REFERENCES public.stores_optioncategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stores_optioncategory stores_optioncategor_option_category_id_870f830d_fk_stores_op; Type: FK CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_optioncategory
    ADD CONSTRAINT stores_optioncategor_option_category_id_870f830d_fk_stores_op FOREIGN KEY (option_category_id) REFERENCES public.stores_optioncategory(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stores_store_badges stores_store_badges_badge_id_55b71341_fk_stores_badge_id; Type: FK CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_store_badges
    ADD CONSTRAINT stores_store_badges_badge_id_55b71341_fk_stores_badge_id FOREIGN KEY (badge_id) REFERENCES public.stores_badge(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: stores_store_badges stores_store_badges_store_id_75bfa916_fk_stores_store_id; Type: FK CONSTRAINT; Schema: public; Owner: dev_postmates
--

ALTER TABLE ONLY public.stores_store_badges
    ADD CONSTRAINT stores_store_badges_store_id_75bfa916_fk_stores_store_id FOREIGN KEY (store_id) REFERENCES public.stores_store(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

