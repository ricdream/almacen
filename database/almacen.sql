--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.4.4
-- Started on 2015-09-10 15:35:12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 189 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2103 (class 0 OID 0)
-- Dependencies: 189
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 181 (class 1259 OID 17543)
-- Name: alm_almacen; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE alm_almacen (
    id_almacen smallint NOT NULL,
    codigo_almacen character varying(100),
    descripcion character varying(300),
    direccion character varying(350),
    id_responsable integer,
    id_tipo_almacen integer,
    id_estado character varying(10),
    id_usuario_registro integer,
    fecha_registro timestamp without time zone,
    id_usuario_modificacion integer,
    fecha_modificacion timestamp without time zone
);


ALTER TABLE alm_almacen OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 17541)
-- Name: alm_almacen_id_almacen_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE alm_almacen_id_almacen_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alm_almacen_id_almacen_seq OWNER TO postgres;

--
-- TOC entry 2104 (class 0 OID 0)
-- Dependencies: 180
-- Name: alm_almacen_id_almacen_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE alm_almacen_id_almacen_seq OWNED BY alm_almacen.id_almacen;


--
-- TOC entry 188 (class 1259 OID 17580)
-- Name: alm_estado; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE alm_estado (
    id_estado character varying(10) NOT NULL,
    nombre character varying(30),
    descripcion character varying(255)
);


ALTER TABLE alm_estado OWNER TO postgres;

--
-- TOC entry 183 (class 1259 OID 17554)
-- Name: alm_item; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE alm_item (
    id_item smallint NOT NULL,
    codigo_item character varying(100),
    nombre character varying(300),
    id_unidad integer,
    id_subgrupo integer,
    id_grupo integer,
    porcentaje_ganancia real,
    disponible character varying(100),
    id_estado character varying(10),
    id_usuario_registro integer,
    fecha_registro timestamp without time zone,
    id_usuario_modificacion integer,
    fecha_modificacion timestamp without time zone
);


ALTER TABLE alm_item OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 17565)
-- Name: alm_item_almacen; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE alm_item_almacen (
    id_item_almacen smallint NOT NULL,
    id_almacen integer,
    id_item integer,
    stock_minimo integer,
    stock_maximo integer,
    saldo_anterior real,
    saldo_actual real,
    precio_anterior real,
    precio_actual real,
    id_estado character varying(10),
    id_usuario_registro integer,
    fecha_registro timestamp without time zone,
    id_usuario_modificacion integer,
    fecha_modificacion timestamp without time zone
);


ALTER TABLE alm_item_almacen OWNER TO postgres;

--
-- TOC entry 184 (class 1259 OID 17563)
-- Name: alm_item_almacen_id_item_almacen_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE alm_item_almacen_id_item_almacen_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alm_item_almacen_id_item_almacen_seq OWNER TO postgres;

--
-- TOC entry 2105 (class 0 OID 0)
-- Dependencies: 184
-- Name: alm_item_almacen_id_item_almacen_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE alm_item_almacen_id_item_almacen_seq OWNED BY alm_item_almacen.id_item_almacen;


--
-- TOC entry 182 (class 1259 OID 17552)
-- Name: alm_item_id_item_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE alm_item_id_item_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alm_item_id_item_seq OWNER TO postgres;

--
-- TOC entry 2106 (class 0 OID 0)
-- Dependencies: 182
-- Name: alm_item_id_item_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE alm_item_id_item_seq OWNED BY alm_item.id_item;


--
-- TOC entry 177 (class 1259 OID 17527)
-- Name: alm_pedido; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE alm_pedido (
    id_pedido smallint NOT NULL,
    codigo_pedido character varying(100),
    fecha_pedido timestamp(6) without time zone,
    fecha_limite timestamp(6) without time zone,
    id_proveedor integer,
    id_almacen integer,
    id_estado character varying(10),
    id_usuario_registro integer,
    fecha_registro timestamp(6) without time zone,
    id_usuario_modificacion integer,
    fecha_modificacion timestamp(6) without time zone
);


ALTER TABLE alm_pedido OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 17535)
-- Name: alm_pedido_detalle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE alm_pedido_detalle (
    id_pedido_detalle smallint NOT NULL,
    id_pedido integer,
    id_item integer,
    cantidad integer,
    costo_unitario real,
    id_estado character varying(10),
    id_usuario_registro integer,
    fecha_registro timestamp without time zone,
    id_usuario_modificacion integer,
    fecha_modificacion timestamp without time zone
);


