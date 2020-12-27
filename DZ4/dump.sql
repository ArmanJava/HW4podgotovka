--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

-- Started on 2020-12-27 06:29:48

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
-- TOC entry 201 (class 1259 OID 16397)
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id bigint NOT NULL,
    name character varying(250) NOT NULL,
    ticket bigint
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16395)
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_id_seq OWNER TO postgres;

--
-- TOC entry 3028 (class 0 OID 0)
-- Dependencies: 200
-- Name: client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_id_seq OWNED BY public.clients.id;


--
-- TOC entry 205 (class 1259 OID 16427)
-- Name: price; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price (
    id integer NOT NULL,
    ticket_price character varying NOT NULL
);


ALTER TABLE public.price OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16439)
-- Name: price_seansi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.price_seansi (
    id integer NOT NULL,
    price integer NOT NULL,
    seansi integer NOT NULL
);


ALTER TABLE public.price_seansi OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16417)
-- Name: seanses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seanses (
    id integer NOT NULL,
    raspisanie integer NOT NULL
);


ALTER TABLE public.seanses OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16405)
-- Name: tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tickets (
    id bigint NOT NULL,
    name character varying(250) NOT NULL,
    "time" bigint NOT NULL
);


ALTER TABLE public.tickets OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16403)
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tickets_id_seq OWNER TO postgres;

--
-- TOC entry 3029 (class 0 OID 0)
-- Dependencies: 202
-- Name: tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;


--
-- TOC entry 2869 (class 2604 OID 16400)
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.client_id_seq'::regclass);


--
-- TOC entry 2870 (class 2604 OID 16408)
-- Name: tickets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);


--
-- TOC entry 3017 (class 0 OID 16397)
-- Dependencies: 201
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, name, ticket) FROM stdin;
\.


--
-- TOC entry 3021 (class 0 OID 16427)
-- Dependencies: 205
-- Data for Name: price; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price (id, ticket_price) FROM stdin;
\.


--
-- TOC entry 3022 (class 0 OID 16439)
-- Dependencies: 206
-- Data for Name: price_seansi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.price_seansi (id, price, seansi) FROM stdin;
\.


--
-- TOC entry 3020 (class 0 OID 16417)
-- Dependencies: 204
-- Data for Name: seanses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seanses (id, raspisanie) FROM stdin;
\.


--
-- TOC entry 3019 (class 0 OID 16405)
-- Dependencies: 203
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tickets (id, name, "time") FROM stdin;
\.


--
-- TOC entry 3030 (class 0 OID 0)
-- Dependencies: 200
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_id_seq', 1, false);


--
-- TOC entry 3031 (class 0 OID 0)
-- Dependencies: 202
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tickets_id_seq', 1, false);


--
-- TOC entry 2872 (class 2606 OID 16402)
-- Name: clients client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 16445)
-- Name: price price_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_pk PRIMARY KEY (id);


--
-- TOC entry 2881 (class 2606 OID 16443)
-- Name: price_seansi price_seansi_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_seansi
    ADD CONSTRAINT price_seansi_pk PRIMARY KEY (id);


--
-- TOC entry 2877 (class 2606 OID 16421)
-- Name: seanses seanses_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seanses
    ADD CONSTRAINT seanses_pk PRIMARY KEY (id);


--
-- TOC entry 2875 (class 2606 OID 16410)
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- TOC entry 2873 (class 1259 OID 16416)
-- Name: fki_fk_tickets_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_fk_tickets_id ON public.clients USING btree (ticket);


--
-- TOC entry 2882 (class 2606 OID 16411)
-- Name: clients fk_tickets_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT fk_tickets_id FOREIGN KEY (ticket) REFERENCES public.tickets(id) NOT VALID;


--
-- TOC entry 2884 (class 2606 OID 16446)
-- Name: price_seansi price_seansi_price_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_seansi
    ADD CONSTRAINT price_seansi_price_id_fk FOREIGN KEY (price) REFERENCES public.price(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2885 (class 2606 OID 16451)
-- Name: price_seansi price_seansi_seanses_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.price_seansi
    ADD CONSTRAINT price_seansi_seanses_id_fk FOREIGN KEY (seansi) REFERENCES public.seanses(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2883 (class 2606 OID 16456)
-- Name: tickets tickets_price_seansi_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_price_seansi_id_fk FOREIGN KEY ("time") REFERENCES public.price_seansi(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2020-12-27 06:29:48

--
-- PostgreSQL database dump complete
--