ALTER TABLE alm_pedido_detalle OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 17533)
-- Name: alm_pedido_detalle_id_pedido_detalle_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE alm_pedido_detalle_id_pedido_detalle_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alm_pedido_detalle_id_pedido_detalle_seq OWNER TO postgres;

--
-- TOC entry 2107 (class 0 OID 0)
-- Dependencies: 178
-- Name: alm_pedido_detalle_id_pedido_detalle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE alm_pedido_detalle_id_pedido_detalle_seq OWNED BY alm_pedido_detalle.id_pedido_detalle;


--
-- TOC entry 176 (class 1259 OID 17525)
-- Name: alm_pedido_id_pedido_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE alm_pedido_id_pedido_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alm_pedido_id_pedido_seq OWNER TO postgres;

--
-- TOC entry 2108 (class 0 OID 0)
-- Dependencies: 176
-- Name: alm_pedido_id_pedido_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE alm_pedido_id_pedido_seq OWNED BY alm_pedido.id_pedido;


--
-- TOC entry 173 (class 1259 OID 17508)
-- Name: alm_proveedor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE alm_proveedor (
    id_proveedor smallint NOT NULL,
    codigo_proveedor character varying(50),
    razon_social character varying(255),
    nit character varying(20),
    direccion character varying(255),
    telefono integer,
    celular integer,
    fax character varying(20),
    contacto character varying(100),
    correo_electronico character varying(100),
    id_estado character varying(10),
    id_tipo_proveedor integer,
    id_usuario_registro integer,
    fecha_registro timestamp without time zone,
    id_usuario_modificacion integer,
    fecha_modificacion timestamp without time zone
);


ALTER TABLE alm_proveedor OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 17573)
-- Name: alm_tipo_almacen; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE alm_tipo_almacen (
    id_tipo_almacen smallint NOT NULL,
    detalle character varying(300)
);


ALTER TABLE alm_tipo_almacen OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 17571)
-- Name: alm_tipo_almacen_id_tipo_almacen_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE alm_tipo_almacen_id_tipo_almacen_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alm_tipo_almacen_id_tipo_almacen_seq OWNER TO postgres;

--
-- TOC entry 2109 (class 0 OID 0)
-- Dependencies: 186
-- Name: alm_tipo_almacen_id_tipo_almacen_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE alm_tipo_almacen_id_tipo_almacen_seq OWNED BY alm_tipo_almacen.id_tipo_almacen;


--
-- TOC entry 175 (class 1259 OID 17519)
-- Name: alm_tipo_proveedor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE alm_tipo_proveedor (
    id_tipo_proveedor smallint NOT NULL,
    detalle character varying(255)
);


ALTER TABLE alm_tipo_proveedor OWNER TO postgres;

--
-- TOC entry 172 (class 1259 OID 17506)
-- Name: alm_tipo_proveedor_id_proveedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE alm_tipo_proveedor_id_proveedor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alm_tipo_proveedor_id_proveedor_seq OWNER TO postgres;

--
-- TOC entry 2110 (class 0 OID 0)
-- Dependencies: 172
-- Name: alm_tipo_proveedor_id_proveedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE alm_tipo_proveedor_id_proveedor_seq OWNED BY alm_proveedor.id_proveedor;


--
-- TOC entry 174 (class 1259 OID 17517)
-- Name: alm_tipo_proveedor_id_tipo_proveedor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE alm_tipo_proveedor_id_tipo_proveedor_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE alm_tipo_proveedor_id_tipo_proveedor_seq OWNER TO postgres;

--
-- TOC entry 2111 (class 0 OID 0)
-- Dependencies: 174
-- Name: alm_tipo_proveedor_id_tipo_proveedor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE alm_tipo_proveedor_id_tipo_proveedor_seq OWNED BY alm_tipo_proveedor.id_tipo_proveedor;


--
-- TOC entry 1934 (class 2604 OID 17546)
-- Name: id_almacen; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alm_almacen ALTER COLUMN id_almacen SET DEFAULT nextval('alm_almacen_id_almacen_seq'::regclass);


--
-- TOC entry 1935 (class 2604 OID 17557)
-- Name: id_item; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alm_item ALTER COLUMN id_item SET DEFAULT nextval('alm_item_id_item_seq'::regclass);


--
-- TOC entry 1936 (class 2604 OID 17568)
-- Name: id_item_almacen; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alm_item_almacen ALTER COLUMN id_item_almacen SET DEFAULT nextval('alm_item_almacen_id_item_almacen_seq'::regclass);


--
-- TOC entry 1932 (class 2604 OID 17530)
-- Name: id_pedido; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alm_pedido ALTER COLUMN id_pedido SET DEFAULT nextval('alm_pedido_id_pedido_seq'::regclass);


--
-- TOC entry 1933 (class 2604 OID 17538)
-- Name: id_pedido_detalle; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alm_pedido_detalle ALTER COLUMN id_pedido_detalle SET DEFAULT nextval('alm_pedido_detalle_id_pedido_detalle_seq'::regclass);


--
-- TOC entry 1930 (class 2604 OID 17511)
-- Name: id_proveedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alm_proveedor ALTER COLUMN id_proveedor SET DEFAULT nextval('alm_tipo_proveedor_id_proveedor_seq'::regclass);


--
-- TOC entry 1937 (class 2604 OID 17576)
-- Name: id_tipo_almacen; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alm_tipo_almacen ALTER COLUMN id_tipo_almacen SET DEFAULT nextval('alm_tipo_almacen_id_tipo_almacen_seq'::regclass);


--
-- TOC entry 1931 (class 2604 OID 17522)
-- Name: id_tipo_proveedor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alm_tipo_proveedor ALTER COLUMN id_tipo_proveedor SET DEFAULT nextval('alm_tipo_proveedor_id_tipo_proveedor_seq'::regclass);


--
-- TOC entry 2088 (class 0 OID 17543)
-- Dependencies: 181
-- Data for Name: alm_almacen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY alm_almacen (id_almacen, codigo_almacen, descripcion, direccion, id_responsable, id_tipo_almacen, id_estado, id_usuario_registro, fecha_registro, id_usuario_modificacion, fecha_modificacion) FROM stdin;
\.


--
-- TOC entry 2112 (class 0 OID 0)
-- Dependencies: 180
-- Name: alm_almacen_id_almacen_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('alm_almacen_id_almacen_seq', 1, false);


--
-- TOC entry 2095 (class 0 OID 17580)
-- Dependencies: 188
-- Data for Name: alm_estado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY alm_estado (id_estado, nombre, descripcion) FROM stdin;
\.


--
-- TOC entry 2090 (class 0 OID 17554)
-- Dependencies: 183
-- Data for Name: alm_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY alm_item (id_item, codigo_item, nombre, id_unidad, id_subgrupo, id_grupo, porcentaje_ganancia, disponible, id_estado, id_usuario_registro, fecha_registro, id_usuario_modificacion, fecha_modificacion) FROM stdin;
\.


--
-- TOC entry 2092 (class 0 OID 17565)
-- Dependencies: 185
-- Data for Name: alm_item_almacen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY alm_item_almacen (id_item_almacen, id_almacen, id_item, stock_minimo, stock_maximo, saldo_anterior, saldo_actual, precio_anterior, precio_actual, id_estado, id_usuario_registro, fecha_registro, id_usuario_modificacion, fecha_modificacion) FROM stdin;
\.


--
-- TOC entry 2113 (class 0 OID 0)
-- Dependencies: 184
-- Name: alm_item_almacen_id_item_almacen_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('alm_item_almacen_id_item_almacen_seq', 1, false);


--
-- TOC entry 2114 (class 0 OID 0)
-- Dependencies: 182
-- Name: alm_item_id_item_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('alm_item_id_item_seq', 1, false);


--
-- TOC entry 2084 (class 0 OID 17527)
-- Dependencies: 177
-- Data for Name: alm_pedido; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY alm_pedido (id_pedido, codigo_pedido, fecha_pedido, fecha_limite, id_proveedor, id_almacen, id_estado, id_usuario_registro, fecha_registro, id_usuario_modificacion, fecha_modificacion) FROM stdin;
\.


--
-- TOC entry 2086 (class 0 OID 17535)
-- Dependencies: 179
-- Data for Name: alm_pedido_detalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY alm_pedido_detalle (id_pedido_detalle, id_pedido, id_item, cantidad, costo_unitario, id_estado, id_usuario_registro, fecha_registro, id_usuario_modificacion, fecha_modificacion) FROM stdin;
\.


--
-- TOC entry 2115 (class 0 OID 0)
-- Dependencies: 178
-- Name: alm_pedido_detalle_id_pedido_detalle_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('alm_pedido_detalle_id_pedido_detalle_seq', 1, false);


--
-- TOC entry 2116 (class 0 OID 0)
-- Dependencies: 176
-- Name: alm_pedido_id_pedido_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('alm_pedido_id_pedido_seq', 1, false);


--
-- TOC entry 2080 (class 0 OID 17508)
-- Dependencies: 173
-- Data for Name: alm_proveedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY alm_proveedor (id_proveedor, codigo_proveedor, razon_social, nit, direccion, telefono, celular, fax, contacto, correo_electronico, id_estado, id_tipo_proveedor, id_usuario_registro, fecha_registro, id_usuario_modificacion, fecha_modificacion) FROM stdin;
\.


--
-- TOC entry 2094 (class 0 OID 17573)
-- Dependencies: 187
-- Data for Name: alm_tipo_almacen; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY alm_tipo_almacen (id_tipo_almacen, detalle) FROM stdin;
\.


--
-- TOC entry 2117 (class 0 OID 0)
-- Dependencies: 186
-- Name: alm_tipo_almacen_id_tipo_almacen_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('alm_tipo_almacen_id_tipo_almacen_seq', 1, false);


--
-- TOC entry 2082 (class 0 OID 17519)
-- Dependencies: 175
-- Data for Name: alm_tipo_proveedor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY alm_tipo_proveedor (id_tipo_proveedor, detalle) FROM stdin;
\.


--
-- TOC entry 2118 (class 0 OID 0)
-- Dependencies: 172
-- Name: alm_tipo_proveedor_id_proveedor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('alm_tipo_proveedor_id_proveedor_seq', 1, false);


--
-- TOC entry 2119 (class 0 OID 0)
-- Dependencies: 174
-- Name: alm_tipo_proveedor_id_tipo_proveedor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('alm_tipo_proveedor_id_tipo_proveedor_seq', 1, false);


--
-- TOC entry 1947 (class 2606 OID 17551)
-- Name: alm_almacen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY alm_almacen
    ADD CONSTRAINT alm_almacen_pkey PRIMARY KEY (id_almacen);


--
-- TOC entry 1955 (class 2606 OID 17584)
-- Name: alm_estado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY alm_estado
    ADD CONSTRAINT alm_estado_pkey PRIMARY KEY (id_estado);


--
-- TOC entry 1951 (class 2606 OID 17570)
-- Name: alm_item_almacen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY alm_item_almacen
    ADD CONSTRAINT alm_item_almacen_pkey PRIMARY KEY (id_item_almacen);


--
-- TOC entry 1949 (class 2606 OID 17562)
-- Name: alm_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY alm_item
    ADD CONSTRAINT alm_item_pkey PRIMARY KEY (id_item);


--
-- TOC entry 1945 (class 2606 OID 17540)
-- Name: alm_pedido_detalle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY alm_pedido_detalle
    ADD CONSTRAINT alm_pedido_detalle_pkey PRIMARY KEY (id_pedido_detalle);


--
-- TOC entry 1943 (class 2606 OID 17532)
-- Name: alm_pedido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY alm_pedido
    ADD CONSTRAINT alm_pedido_pkey PRIMARY KEY (id_pedido);


--
-- TOC entry 1953 (class 2606 OID 17578)
-- Name: alm_tipo_almacen_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY alm_tipo_almacen
    ADD CONSTRAINT alm_tipo_almacen_pkey PRIMARY KEY (id_tipo_almacen);


--
-- TOC entry 1939 (class 2606 OID 17516)
-- Name: alm_tipo_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY alm_proveedor
    ADD CONSTRAINT alm_tipo_proveedor_pkey PRIMARY KEY (id_proveedor);


--
-- TOC entry 1941 (class 2606 OID 17524)
-- Name: alm_tipo_proveedor_pkey1; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY alm_tipo_proveedor
    ADD CONSTRAINT alm_tipo_proveedor_pkey1 PRIMARY KEY (id_tipo_proveedor);


--
-- TOC entry 1965 (class 2606 OID 17600)
-- Name: alm_almacen_id_estado; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alm_almacen
    ADD CONSTRAINT alm_almacen_id_estado FOREIGN KEY (id_estado) REFERENCES alm_estado(id_estado);


--
-- TOC entry 1964 (class 2606 OID 17595)
-- Name: alm_almacen_id_tipo_almacen_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alm_almacen
    ADD CONSTRAINT alm_almacen_id_tipo_almacen_fk FOREIGN KEY (id_tipo_almacen) REFERENCES alm_tipo_almacen(id_tipo_almacen);


--
-- TOC entry 1967 (class 2606 OID 17624)
-- Name: alm_item_almacen_id_almacen_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alm_item_almacen
    ADD CONSTRAINT alm_item_almacen_id_almacen_fk FOREIGN KEY (id_almacen) REFERENCES alm_almacen(id_almacen);


--
-- TOC entry 1969 (class 2606 OID 17634)
-- Name: alm_item_almacen_id_estado_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alm_item_almacen
    ADD CONSTRAINT alm_item_almacen_id_estado_fk FOREIGN KEY (id_estado) REFERENCES alm_estado(id_estado);


--
-- TOC entry 1968 (class 2606 OID 17629)
-- Name: alm_item_almacen_id_item_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alm_item_almacen
    ADD CONSTRAINT alm_item_almacen_id_item_fk FOREIGN KEY (id_item) REFERENCES alm_item(id_item);


--
-- TOC entry 1966 (class 2606 OID 17619)
-- Name: alm_item_id_estado_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alm_item
    ADD CONSTRAINT alm_item_id_estado_fk FOREIGN KEY (id_estado) REFERENCES alm_estado(id_estado);


--
-- TOC entry 1963 (class 2606 OID 17668)
-- Name: alm_pedido _detalle_id_estado_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alm_pedido_detalle
    ADD CONSTRAINT "alm_pedido _detalle_id_estado_fk" FOREIGN KEY (id_estado) REFERENCES alm_estado(id_estado);


--
-- TOC entry 1962 (class 2606 OID 17663)
-- Name: alm_pedido_detalle_id_item_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alm_pedido_detalle
    ADD CONSTRAINT alm_pedido_detalle_id_item_fk FOREIGN KEY (id_item) REFERENCES alm_item(id_item);


--
-- TOC entry 1961 (class 2606 OID 17658)
-- Name: alm_pedido_detalle_id_pedido; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alm_pedido_detalle
    ADD CONSTRAINT alm_pedido_detalle_id_pedido FOREIGN KEY (id_pedido) REFERENCES alm_pedido(id_pedido);


--
-- TOC entry 1959 (class 2606 OID 17648)
-- Name: alm_pedido_id_almacen_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alm_pedido
    ADD CONSTRAINT alm_pedido_id_almacen_fk FOREIGN KEY (id_almacen) REFERENCES alm_almacen(id_almacen);


--
-- TOC entry 1960 (class 2606 OID 17653)
-- Name: alm_pedido_id_estado_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alm_pedido
    ADD CONSTRAINT alm_pedido_id_estado_fk FOREIGN KEY (id_estado) REFERENCES alm_estado(id_estado);


--
-- TOC entry 1958 (class 2606 OID 17643)
-- Name: alm_pedido_id_proveedor_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alm_pedido
    ADD CONSTRAINT alm_pedido_id_proveedor_fk FOREIGN KEY (id_proveedor) REFERENCES alm_proveedor(id_proveedor);


--
-- TOC entry 1957 (class 2606 OID 17590)
-- Name: alm_proveedor_id_estado_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alm_proveedor
    ADD CONSTRAINT alm_proveedor_id_estado_fk FOREIGN KEY (id_estado) REFERENCES alm_estado(id_estado);


--
-- TOC entry 1956 (class 2606 OID 17585)
-- Name: alm_proveedor_id_tipo_proveedor_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY alm_proveedor
    ADD CONSTRAINT alm_proveedor_id_tipo_proveedor_fk FOREIGN KEY (id_tipo_proveedor) REFERENCES alm_tipo_proveedor(id_tipo_proveedor);


--
-- TOC entry 2102 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-09-10 15:35:13

--
-- PostgreSQL database dump complete
--

