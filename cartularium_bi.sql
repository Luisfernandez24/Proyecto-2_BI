--
-- PostgreSQL database dump
--

\restrict kcjhWQisnjhX2pQ7qoBo4OnwBTCNlpDE7RbBibpvFJZvw8lBBfpZD62XQeE5CpZ

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-05-25 18:58:23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 17596)
-- Name: cartularium_ops; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA cartularium_ops;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 235 (class 1259 OID 17719)
-- Name: certificado; Type: TABLE; Schema: cartularium_ops; Owner: -
--

CREATE TABLE cartularium_ops.certificado (
    id_certificado integer NOT NULL,
    id_participante integer NOT NULL,
    codigo_certificado character varying(100),
    fecha_emision date,
    fecha_entrega date,
    estado_certificado character varying(50),
    CONSTRAINT chk_certificado_fechas CHECK (((fecha_entrega IS NULL) OR (fecha_emision IS NULL) OR (fecha_entrega >= fecha_emision)))
);


--
-- TOC entry 234 (class 1259 OID 17718)
-- Name: certificado_id_certificado_seq; Type: SEQUENCE; Schema: cartularium_ops; Owner: -
--

CREATE SEQUENCE cartularium_ops.certificado_id_certificado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5123 (class 0 OID 0)
-- Dependencies: 234
-- Name: certificado_id_certificado_seq; Type: SEQUENCE OWNED BY; Schema: cartularium_ops; Owner: -
--

ALTER SEQUENCE cartularium_ops.certificado_id_certificado_seq OWNED BY cartularium_ops.certificado.id_certificado;


--
-- TOC entry 227 (class 1259 OID 17647)
-- Name: cliente; Type: TABLE; Schema: cartularium_ops; Owner: -
--

CREATE TABLE cartularium_ops.cliente (
    id_cliente integer NOT NULL,
    nombre_cliente character varying(250) NOT NULL,
    telefono character varying(50),
    email character varying(150),
    lugar_trabajo character varying(250),
    cargo_puesto character varying(150),
    razon_social character varying(250),
    cedula character varying(50),
    tipo_cliente character varying(30),
    correo_facturacion character varying(150),
    telefono_facturacion character varying(50),
    sugerencia_temas text
);


--
-- TOC entry 226 (class 1259 OID 17646)
-- Name: cliente_id_cliente_seq; Type: SEQUENCE; Schema: cartularium_ops; Owner: -
--

CREATE SEQUENCE cartularium_ops.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5124 (class 0 OID 0)
-- Dependencies: 226
-- Name: cliente_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: cartularium_ops; Owner: -
--

ALTER SEQUENCE cartularium_ops.cliente_id_cliente_seq OWNED BY cartularium_ops.cliente.id_cliente;


--
-- TOC entry 221 (class 1259 OID 17598)
-- Name: curso; Type: TABLE; Schema: cartularium_ops; Owner: -
--

CREATE TABLE cartularium_ops.curso (
    id_curso integer NOT NULL,
    nombre_curso character varying(250) NOT NULL,
    descripcion text,
    area_tematica character varying(120),
    activo boolean DEFAULT true
);


--
-- TOC entry 220 (class 1259 OID 17597)
-- Name: curso_id_curso_seq; Type: SEQUENCE; Schema: cartularium_ops; Owner: -
--

CREATE SEQUENCE cartularium_ops.curso_id_curso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5125 (class 0 OID 0)
-- Dependencies: 220
-- Name: curso_id_curso_seq; Type: SEQUENCE OWNED BY; Schema: cartularium_ops; Owner: -
--

ALTER SEQUENCE cartularium_ops.curso_id_curso_seq OWNED BY cartularium_ops.curso.id_curso;


--
-- TOC entry 225 (class 1259 OID 17624)
-- Name: edicion_curso; Type: TABLE; Schema: cartularium_ops; Owner: -
--

CREATE TABLE cartularium_ops.edicion_curso (
    id_edicion integer NOT NULL,
    id_curso integer NOT NULL,
    id_expositor integer,
    fecha_inicio date,
    fecha_fin date,
    modalidad character varying(50),
    lugar character varying(150),
    precio_base numeric(10,2),
    cupo_maximo integer,
    estado_edicion character varying(50) DEFAULT 'Programado'::character varying,
    hora_inicio time without time zone,
    hora_fin time without time zone,
    CONSTRAINT chk_edicion_cupo_maximo CHECK (((cupo_maximo IS NULL) OR (cupo_maximo >= 0))),
    CONSTRAINT chk_edicion_fechas CHECK (((fecha_fin IS NULL) OR (fecha_inicio IS NULL) OR (fecha_fin >= fecha_inicio))),
    CONSTRAINT chk_edicion_precio_base CHECK (((precio_base IS NULL) OR (precio_base >= (0)::numeric)))
);


--
-- TOC entry 224 (class 1259 OID 17623)
-- Name: edicion_curso_id_edicion_seq; Type: SEQUENCE; Schema: cartularium_ops; Owner: -
--

CREATE SEQUENCE cartularium_ops.edicion_curso_id_edicion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5126 (class 0 OID 0)
-- Dependencies: 224
-- Name: edicion_curso_id_edicion_seq; Type: SEQUENCE OWNED BY; Schema: cartularium_ops; Owner: -
--

ALTER SEQUENCE cartularium_ops.edicion_curso_id_edicion_seq OWNED BY cartularium_ops.edicion_curso.id_edicion;


--
-- TOC entry 223 (class 1259 OID 17612)
-- Name: expositor; Type: TABLE; Schema: cartularium_ops; Owner: -
--

CREATE TABLE cartularium_ops.expositor (
    id_expositor integer NOT NULL,
    nombre_expositor character varying(250) NOT NULL,
    especialidad character varying(150),
    telefono character varying(50),
    email character varying(150),
    activo boolean DEFAULT true
);


--
-- TOC entry 222 (class 1259 OID 17611)
-- Name: expositor_id_expositor_seq; Type: SEQUENCE; Schema: cartularium_ops; Owner: -
--

CREATE SEQUENCE cartularium_ops.expositor_id_expositor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5127 (class 0 OID 0)
-- Dependencies: 222
-- Name: expositor_id_expositor_seq; Type: SEQUENCE OWNED BY; Schema: cartularium_ops; Owner: -
--

ALTER SEQUENCE cartularium_ops.expositor_id_expositor_seq OWNED BY cartularium_ops.expositor.id_expositor;


--
-- TOC entry 231 (class 1259 OID 17682)
-- Name: factura; Type: TABLE; Schema: cartularium_ops; Owner: -
--

CREATE TABLE cartularium_ops.factura (
    id_factura integer NOT NULL,
    id_participante integer NOT NULL,
    numero_factura character varying(100),
    fecha_factura date,
    subtotal numeric(10,2),
    descuento numeric(10,2) DEFAULT 0,
    impuesto numeric(10,2) DEFAULT 0,
    total_factura numeric(10,2),
    estado_factura character varying(50),
    CONSTRAINT chk_factura_descuento CHECK (((descuento IS NULL) OR (descuento >= (0)::numeric))),
    CONSTRAINT chk_factura_impuesto CHECK (((impuesto IS NULL) OR (impuesto >= (0)::numeric))),
    CONSTRAINT chk_factura_subtotal CHECK (((subtotal IS NULL) OR (subtotal >= (0)::numeric))),
    CONSTRAINT chk_factura_total CHECK (((total_factura IS NULL) OR (total_factura >= (0)::numeric)))
);


--
-- TOC entry 230 (class 1259 OID 17681)
-- Name: factura_id_factura_seq; Type: SEQUENCE; Schema: cartularium_ops; Owner: -
--

CREATE SEQUENCE cartularium_ops.factura_id_factura_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5128 (class 0 OID 0)
-- Dependencies: 230
-- Name: factura_id_factura_seq; Type: SEQUENCE OWNED BY; Schema: cartularium_ops; Owner: -
--

ALTER SEQUENCE cartularium_ops.factura_id_factura_seq OWNED BY cartularium_ops.factura.id_factura;


--
-- TOC entry 233 (class 1259 OID 17704)
-- Name: pago; Type: TABLE; Schema: cartularium_ops; Owner: -
--

CREATE TABLE cartularium_ops.pago (
    id_pago integer NOT NULL,
    id_factura integer NOT NULL,
    metodo_pago character varying(80),
    monto_pagado numeric(10,2),
    numero_comprobante character varying(100),
    fecha_pago date,
    estado_pago character varying(50),
    CONSTRAINT chk_pago_monto CHECK (((monto_pagado IS NULL) OR (monto_pagado >= (0)::numeric)))
);


--
-- TOC entry 232 (class 1259 OID 17703)
-- Name: pago_id_pago_seq; Type: SEQUENCE; Schema: cartularium_ops; Owner: -
--

CREATE SEQUENCE cartularium_ops.pago_id_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5129 (class 0 OID 0)
-- Dependencies: 232
-- Name: pago_id_pago_seq; Type: SEQUENCE OWNED BY; Schema: cartularium_ops; Owner: -
--

ALTER SEQUENCE cartularium_ops.pago_id_pago_seq OWNED BY cartularium_ops.pago.id_pago;


--
-- TOC entry 229 (class 1259 OID 17658)
-- Name: participante; Type: TABLE; Schema: cartularium_ops; Owner: -
--

CREATE TABLE cartularium_ops.participante (
    id_participante integer NOT NULL,
    id_cliente integer NOT NULL,
    id_edicion integer NOT NULL,
    nombre_certificado character varying(250) NOT NULL,
    fecha_inscripcion date,
    estado_inscripcion character varying(80),
    asistio boolean,
    estado_asistencia character varying(50),
    precio_aplicado numeric(10,2),
    CONSTRAINT chk_participante_precio_aplicado CHECK (((precio_aplicado IS NULL) OR (precio_aplicado >= (0)::numeric)))
);


--
-- TOC entry 228 (class 1259 OID 17657)
-- Name: participante_id_participante_seq; Type: SEQUENCE; Schema: cartularium_ops; Owner: -
--

CREATE SEQUENCE cartularium_ops.participante_id_participante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 5130 (class 0 OID 0)
-- Dependencies: 228
-- Name: participante_id_participante_seq; Type: SEQUENCE OWNED BY; Schema: cartularium_ops; Owner: -
--

ALTER SEQUENCE cartularium_ops.participante_id_participante_seq OWNED BY cartularium_ops.participante.id_participante;


--
-- TOC entry 4904 (class 2604 OID 17722)
-- Name: certificado id_certificado; Type: DEFAULT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.certificado ALTER COLUMN id_certificado SET DEFAULT nextval('cartularium_ops.certificado_id_certificado_seq'::regclass);


--
-- TOC entry 4898 (class 2604 OID 17650)
-- Name: cliente id_cliente; Type: DEFAULT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('cartularium_ops.cliente_id_cliente_seq'::regclass);


--
-- TOC entry 4892 (class 2604 OID 17601)
-- Name: curso id_curso; Type: DEFAULT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.curso ALTER COLUMN id_curso SET DEFAULT nextval('cartularium_ops.curso_id_curso_seq'::regclass);


--
-- TOC entry 4896 (class 2604 OID 17627)
-- Name: edicion_curso id_edicion; Type: DEFAULT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.edicion_curso ALTER COLUMN id_edicion SET DEFAULT nextval('cartularium_ops.edicion_curso_id_edicion_seq'::regclass);


--
-- TOC entry 4894 (class 2604 OID 17615)
-- Name: expositor id_expositor; Type: DEFAULT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.expositor ALTER COLUMN id_expositor SET DEFAULT nextval('cartularium_ops.expositor_id_expositor_seq'::regclass);


--
-- TOC entry 4900 (class 2604 OID 17685)
-- Name: factura id_factura; Type: DEFAULT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.factura ALTER COLUMN id_factura SET DEFAULT nextval('cartularium_ops.factura_id_factura_seq'::regclass);


--
-- TOC entry 4903 (class 2604 OID 17707)
-- Name: pago id_pago; Type: DEFAULT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.pago ALTER COLUMN id_pago SET DEFAULT nextval('cartularium_ops.pago_id_pago_seq'::regclass);


--
-- TOC entry 4899 (class 2604 OID 17661)
-- Name: participante id_participante; Type: DEFAULT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.participante ALTER COLUMN id_participante SET DEFAULT nextval('cartularium_ops.participante_id_participante_seq'::regclass);


--
-- TOC entry 5117 (class 0 OID 17719)
-- Dependencies: 235
-- Data for Name: certificado; Type: TABLE DATA; Schema: cartularium_ops; Owner: -
--

INSERT INTO cartularium_ops.certificado VALUES (1, 1, 'CERT-2025-C001-001', '2025-03-25', '2025-03-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (2, 2, 'CERT-2025-C001-002', '2025-03-25', '2025-03-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (3, 3, 'CERT-2025-C001-003', '2025-03-25', '2025-03-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (4, 4, 'CERT-2025-C001-004', '2025-03-25', '2025-03-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (5, 5, 'CERT-2025-C001-005', '2025-03-25', '2025-03-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (6, 6, 'CERT-2025-C001-006', '2025-03-25', '2025-03-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (7, 7, 'CERT-2025-C001-007', '2025-03-25', '2025-03-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (8, 8, 'CERT-2025-C001-008', '2025-03-25', '2025-03-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (9, 9, 'CERT-2025-C001-009', '2025-03-25', '2025-03-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (10, 10, 'CERT-2025-C001-010', '2025-03-25', '2025-03-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (11, 11, 'CERT-2025-C001-011', '2025-03-25', '2025-03-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (12, 12, 'CERT-2025-C001-012', '2025-03-25', '2025-03-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (13, 13, 'CERT-2025-C001-013', '2025-03-25', '2025-03-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (14, 14, 'CERT-2025-C001-014', '2025-03-25', '2025-03-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (15, 15, 'CERT-2025-C001-015', '2025-03-25', '2025-03-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (16, 16, 'CERT-2025-C001-016', '2025-03-25', '2025-03-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (17, 17, 'CERT-2025-C001-017', '2025-03-25', '2025-03-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (18, 18, 'CERT-2025-C001-018', '2025-03-25', '2025-03-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (19, 19, 'CERT-2025-C001-019', '2025-03-25', '2025-03-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (20, 20, 'CERT-2025-C001-020', '2025-03-25', '2025-03-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (21, 21, 'CERT-2025-C001-021', '2025-03-25', '2025-03-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (22, 22, 'CERT-2025-C001-022', '2025-03-25', NULL, 'Emitido');
INSERT INTO cartularium_ops.certificado VALUES (23, 23, 'CERT-2025-C002-001', '2025-04-29', '2025-04-30', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (24, 24, 'CERT-2025-C002-002', '2025-04-29', '2025-04-30', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (25, 25, 'CERT-2025-C002-003', '2025-04-29', '2025-04-30', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (26, 26, 'CERT-2025-C002-004', '2025-04-29', '2025-04-30', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (27, 27, 'CERT-2025-C002-005', '2025-04-29', '2025-04-30', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (28, 28, 'CERT-2025-C002-006', '2025-04-29', '2025-04-30', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (29, 29, 'CERT-2025-C002-007', '2025-04-29', '2025-04-30', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (30, 30, 'CERT-2025-C002-008', '2025-04-29', '2025-04-30', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (31, 31, 'CERT-2025-C002-009', '2025-04-29', '2025-04-30', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (32, 32, 'CERT-2025-C002-010', '2025-04-29', '2025-04-30', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (33, 33, 'CERT-2025-C002-011', '2025-04-29', '2025-04-30', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (34, 34, 'CERT-2025-C002-012', '2025-04-29', '2025-04-30', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (35, 35, 'CERT-2025-C002-013', '2025-04-29', '2025-04-30', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (36, 36, 'CERT-2025-C002-014', '2025-04-29', '2025-04-30', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (37, 37, 'CERT-2025-C002-015', '2025-04-29', '2025-04-30', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (38, 38, 'CERT-2025-C002-016', '2025-04-29', '2025-04-30', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (39, 39, 'CERT-2025-C002-017', '2025-04-29', '2025-04-30', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (40, 40, 'CERT-2025-C002-018', '2025-04-29', '2025-04-30', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (41, 41, 'CERT-2025-C002-019', '2025-04-29', '2025-04-30', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (42, 42, 'CERT-2025-C002-020', '2025-04-29', '2025-04-30', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (43, 43, 'CERT-2025-C002-021', '2025-04-29', '2025-04-30', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (44, 44, 'CERT-2025-C002-022', '2025-04-29', '2025-04-30', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (45, 45, 'CERT-2025-C002-023', '2025-04-29', '2025-04-30', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (46, 46, 'CERT-2025-C003-001', '2025-05-13', '2025-05-14', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (47, 47, 'CERT-2025-C003-002', '2025-05-13', '2025-05-14', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (48, 48, 'CERT-2025-C003-003', '2025-05-13', '2025-05-14', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (49, 49, 'CERT-2025-C003-004', '2025-05-13', '2025-05-14', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (50, 50, 'CERT-2025-C003-005', '2025-05-13', '2025-05-14', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (51, 51, 'CERT-2025-C003-006', '2025-05-13', '2025-05-14', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (52, 52, 'CERT-2025-C003-007', '2025-05-13', '2025-05-14', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (53, 53, 'CERT-2025-C003-008', '2025-05-13', '2025-05-14', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (54, 54, 'CERT-2025-C003-009', '2025-05-13', '2025-05-14', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (55, 55, 'CERT-2025-C003-010', '2025-05-13', '2025-05-14', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (56, 56, 'CERT-2025-C003-011', '2025-05-13', '2025-05-14', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (57, 57, 'CERT-2025-C003-012', '2025-05-13', '2025-05-14', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (58, 58, 'CERT-2025-C003-013', '2025-05-13', '2025-05-14', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (59, 59, 'CERT-2025-C003-014', '2025-05-13', '2025-05-14', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (60, 60, 'CERT-2025-C003-015', '2025-05-13', '2025-05-14', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (61, 61, 'CERT-2025-C003-016', '2025-05-13', '2025-05-14', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (62, 62, 'CERT-2025-C003-017', '2025-05-13', '2025-05-14', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (63, 63, 'CERT-2025-C003-018', '2025-05-13', '2025-05-14', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (64, 64, 'CERT-2025-C003-019', '2025-05-13', '2025-05-14', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (65, 65, 'CERT-2025-C004-001', '2025-05-22', '2025-05-23', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (66, 66, 'CERT-2025-C004-002', '2025-05-22', '2025-05-23', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (67, 67, 'CERT-2025-C004-003', '2025-05-22', '2025-05-23', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (68, 68, 'CERT-2025-C004-004', '2025-05-22', '2025-05-23', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (69, 69, 'CERT-2025-C004-005', '2025-05-22', '2025-05-23', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (70, 70, 'CERT-2025-C004-006', '2025-05-22', '2025-05-23', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (71, 71, 'CERT-2025-C004-007', '2025-05-22', '2025-05-23', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (72, 72, 'CERT-2025-C004-008', '2025-05-22', '2025-05-23', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (73, 73, 'CERT-2025-C004-009', '2025-05-22', '2025-05-23', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (74, 74, 'CERT-2025-C004-010', '2025-05-22', '2025-05-23', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (75, 75, 'CERT-2025-C004-011', '2025-05-22', '2025-05-23', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (76, 76, 'CERT-2025-C004-012', '2025-05-22', '2025-05-23', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (77, 77, 'CERT-2025-C004-013', '2025-05-22', '2025-05-23', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (78, 78, 'CERT-2025-C004-014', '2025-05-22', '2025-05-23', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (79, 79, 'CERT-2025-C004-015', '2025-05-22', '2025-05-23', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (80, 80, 'CERT-2025-C004-016', '2025-05-22', '2025-05-23', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (81, 81, 'CERT-2025-C004-017', '2025-05-22', '2025-05-23', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (82, 82, 'CERT-2025-C004-018', '2025-05-22', '2025-05-23', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (83, 83, 'CERT-2025-C004-019', '2025-05-22', '2025-05-23', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (84, 84, 'CERT-2025-C004-020', '2025-05-22', '2025-05-23', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (85, 85, 'CERT-2025-C004-021', '2025-05-22', '2025-05-23', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (86, 86, 'CERT-2025-C004-022', '2025-05-22', '2025-05-23', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (87, 87, 'CERT-2025-C004-023', '2025-05-22', NULL, 'Emitido');
INSERT INTO cartularium_ops.certificado VALUES (88, 88, 'CERT-2025-C004-024', '2025-05-22', NULL, 'Emitido');
INSERT INTO cartularium_ops.certificado VALUES (89, 89, 'CERT-2025-C005-001', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (90, 90, 'CERT-2025-C005-002', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (91, 91, 'CERT-2025-C005-003', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (92, 92, 'CERT-2025-C005-004', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (93, 93, 'CERT-2025-C005-005', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (94, 94, 'CERT-2025-C005-006', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (95, 95, 'CERT-2025-C005-007', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (96, 96, 'CERT-2025-C005-008', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (97, 97, 'CERT-2025-C005-009', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (98, 98, 'CERT-2025-C005-010', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (99, 99, 'CERT-2025-C005-011', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (100, 100, 'CERT-2025-C005-012', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (101, 101, 'CERT-2025-C005-013', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (102, 102, 'CERT-2025-C005-014', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (103, 103, 'CERT-2025-C005-015', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (104, 104, 'CERT-2025-C005-016', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (105, 105, 'CERT-2025-C005-017', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (106, 106, 'CERT-2025-C005-018', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (107, 107, 'CERT-2025-C005-019', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (108, 108, 'CERT-2025-C005-020', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (109, 109, 'CERT-2025-C005-021', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (110, 110, 'CERT-2025-C005-022', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (111, 111, 'CERT-2025-C005-023', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (112, 112, 'CERT-2025-C005-024', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (113, 113, 'CERT-2025-C005-025', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (114, 114, 'CERT-2025-C005-026', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (115, 115, 'CERT-2025-C005-027', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (116, 116, 'CERT-2025-C005-028', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (117, 117, 'CERT-2025-C005-029', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (118, 118, 'CERT-2025-C005-030', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (119, 119, 'CERT-2025-C005-031', '2025-05-27', '2025-05-28', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (120, 120, 'CERT-2025-C005-032', '2025-05-27', NULL, 'Emitido');
INSERT INTO cartularium_ops.certificado VALUES (121, 121, 'CERT-2025-C005-033', '2025-05-27', NULL, 'Emitido');
INSERT INTO cartularium_ops.certificado VALUES (122, 122, 'CERT-2025-C005-034', '2025-05-27', NULL, 'Emitido');
INSERT INTO cartularium_ops.certificado VALUES (123, 123, 'CERT-2025-C006-001', '2025-06-10', '2025-06-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (124, 124, 'CERT-2025-C006-002', '2025-06-10', '2025-06-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (125, 125, 'CERT-2025-C006-003', '2025-06-10', '2025-06-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (126, 126, 'CERT-2025-C006-004', '2025-06-10', '2025-06-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (127, 127, 'CERT-2025-C006-005', '2025-06-10', '2025-06-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (128, 128, 'CERT-2025-C006-006', '2025-06-10', '2025-06-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (129, 129, 'CERT-2025-C006-007', '2025-06-10', '2025-06-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (130, 130, 'CERT-2025-C006-008', '2025-06-10', '2025-06-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (131, 131, 'CERT-2025-C006-009', '2025-06-10', '2025-06-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (132, 132, 'CERT-2025-C006-010', '2025-06-10', '2025-06-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (133, 133, 'CERT-2025-C006-011', '2025-06-10', '2025-06-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (134, 134, 'CERT-2025-C006-012', '2025-06-10', '2025-06-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (135, 135, 'CERT-2025-C006-013', '2025-06-10', '2025-06-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (136, 136, 'CERT-2025-C006-014', '2025-06-10', '2025-06-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (137, 137, 'CERT-2025-C006-015', '2025-06-10', '2025-06-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (138, 138, 'CERT-2025-C006-016', '2025-06-10', '2025-06-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (139, 139, 'CERT-2025-C006-017', '2025-06-10', '2025-06-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (140, 140, 'CERT-2025-C006-018', '2025-06-10', '2025-06-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (141, 141, 'CERT-2025-C006-019', '2025-06-10', '2025-06-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (142, 142, 'CERT-2025-C006-020', '2025-06-10', '2025-06-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (143, 143, 'CERT-2025-C006-021', '2025-06-10', '2025-06-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (144, 144, 'CERT-2025-C006-022', '2025-06-10', '2025-06-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (145, 145, 'CERT-2025-C006-023', '2025-06-10', '2025-06-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (146, 146, 'CERT-2025-C006-024', '2025-06-10', NULL, 'Emitido');
INSERT INTO cartularium_ops.certificado VALUES (147, 147, 'CERT-2025-C006-025', '2025-06-10', NULL, 'Emitido');
INSERT INTO cartularium_ops.certificado VALUES (148, 148, 'CERT-2025-C006-026', '2025-06-10', NULL, 'Emitido');
INSERT INTO cartularium_ops.certificado VALUES (149, 149, 'CERT-2025-C006-027', '2025-06-10', NULL, 'Emitido');
INSERT INTO cartularium_ops.certificado VALUES (150, 150, 'CERT-2025-C007-001', '2025-06-19', '2025-06-20', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (151, 151, 'CERT-2025-C007-002', '2025-06-19', '2025-06-20', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (152, 152, 'CERT-2025-C007-003', '2025-06-19', '2025-06-20', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (153, 153, 'CERT-2025-C007-004', '2025-06-19', '2025-06-20', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (154, 154, 'CERT-2025-C007-005', '2025-06-19', '2025-06-20', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (155, 155, 'CERT-2025-C007-006', '2025-06-19', '2025-06-20', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (156, 156, 'CERT-2025-C007-007', '2025-06-19', '2025-06-20', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (157, 157, 'CERT-2025-C007-008', '2025-06-19', '2025-06-20', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (158, 158, 'CERT-2025-C008-001', '2025-06-25', '2025-06-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (159, 159, 'CERT-2025-C008-002', '2025-06-25', '2025-06-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (160, 160, 'CERT-2025-C008-003', '2025-06-25', '2025-06-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (161, 161, 'CERT-2025-C008-004', '2025-06-25', '2025-06-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (162, 162, 'CERT-2025-C008-005', '2025-06-25', '2025-06-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (163, 163, 'CERT-2025-C008-006', '2025-06-25', '2025-06-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (164, 164, 'CERT-2025-C008-007', '2025-06-25', '2025-06-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (165, 165, 'CERT-2025-C008-008', '2025-06-25', '2025-06-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (166, 166, 'CERT-2025-C008-009', '2025-06-25', '2025-06-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (167, 167, 'CERT-2025-C008-010', '2025-06-25', '2025-06-26', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (168, 168, 'CERT-2025-C009-001', '2025-07-10', '2025-07-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (169, 169, 'CERT-2025-C009-002', '2025-07-10', '2025-07-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (170, 170, 'CERT-2025-C009-003', '2025-07-10', '2025-07-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (171, 171, 'CERT-2025-C009-004', '2025-07-10', '2025-07-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (172, 172, 'CERT-2025-C009-005', '2025-07-10', '2025-07-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (173, 173, 'CERT-2025-C009-006', '2025-07-10', '2025-07-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (174, 174, 'CERT-2025-C009-007', '2025-07-10', '2025-07-11', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (175, 175, 'CERT-2025-C010A-001', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (176, 176, 'CERT-2025-C010A-002', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (177, 177, 'CERT-2025-C010A-003', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (178, 178, 'CERT-2025-C010A-004', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (179, 179, 'CERT-2025-C010A-005', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (180, 180, 'CERT-2025-C010A-006', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (181, 181, 'CERT-2025-C010A-007', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (182, 182, 'CERT-2025-C010A-008', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (183, 183, 'CERT-2025-C010A-009', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (184, 184, 'CERT-2025-C010A-010', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (185, 185, 'CERT-2025-C010A-011', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (186, 186, 'CERT-2025-C010A-012', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (187, 187, 'CERT-2025-C010A-013', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (188, 188, 'CERT-2025-C010A-014', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (189, 189, 'CERT-2025-C010A-015', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (190, 190, 'CERT-2025-C010A-016', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (191, 191, 'CERT-2025-C010A-017', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (192, 192, 'CERT-2025-C010A-018', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (193, 193, 'CERT-2025-C010A-019', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (194, 194, 'CERT-2025-C010A-020', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (195, 195, 'CERT-2025-C010A-021', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (196, 196, 'CERT-2025-C010A-022', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (197, 197, 'CERT-2025-C010A-023', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (198, 198, 'CERT-2025-C010A-024', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (199, 199, 'CERT-2025-C010A-025', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (200, 200, 'CERT-2025-C010A-026', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (201, 201, 'CERT-2025-C010A-027', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (202, 202, 'CERT-2025-C010A-028', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (203, 203, 'CERT-2025-C010A-029', '2025-09-16', '2025-09-17', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (204, 204, 'CERT-2025-C010A-030', '2025-09-16', NULL, 'Emitido');
INSERT INTO cartularium_ops.certificado VALUES (205, 205, 'CERT-2025-C010A-031', '2025-09-16', NULL, 'Emitido');
INSERT INTO cartularium_ops.certificado VALUES (206, 206, 'CERT-2025-C010B-001', '2025-09-23', '2025-09-24', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (207, 207, 'CERT-2025-C010B-002', '2025-09-23', '2025-09-24', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (208, 208, 'CERT-2025-C010B-003', '2025-09-23', '2025-09-24', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (209, 209, 'CERT-2025-C010B-004', '2025-09-23', '2025-09-24', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (210, 210, 'CERT-2025-C010B-005', '2025-09-23', '2025-09-24', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (211, 211, 'CERT-2025-C010B-006', '2025-09-23', '2025-09-24', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (212, 212, 'CERT-2025-C010B-007', '2025-09-23', '2025-09-24', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (213, 213, 'CERT-2025-C010B-008', '2025-09-23', '2025-09-24', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (214, 214, 'CERT-2025-C010B-009', '2025-09-23', '2025-09-24', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (215, 215, 'CERT-2025-C010B-010', '2025-09-23', '2025-09-24', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (216, 216, 'CERT-2025-C010B-011', '2025-09-23', '2025-09-24', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (217, 217, 'CERT-2025-C010B-012', '2025-09-23', '2025-09-24', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (218, 218, 'CERT-2025-C010B-013', '2025-09-23', '2025-09-24', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (219, 219, 'CERT-2025-C010B-014', '2025-09-23', '2025-09-24', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (220, 220, 'CERT-2025-C010B-015', '2025-09-23', '2025-09-24', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (221, 221, 'CERT-2025-C010B-016', '2025-09-23', '2025-09-24', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (222, 222, 'CERT-2025-C010B-017', '2025-09-23', '2025-09-24', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (223, 223, 'CERT-2025-C010B-018', '2025-09-23', '2025-09-24', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (224, 224, 'CERT-2025-C010B-019', '2025-09-23', '2025-09-24', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (225, 225, 'CERT-2025-C010B-020', '2025-09-23', '2025-09-24', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (226, 226, 'CERT-2025-C010B-021', '2025-09-23', '2025-09-24', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (227, 227, 'CERT-2025-C010B-022', '2025-09-23', NULL, 'Emitido');
INSERT INTO cartularium_ops.certificado VALUES (228, 228, 'CERT-2025-C010B-023', '2025-09-23', NULL, 'Emitido');
INSERT INTO cartularium_ops.certificado VALUES (229, 229, 'CERT-2025-C010B-024', '2025-09-23', NULL, 'Emitido');
INSERT INTO cartularium_ops.certificado VALUES (230, 230, 'CERT-2025-C010B-025', '2025-09-23', NULL, 'Emitido');
INSERT INTO cartularium_ops.certificado VALUES (231, 231, 'CERT-2025-C010B-026', '2025-09-23', NULL, 'Emitido');
INSERT INTO cartularium_ops.certificado VALUES (232, 232, 'CERT-2025-C010B-027', '2025-09-23', NULL, 'Emitido');
INSERT INTO cartularium_ops.certificado VALUES (233, 233, 'CERT-2025-C010B-028', '2025-09-23', NULL, 'Emitido');
INSERT INTO cartularium_ops.certificado VALUES (234, 234, 'CERT-2025-C010B-029', '2025-09-23', NULL, 'Emitido');
INSERT INTO cartularium_ops.certificado VALUES (235, 235, 'CERT-2025-C010B-030', '2025-09-23', NULL, 'Emitido');
INSERT INTO cartularium_ops.certificado VALUES (236, 236, 'CERT-2025-C010B-031', '2025-09-23', NULL, 'Emitido');
INSERT INTO cartularium_ops.certificado VALUES (237, 262, 'CERT-2025-C011-001', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (238, 263, 'CERT-2025-C011-002', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (239, 264, 'CERT-2025-C011-003', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (240, 265, 'CERT-2025-C011-004', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (241, 266, 'CERT-2025-C011-005', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (242, 267, 'CERT-2025-C011-006', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (243, 268, 'CERT-2025-C011-007', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (244, 269, 'CERT-2025-C011-008', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (245, 270, 'CERT-2025-C011-009', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (246, 271, 'CERT-2025-C011-010', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (247, 272, 'CERT-2025-C011-011', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (248, 273, 'CERT-2025-C011-012', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (249, 274, 'CERT-2025-C011-013', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (250, 275, 'CERT-2025-C011-014', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (251, 276, 'CERT-2025-C011-015', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (252, 277, 'CERT-2025-C011-016', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (253, 278, 'CERT-2025-C011-017', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (254, 279, 'CERT-2025-C011-018', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (255, 280, 'CERT-2025-C011-019', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (256, 281, 'CERT-2025-C011-020', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (257, 282, 'CERT-2025-C011-021', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (258, 283, 'CERT-2025-C011-022', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (259, 284, 'CERT-2025-C011-023', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (260, 285, 'CERT-2025-C011-024', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (261, 286, 'CERT-2025-C011-025', '2025-10-21', '2025-10-22', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (262, 317, 'CERT-2025-C012-001', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (263, 318, 'CERT-2025-C012-002', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (264, 319, 'CERT-2025-C012-003', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (265, 320, 'CERT-2025-C012-004', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (266, 321, 'CERT-2025-C012-005', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (267, 322, 'CERT-2025-C012-006', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (268, 323, 'CERT-2025-C012-007', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (269, 324, 'CERT-2025-C012-008', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (270, 325, 'CERT-2025-C012-009', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (271, 326, 'CERT-2025-C012-010', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (272, 327, 'CERT-2025-C012-011', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (273, 328, 'CERT-2025-C012-012', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (274, 329, 'CERT-2025-C012-013', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (275, 330, 'CERT-2025-C012-014', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (276, 331, 'CERT-2025-C012-015', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (277, 332, 'CERT-2025-C012-016', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (278, 333, 'CERT-2025-C012-017', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (279, 334, 'CERT-2025-C012-018', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (280, 335, 'CERT-2025-C012-019', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (281, 336, 'CERT-2025-C012-020', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (282, 337, 'CERT-2025-C012-021', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (283, 338, 'CERT-2025-C012-022', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (284, 339, 'CERT-2025-C012-023', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (285, 340, 'CERT-2025-C012-024', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (286, 341, 'CERT-2025-C012-025', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (287, 342, 'CERT-2025-C012-026', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (288, 343, 'CERT-2025-C012-027', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (289, 344, 'CERT-2025-C012-028', '2025-11-11', '2025-11-12', 'Entregado');
INSERT INTO cartularium_ops.certificado VALUES (290, 345, 'CERT-2025-C012-029', '2025-11-11', NULL, 'Emitido');
INSERT INTO cartularium_ops.certificado VALUES (291, 346, 'CERT-2025-C012-030', '2025-11-11', NULL, 'Emitido');


--
-- TOC entry 5109 (class 0 OID 17647)
-- Dependencies: 227
-- Data for Name: cliente; Type: TABLE DATA; Schema: cartularium_ops; Owner: -
--

INSERT INTO cartularium_ops.cliente VALUES (1, 'María Fernanda Calderón Rojas', '8834-1276', 'maria.calderon@example.invalid', 'Bufete Calderón & Asociados', 'Abogada litigante', 'María Fernanda Calderón Rojas', '1-1456-0789', 'FISICA', 'maria.calderon@example.invalid', '8834-1276', 'Remates judiciales');
INSERT INTO cartularium_ops.cliente VALUES (2, 'José Pablo Araya Méndez', '8721-4390', 'jose.araya@example.invalid', 'Araya Consultores Legales', 'Abogado', 'José Pablo Araya Méndez', '1-1189-0456', 'FISICA', 'jose.araya@example.invalid', '8721-4390', 'Cobro judicial');
INSERT INTO cartularium_ops.cliente VALUES (3, 'Daniela Valverde Soto', '8990-2145', 'daniela.valverde@example.invalid', 'Notaría Valverde', 'Notaria pública', 'Daniela Valverde Soto', '2-0634-0987', 'FISICA', 'daniela.valverde@example.invalid', '8990-2145', 'Derecho notarial');
INSERT INTO cartularium_ops.cliente VALUES (4, 'Luis Diego Ramírez Castro', '8356-7781', 'luis.ramirez@example.invalid', 'Ramírez & Castro Abogados', 'Socio abogado', 'Ramírez & Castro Abogados S.A.', '3-101-778899', 'JURIDICA', 'facturacion.ramirezcastro@example.invalid', '8356-7781', 'Procesos de ejecución');
INSERT INTO cartularium_ops.cliente VALUES (5, 'Adriana Chaves Mora', '8704-5523', 'adriana.chaves@example.invalid', 'Chaves Mora Servicios Jurídicos', 'Abogada independiente', 'Adriana Chaves Mora', '1-1287-0345', 'FISICA', 'adriana.chaves@example.invalid', '8704-5523', 'Pacto comisorio');
INSERT INTO cartularium_ops.cliente VALUES (6, 'Carlos Andrés Brenes Vargas', '8412-6009', 'carlos.brenes@example.invalid', 'Consultoría Jurídica Brenes', 'Asesor legal', 'Carlos Andrés Brenes Vargas', '1-1567-0912', 'FISICA', 'carlos.brenes@example.invalid', '8412-6009', 'Cobro judicial');
INSERT INTO cartularium_ops.cliente VALUES (7, 'Sofía Jiménez Aguilar', '8822-3150', 'sofia.jimenez@example.invalid', 'Jiménez Aguilar Legal', 'Abogada junior', 'Sofía Jiménez Aguilar', '1-1734-0654', 'FISICA', 'sofia.jimenez@example.invalid', '8822-3150', 'Derecho registral');
INSERT INTO cartularium_ops.cliente VALUES (8, 'Esteban Morales Quesada', '8987-4412', 'esteban.morales@example.invalid', 'Morales Quesada Abogados', 'Abogado litigante', 'Morales Quesada Abogados S.R.L.', '3-102-445566', 'JURIDICA', 'facturas.morales@example.invalid', '8987-4412', 'Remates judiciales');
INSERT INTO cartularium_ops.cliente VALUES (9, 'Natalia Cordero Fernández', '8567-9021', 'natalia.cordero@example.invalid', 'Cordero Fernández Consultores', 'Abogada', 'Natalia Cordero Fernández', '2-0765-0123', 'FISICA', 'natalia.cordero@example.invalid', '8567-9021', 'Notificaciones judiciales');
INSERT INTO cartularium_ops.cliente VALUES (10, 'Andrés Gutiérrez Salazar', '8811-7643', 'andres.gutierrez@example.invalid', 'Bufete Gutiérrez Legal', 'Abogado', 'Andrés Gutiérrez Salazar', '1-1998-0543', 'FISICA', 'andres.gutierrez@example.invalid', '8811-7643', 'Cobro judicial');
INSERT INTO cartularium_ops.cliente VALUES (11, 'Paola Vargas Montero', '8799-4388', 'paola.vargas@example.invalid', 'Vargas Montero Abogados', 'Abogada', 'Paola Vargas Montero', '1-1605-0881', 'FISICA', 'paola.vargas@example.invalid', '8799-4388', 'Derecho sucesorio');
INSERT INTO cartularium_ops.cliente VALUES (12, 'Ricardo Solano Alfaro', '8450-2219', 'ricardo.solano@example.invalid', 'Solano Alfaro Consultores', 'Asesor jurídico', 'Ricardo Solano Alfaro', '1-1220-0764', 'FISICA', 'ricardo.solano@example.invalid', '8450-2219', 'Procesos cobratorios');
INSERT INTO cartularium_ops.cliente VALUES (13, 'Laura Méndez Herrera', '8901-6642', 'laura.mendez@example.invalid', 'Méndez Herrera Legal', 'Notaria pública', 'Laura Méndez Herrera', '1-1876-0451', 'FISICA', 'laura.mendez@example.invalid', '8901-6642', 'Derecho notarial');
INSERT INTO cartularium_ops.cliente VALUES (14, 'Fernando Acuña Rojas', '8324-1187', 'fernando.acuna@example.invalid', 'Acuña Rojas Abogados', 'Abogado litigante', 'Acuña Rojas Abogados S.A.', '3-101-334455', 'JURIDICA', 'facturacion.acuna@example.invalid', '8324-1187', 'Ejecución hipotecaria');
INSERT INTO cartularium_ops.cliente VALUES (15, 'Gabriela León Campos', '8845-7709', 'gabriela.leon@example.invalid', 'León Campos Consultoría Legal', 'Abogada', 'Gabriela León Campos', '1-1432-0998', 'FISICA', 'gabriela.leon@example.invalid', '8845-7709', 'Remates judiciales');
INSERT INTO cartularium_ops.cliente VALUES (16, 'Manuel Rojas Pineda', '8612-3407', 'manuel.rojas@example.invalid', 'Rojas Pineda Abogados', 'Abogado', 'Manuel Rojas Pineda', '1-1098-0332', 'FISICA', 'manuel.rojas@example.invalid', '8612-3407', 'Cobro judicial');
INSERT INTO cartularium_ops.cliente VALUES (17, 'Valeria Hidalgo Núñez', '8976-2033', 'valeria.hidalgo@example.invalid', 'Hidalgo Núñez Legal', 'Abogada junior', 'Valeria Hidalgo Núñez', '2-0890-0677', 'FISICA', 'valeria.hidalgo@example.invalid', '8976-2033', 'Derecho procesal');
INSERT INTO cartularium_ops.cliente VALUES (18, 'Sebastián Mora Céspedes', '8702-9914', 'sebastian.mora@example.invalid', 'Mora Céspedes Consultores', 'Abogado', 'Sebastián Mora Céspedes', '1-1345-0219', 'FISICA', 'sebastian.mora@example.invalid', '8702-9914', 'Procesos de ejecución');
INSERT INTO cartularium_ops.cliente VALUES (19, 'Karla Rodríguez Arias', '8881-4560', 'karla.rodriguez@example.invalid', 'Rodríguez Arias Abogados', 'Abogada litigante', 'Karla Rodríguez Arias', '1-1770-0640', 'FISICA', 'karla.rodriguez@example.invalid', '8881-4560', 'Pacto comisorio');
INSERT INTO cartularium_ops.cliente VALUES (20, 'Javier Salas Umaña', '8399-6205', 'javier.salas@example.invalid', 'Salas Umaña Legal', 'Abogado', 'Javier Salas Umaña', '1-1554-0872', 'FISICA', 'javier.salas@example.invalid', '8399-6205', 'Notificaciones judiciales');
INSERT INTO cartularium_ops.cliente VALUES (21, 'Mónica Esquivel Porras', '8750-3098', 'monica.esquivel@example.invalid', 'Esquivel Porras Consultores', 'Abogada', 'Mónica Esquivel Porras', '1-1888-0194', 'FISICA', 'monica.esquivel@example.invalid', '8750-3098', 'Cobro judicial');
INSERT INTO cartularium_ops.cliente VALUES (22, 'Diego Navarro Segura', '8894-5176', 'diego.navarro@example.invalid', 'Navarro Segura Abogados', 'Abogado independiente', 'Diego Navarro Segura', '1-1666-0412', 'FISICA', 'diego.navarro@example.invalid', '8894-5176', 'Procesos de ejecución');
INSERT INTO cartularium_ops.cliente VALUES (23, 'Ana Lucía Vargas Cordero', '8714-6023', 'ana.vargas@example.com', 'Vargas Cordero Legal', 'Abogada', 'Ana Lucía Vargas Cordero', '1-2045-0781', 'FISICA', 'ana.vargas@example.com', '8714-6023', 'Testamentos');
INSERT INTO cartularium_ops.cliente VALUES (24, 'Pablo Enrique Soto Jiménez', '8883-1904', 'pablo.soto@example.com', 'Soto Jiménez Abogados', 'Abogado litigante', 'Pablo Enrique Soto Jiménez', '1-1789-0456', 'FISICA', 'pablo.soto@example.com', '8883-1904', 'Sucesiones judiciales');
INSERT INTO cartularium_ops.cliente VALUES (25, 'Mariana Rojas Bermúdez', '8569-3341', 'mariana.rojas@example.com', 'Notaría Rojas Bermúdez', 'Notaria pública', 'Mariana Rojas Bermúdez', '2-0987-1234', 'FISICA', 'mariana.rojas@example.com', '8569-3341', 'Albaceazgo');
INSERT INTO cartularium_ops.cliente VALUES (26, 'Francisco Javier Molina Castro', '8992-7745', 'francisco.molina@example.com', 'Molina Castro Consultores', 'Asesor legal', 'Francisco Javier Molina Castro', '1-1654-0992', 'FISICA', 'francisco.molina@example.com', '8992-7745', 'Herencias');
INSERT INTO cartularium_ops.cliente VALUES (27, 'Silvia Elena Pacheco Mora', '8830-4567', 'silvia.pacheco@example.com', 'Pacheco Mora Abogados', 'Abogada', 'Pacheco Mora Abogados S.A.', '3-101-552244', 'JURIDICA', 'facturacion.pacheco@example.com', '8830-4567', 'Derecho sucesorio');
INSERT INTO cartularium_ops.cliente VALUES (28, 'Roberto Andrés Fallas León', '8701-2998', 'roberto.fallas@example.com', 'Fallas León Legal', 'Abogado', 'Roberto Andrés Fallas León', '1-1877-0321', 'FISICA', 'roberto.fallas@example.com', '8701-2998', 'Procesos sucesorios');
INSERT INTO cartularium_ops.cliente VALUES (29, 'Camila Fernández Arce', '8456-7812', 'camila.fernandez@example.com', 'Fernández Arce Notaría', 'Notaria pública', 'Camila Fernández Arce', '1-1933-0650', 'FISICA', 'camila.fernandez@example.com', '8456-7812', 'Testamentos abiertos');
INSERT INTO cartularium_ops.cliente VALUES (30, 'Héctor Daniel Salazar Núñez', '8974-2038', 'hector.salazar@example.com', 'Salazar Núñez Abogados', 'Abogado', 'Salazar Núñez Abogados S.R.L.', '3-102-773311', 'JURIDICA', 'facturas.salazar@example.com', '8974-2038', 'Declaratoria de herederos');
INSERT INTO cartularium_ops.cliente VALUES (31, 'Valentina Quesada Alfaro', '8819-6602', 'valentina.quesada@example.com', 'Quesada Alfaro Legal', 'Abogada junior', 'Valentina Quesada Alfaro', '2-0744-0189', 'FISICA', 'valentina.quesada@example.com', '8819-6602', 'Derecho de familia');
INSERT INTO cartularium_ops.cliente VALUES (32, 'Óscar Alberto Chacón Vega', '8321-5439', 'oscar.chacon@example.com', 'Chacón Vega Consultores', 'Abogado independiente', 'Óscar Alberto Chacón Vega', '1-1221-0867', 'FISICA', 'oscar.chacon@example.com', '8321-5439', 'Sucesiones notariales');
INSERT INTO cartularium_ops.cliente VALUES (33, 'Gabriela María Solís Herrera', '8790-1148', 'gabriela.solis@example.com', 'Solís Herrera Abogados', 'Abogada litigante', 'Gabriela María Solís Herrera', '1-1440-0543', 'FISICA', 'gabriela.solis@example.com', '8790-1148', 'Herederos');
INSERT INTO cartularium_ops.cliente VALUES (34, 'Mauricio Céspedes Ramírez', '8842-9007', 'mauricio.cespedes@example.com', 'Céspedes Ramírez Legal', 'Asesor jurídico', 'Mauricio Céspedes Ramírez', '1-1775-0334', 'FISICA', 'mauricio.cespedes@example.com', '8842-9007', 'Partición de bienes');
INSERT INTO cartularium_ops.cliente VALUES (35, 'Daniela María Arias Brenes', '8907-6611', 'daniela.arias@example.com', 'Arias Brenes Notaría', 'Notaria pública', 'Daniela María Arias Brenes', '2-0899-0721', 'FISICA', 'daniela.arias@example.com', '8907-6611', 'Testamentos cerrados');
INSERT INTO cartularium_ops.cliente VALUES (36, 'Jorge Luis Hidalgo Castro', '8561-7780', 'jorge.hidalgo@example.com', 'Hidalgo Castro Abogados', 'Abogado', 'Hidalgo Castro Abogados S.A.', '3-101-664422', 'JURIDICA', 'facturacion.hidalgo@example.com', '8561-7780', 'Sucesión judicial');
INSERT INTO cartularium_ops.cliente VALUES (37, 'Nicole Patricia Campos Rojas', '8722-4895', 'nicole.campos@example.com', 'Campos Rojas Legal', 'Abogada', 'Nicole Patricia Campos Rojas', '1-1884-0933', 'FISICA', 'nicole.campos@example.com', '8722-4895', 'Derecho notarial');
INSERT INTO cartularium_ops.cliente VALUES (38, 'Rafael Ángel Mora Gamboa', '8998-1034', 'rafael.mora@example.com', 'Mora Gamboa Consultores', 'Abogado litigante', 'Rafael Ángel Mora Gamboa', '1-1669-0410', 'FISICA', 'rafael.mora@example.com', '8998-1034', 'Procesos sucesorios');
INSERT INTO cartularium_ops.cliente VALUES (39, 'Tatiana Jiménez Villalobos', '8350-6672', 'tatiana.jimenez@example.com', 'Jiménez Villalobos Abogados', 'Abogada', 'Tatiana Jiménez Villalobos', '1-1730-0876', 'FISICA', 'tatiana.jimenez@example.com', '8350-6672', 'Impugnación de testamentos');
INSERT INTO cartularium_ops.cliente VALUES (40, 'Felipe Andrés Montero Pineda', '8810-2934', 'felipe.montero@example.com', 'Montero Pineda Legal', 'Abogado', 'Felipe Andrés Montero Pineda', '1-1550-0254', 'FISICA', 'felipe.montero@example.com', '8810-2934', 'Albacea');
INSERT INTO cartularium_ops.cliente VALUES (41, 'Carolina Esquivel Zúñiga', '8708-4401', 'carolina.esquivel@example.com', 'Esquivel Zúñiga Notaría', 'Notaria pública', 'Carolina Esquivel Zúñiga', '2-0761-0345', 'FISICA', 'carolina.esquivel@example.com', '8708-4401', 'Herencias familiares');
INSERT INTO cartularium_ops.cliente VALUES (42, 'Sergio Iván Ramírez Aguilar', '8455-7820', 'sergio.ramirez@example.com', 'Ramírez Aguilar Abogados', 'Abogado', 'Sergio Iván Ramírez Aguilar', '1-1219-0778', 'FISICA', 'sergio.ramirez@example.com', '8455-7820', 'Sucesión intestada');
INSERT INTO cartularium_ops.cliente VALUES (43, 'María José Castro Murillo', '8971-5033', 'maria.castro@example.com', 'Castro Murillo Legal', 'Abogada junior', 'María José Castro Murillo', '1-1990-0655', 'FISICA', 'maria.castro@example.com', '8971-5033', 'Testamentos');
INSERT INTO cartularium_ops.cliente VALUES (44, 'Alejandro Brenes Salas', '8835-2109', 'alejandro.brenes@example.com', 'Brenes Salas Consultores', 'Asesor legal', 'Alejandro Brenes Salas', '1-1422-0198', 'FISICA', 'alejandro.brenes@example.com', '8835-2109', 'Derecho sucesorio');
INSERT INTO cartularium_ops.cliente VALUES (45, 'Laura Isabel Méndez Corrales', '8994-6715', 'laura.mendezc@example.com', 'Méndez Corrales Abogados', 'Abogada litigante', 'Méndez Corrales Abogados S.R.L.', '3-102-889900', 'JURIDICA', 'facturas.mendezcorrales@example.com', '8994-6715', 'Partición hereditaria');
INSERT INTO cartularium_ops.cliente VALUES (46, 'Lucía Fernanda Mora Salas', '8710-4829', 'lucia.mora@example.com', 'Mora Salas Abogados', 'Abogada', 'Lucía Fernanda Mora Salas', '1-2034-0567', 'FISICA', 'lucia.mora@example.com', '8710-4829', 'Contratos de arrendamiento');
INSERT INTO cartularium_ops.cliente VALUES (47, 'Carlos Eduardo Jiménez Rojas', '8892-1740', 'carlos.jimenez@example.com', 'Jiménez Rojas Legal', 'Abogado litigante', 'Carlos Eduardo Jiménez Rojas', '1-1876-0432', 'FISICA', 'carlos.jimenez@example.com', '8892-1740', 'Desalojos');
INSERT INTO cartularium_ops.cliente VALUES (48, 'María Paula Castro Núñez', '8564-7702', 'maria.castro.n@example.com', 'Castro Núñez Notaría', 'Notaria pública', 'María Paula Castro Núñez', '2-0945-0711', 'FISICA', 'maria.castro.n@example.com', '8564-7702', 'Arrendamiento comercial');
INSERT INTO cartularium_ops.cliente VALUES (49, 'Andrés Felipe Solano Vargas', '8975-6301', 'andres.solano@example.com', 'Solano Vargas Consultores', 'Asesor legal', 'Andrés Felipe Solano Vargas', '1-1662-0885', 'FISICA', 'andres.solano@example.com', '8975-6301', 'Incumplimiento contractual');
INSERT INTO cartularium_ops.cliente VALUES (50, 'Katherine Rodríguez Brenes', '8831-5094', 'katherine.rodriguez@example.com', 'Rodríguez Brenes Abogados', 'Abogada', 'Rodríguez Brenes Abogados S.A.', '3-101-778812', 'JURIDICA', 'facturacion.rodriguezb@example.com', '8831-5094', 'Contratos civiles');
INSERT INTO cartularium_ops.cliente VALUES (51, 'Javier Enrique Porras León', '8703-9912', 'javier.porras@example.com', 'Porras León Legal', 'Abogado', 'Javier Enrique Porras León', '1-1554-0231', 'FISICA', 'javier.porras@example.com', '8703-9912', 'Arrendamiento habitacional');
INSERT INTO cartularium_ops.cliente VALUES (52, 'Sofía Valverde Chacón', '8459-2088', 'sofia.valverde@example.com', 'Valverde Chacón Consultores', 'Abogada junior', 'Sofía Valverde Chacón', '1-1902-0674', 'FISICA', 'sofia.valverde@example.com', '8459-2088', 'Garantías en alquileres');
INSERT INTO cartularium_ops.cliente VALUES (53, 'Roberto Daniel Acuña Mora', '8991-4506', 'roberto.acuna@example.com', 'Acuña Mora Abogados', 'Abogado litigante', 'Acuña Mora Abogados S.R.L.', '3-102-554433', 'JURIDICA', 'facturas.acunamora@example.com', '8991-4506', 'Procesos de desahucio');
INSERT INTO cartularium_ops.cliente VALUES (54, 'Valeria Campos Hernández', '8814-6027', 'valeria.campos@example.com', 'Campos Hernández Legal', 'Abogada', 'Valeria Campos Hernández', '2-0833-0198', 'FISICA', 'valeria.campos@example.com', '8814-6027', 'Derecho inmobiliario');
INSERT INTO cartularium_ops.cliente VALUES (55, 'Mauricio Andrés Brenes Soto', '8327-1185', 'mauricio.brenes@example.com', 'Brenes Soto Consultores', 'Asesor jurídico', 'Mauricio Andrés Brenes Soto', '1-1445-0760', 'FISICA', 'mauricio.brenes@example.com', '8327-1185', 'Arrendamientos urbanos');
INSERT INTO cartularium_ops.cliente VALUES (56, 'Daniela Jiménez Araya', '8794-3016', 'daniela.jimenez@example.com', 'Jiménez Araya Abogados', 'Abogada', 'Daniela Jiménez Araya', '1-1776-0342', 'FISICA', 'daniela.jimenez@example.com', '8794-3016', 'Contratos de alquiler');
INSERT INTO cartularium_ops.cliente VALUES (57, 'Pablo Antonio Méndez Castro', '8846-9903', 'pablo.mendez@example.com', 'Méndez Castro Legal', 'Abogado', 'Pablo Antonio Méndez Castro', '1-1228-0655', 'FISICA', 'pablo.mendez@example.com', '8846-9903', 'Cobro de alquileres');
INSERT INTO cartularium_ops.cliente VALUES (58, 'Gabriela Fernández Aguilar', '8905-7811', 'gabriela.fernandez@example.com', 'Fernández Aguilar Notaría', 'Notaria pública', 'Gabriela Fernández Aguilar', '2-0754-0877', 'FISICA', 'gabriela.fernandez@example.com', '8905-7811', 'Derecho civil');
INSERT INTO cartularium_ops.cliente VALUES (59, 'Diego Alejandro Rojas Alfaro', '8568-2209', 'diego.rojas@example.com', 'Rojas Alfaro Abogados', 'Abogado', 'Rojas Alfaro Abogados S.A.', '3-101-663300', 'JURIDICA', 'facturacion.rojasalfaro@example.com', '8568-2209', 'Arrendamiento comercial');
INSERT INTO cartularium_ops.cliente VALUES (60, 'Natalia María Hidalgo Vargas', '8729-6044', 'natalia.hidalgo@example.com', 'Hidalgo Vargas Legal', 'Abogada', 'Natalia María Hidalgo Vargas', '1-1889-0413', 'FISICA', 'natalia.hidalgo@example.com', '8729-6044', 'Procesos civiles');
INSERT INTO cartularium_ops.cliente VALUES (61, 'Óscar Gerardo Salas Quesada', '8451-7730', 'oscar.salas@example.com', 'Salas Quesada Consultores', 'Abogado independiente', 'Óscar Gerardo Salas Quesada', '1-1332-0971', 'FISICA', 'oscar.salas@example.com', '8451-7730', 'Incumplimiento en arrendamientos');
INSERT INTO cartularium_ops.cliente VALUES (62, 'Camila Pacheco Montero', '8972-3405', 'camila.pacheco@example.com', 'Pacheco Montero Legal', 'Abogada junior', 'Camila Pacheco Montero', '2-0912-0225', 'FISICA', 'camila.pacheco@example.com', '8972-3405', 'Desalojos administrativos');
INSERT INTO cartularium_ops.cliente VALUES (63, 'Fernando Luis Cordero Arias', '8836-1190', 'fernando.cordero@example.com', 'Cordero Arias Abogados', 'Abogado litigante', 'Fernando Luis Cordero Arias', '1-1420-0688', 'FISICA', 'fernando.cordero@example.com', '8836-1190', 'Arrendamiento civil');
INSERT INTO cartularium_ops.cliente VALUES (64, 'Mariana Esquivel Ramírez', '8995-6207', 'mariana.esquivel@example.com', 'Esquivel Ramírez Consultoría Legal', 'Abogada', 'Mariana Esquivel Ramírez', '1-1994-0549', 'FISICA', 'mariana.esquivel@example.com', '8995-6207', 'Contratos inmobiliarios');
INSERT INTO cartularium_ops.cliente VALUES (65, 'Andrea Valeria Solís Mora', '8720-4415', 'andrea.solis@example.com', 'Solís Mora Notaría', 'Notaria pública', 'Andrea Valeria Solís Mora', '1-2048-0672', 'FISICA', 'andrea.solis@example.com', '8720-4415', 'IA aplicada al notariado');
INSERT INTO cartularium_ops.cliente VALUES (66, 'Luis Fernando Araya Campos', '8891-2570', 'luis.araya@example.com', 'Araya Campos Abogados', 'Abogado y notario', 'Luis Fernando Araya Campos', '1-1765-0449', 'FISICA', 'luis.araya@example.com', '8891-2570', 'Automatización documental');
INSERT INTO cartularium_ops.cliente VALUES (67, 'María José Pineda Chaves', '8562-7803', 'maria.pineda@example.com', 'Pineda Chaves Legal', 'Notaria pública', 'María José Pineda Chaves', '2-0954-0718', 'FISICA', 'maria.pineda@example.com', '8562-7803', 'Herramientas digitales notariales');
INSERT INTO cartularium_ops.cliente VALUES (68, 'Esteban Ramírez Monge', '8976-3308', 'esteban.ramirez@example.com', 'Ramírez Monge Consultores', 'Abogado', 'Esteban Ramírez Monge', '1-1667-0881', 'FISICA', 'esteban.ramirez@example.com', '8976-3308', 'Ética e inteligencia artificial');
INSERT INTO cartularium_ops.cliente VALUES (69, 'Natalia Brenes Alfaro', '8832-5091', 'natalia.brenes@example.com', 'Brenes Alfaro Notaría', 'Notaria pública', 'Natalia Brenes Alfaro', '1-1890-0236', 'FISICA', 'natalia.brenes@example.com', '8832-5091', 'Gestión notarial digital');
INSERT INTO cartularium_ops.cliente VALUES (70, 'Pablo Andrés Castro Rojas', '8704-1186', 'pablo.castro@example.com', 'Castro Rojas Abogados', 'Abogado y notario', 'Castro Rojas Abogados S.A.', '3-101-774455', 'JURIDICA', 'facturacion.castrorojas@example.com', '8704-1186', 'Automatización de escrituras');
INSERT INTO cartularium_ops.cliente VALUES (71, 'Gabriela Montero Jiménez', '8458-9032', 'gabriela.montero@example.com', 'Montero Jiménez Legal', 'Abogada', 'Gabriela Montero Jiménez', '1-1436-0980', 'FISICA', 'gabriela.montero@example.com', '8458-9032', 'Protección de datos');
INSERT INTO cartularium_ops.cliente VALUES (72, 'Ricardo Vargas León', '8990-6712', 'ricardo.vargas@example.com', 'Vargas León Notaría', 'Notario público', 'Ricardo Vargas León', '1-1552-0399', 'FISICA', 'ricardo.vargas@example.com', '8990-6712', 'IA generativa en derecho');
INSERT INTO cartularium_ops.cliente VALUES (73, 'Daniela Cordero Núñez', '8817-6040', 'daniela.cordero@example.com', 'Cordero Núñez Abogados', 'Abogada junior', 'Daniela Cordero Núñez', '2-0821-0167', 'FISICA', 'daniela.cordero@example.com', '8817-6040', 'Redacción asistida por IA');
INSERT INTO cartularium_ops.cliente VALUES (74, 'Jorge Alberto Salas Brenes', '8329-7754', 'jorge.salas@example.com', 'Salas Brenes Consultores', 'Asesor legal', 'Jorge Alberto Salas Brenes', '1-1778-0314', 'FISICA', 'jorge.salas@example.com', '8329-7754', 'Innovación legal');
INSERT INTO cartularium_ops.cliente VALUES (75, 'Camila Hidalgo Quesada', '8795-3017', 'camila.hidalgo@example.com', 'Hidalgo Quesada Notaría', 'Notaria pública', 'Camila Hidalgo Quesada', '1-1908-0542', 'FISICA', 'camila.hidalgo@example.com', '8795-3017', 'Firma digital');
INSERT INTO cartularium_ops.cliente VALUES (76, 'Mauricio Fallas Soto', '8847-2290', 'mauricio.fallas@example.com', 'Fallas Soto Legal', 'Abogado y notario', 'Mauricio Fallas Soto', '1-1225-0681', 'FISICA', 'mauricio.fallas@example.com', '8847-2290', 'Notariado electrónico');
INSERT INTO cartularium_ops.cliente VALUES (77, 'Valentina Rojas Herrera', '8903-7814', 'valentina.rojas@example.com', 'Rojas Herrera Abogados', 'Abogada', 'Rojas Herrera Abogados S.R.L.', '3-102-665544', 'JURIDICA', 'facturas.rojasherrera@example.com', '8903-7814', 'IA en trámites notariales');
INSERT INTO cartularium_ops.cliente VALUES (78, 'Sebastián Mora Pacheco', '8567-2208', 'sebastian.morap@example.com', 'Mora Pacheco Consultores', 'Abogado', 'Sebastián Mora Pacheco', '1-1349-0720', 'FISICA', 'sebastian.morap@example.com', '8567-2208', 'Legaltech');
INSERT INTO cartularium_ops.cliente VALUES (79, 'Laura Patricia Arias Vega', '8728-6046', 'laura.arias@example.com', 'Arias Vega Notaría', 'Notaria pública', 'Laura Patricia Arias Vega', '2-0748-0872', 'FISICA', 'laura.arias@example.com', '8728-6046', 'Seguridad de datos notariales');
INSERT INTO cartularium_ops.cliente VALUES (80, 'Óscar Daniel Chacón Mora', '8453-7729', 'oscar.chaconm@example.com', 'Chacón Mora Legal', 'Abogado litigante', 'Óscar Daniel Chacón Mora', '1-1336-0944', 'FISICA', 'oscar.chaconm@example.com', '8453-7729', 'Herramientas de IA');
INSERT INTO cartularium_ops.cliente VALUES (81, 'Mariana Esquivel Soto', '8973-3404', 'mariana.esquivels@example.com', 'Esquivel Soto Abogados', 'Abogada y notaria', 'Mariana Esquivel Soto', '2-0916-0231', 'FISICA', 'mariana.esquivels@example.com', '8973-3404', 'Productividad notarial');
INSERT INTO cartularium_ops.cliente VALUES (82, 'Fernando Cordero Ramírez', '8837-1191', 'fernando.corderor@example.com', 'Cordero Ramírez Consultores', 'Asesor jurídico', 'Fernando Cordero Ramírez', '1-1424-0612', 'FISICA', 'fernando.corderor@example.com', '8837-1191', 'IA y responsabilidad profesional');
INSERT INTO cartularium_ops.cliente VALUES (83, 'Karla Rodríguez Montero', '8996-6208', 'karla.montero@example.com', 'Rodríguez Montero Legal', 'Abogada', 'Karla Rodríguez Montero', '1-1997-0515', 'FISICA', 'karla.montero@example.com', '8996-6208', 'Transformación digital');
INSERT INTO cartularium_ops.cliente VALUES (84, 'Felipe Andrés Quesada Brenes', '8711-5080', 'felipe.quesada@example.com', 'Quesada Brenes Notaría', 'Notario público', 'Felipe Andrés Quesada Brenes', '1-1886-0468', 'FISICA', 'felipe.quesada@example.com', '8711-5080', 'IA para revisión documental');
INSERT INTO cartularium_ops.cliente VALUES (85, 'Sofía Fernández Campos', '8841-5602', 'sofia.fernandez@example.com', 'Fernández Campos Abogados', 'Abogada junior', 'Sofía Fernández Campos', '1-1760-0347', 'FISICA', 'sofia.fernandez@example.com', '8841-5602', 'Notariado y tecnología');
INSERT INTO cartularium_ops.cliente VALUES (86, 'Roberto Daniel Vargas Alfaro', '8997-6124', 'roberto.vargasa@example.com', 'Vargas Alfaro Legal', 'Abogado', 'Roberto Daniel Vargas Alfaro', '1-1568-0190', 'FISICA', 'roberto.vargasa@example.com', '8997-6124', 'Automatización legal');
INSERT INTO cartularium_ops.cliente VALUES (87, 'Carolina Méndez Aguilar', '8726-8031', 'carolina.aguilar@example.com', 'Méndez Aguilar Notaría', 'Notaria pública', 'Carolina Méndez Aguilar', '2-0863-0184', 'FISICA', 'carolina.aguilar@example.com', '8726-8031', 'IA en protocolos notariales');
INSERT INTO cartularium_ops.cliente VALUES (88, 'Héctor Iván Jiménez Salazar', '8450-6813', 'hector.jimenez@example.com', 'Jiménez Salazar Abogados', 'Abogado y notario', 'Jiménez Salazar Abogados S.A.', '3-101-889944', 'JURIDICA', 'facturacion.jimenezsalazar@example.com', '8450-6813', 'Notariado digital');
INSERT INTO cartularium_ops.cliente VALUES (89, 'Fernanda Arias Calderón', '8721-4506', 'fernanda.arias@example.com', 'Arias Calderón Abogados', 'Abogada litigante', 'Fernanda Arias Calderón', '1-2050-0611', 'FISICA', 'fernanda.arias@example.com', '8721-4506', 'Cobro judicial avanzado');
INSERT INTO cartularium_ops.cliente VALUES (90, 'José Andrés Vargas Mora', '8894-2107', 'jose.vargas@example.com', 'Vargas Mora Legal', 'Abogado', 'José Andrés Vargas Mora', '1-1768-0433', 'FISICA', 'jose.vargas@example.com', '8894-2107', 'Ejecución de sentencias');
INSERT INTO cartularium_ops.cliente VALUES (91, 'María Paula Salazar Rojas', '8563-7810', 'maria.salazar@example.com', 'Salazar Rojas Consultores', 'Asesora legal', 'María Paula Salazar Rojas', '2-0958-0720', 'FISICA', 'maria.salazar@example.com', '8563-7810', 'Embargos');
INSERT INTO cartularium_ops.cliente VALUES (92, 'Luis Diego Chacón Brenes', '8977-3311', 'luis.chacon@example.com', 'Chacón Brenes Abogados', 'Abogado litigante', 'Chacón Brenes Abogados S.A.', '3-101-775588', 'JURIDICA', 'facturacion.chaconbrenes@example.com', '8977-3311', 'Procesos monitorios');
INSERT INTO cartularium_ops.cliente VALUES (93, 'Natalia Montero Alfaro', '8833-5092', 'natalia.montero@example.com', 'Montero Alfaro Legal', 'Abogada', 'Natalia Montero Alfaro', '1-1894-0240', 'FISICA', 'natalia.montero@example.com', '8833-5092', 'Cobro de pagarés');
INSERT INTO cartularium_ops.cliente VALUES (94, 'Pablo Esteban Castro Solís', '8705-1187', 'pablo.castros@example.com', 'Castro Solís Abogados', 'Abogado', 'Pablo Esteban Castro Solís', '1-1557-0394', 'FISICA', 'pablo.castros@example.com', '8705-1187', 'Recuperación de créditos');
INSERT INTO cartularium_ops.cliente VALUES (95, 'Gabriela León Jiménez', '8459-9034', 'gabriela.leonj@example.com', 'León Jiménez Consultoría Legal', 'Abogada', 'Gabriela León Jiménez', '1-1439-0984', 'FISICA', 'gabriela.leonj@example.com', '8459-9034', 'Medidas cautelares');
INSERT INTO cartularium_ops.cliente VALUES (96, 'Ricardo Quesada Vargas', '8991-6713', 'ricardo.quesada@example.com', 'Quesada Vargas Abogados', 'Abogado litigante', 'Quesada Vargas Abogados S.R.L.', '3-102-445577', 'JURIDICA', 'facturas.quesadavargas@example.com', '8991-6713', 'Cobro judicial civil');
INSERT INTO cartularium_ops.cliente VALUES (97, 'Daniela Cordero Pacheco', '8818-6041', 'daniela.pacheco@example.com', 'Cordero Pacheco Legal', 'Abogada junior', 'Daniela Cordero Pacheco', '2-0824-0169', 'FISICA', 'daniela.pacheco@example.com', '8818-6041', 'Procesos ejecutivos');
INSERT INTO cartularium_ops.cliente VALUES (98, 'Jorge Alberto Brenes Méndez', '8330-7755', 'jorge.brenes@example.com', 'Brenes Méndez Consultores', 'Asesor jurídico', 'Jorge Alberto Brenes Méndez', '1-1780-0318', 'FISICA', 'jorge.brenes@example.com', '8330-7755', 'Títulos ejecutivos');
INSERT INTO cartularium_ops.cliente VALUES (99, 'Camila Hidalgo Soto', '8796-3018', 'camila.soto@example.com', 'Hidalgo Soto Abogados', 'Abogada', 'Camila Hidalgo Soto', '1-1910-0545', 'FISICA', 'camila.soto@example.com', '8796-3018', 'Estrategia procesal');
INSERT INTO cartularium_ops.cliente VALUES (100, 'Mauricio Fallas Ramírez', '8848-2291', 'mauricio.ramirez@example.com', 'Fallas Ramírez Legal', 'Abogado litigante', 'Mauricio Fallas Ramírez', '1-1229-0685', 'FISICA', 'mauricio.ramirez@example.com', '8848-2291', 'Cobro hipotecario');
INSERT INTO cartularium_ops.cliente VALUES (101, 'Valentina Rojas Segura', '8904-7815', 'valentina.segura@example.com', 'Rojas Segura Abogados', 'Abogada', 'Rojas Segura Abogados S.A.', '3-101-667799', 'JURIDICA', 'facturas.rojassegura@example.com', '8904-7815', 'Cobro mercantil');
INSERT INTO cartularium_ops.cliente VALUES (102, 'Sebastián Mora Arce', '8568-2209', 'sebastian.arce@example.com', 'Mora Arce Consultores', 'Abogado', 'Sebastián Mora Arce', '1-1351-0725', 'FISICA', 'sebastian.arce@example.com', '8568-2209', 'Liquidación de intereses');
INSERT INTO cartularium_ops.cliente VALUES (103, 'Laura Patricia Arias Núñez', '8729-6047', 'laura.nunez@example.com', 'Arias Núñez Legal', 'Abogada litigante', 'Laura Patricia Arias Núñez', '2-0751-0873', 'FISICA', 'laura.nunez@example.com', '8729-6047', 'Cobro de honorarios');
INSERT INTO cartularium_ops.cliente VALUES (104, 'Óscar Daniel Chacón Salas', '8454-7730', 'oscar.salas@example.com', 'Chacón Salas Abogados', 'Abogado', 'Óscar Daniel Chacón Salas', '1-1339-0946', 'FISICA', 'oscar.salas@example.com', '8454-7730', 'Procesos de ejecución');
INSERT INTO cartularium_ops.cliente VALUES (105, 'Mariana Esquivel Porras', '8974-3406', 'mariana.porras@example.com', 'Esquivel Porras Consultores', 'Asesora legal', 'Mariana Esquivel Porras', '2-0919-0234', 'FISICA', 'mariana.porras@example.com', '8974-3406', 'Cobro judicial práctico');
INSERT INTO cartularium_ops.cliente VALUES (106, 'Fernando Cordero Valverde', '8838-1192', 'fernando.valverde@example.com', 'Cordero Valverde Legal', 'Abogado', 'Fernando Cordero Valverde', '1-1427-0618', 'FISICA', 'fernando.valverde@example.com', '8838-1192', 'Audiencias en cobro judicial');
INSERT INTO cartularium_ops.cliente VALUES (107, 'Karla Rodríguez Campos', '8997-6209', 'karla.campos@example.com', 'Rodríguez Campos Abogados', 'Abogada', 'Karla Rodríguez Campos', '1-1999-0518', 'FISICA', 'karla.campos@example.com', '8997-6209', 'Gestión de cartera judicial');
INSERT INTO cartularium_ops.cliente VALUES (108, 'Felipe Andrés Quesada Mora', '8712-5081', 'felipe.mora@example.com', 'Quesada Mora Legal', 'Abogado litigante', 'Felipe Andrés Quesada Mora', '1-1889-0472', 'FISICA', 'felipe.mora@example.com', '8712-5081', 'Cobro de deudas');
INSERT INTO cartularium_ops.cliente VALUES (109, 'Sofía Fernández Aguilar', '8842-5603', 'sofia.aguilar@example.com', 'Fernández Aguilar Abogados', 'Abogada junior', 'Sofía Fernández Aguilar', '1-1763-0350', 'FISICA', 'sofia.aguilar@example.com', '8842-5603', 'Ejecución prendaria');
INSERT INTO cartularium_ops.cliente VALUES (110, 'Roberto Vargas Alfaro', '8998-6125', 'roberto.alfaro@example.com', 'Vargas Alfaro Legal', 'Abogado', 'Roberto Vargas Alfaro', '1-1570-0193', 'FISICA', 'roberto.alfaro@example.com', '8998-6125', 'Procesos cobratorios');
INSERT INTO cartularium_ops.cliente VALUES (111, 'Carolina Méndez Aguilar', '8727-8032', 'carolina.mendezag@example.com', 'Méndez Aguilar Consultores', 'Abogada litigante', 'Carolina Méndez Aguilar', '2-0866-0188', 'FISICA', 'carolina.mendezag@example.com', '8727-8032', 'Cobro judicial estratégico');
INSERT INTO cartularium_ops.cliente VALUES (112, 'Héctor Iván Jiménez Salazar', '8451-6814', 'hector.salazarj@example.com', 'Jiménez Salazar Abogados', 'Abogado', 'Jiménez Salazar Abogados S.A.', '3-101-889955', 'JURIDICA', 'facturacion.jimenezs@example.com', '8451-6814', 'Embargos y remates');
INSERT INTO cartularium_ops.cliente VALUES (113, 'Patricia Valverde Rojas', '8872-4406', 'patricia.valverde@example.com', 'Valverde Rojas Legal', 'Abogada', 'Patricia Valverde Rojas', '1-1508-0761', 'FISICA', 'patricia.valverde@example.com', '8872-4406', 'Recuperación judicial');
INSERT INTO cartularium_ops.cliente VALUES (114, 'Adrián Molina Céspedes', '8706-2018', 'adrian.molina@example.com', 'Molina Céspedes Abogados', 'Abogado litigante', 'Adrián Molina Céspedes', '1-1664-0328', 'FISICA', 'adrian.molina@example.com', '8706-2018', 'Cobro ejecutivo');
INSERT INTO cartularium_ops.cliente VALUES (115, 'Isabel Cristina Pacheco Mora', '8993-1175', 'isabel.pacheco@example.com', 'Pacheco Mora Consultores', 'Asesora legal', 'Isabel Cristina Pacheco Mora', '2-0784-0901', 'FISICA', 'isabel.pacheco@example.com', '8993-1175', 'Estrategias de cobro');
INSERT INTO cartularium_ops.cliente VALUES (116, 'Tomás Andrés Rojas León', '8569-4430', 'tomas.rojas@example.com', 'Rojas León Legal', 'Abogado', 'Tomás Andrés Rojas León', '1-1844-0290', 'FISICA', 'tomas.rojas@example.com', '8569-4430', 'Medidas de ejecución');
INSERT INTO cartularium_ops.cliente VALUES (117, 'Marcela Jiménez Vargas', '8835-7602', 'marcela.jimenez@example.com', 'Jiménez Vargas Abogados', 'Abogada litigante', 'Jiménez Vargas Abogados S.R.L.', '3-102-774488', 'JURIDICA', 'facturas.jimenezvargas@example.com', '8835-7602', 'Cobro judicial y conciliación');
INSERT INTO cartularium_ops.cliente VALUES (118, 'Rodrigo Salas Cordero', '8725-6089', 'rodrigo.salas@example.com', 'Salas Cordero Consultores', 'Asesor jurídico', 'Rodrigo Salas Cordero', '1-1214-0669', 'FISICA', 'rodrigo.salas@example.com', '8725-6089', 'Cobro de obligaciones');
INSERT INTO cartularium_ops.cliente VALUES (119, 'Elena Sofía Brenes Castro', '8890-2306', 'elena.brenes@example.com', 'Brenes Castro Legal', 'Abogada', 'Elena Sofía Brenes Castro', '1-1980-0554', 'FISICA', 'elena.brenes@example.com', '8890-2306', 'Procesos de ejecución civil');
INSERT INTO cartularium_ops.cliente VALUES (120, 'Gustavo Enrique Mora Pineda', '8456-3312', 'gustavo.mora@example.com', 'Mora Pineda Abogados', 'Abogado', 'Gustavo Enrique Mora Pineda', '1-1441-0788', 'FISICA', 'gustavo.mora@example.com', '8456-3312', 'Cobro judicial básico');
INSERT INTO cartularium_ops.cliente VALUES (121, 'Adriana María Castro Solano', '8999-6401', 'adriana.castros@example.com', 'Castro Solano Legal', 'Abogada', 'Adriana María Castro Solano', '2-0990-0412', 'FISICA', 'adriana.castros@example.com', '8999-6401', 'Remates judiciales');
INSERT INTO cartularium_ops.cliente VALUES (122, 'Daniel Rojas Fernández', '8718-7710', 'daniel.rojas@example.com', 'Rojas Fernández Consultores', 'Abogado independiente', 'Daniel Rojas Fernández', '1-1771-0246', 'FISICA', 'daniel.rojas@example.com', '8718-7710', 'Gestión de expedientes judiciales');
INSERT INTO cartularium_ops.cliente VALUES (123, 'María Fernanda Solano Rojas', '8723-4510', 'fernanda.solano@example.com', 'Solano Rojas Abogados', 'Abogada litigante', 'María Fernanda Solano Rojas', '1-2052-0614', 'FISICA', 'fernanda.solano@example.com', '8723-4510', 'Remates judiciales');
INSERT INTO cartularium_ops.cliente VALUES (124, 'José Daniel Vargas Brenes', '8895-2140', 'jose.vargasb@example.com', 'Vargas Brenes Legal', 'Abogado', 'José Daniel Vargas Brenes', '1-1770-0437', 'FISICA', 'jose.vargasb@example.com', '8895-2140', 'Participación en remates');
INSERT INTO cartularium_ops.cliente VALUES (125, 'Laura Patricia Chacón Mora', '8565-7812', 'laura.chacon@example.com', 'Chacón Mora Consultores', 'Asesora legal', 'Laura Patricia Chacón Mora', '2-0960-0724', 'FISICA', 'laura.chacon@example.com', '8565-7812', 'Avalúos judiciales');
INSERT INTO cartularium_ops.cliente VALUES (126, 'Luis Fernando Ramírez Soto', '8978-3315', 'luis.ramirezs@example.com', 'Ramírez Soto Abogados', 'Abogado litigante', 'Ramírez Soto Abogados S.A.', '3-101-775699', 'JURIDICA', 'facturacion.ramirezsoto@example.com', '8978-3315', 'Procesos de remate');
INSERT INTO cartularium_ops.cliente VALUES (127, 'Natalia Méndez Alfaro', '8834-5096', 'natalia.mendez@example.com', 'Méndez Alfaro Legal', 'Abogada', 'Natalia Méndez Alfaro', '1-1896-0244', 'FISICA', 'natalia.mendez@example.com', '8834-5096', 'Cobro judicial');
INSERT INTO cartularium_ops.cliente VALUES (128, 'Pablo Andrés Castro León', '8707-1189', 'pablo.castrol@example.com', 'Castro León Abogados', 'Abogado', 'Pablo Andrés Castro León', '1-1560-0398', 'FISICA', 'pablo.castrol@example.com', '8707-1189', 'Ejecución de garantías');
INSERT INTO cartularium_ops.cliente VALUES (129, 'Gabriela Jiménez Salas', '8460-9036', 'gabriela.jimenezs@example.com', 'Jiménez Salas Consultoría Legal', 'Abogada', 'Gabriela Jiménez Salas', '1-1442-0987', 'FISICA', 'gabriela.jimenezs@example.com', '8460-9036', 'Remate de inmuebles');
INSERT INTO cartularium_ops.cliente VALUES (130, 'Ricardo Quesada Montero', '8992-6716', 'ricardo.montero@example.com', 'Quesada Montero Abogados', 'Abogado litigante', 'Quesada Montero Abogados S.R.L.', '3-102-445688', 'JURIDICA', 'facturas.quesadam@example.com', '8992-6716', 'Adjudicación judicial');
INSERT INTO cartularium_ops.cliente VALUES (131, 'Daniela Pacheco Cordero', '8819-6045', 'daniela.cordero2@example.com', 'Pacheco Cordero Legal', 'Abogada junior', 'Daniela Pacheco Cordero', '2-0826-0173', 'FISICA', 'daniela.cordero2@example.com', '8819-6045', 'Oferta en remates');
INSERT INTO cartularium_ops.cliente VALUES (132, 'Jorge Alberto Brenes Valverde', '8331-7758', 'jorge.valverde@example.com', 'Brenes Valverde Consultores', 'Asesor jurídico', 'Jorge Alberto Brenes Valverde', '1-1782-0321', 'FISICA', 'jorge.valverde@example.com', '8331-7758', 'Remates electrónicos');
INSERT INTO cartularium_ops.cliente VALUES (133, 'Camila Hidalgo Mora', '8797-3021', 'camila.mora@example.com', 'Hidalgo Mora Abogados', 'Abogada', 'Camila Hidalgo Mora', '1-1912-0548', 'FISICA', 'camila.mora@example.com', '8797-3021', 'Derecho inmobiliario');
INSERT INTO cartularium_ops.cliente VALUES (134, 'Mauricio Fallas Cordero', '8849-2294', 'mauricio.cordero@example.com', 'Fallas Cordero Legal', 'Abogado litigante', 'Mauricio Fallas Cordero', '1-1231-0689', 'FISICA', 'mauricio.cordero@example.com', '8849-2294', 'Bienes embargados');
INSERT INTO cartularium_ops.cliente VALUES (135, 'Valentina Rojas Porras', '8905-7818', 'valentina.porras@example.com', 'Rojas Porras Abogados', 'Abogada', 'Rojas Porras Abogados S.A.', '3-101-667855', 'JURIDICA', 'facturas.rojasporras@example.com', '8905-7818', 'Proceso monitorio');
INSERT INTO cartularium_ops.cliente VALUES (136, 'Sebastián Mora Calderón', '8569-2211', 'sebastian.calderon@example.com', 'Mora Calderón Consultores', 'Abogado', 'Sebastián Mora Calderón', '1-1353-0728', 'FISICA', 'sebastian.calderon@example.com', '8569-2211', 'Estrategia de remate');
INSERT INTO cartularium_ops.cliente VALUES (137, 'Laura Patricia Arias Campos', '8730-6049', 'laura.campos@example.com', 'Arias Campos Legal', 'Abogada litigante', 'Laura Patricia Arias Campos', '2-0753-0876', 'FISICA', 'laura.campos@example.com', '8730-6049', 'Gestión de expedientes');
INSERT INTO cartularium_ops.cliente VALUES (138, 'Óscar Daniel Salas Chacón', '8455-7732', 'oscar.chacons@example.com', 'Salas Chacón Abogados', 'Abogado', 'Óscar Daniel Salas Chacón', '1-1341-0949', 'FISICA', 'oscar.chacons@example.com', '8455-7732', 'Liquidación en remates');
INSERT INTO cartularium_ops.cliente VALUES (139, 'Mariana Porras Esquivel', '8975-3408', 'mariana.esquivelp@example.com', 'Porras Esquivel Consultores', 'Asesora legal', 'Mariana Porras Esquivel', '2-0921-0238', 'FISICA', 'mariana.esquivelp@example.com', '8975-3408', 'Remates y garantías');
INSERT INTO cartularium_ops.cliente VALUES (140, 'Fernando Valverde Cordero', '8839-1195', 'fernando.corderov@example.com', 'Valverde Cordero Legal', 'Abogado', 'Fernando Valverde Cordero', '1-1429-0622', 'FISICA', 'fernando.corderov@example.com', '8839-1195', 'Cobro con garantía real');
INSERT INTO cartularium_ops.cliente VALUES (141, 'Karla Campos Rodríguez', '8998-6212', 'karla.rodriguezc@example.com', 'Campos Rodríguez Abogados', 'Abogada', 'Karla Campos Rodríguez', '1-2001-0521', 'FISICA', 'karla.rodriguezc@example.com', '8998-6212', 'Embargos y remates');
INSERT INTO cartularium_ops.cliente VALUES (142, 'Felipe Andrés Mora Quesada', '8713-5084', 'felipe.quesadam@example.com', 'Mora Quesada Legal', 'Abogado litigante', 'Felipe Andrés Mora Quesada', '1-1891-0475', 'FISICA', 'felipe.quesadam@example.com', '8713-5084', 'Subasta judicial');
INSERT INTO cartularium_ops.cliente VALUES (143, 'Sofía Aguilar Fernández', '8843-5606', 'sofia.fernandeza@example.com', 'Aguilar Fernández Abogados', 'Abogada junior', 'Sofía Aguilar Fernández', '1-1765-0354', 'FISICA', 'sofia.fernandeza@example.com', '8843-5606', 'Remates judiciales');
INSERT INTO cartularium_ops.cliente VALUES (144, 'Roberto Alfaro Vargas', '8999-6128', 'roberto.vargas2@example.com', 'Alfaro Vargas Legal', 'Abogado', 'Roberto Alfaro Vargas', '1-1572-0197', 'FISICA', 'roberto.vargas2@example.com', '8999-6128', 'Adjudicación de bienes');
INSERT INTO cartularium_ops.cliente VALUES (145, 'Carolina Aguilar Méndez', '8728-8035', 'carolina.mendeza@example.com', 'Aguilar Méndez Consultores', 'Abogada litigante', 'Carolina Aguilar Méndez', '2-0868-0192', 'FISICA', 'carolina.mendeza@example.com', '8728-8035', 'Ejecución hipotecaria');
INSERT INTO cartularium_ops.cliente VALUES (146, 'Héctor Jiménez Salazar', '8452-6817', 'hector.jimenezs@example.com', 'Jiménez Salazar Abogados', 'Abogado', 'Jiménez Salazar Abogados S.A.', '3-101-889966', 'JURIDICA', 'facturacion.jimenezsalazar2@example.com', '8452-6817', 'Remate de propiedades');
INSERT INTO cartularium_ops.cliente VALUES (147, 'Patricia Rojas Valverde', '8873-4409', 'patricia.rojas@example.com', 'Rojas Valverde Legal', 'Abogada', 'Patricia Rojas Valverde', '1-1510-0765', 'FISICA', 'patricia.rojas@example.com', '8873-4409', 'Procesos de ejecución');
INSERT INTO cartularium_ops.cliente VALUES (148, 'Adrián Céspedes Molina', '8707-2021', 'adrian.cespedes@example.com', 'Céspedes Molina Abogados', 'Abogado litigante', 'Adrián Céspedes Molina', '1-1666-0331', 'FISICA', 'adrian.cespedes@example.com', '8707-2021', 'Cobro y remate');
INSERT INTO cartularium_ops.cliente VALUES (149, 'Isabel Cristina Mora Pacheco', '8994-1178', 'isabel.mora@example.com', 'Mora Pacheco Consultores', 'Asesora legal', 'Isabel Cristina Mora Pacheco', '2-0786-0905', 'FISICA', 'isabel.mora@example.com', '8994-1178', 'Ejecución judicial');
INSERT INTO cartularium_ops.cliente VALUES (150, 'Gabriela María Rojas Chaves', '8726-4518', 'gabriela.rojasch@example.com', 'Rojas Chaves Notaría', 'Notaria pública', 'Gabriela María Rojas Chaves', '1-2054-0619', 'FISICA', 'gabriela.rojasch@example.com', '8726-4518', 'Ocursos registrales');
INSERT INTO cartularium_ops.cliente VALUES (151, 'Luis Alberto Méndez Vargas', '8896-2144', 'luis.mendezv@example.com', 'Méndez Vargas Abogados', 'Abogado registral', 'Luis Alberto Méndez Vargas', '1-1773-0441', 'FISICA', 'luis.mendezv@example.com', '8896-2144', 'Calificación registral');
INSERT INTO cartularium_ops.cliente VALUES (152, 'María José Alfaro Solís', '8566-7815', 'maria.alfaro@example.com', 'Alfaro Solís Legal', 'Abogada', 'María José Alfaro Solís', '2-0962-0728', 'FISICA', 'maria.alfaro@example.com', '8566-7815', 'Trámite registral');
INSERT INTO cartularium_ops.cliente VALUES (153, 'Carlos Eduardo Porras León', '8979-3318', 'carlos.porras@example.com', 'Porras León Consultores', 'Asesor legal', 'Carlos Eduardo Porras León', '1-1669-0887', 'FISICA', 'carlos.porras@example.com', '8979-3318', 'Presentación de documentos');
INSERT INTO cartularium_ops.cliente VALUES (154, 'Valeria Montero Campos', '8835-5099', 'valeria.montero@example.com', 'Montero Campos Abogados', 'Abogada', 'Montero Campos Abogados S.A.', '3-101-775700', 'JURIDICA', 'facturacion.monterocampos@example.com', '8835-5099', 'Subsanación registral');
INSERT INTO cartularium_ops.cliente VALUES (155, 'Jorge Andrés Castro Núñez', '8708-1192', 'jorge.castro@example.com', 'Castro Núñez Notaría', 'Notario público', 'Jorge Andrés Castro Núñez', '1-1562-0401', 'FISICA', 'jorge.castro@example.com', '8708-1192', 'Defectos registrales');
INSERT INTO cartularium_ops.cliente VALUES (156, 'Daniela Brenes Mora', '8461-9039', 'daniela.brenes@example.com', 'Brenes Mora Legal', 'Abogada junior', 'Daniela Brenes Mora', '1-1444-0990', 'FISICA', 'daniela.brenes@example.com', '8461-9039', 'Calificación formal');
INSERT INTO cartularium_ops.cliente VALUES (157, 'Ricardo Salazar Jiménez', '8993-6720', 'ricardo.salazar@example.com', 'Salazar Jiménez Consultores', 'Abogado', 'Ricardo Salazar Jiménez', '1-1558-0397', 'FISICA', 'ricardo.salazar@example.com', '8993-6720', 'Derecho registral práctico');
INSERT INTO cartularium_ops.cliente VALUES (158, 'María José Vargas Calderón', '8727-4521', 'maria.vargasc@example.com', 'Vargas Calderón Consultores', 'Contadora pública', 'María José Vargas Calderón', '1-2056-0622', 'FISICA', 'maria.vargasc@example.com', '8727-4521', 'Facturación electrónica');
INSERT INTO cartularium_ops.cliente VALUES (159, 'José Andrés Rojas Salas', '8897-2148', 'jose.rojass@example.com', 'Rojas Salas Asesores', 'Asesor tributario', 'José Andrés Rojas Salas', '1-1775-0445', 'FISICA', 'jose.rojass@example.com', '8897-2148', 'Comprobantes electrónicos');
INSERT INTO cartularium_ops.cliente VALUES (160, 'Laura Daniela Méndez Solís', '8567-7818', 'laura.mendezs@example.com', 'Méndez Solís Legal', 'Abogada', 'Laura Daniela Méndez Solís', '2-0964-0731', 'FISICA', 'laura.mendezs@example.com', '8567-7818', 'Obligaciones tributarias');
INSERT INTO cartularium_ops.cliente VALUES (161, 'Carlos Alberto Chaves Mora', '8980-3320', 'carlos.chaves@example.com', 'Chaves Mora Contadores', 'Contador privado', 'Chaves Mora Contadores S.A.', '3-101-775811', 'JURIDICA', 'facturacion.chavesmora@example.com', '8980-3320', 'IVA y facturación');
INSERT INTO cartularium_ops.cliente VALUES (162, 'Natalia Pacheco Araya', '8836-5101', 'natalia.pacheco@example.com', 'Pacheco Araya Consultores', 'Asesora administrativa', 'Natalia Pacheco Araya', '1-1898-0248', 'FISICA', 'natalia.pacheco@example.com', '8836-5101', 'Notas de crédito electrónicas');
INSERT INTO cartularium_ops.cliente VALUES (163, 'Pablo Esteban Alfaro Núñez', '8709-1195', 'pablo.alfaro@example.com', 'Alfaro Núñez Abogados', 'Abogado tributario', 'Pablo Esteban Alfaro Núñez', '1-1564-0405', 'FISICA', 'pablo.alfaro@example.com', '8709-1195', 'Reglamento tributario');
INSERT INTO cartularium_ops.cliente VALUES (164, 'Gabriela Castro León', '8462-9042', 'gabriela.castrol@example.com', 'Castro León Servicios Contables', 'Contadora', 'Castro León Servicios Contables S.R.L.', '3-102-558899', 'JURIDICA', 'facturas.castroleon@example.com', '8462-9042', 'Factura electrónica 4.4');
INSERT INTO cartularium_ops.cliente VALUES (165, 'Ricardo Jiménez Valverde', '8994-6724', 'ricardo.jimenezv@example.com', 'Jiménez Valverde Consultores', 'Asesor financiero', 'Ricardo Jiménez Valverde', '1-1560-0402', 'FISICA', 'ricardo.jimenezv@example.com', '8994-6724', 'Cumplimiento tributario');
INSERT INTO cartularium_ops.cliente VALUES (166, 'Daniela Montero Campos', '8820-6048', 'daniela.monteroc@example.com', 'Montero Campos Legal', 'Abogada', 'Daniela Montero Campos', '2-0828-0176', 'FISICA', 'daniela.monteroc@example.com', '8820-6048', 'Documentos electrónicos');
INSERT INTO cartularium_ops.cliente VALUES (167, 'Jorge Andrés Brenes Soto', '8332-7760', 'jorge.breness@example.com', 'Brenes Soto Asesores', 'Consultor tributario', 'Jorge Andrés Brenes Soto', '1-1784-0325', 'FISICA', 'jorge.breness@example.com', '8332-7760', 'Cambios en facturación');
INSERT INTO cartularium_ops.cliente VALUES (168, 'María Fernanda Castro Rojas', '8728-4524', 'maria.castror@example.com', 'Castro Rojas Notaría', 'Notaria pública', 'María Fernanda Castro Rojas', '1-2058-0625', 'FISICA', 'maria.castror@example.com', '8728-4524', 'Saneamiento registral');
INSERT INTO cartularium_ops.cliente VALUES (169, 'José Daniel Alfaro Méndez', '8898-2151', 'jose.alfaro@example.com', 'Alfaro Méndez Abogados', 'Abogado registral', 'José Daniel Alfaro Méndez', '1-1777-0448', 'FISICA', 'jose.alfaro@example.com', '8898-2151', 'Corrección registral');
INSERT INTO cartularium_ops.cliente VALUES (170, 'Laura Valeria Chaves Solís', '8568-7821', 'laura.chavess@example.com', 'Chaves Solís Legal', 'Abogada', 'Laura Valeria Chaves Solís', '2-0966-0734', 'FISICA', 'laura.chavess@example.com', '8568-7821', 'Rectificación de inscripciones');
INSERT INTO cartularium_ops.cliente VALUES (171, 'Carlos Andrés Porras Mora', '8981-3323', 'carlos.porrasm@example.com', 'Porras Mora Consultores', 'Asesor legal', 'Carlos Andrés Porras Mora', '1-1671-0890', 'FISICA', 'carlos.porrasm@example.com', '8981-3323', 'Derecho inmobiliario');
INSERT INTO cartularium_ops.cliente VALUES (172, 'Natalia Jiménez Araya', '8837-5104', 'natalia.jimeneza@example.com', 'Jiménez Araya Abogados', 'Abogada', 'Jiménez Araya Abogados S.A.', '3-101-775922', 'JURIDICA', 'facturacion.jimenezaraya@example.com', '8837-5104', 'Saneamiento de propiedades');
INSERT INTO cartularium_ops.cliente VALUES (173, 'Pablo Esteban Vargas Núñez', '8710-1198', 'pablo.vargasn@example.com', 'Vargas Núñez Notaría', 'Notario público', 'Pablo Esteban Vargas Núñez', '1-1566-0409', 'FISICA', 'pablo.vargasn@example.com', '8710-1198', 'Calificación registral');
INSERT INTO cartularium_ops.cliente VALUES (174, 'Gabriela Brenes León', '8463-9045', 'gabriela.brenesl@example.com', 'Brenes León Legal', 'Abogada junior', 'Gabriela Brenes León', '1-1446-0993', 'FISICA', 'gabriela.brenesl@example.com', '8463-9045', 'Trámites registrales');
INSERT INTO cartularium_ops.cliente VALUES (175, 'María Fernanda Araya Solano', '8729-4530', 'maria.araya@example.com', 'Araya Solano Abogados', 'Abogada litigante', 'María Fernanda Araya Solano', '1-2060-0630', 'FISICA', 'maria.araya@example.com', '8729-4530', 'Cobro judicial avanzado');
INSERT INTO cartularium_ops.cliente VALUES (176, 'José Pablo Vargas León', '8899-2160', 'jose.vargasl@example.com', 'Vargas León Legal', 'Abogado', 'José Pablo Vargas León', '1-1780-0450', 'FISICA', 'jose.vargasl@example.com', '8899-2160', 'Procesos ejecutivos');
INSERT INTO cartularium_ops.cliente VALUES (177, 'Laura Daniela Salas Mora', '8569-7825', 'laura.salas@example.com', 'Salas Mora Consultores', 'Asesora legal', 'Laura Daniela Salas Mora', '2-0968-0738', 'FISICA', 'laura.salas@example.com', '8569-7825', 'Embargos');
INSERT INTO cartularium_ops.cliente VALUES (178, 'Carlos Eduardo Brenes Soto', '8982-3327', 'carlos.breness@example.com', 'Brenes Soto Abogados', 'Abogado litigante', 'Brenes Soto Abogados S.A.', '3-101-776033', 'JURIDICA', 'facturacion.brenessoto@example.com', '8982-3327', 'Estrategia procesal');
INSERT INTO cartularium_ops.cliente VALUES (179, 'Natalia Jiménez Pacheco', '8838-5108', 'natalia.pachecoj@example.com', 'Jiménez Pacheco Legal', 'Abogada', 'Natalia Jiménez Pacheco', '1-1900-0252', 'FISICA', 'natalia.pachecoj@example.com', '8838-5108', 'Cobro de obligaciones');
INSERT INTO cartularium_ops.cliente VALUES (180, 'Pablo Esteban Chaves Núñez', '8711-1202', 'pablo.chaves@example.com', 'Chaves Núñez Abogados', 'Abogado', 'Pablo Esteban Chaves Núñez', '1-1568-0412', 'FISICA', 'pablo.chaves@example.com', '8711-1202', 'Ejecución de garantías');
INSERT INTO cartularium_ops.cliente VALUES (181, 'Gabriela Castro Montero', '8464-9048', 'gabriela.castrom@example.com', 'Castro Montero Consultoría Legal', 'Abogada', 'Gabriela Castro Montero', '1-1448-0996', 'FISICA', 'gabriela.castrom@example.com', '8464-9048', 'Procesos monitorios');
INSERT INTO cartularium_ops.cliente VALUES (182, 'Ricardo Jiménez Calderón', '8995-6728', 'ricardo.calderon@example.com', 'Jiménez Calderón Abogados', 'Abogado litigante', 'Jiménez Calderón Abogados S.R.L.', '3-102-446011', 'JURIDICA', 'facturas.jimenezcalderon@example.com', '8995-6728', 'Cobro hipotecario');
INSERT INTO cartularium_ops.cliente VALUES (183, 'Daniela Montero Rojas', '8821-6052', 'daniela.rojasm@example.com', 'Montero Rojas Legal', 'Abogada junior', 'Daniela Montero Rojas', '2-0830-0180', 'FISICA', 'daniela.rojasm@example.com', '8821-6052', 'Títulos ejecutivos');
INSERT INTO cartularium_ops.cliente VALUES (184, 'Jorge Andrés Brenes Campos', '8333-7764', 'jorge.camposb@example.com', 'Brenes Campos Consultores', 'Asesor jurídico', 'Jorge Andrés Brenes Campos', '1-1786-0329', 'FISICA', 'jorge.camposb@example.com', '8333-7764', 'Medidas cautelares');
INSERT INTO cartularium_ops.cliente VALUES (185, 'Camila Hidalgo Alfaro', '8798-3025', 'camila.alfaro@example.com', 'Hidalgo Alfaro Abogados', 'Abogada', 'Camila Hidalgo Alfaro', '1-1914-0551', 'FISICA', 'camila.alfaro@example.com', '8798-3025', 'Cobro judicial práctico');
INSERT INTO cartularium_ops.cliente VALUES (186, 'Mauricio Fallas Valverde', '8850-2298', 'mauricio.valverde@example.com', 'Fallas Valverde Legal', 'Abogado litigante', 'Mauricio Fallas Valverde', '1-1233-0693', 'FISICA', 'mauricio.valverde@example.com', '8850-2298', 'Gestión de cartera');
INSERT INTO cartularium_ops.cliente VALUES (187, 'Valentina Rojas Brenes', '8906-7822', 'valentina.brenes@example.com', 'Rojas Brenes Abogados', 'Abogada', 'Rojas Brenes Abogados S.A.', '3-101-668022', 'JURIDICA', 'facturas.rojasbrenes@example.com', '8906-7822', 'Procesos cobratorios');
INSERT INTO cartularium_ops.cliente VALUES (188, 'Sebastián Mora Salazar', '8570-2215', 'sebastian.salazar@example.com', 'Mora Salazar Consultores', 'Abogado', 'Sebastián Mora Salazar', '1-1355-0732', 'FISICA', 'sebastian.salazar@example.com', '8570-2215', 'Liquidación de intereses');
INSERT INTO cartularium_ops.cliente VALUES (189, 'Laura Patricia Arias Porras', '8731-6051', 'laura.porras@example.com', 'Arias Porras Legal', 'Abogada litigante', 'Laura Patricia Arias Porras', '2-0755-0880', 'FISICA', 'laura.porras@example.com', '8731-6051', 'Ejecución civil');
INSERT INTO cartularium_ops.cliente VALUES (190, 'Óscar Daniel Chacón Vargas', '8456-7736', 'oscar.vargas@example.com', 'Chacón Vargas Abogados', 'Abogado', 'Óscar Daniel Chacón Vargas', '1-1343-0952', 'FISICA', 'oscar.vargas@example.com', '8456-7736', 'Cobro de pagarés');
INSERT INTO cartularium_ops.cliente VALUES (191, 'Mariana Porras Alfaro', '8976-3412', 'mariana.alfaro@example.com', 'Porras Alfaro Consultores', 'Asesora legal', 'Mariana Porras Alfaro', '2-0923-0242', 'FISICA', 'mariana.alfaro@example.com', '8976-3412', 'Cobro mercantil');
INSERT INTO cartularium_ops.cliente VALUES (192, 'Fernando Valverde Solano', '8840-1199', 'fernando.solano@example.com', 'Valverde Solano Legal', 'Abogado', 'Fernando Valverde Solano', '1-1431-0626', 'FISICA', 'fernando.solano@example.com', '8840-1199', 'Ejecución prendaria');
INSERT INTO cartularium_ops.cliente VALUES (193, 'Karla Campos Mora', '8999-6216', 'karla.mora@example.com', 'Campos Mora Abogados', 'Abogada', 'Karla Campos Mora', '1-2003-0525', 'FISICA', 'karla.mora@example.com', '8999-6216', 'Recuperación judicial');
INSERT INTO cartularium_ops.cliente VALUES (194, 'Felipe Andrés Quesada Soto', '8714-5088', 'felipe.soto@example.com', 'Quesada Soto Legal', 'Abogado litigante', 'Felipe Andrés Quesada Soto', '1-1893-0479', 'FISICA', 'felipe.soto@example.com', '8714-5088', 'Cobro judicial estratégico');
INSERT INTO cartularium_ops.cliente VALUES (195, 'Sofía Fernández Valverde', '8844-5610', 'sofia.valverdef@example.com', 'Fernández Valverde Abogados', 'Abogada junior', 'Sofía Fernández Valverde', '1-1767-0358', 'FISICA', 'sofia.valverdef@example.com', '8844-5610', 'Procesos de ejecución');
INSERT INTO cartularium_ops.cliente VALUES (196, 'Roberto Alfaro Méndez', '8998-6132', 'roberto.mendez@example.com', 'Alfaro Méndez Legal', 'Abogado', 'Roberto Alfaro Méndez', '1-1574-0201', 'FISICA', 'roberto.mendez@example.com', '8998-6132', 'Cobro con garantía real');
INSERT INTO cartularium_ops.cliente VALUES (197, 'Carolina Aguilar Soto', '8729-8039', 'carolina.soto@example.com', 'Aguilar Soto Consultores', 'Abogada litigante', 'Carolina Aguilar Soto', '2-0870-0196', 'FISICA', 'carolina.soto@example.com', '8729-8039', 'Audiencias en cobro judicial');
INSERT INTO cartularium_ops.cliente VALUES (198, 'Héctor Jiménez Rojas', '8453-6821', 'hector.rojasj@example.com', 'Jiménez Rojas Abogados', 'Abogado', 'Jiménez Rojas Abogados S.A.', '3-101-889977', 'JURIDICA', 'facturacion.jimenezrojas@example.com', '8453-6821', 'Embargos y remates');
INSERT INTO cartularium_ops.cliente VALUES (199, 'Patricia Rojas Mora', '8874-4413', 'patricia.mora@example.com', 'Rojas Mora Legal', 'Abogada', 'Patricia Rojas Mora', '1-1512-0769', 'FISICA', 'patricia.mora@example.com', '8874-4413', 'Cobro ejecutivo');
INSERT INTO cartularium_ops.cliente VALUES (200, 'Adrián Céspedes Vargas', '8708-2025', 'adrian.vargas@example.com', 'Céspedes Vargas Abogados', 'Abogado litigante', 'Adrián Céspedes Vargas', '1-1668-0335', 'FISICA', 'adrian.vargas@example.com', '8708-2025', 'Cobro de deudas');
INSERT INTO cartularium_ops.cliente VALUES (201, 'Isabel Cristina Mora León', '8995-1182', 'isabel.leon@example.com', 'Mora León Consultores', 'Asesora legal', 'Isabel Cristina Mora León', '2-0788-0909', 'FISICA', 'isabel.leon@example.com', '8995-1182', 'Estrategias de recuperación');
INSERT INTO cartularium_ops.cliente VALUES (202, 'Tomás Andrés Salas Cordero', '8571-4434', 'tomas.salas@example.com', 'Salas Cordero Legal', 'Abogado', 'Tomás Andrés Salas Cordero', '1-1848-0294', 'FISICA', 'tomas.salas@example.com', '8571-4434', 'Cobro de honorarios');
INSERT INTO cartularium_ops.cliente VALUES (203, 'Marcela Jiménez Porras', '8836-7606', 'marcela.porras@example.com', 'Jiménez Porras Abogados', 'Abogada litigante', 'Jiménez Porras Abogados S.R.L.', '3-102-774499', 'JURIDICA', 'facturas.jimenezporras@example.com', '8836-7606', 'Cobro judicial y conciliación');
INSERT INTO cartularium_ops.cliente VALUES (204, 'Rodrigo Salas Brenes', '8726-6093', 'rodrigo.brenes@example.com', 'Salas Brenes Consultores', 'Asesor jurídico', 'Rodrigo Salas Brenes', '1-1218-0673', 'FISICA', 'rodrigo.brenes@example.com', '8726-6093', 'Procesos cobratorios');
INSERT INTO cartularium_ops.cliente VALUES (205, 'Elena Sofía Brenes Rojas', '8891-2310', 'elena.rojasb@example.com', 'Brenes Rojas Legal', 'Abogada', 'Elena Sofía Brenes Rojas', '1-1984-0558', 'FISICA', 'elena.rojasb@example.com', '8891-2310', 'Actualización en cobro judicial');
INSERT INTO cartularium_ops.cliente VALUES (206, 'María Fernanda Chaves Mora', '8729-4540', 'maria.chaves@example.com', 'Chaves Mora Abogados', 'Abogada litigante', 'María Fernanda Chaves Mora', '1-2062-0634', 'FISICA', 'maria.chaves@example.com', '8729-4540', 'Notificaciones judiciales');
INSERT INTO cartularium_ops.cliente VALUES (207, 'José Daniel Rojas Vargas', '8899-2170', 'jose.rojasv@example.com', 'Rojas Vargas Legal', 'Abogado', 'José Daniel Rojas Vargas', '1-1782-0454', 'FISICA', 'jose.rojasv@example.com', '8899-2170', 'Notificación personal');
INSERT INTO cartularium_ops.cliente VALUES (208, 'Laura Daniela Brenes Salas', '8570-7829', 'laura.brenes@example.com', 'Brenes Salas Consultores', 'Asesora legal', 'Laura Daniela Brenes Salas', '2-0970-0742', 'FISICA', 'laura.brenes@example.com', '8570-7829', 'Notificaciones notariales');
INSERT INTO cartularium_ops.cliente VALUES (209, 'Carlos Eduardo Mora Soto', '8983-3331', 'carlos.moras@example.com', 'Mora Soto Abogados', 'Abogado litigante', 'Mora Soto Abogados S.A.', '3-101-776144', 'JURIDICA', 'facturacion.morasoto@example.com', '8983-3331', 'Cómputo de plazos');
INSERT INTO cartularium_ops.cliente VALUES (210, 'Natalia Jiménez Alfaro', '8839-5112', 'natalia.alfaro@example.com', 'Jiménez Alfaro Legal', 'Abogada', 'Natalia Jiménez Alfaro', '1-1902-0256', 'FISICA', 'natalia.alfaro@example.com', '8839-5112', 'Nulidad de notificaciones');
INSERT INTO cartularium_ops.cliente VALUES (211, 'Pablo Esteban Cordero Núñez', '8712-1206', 'pablo.cordero@example.com', 'Cordero Núñez Abogados', 'Abogado', 'Pablo Esteban Cordero Núñez', '1-1570-0416', 'FISICA', 'pablo.cordero@example.com', '8712-1206', 'Notificación por edictos');
INSERT INTO cartularium_ops.cliente VALUES (212, 'Gabriela Castro Pacheco', '8465-9052', 'gabriela.pacheco@example.com', 'Castro Pacheco Consultoría Legal', 'Abogada', 'Gabriela Castro Pacheco', '1-1450-1000', 'FISICA', 'gabriela.pacheco@example.com', '8465-9052', 'Actas notariales');
INSERT INTO cartularium_ops.cliente VALUES (213, 'Ricardo Jiménez Valverde', '8996-6732', 'ricardo.valverde@example.com', 'Jiménez Valverde Abogados', 'Abogado litigante', 'Jiménez Valverde Abogados S.R.L.', '3-102-446122', 'JURIDICA', 'facturas.jimenezv@example.com', '8996-6732', 'Comunicación judicial');
INSERT INTO cartularium_ops.cliente VALUES (214, 'Daniela Montero Solano', '8822-6056', 'daniela.solano@example.com', 'Montero Solano Legal', 'Abogada junior', 'Daniela Montero Solano', '2-0832-0184', 'FISICA', 'daniela.solano@example.com', '8822-6056', 'Notificación notarial');
INSERT INTO cartularium_ops.cliente VALUES (215, 'Jorge Andrés Brenes Porras', '8334-7768', 'jorge.porras@example.com', 'Brenes Porras Consultores', 'Asesor jurídico', 'Jorge Andrés Brenes Porras', '1-1788-0333', 'FISICA', 'jorge.porras@example.com', '8334-7768', 'Archivo de referencias');
INSERT INTO cartularium_ops.cliente VALUES (216, 'Camila Hidalgo Rojas', '8799-3029', 'camila.rojas@example.com', 'Hidalgo Rojas Abogados', 'Abogada', 'Camila Hidalgo Rojas', '1-1916-0555', 'FISICA', 'camila.rojas@example.com', '8799-3029', 'Notificaciones en procesos judiciales');
INSERT INTO cartularium_ops.cliente VALUES (217, 'Mauricio Fallas Méndez', '8851-2302', 'mauricio.mendez@example.com', 'Fallas Méndez Legal', 'Abogado litigante', 'Mauricio Fallas Méndez', '1-1235-0697', 'FISICA', 'mauricio.mendez@example.com', '8851-2302', 'Formato de acta notarial');
INSERT INTO cartularium_ops.cliente VALUES (218, 'Valentina Rojas Campos', '8907-7826', 'valentina.campos@example.com', 'Rojas Campos Abogados', 'Abogada', 'Rojas Campos Abogados S.A.', '3-101-668133', 'JURIDICA', 'facturas.rojascampos@example.com', '8907-7826', 'Formato de notificación');
INSERT INTO cartularium_ops.cliente VALUES (219, 'Sebastián Mora Quesada', '8571-2219', 'sebastian.quesada@example.com', 'Mora Quesada Consultores', 'Abogado', 'Sebastián Mora Quesada', '1-1357-0736', 'FISICA', 'sebastian.quesada@example.com', '8571-2219', 'Casos reales');
INSERT INTO cartularium_ops.cliente VALUES (220, 'Laura Patricia Arias Castro', '8732-6055', 'laura.castro@example.com', 'Arias Castro Legal', 'Abogada litigante', 'Laura Patricia Arias Castro', '2-0757-0884', 'FISICA', 'laura.castro@example.com', '8732-6055', 'Resoluciones notificables');
INSERT INTO cartularium_ops.cliente VALUES (221, 'Óscar Daniel Chacón Pineda', '8457-7740', 'oscar.pineda@example.com', 'Chacón Pineda Abogados', 'Abogado', 'Óscar Daniel Chacón Pineda', '1-1345-0956', 'FISICA', 'oscar.pineda@example.com', '8457-7740', 'Notificación personal');
INSERT INTO cartularium_ops.cliente VALUES (222, 'Mariana Porras Vargas', '8977-3416', 'mariana.vargas@example.com', 'Porras Vargas Consultores', 'Asesora legal', 'Mariana Porras Vargas', '2-0925-0246', 'FISICA', 'mariana.vargas@example.com', '8977-3416', 'Nulidad procesal');
INSERT INTO cartularium_ops.cliente VALUES (223, 'Fernando Valverde Mora', '8841-1203', 'fernando.mora@example.com', 'Valverde Mora Legal', 'Abogado', 'Fernando Valverde Mora', '1-1433-0630', 'FISICA', 'fernando.mora@example.com', '8841-1203', 'Notificación judicial');
INSERT INTO cartularium_ops.cliente VALUES (224, 'Karla Campos Brenes', '8998-6220', 'karla.brenes@example.com', 'Campos Brenes Abogados', 'Abogada', 'Karla Campos Brenes', '1-2005-0529', 'FISICA', 'karla.brenes@example.com', '8998-6220', 'Notificación notarial en procesos');
INSERT INTO cartularium_ops.cliente VALUES (225, 'Felipe Andrés Quesada Alfaro', '8715-5092', 'felipe.alfaro@example.com', 'Quesada Alfaro Legal', 'Abogado litigante', 'Felipe Andrés Quesada Alfaro', '1-1895-0483', 'FISICA', 'felipe.alfaro@example.com', '8715-5092', 'Actas notariales');
INSERT INTO cartularium_ops.cliente VALUES (226, 'Sofía Fernández Solís', '8845-5614', 'sofia.solis@example.com', 'Fernández Solís Abogados', 'Abogada junior', 'Sofía Fernández Solís', '1-1769-0362', 'FISICA', 'sofia.solis@example.com', '8845-5614', 'Notificaciones y plazos');
INSERT INTO cartularium_ops.cliente VALUES (227, 'Roberto Alfaro Cordero', '8999-6136', 'roberto.cordero@example.com', 'Alfaro Cordero Legal', 'Abogado', 'Roberto Alfaro Cordero', '1-1576-0205', 'FISICA', 'roberto.cordero@example.com', '8999-6136', 'Comunicación judicial del acta');
INSERT INTO cartularium_ops.cliente VALUES (228, 'Carolina Aguilar Vargas', '8730-8043', 'carolina.vargas@example.com', 'Aguilar Vargas Consultores', 'Abogada litigante', 'Carolina Aguilar Vargas', '2-0872-0200', 'FISICA', 'carolina.vargas@example.com', '8730-8043', 'Notificación por edictos');
INSERT INTO cartularium_ops.cliente VALUES (229, 'Héctor Jiménez Brenes', '8454-6825', 'hector.brenes@example.com', 'Jiménez Brenes Abogados', 'Abogado', 'Jiménez Brenes Abogados S.A.', '3-101-889988', 'JURIDICA', 'facturacion.jimenezb@example.com', '8454-6825', 'Notificaciones judiciales y notariales');
INSERT INTO cartularium_ops.cliente VALUES (230, 'Patricia Rojas Salas', '8875-4417', 'patricia.salas@example.com', 'Rojas Salas Legal', 'Abogada', 'Patricia Rojas Salas', '1-1514-0773', 'FISICA', 'patricia.salas@example.com', '8875-4417', 'Análisis de casos reales');
INSERT INTO cartularium_ops.cliente VALUES (231, 'María Fernanda Solís Calderón', '8729-4550', 'maria.solisc@example.com', 'Solís Calderón Abogados', 'Abogada litigante', 'María Fernanda Solís Calderón', '1-2064-0638', 'FISICA', 'maria.solisc@example.com', '8729-4550', 'Sucesión judicial');
INSERT INTO cartularium_ops.cliente VALUES (232, 'José Daniel Araya Vargas', '8899-2180', 'jose.arayav@example.com', 'Araya Vargas Legal', 'Abogado', 'José Daniel Araya Vargas', '1-1784-0458', 'FISICA', 'jose.arayav@example.com', '8899-2180', 'Sucesión notarial');
INSERT INTO cartularium_ops.cliente VALUES (233, 'Laura Daniela Rojas Brenes', '8570-7833', 'laura.rojasb@example.com', 'Rojas Brenes Consultores', 'Asesora legal', 'Laura Daniela Rojas Brenes', '2-0972-0746', 'FISICA', 'laura.rojasb@example.com', '8570-7833', 'Declaratoria de herederos');
INSERT INTO cartularium_ops.cliente VALUES (234, 'Carlos Eduardo Mora Chaves', '8983-3335', 'carlos.morac@example.com', 'Mora Chaves Abogados', 'Abogado litigante', 'Mora Chaves Abogados S.A.', '3-101-776255', 'JURIDICA', 'facturacion.morachaves@example.com', '8983-3335', 'Testamentos');
INSERT INTO cartularium_ops.cliente VALUES (235, 'Natalia Jiménez Castro', '8839-5116', 'natalia.castroj@example.com', 'Jiménez Castro Legal', 'Abogada', 'Natalia Jiménez Castro', '1-1904-0260', 'FISICA', 'natalia.castroj@example.com', '8839-5116', 'Albaceazgo');
INSERT INTO cartularium_ops.cliente VALUES (236, 'Pablo Esteban Cordero Salas', '8712-1210', 'pablo.salasc@example.com', 'Cordero Salas Abogados', 'Abogado', 'Pablo Esteban Cordero Salas', '1-1572-0420', 'FISICA', 'pablo.salasc@example.com', '8712-1210', 'Partición hereditaria');
INSERT INTO cartularium_ops.cliente VALUES (237, 'Gabriela Castro Méndez', '8465-9056', 'gabriela.mendezc@example.com', 'Castro Méndez Consultoría Legal', 'Abogada', 'Gabriela Castro Méndez', '1-1452-1004', 'FISICA', 'gabriela.mendezc@example.com', '8465-9056', 'Proceso sucesorio');
INSERT INTO cartularium_ops.cliente VALUES (238, 'Ricardo Jiménez Porras', '8996-6736', 'ricardo.porrasj@example.com', 'Jiménez Porras Abogados', 'Abogado litigante', 'Jiménez Porras Abogados S.R.L.', '3-102-446233', 'JURIDICA', 'facturas.jimenezporras2@example.com', '8996-6736', 'Herencias');
INSERT INTO cartularium_ops.cliente VALUES (239, 'Daniela Montero Alfaro', '8822-6060', 'daniela.alfarom@example.com', 'Montero Alfaro Legal', 'Abogada junior', 'Daniela Montero Alfaro', '2-0834-0188', 'FISICA', 'daniela.alfarom@example.com', '8822-6060', 'Sucesión intestada');
INSERT INTO cartularium_ops.cliente VALUES (240, 'Jorge Andrés Brenes Rojas', '8334-7772', 'jorge.rojasb@example.com', 'Brenes Rojas Consultores', 'Asesor jurídico', 'Jorge Andrés Brenes Rojas', '1-1790-0337', 'FISICA', 'jorge.rojasb@example.com', '8334-7772', 'Trámite sucesorio');
INSERT INTO cartularium_ops.cliente VALUES (241, 'Camila Hidalgo Mora', '8799-3033', 'camila.hidalgom@example.com', 'Hidalgo Mora Abogados', 'Abogada', 'Camila Hidalgo Mora', '1-1918-0559', 'FISICA', 'camila.hidalgom@example.com', '8799-3033', 'Derecho sucesorio');
INSERT INTO cartularium_ops.cliente VALUES (242, 'Mauricio Fallas Alfaro', '8851-2306', 'mauricio.alfaro@example.com', 'Fallas Alfaro Legal', 'Abogado litigante', 'Mauricio Fallas Alfaro', '1-1237-0701', 'FISICA', 'mauricio.alfaro@example.com', '8851-2306', 'Inventario de bienes');
INSERT INTO cartularium_ops.cliente VALUES (243, 'Valentina Rojas Pineda', '8907-7830', 'valentina.pineda@example.com', 'Rojas Pineda Abogados', 'Abogada', 'Rojas Pineda Abogados S.A.', '3-101-668244', 'JURIDICA', 'facturas.rojaspineda@example.com', '8907-7830', 'Sucesión judicial y notarial');
INSERT INTO cartularium_ops.cliente VALUES (244, 'Sebastián Mora Valverde', '8571-2223', 'sebastian.valverde@example.com', 'Mora Valverde Consultores', 'Abogado', 'Sebastián Mora Valverde', '1-1359-0740', 'FISICA', 'sebastian.valverde@example.com', '8571-2223', 'Adjudicación hereditaria');
INSERT INTO cartularium_ops.cliente VALUES (245, 'Laura Patricia Arias Jiménez', '8732-6059', 'laura.jimeneza@example.com', 'Arias Jiménez Legal', 'Abogada litigante', 'Laura Patricia Arias Jiménez', '2-0759-0888', 'FISICA', 'laura.jimeneza@example.com', '8732-6059', 'Testamento y herederos');
INSERT INTO cartularium_ops.cliente VALUES (246, 'Óscar Daniel Chacón Solís', '8457-7744', 'oscar.solisc@example.com', 'Chacón Solís Abogados', 'Abogado', 'Óscar Daniel Chacón Solís', '1-1347-0960', 'FISICA', 'oscar.solisc@example.com', '8457-7744', 'Aceptación de herencia');
INSERT INTO cartularium_ops.cliente VALUES (247, 'Mariana Porras Chaves', '8977-3420', 'mariana.chavesp@example.com', 'Porras Chaves Consultores', 'Asesora legal', 'Mariana Porras Chaves', '2-0927-0250', 'FISICA', 'mariana.chavesp@example.com', '8977-3420', 'Herederos legales');
INSERT INTO cartularium_ops.cliente VALUES (248, 'Fernando Valverde Castro', '8841-1207', 'fernando.castrov@example.com', 'Valverde Castro Legal', 'Abogado', 'Fernando Valverde Castro', '1-1435-0634', 'FISICA', 'fernando.castrov@example.com', '8841-1207', 'Sucesión testamentaria');
INSERT INTO cartularium_ops.cliente VALUES (249, 'Karla Campos Solano', '8998-6224', 'karla.solanoc@example.com', 'Campos Solano Abogados', 'Abogada', 'Karla Campos Solano', '1-2007-0533', 'FISICA', 'karla.solanoc@example.com', '8998-6224', 'Partición de bienes');
INSERT INTO cartularium_ops.cliente VALUES (250, 'Felipe Andrés Quesada Brenes', '8715-5096', 'felipe.brenesq@example.com', 'Quesada Brenes Legal', 'Abogado litigante', 'Felipe Andrés Quesada Brenes', '1-1897-0487', 'FISICA', 'felipe.brenesq@example.com', '8715-5096', 'Albacea testamentario');
INSERT INTO cartularium_ops.cliente VALUES (251, 'Sofía Fernández Vargas', '8845-5618', 'sofia.vargasf@example.com', 'Fernández Vargas Abogados', 'Abogada junior', 'Sofía Fernández Vargas', '1-1771-0366', 'FISICA', 'sofia.vargasf@example.com', '8845-5618', 'Trámite notarial sucesorio');
INSERT INTO cartularium_ops.cliente VALUES (252, 'Roberto Alfaro Salazar', '8999-6140', 'roberto.salazara@example.com', 'Alfaro Salazar Legal', 'Abogado', 'Roberto Alfaro Salazar', '1-1578-0209', 'FISICA', 'roberto.salazara@example.com', '8999-6140', 'Bienes hereditarios');
INSERT INTO cartularium_ops.cliente VALUES (253, 'Carolina Aguilar Pacheco', '8730-8047', 'carolina.pacheco@example.com', 'Aguilar Pacheco Consultores', 'Abogada litigante', 'Carolina Aguilar Pacheco', '2-0874-0204', 'FISICA', 'carolina.pacheco@example.com', '8730-8047', 'Declaratoria de herederos');
INSERT INTO cartularium_ops.cliente VALUES (254, 'Héctor Jiménez Mora', '8454-6829', 'hector.moraj@example.com', 'Jiménez Mora Abogados', 'Abogado', 'Jiménez Mora Abogados S.A.', '3-101-889999', 'JURIDICA', 'facturacion.jimenezmora@example.com', '8454-6829', 'Sucesión judicial');
INSERT INTO cartularium_ops.cliente VALUES (255, 'Patricia Rojas Brenes', '8875-4421', 'patricia.brenesr@example.com', 'Rojas Brenes Legal', 'Abogada', 'Patricia Rojas Brenes', '1-1516-0777', 'FISICA', 'patricia.brenesr@example.com', '8875-4421', 'Derecho notarial');
INSERT INTO cartularium_ops.cliente VALUES (256, 'Adrián Céspedes Rojas', '8709-2029', 'adrian.rojasc@example.com', 'Céspedes Rojas Abogados', 'Abogado litigante', 'Adrián Céspedes Rojas', '1-1670-0339', 'FISICA', 'adrian.rojasc@example.com', '8709-2029', 'Sucesión notarial');
INSERT INTO cartularium_ops.cliente VALUES (257, 'Isabel Cristina Mora Vargas', '8995-1186', 'isabel.vargasm@example.com', 'Mora Vargas Consultores', 'Asesora legal', 'Isabel Cristina Mora Vargas', '2-0790-0913', 'FISICA', 'isabel.vargasm@example.com', '8995-1186', 'Procesos sucesorios');
INSERT INTO cartularium_ops.cliente VALUES (258, 'Tomás Andrés Salas Jiménez', '8571-4438', 'tomas.jimenezs@example.com', 'Salas Jiménez Legal', 'Abogado', 'Tomás Andrés Salas Jiménez', '1-1850-0298', 'FISICA', 'tomas.jimenezs@example.com', '8571-4438', 'Testamentos y herencias');
INSERT INTO cartularium_ops.cliente VALUES (259, 'Marcela Jiménez Alfaro', '8836-7610', 'marcela.alfaroj@example.com', 'Jiménez Alfaro Abogados', 'Abogada litigante', 'Jiménez Alfaro Abogados S.R.L.', '3-102-774500', 'JURIDICA', 'facturas.jimenezalfaro@example.com', '8836-7610', 'Sucesión judicial y notarial');
INSERT INTO cartularium_ops.cliente VALUES (260, 'Rodrigo Salas Montero', '8726-6097', 'rodrigo.monteros@example.com', 'Salas Montero Consultores', 'Asesor jurídico', 'Rodrigo Salas Montero', '1-1220-0677', 'FISICA', 'rodrigo.monteros@example.com', '8726-6097', 'Albaceazgo y partición');


--
-- TOC entry 5103 (class 0 OID 17598)
-- Dependencies: 221
-- Data for Name: curso; Type: TABLE DATA; Schema: cartularium_ops; Owner: -
--

INSERT INTO cartularium_ops.curso VALUES (1, 'CÓMO NEGOCIAR UN PROCESO DE EJECUCIÓN SIN CAER EN UN PACTO COMISORIO', 'Seminario virtual sobre negociación en procesos de ejecución y prevención del pacto comisorio.', 'Derecho procesal', true);
INSERT INTO cartularium_ops.curso VALUES (2, 'DESCUBRE LAS 10 INCÓGNITAS MÁS FRECUENTES EN EL DERECHO SUCESORIO', 'Seminario virtual sobre consultas frecuentes en materia de derecho sucesorio.', 'Derecho sucesorio', true);
INSERT INTO cartularium_ops.curso VALUES (3, 'CONOCE SOBRE EL DERECHO DE ARRENDAMIENTO Y EVITA ERRORES COSTOSOS', 'Seminario virtual sobre aspectos legales del arrendamiento y prevención de errores frecuentes.', 'Derecho de arrendamientos', true);
INSERT INTO cartularium_ops.curso VALUES (4, 'APLICACIÓN DE LA INTELIGENCIA ARTIFICIAL EN EL NOTARIADO COSTARRICENSE', 'Seminario virtual sobre el uso de inteligencia artificial en la práctica notarial costarricense.', 'Derecho notarial y tecnología', true);
INSERT INTO cartularium_ops.curso VALUES (5, 'DOMINA EL COBRO JUDICIAL Y MAXIMIZA EL ÉXITO EN TUS PROCESOS', 'Seminario virtual sobre estrategias para la gestión efectiva de procesos de cobro judicial.', 'Cobro judicial', true);
INSERT INTO cartularium_ops.curso VALUES (6, 'APRENDE DE LOS REMATES JUDICIALES Y ASEGURA EL MEJOR RESULTADO', 'Seminario virtual sobre remates judiciales, participación estratégica y prevención de errores en el proceso.', 'Remates judiciales', true);
INSERT INTO cartularium_ops.curso VALUES (7, 'PROCEDIMIENTO DE PRESENTACIÓN DE UN OCURSO REGISTRAL Y CALIFICACIÓN REGISTRAL FORMAL', 'Seminario virtual sobre presentación de ocursos registrales y criterios de calificación formal en materia registral.', 'Derecho registral', true);
INSERT INTO cartularium_ops.curso VALUES (8, 'APLICACIÓN DE CAMBIOS DEL REGLAMENTO DE FACTURACIÓN ELECTRÓNICA', 'Seminario virtual sobre los principales cambios del reglamento de facturación electrónica y su aplicación práctica.', 'Facturación electrónica', true);
INSERT INTO cartularium_ops.curso VALUES (9, 'SANEAMIENTO REGISTRAL', 'Seminario virtual sobre saneamiento registral y corrección de situaciones jurídicas en bienes inscritos.', 'Derecho registral', true);
INSERT INTO cartularium_ops.curso VALUES (10, 'COBRO JUDICIAL: ACTUALIZACIÓN Y ESTRATEGIA', 'Seminario virtual sobre actualización normativa, estrategia procesal y buenas prácticas en procesos de cobro judicial.', 'Cobro judicial', true);
INSERT INTO cartularium_ops.curso VALUES (11, 'NOTIFICACIONES JUDICIALES Y NOTARIALES', 'Seminario virtual de dos sesiones sobre notificaciones judiciales y notificaciones notariales.', 'Derecho procesal y notarial', true);
INSERT INTO cartularium_ops.curso VALUES (12, 'SUCESIÓN JUDICIAL Y NOTARIAL', 'Seminario virtual de dos sesiones sobre sucesión judicial y sucesión notarial.', 'Derecho sucesorio y notarial', true);


--
-- TOC entry 5107 (class 0 OID 17624)
-- Dependencies: 225
-- Data for Name: edicion_curso; Type: TABLE DATA; Schema: cartularium_ops; Owner: -
--

INSERT INTO cartularium_ops.edicion_curso VALUES (1, 1, 1, '2025-03-25', '2025-03-25', 'Virtual', 'Plataforma virtual', 40800.00, 22, 'Finalizado', '17:00:00', '21:00:00');
INSERT INTO cartularium_ops.edicion_curso VALUES (2, 2, 1, '2025-04-29', '2025-04-29', 'Virtual', 'Plataforma virtual', 40800.00, 23, 'Finalizado', '17:00:00', '21:00:00');
INSERT INTO cartularium_ops.edicion_curso VALUES (3, 3, 1, '2025-05-13', '2025-05-13', 'Virtual', 'Plataforma virtual', 40800.00, 19, 'Finalizado', '17:00:00', '21:00:00');
INSERT INTO cartularium_ops.edicion_curso VALUES (4, 4, 2, '2025-05-22', '2025-05-22', 'Virtual', 'Plataforma virtual', 25500.00, 24, 'Finalizado', '17:00:00', '21:00:00');
INSERT INTO cartularium_ops.edicion_curso VALUES (5, 5, 1, '2025-05-27', '2025-05-27', 'Virtual', 'Plataforma virtual', 35700.00, 34, 'Finalizado', '17:00:00', '21:00:00');
INSERT INTO cartularium_ops.edicion_curso VALUES (6, 6, 1, '2025-06-10', '2025-06-10', 'Virtual', 'Plataforma virtual', 35700.00, 27, 'Finalizado', '17:00:00', '21:00:00');
INSERT INTO cartularium_ops.edicion_curso VALUES (7, 7, 2, '2025-06-19', '2025-06-19', 'Virtual', 'Plataforma virtual', 30600.00, 8, 'Finalizado', '17:00:00', '21:00:00');
INSERT INTO cartularium_ops.edicion_curso VALUES (8, 8, 3, '2025-06-25', '2025-06-25', 'Virtual', 'Plataforma virtual', 25500.00, 10, 'Finalizado', '17:00:00', '21:00:00');
INSERT INTO cartularium_ops.edicion_curso VALUES (9, 9, 2, '2025-07-10', '2025-07-10', 'Virtual', 'Plataforma virtual', 25500.00, 7, 'Finalizado', '17:00:00', '21:00:00');
INSERT INTO cartularium_ops.edicion_curso VALUES (10, 10, 1, '2025-09-16', '2025-09-16', 'Virtual', 'Plataforma virtual', 40800.00, 31, 'Finalizado', '17:00:00', '21:00:00');
INSERT INTO cartularium_ops.edicion_curso VALUES (11, 10, 1, '2025-09-23', '2025-09-23', 'Virtual', 'Plataforma virtual', 40800.00, 31, 'Finalizado', '17:00:00', '21:00:00');
INSERT INTO cartularium_ops.edicion_curso VALUES (12, 11, 1, '2025-10-14', '2025-10-14', 'Virtual', 'Plataforma virtual', 40800.00, 25, 'Finalizado', '17:00:00', '21:00:00');
INSERT INTO cartularium_ops.edicion_curso VALUES (13, 11, 2, '2025-10-21', '2025-10-21', 'Virtual', 'Plataforma virtual', 0.00, 25, 'Finalizado', '17:00:00', '21:00:00');
INSERT INTO cartularium_ops.edicion_curso VALUES (14, 12, 1, '2025-11-04', '2025-11-04', 'Virtual', 'Plataforma virtual', 40800.00, 30, 'Finalizado', '17:00:00', '21:00:00');
INSERT INTO cartularium_ops.edicion_curso VALUES (15, 12, 1, '2025-11-11', '2025-11-11', 'Virtual', 'Plataforma virtual', 0.00, 30, 'Finalizado', '17:00:00', '21:00:00');


--
-- TOC entry 5105 (class 0 OID 17612)
-- Dependencies: 223
-- Data for Name: expositor; Type: TABLE DATA; Schema: cartularium_ops; Owner: -
--

INSERT INTO cartularium_ops.expositor VALUES (1, 'Lic. Mauricio Villalobos Solís', 'Derecho procesal civil', '8456-2301', 'mauricio.villalobos@example.invalid', true);
INSERT INTO cartularium_ops.expositor VALUES (2, 'Dra. Marcela Brenes Valverde', 'Derecho sucesorio y notarial', '8627-9145', 'marcela.brenes@example.com', true);
INSERT INTO cartularium_ops.expositor VALUES (3, 'Licda. Karina Villalobos Castro', 'Derecho tributario y facturación electrónica', '8845-7302', 'karina.villalobos@example.com', true);


--
-- TOC entry 5113 (class 0 OID 17682)
-- Dependencies: 231
-- Data for Name: factura; Type: TABLE DATA; Schema: cartularium_ops; Owner: -
--

INSERT INTO cartularium_ops.factura VALUES (1, 1, 'FAC-2025-0001', '2025-03-25', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (2, 2, 'FAC-2025-0002', '2025-03-25', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (3, 3, 'FAC-2025-0003', '2025-03-25', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (4, 4, 'FAC-2025-0004', '2025-03-25', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (5, 5, 'FAC-2025-0005', '2025-03-25', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (6, 6, 'FAC-2025-0006', '2025-03-25', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (7, 7, 'FAC-2025-0007', '2025-03-25', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (8, 8, 'FAC-2025-0008', '2025-03-25', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (9, 9, 'FAC-2025-0009', '2025-03-25', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (10, 10, 'FAC-2025-0010', '2025-03-25', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (11, 11, 'FAC-2025-0011', '2025-03-25', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (12, 12, 'FAC-2025-0012', '2025-03-25', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (13, 13, 'FAC-2025-0013', '2025-03-25', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (14, 14, 'FAC-2025-0014', '2025-03-25', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (15, 15, 'FAC-2025-0015', '2025-03-25', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (16, 16, 'FAC-2025-0016', '2025-03-25', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (17, 17, 'FAC-2025-0017', '2025-03-25', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (18, 18, 'FAC-2025-0018', '2025-03-25', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (19, 19, 'FAC-2025-0019', '2025-03-25', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (20, 20, 'FAC-2025-0020', '2025-03-25', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (21, 21, 'FAC-2025-0021', '2025-03-25', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (22, 22, 'FAC-2025-0022', '2025-03-25', 40800.00, 0.00, 0.00, 40800.00, 'Parcial');
INSERT INTO cartularium_ops.factura VALUES (23, 23, 'FAC-2025-0023', '2025-04-29', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (24, 24, 'FAC-2025-0024', '2025-04-29', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (25, 25, 'FAC-2025-0025', '2025-04-29', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (26, 26, 'FAC-2025-0026', '2025-04-29', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (27, 27, 'FAC-2025-0027', '2025-04-29', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (28, 28, 'FAC-2025-0028', '2025-04-29', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (29, 29, 'FAC-2025-0029', '2025-04-29', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (30, 30, 'FAC-2025-0030', '2025-04-29', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (31, 31, 'FAC-2025-0031', '2025-04-29', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (32, 32, 'FAC-2025-0032', '2025-04-29', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (33, 33, 'FAC-2025-0033', '2025-04-29', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (34, 34, 'FAC-2025-0034', '2025-04-29', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (35, 35, 'FAC-2025-0035', '2025-04-29', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (36, 36, 'FAC-2025-0036', '2025-04-29', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (37, 37, 'FAC-2025-0037', '2025-04-29', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (38, 38, 'FAC-2025-0038', '2025-04-29', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (39, 39, 'FAC-2025-0039', '2025-04-29', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (40, 40, 'FAC-2025-0040', '2025-04-29', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (41, 41, 'FAC-2025-0041', '2025-04-29', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (42, 42, 'FAC-2025-0042', '2025-04-29', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (43, 43, 'FAC-2025-0043', '2025-04-29', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (44, 44, 'FAC-2025-0044', '2025-04-29', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (45, 45, 'FAC-2025-0045', '2025-04-29', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (46, 46, 'FAC-2025-0046', '2025-05-13', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (47, 47, 'FAC-2025-0047', '2025-05-13', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (48, 48, 'FAC-2025-0048', '2025-05-13', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (49, 49, 'FAC-2025-0049', '2025-05-13', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (50, 50, 'FAC-2025-0050', '2025-05-13', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (51, 51, 'FAC-2025-0051', '2025-05-13', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (52, 52, 'FAC-2025-0052', '2025-05-13', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (53, 53, 'FAC-2025-0053', '2025-05-13', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (54, 54, 'FAC-2025-0054', '2025-05-13', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (55, 55, 'FAC-2025-0055', '2025-05-13', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (56, 56, 'FAC-2025-0056', '2025-05-13', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (57, 57, 'FAC-2025-0057', '2025-05-13', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (58, 58, 'FAC-2025-0058', '2025-05-13', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (59, 59, 'FAC-2025-0059', '2025-05-13', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (60, 60, 'FAC-2025-0060', '2025-05-13', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (61, 61, 'FAC-2025-0061', '2025-05-13', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (62, 62, 'FAC-2025-0062', '2025-05-13', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (63, 63, 'FAC-2025-0063', '2025-05-13', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (64, 64, 'FAC-2025-0064', '2025-05-13', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (65, 65, 'FAC-2025-0065', '2025-05-22', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (66, 66, 'FAC-2025-0066', '2025-05-22', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (67, 67, 'FAC-2025-0067', '2025-05-22', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (68, 68, 'FAC-2025-0068', '2025-05-22', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (69, 69, 'FAC-2025-0069', '2025-05-22', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (70, 70, 'FAC-2025-0070', '2025-05-22', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (71, 71, 'FAC-2025-0071', '2025-05-22', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (72, 72, 'FAC-2025-0072', '2025-05-22', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (73, 73, 'FAC-2025-0073', '2025-05-22', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (74, 74, 'FAC-2025-0074', '2025-05-22', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (75, 75, 'FAC-2025-0075', '2025-05-22', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (76, 76, 'FAC-2025-0076', '2025-05-22', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (77, 77, 'FAC-2025-0077', '2025-05-22', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (78, 78, 'FAC-2025-0078', '2025-05-22', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (79, 79, 'FAC-2025-0079', '2025-05-22', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (80, 80, 'FAC-2025-0080', '2025-05-22', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (81, 81, 'FAC-2025-0081', '2025-05-22', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (82, 82, 'FAC-2025-0082', '2025-05-22', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (83, 83, 'FAC-2025-0083', '2025-05-22', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (84, 84, 'FAC-2025-0084', '2025-05-22', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (85, 85, 'FAC-2025-0085', '2025-05-22', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (86, 86, 'FAC-2025-0086', '2025-05-22', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (87, 87, 'FAC-2025-0087', '2025-05-22', 25500.00, 0.00, 0.00, 25500.00, 'Pendiente');
INSERT INTO cartularium_ops.factura VALUES (88, 88, 'FAC-2025-0088', '2025-05-22', 25500.00, 0.00, 0.00, 25500.00, 'Pendiente');
INSERT INTO cartularium_ops.factura VALUES (89, 89, 'FAC-2025-0089', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (90, 90, 'FAC-2025-0090', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (91, 91, 'FAC-2025-0091', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (92, 92, 'FAC-2025-0092', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (93, 93, 'FAC-2025-0093', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (94, 94, 'FAC-2025-0094', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (95, 95, 'FAC-2025-0095', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (96, 96, 'FAC-2025-0096', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (97, 97, 'FAC-2025-0097', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (98, 98, 'FAC-2025-0098', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (99, 99, 'FAC-2025-0099', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (100, 100, 'FAC-2025-0100', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (101, 101, 'FAC-2025-0101', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (102, 102, 'FAC-2025-0102', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (103, 103, 'FAC-2025-0103', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (104, 104, 'FAC-2025-0104', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (105, 105, 'FAC-2025-0105', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (106, 106, 'FAC-2025-0106', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (107, 107, 'FAC-2025-0107', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (108, 108, 'FAC-2025-0108', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (109, 109, 'FAC-2025-0109', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (110, 110, 'FAC-2025-0110', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (111, 111, 'FAC-2025-0111', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (112, 112, 'FAC-2025-0112', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (113, 113, 'FAC-2025-0113', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (114, 114, 'FAC-2025-0114', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (115, 115, 'FAC-2025-0115', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (116, 116, 'FAC-2025-0116', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (117, 117, 'FAC-2025-0117', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (118, 118, 'FAC-2025-0118', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (119, 119, 'FAC-2025-0119', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (120, 120, 'FAC-2025-0120', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pendiente');
INSERT INTO cartularium_ops.factura VALUES (121, 121, 'FAC-2025-0121', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pendiente');
INSERT INTO cartularium_ops.factura VALUES (122, 122, 'FAC-2025-0122', '2025-05-27', 35700.00, 0.00, 0.00, 35700.00, 'Pendiente');
INSERT INTO cartularium_ops.factura VALUES (123, 123, 'FAC-2025-0123', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (124, 124, 'FAC-2025-0124', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (125, 125, 'FAC-2025-0125', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (126, 126, 'FAC-2025-0126', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (127, 127, 'FAC-2025-0127', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (128, 128, 'FAC-2025-0128', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (129, 129, 'FAC-2025-0129', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (130, 130, 'FAC-2025-0130', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (131, 131, 'FAC-2025-0131', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (132, 132, 'FAC-2025-0132', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (133, 133, 'FAC-2025-0133', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (134, 134, 'FAC-2025-0134', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (135, 135, 'FAC-2025-0135', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (136, 136, 'FAC-2025-0136', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (137, 137, 'FAC-2025-0137', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (138, 138, 'FAC-2025-0138', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (139, 139, 'FAC-2025-0139', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (140, 140, 'FAC-2025-0140', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (141, 141, 'FAC-2025-0141', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (142, 142, 'FAC-2025-0142', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (143, 143, 'FAC-2025-0143', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (144, 144, 'FAC-2025-0144', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (145, 145, 'FAC-2025-0145', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (146, 146, 'FAC-2025-0146', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pendiente');
INSERT INTO cartularium_ops.factura VALUES (147, 147, 'FAC-2025-0147', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pendiente');
INSERT INTO cartularium_ops.factura VALUES (148, 148, 'FAC-2025-0148', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pendiente');
INSERT INTO cartularium_ops.factura VALUES (149, 149, 'FAC-2025-0149', '2025-06-10', 35700.00, 0.00, 0.00, 35700.00, 'Pendiente');
INSERT INTO cartularium_ops.factura VALUES (150, 150, 'FAC-2025-0150', '2025-06-19', 30600.00, 0.00, 0.00, 30600.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (151, 151, 'FAC-2025-0151', '2025-06-19', 30600.00, 0.00, 0.00, 30600.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (152, 152, 'FAC-2025-0152', '2025-06-19', 30600.00, 0.00, 0.00, 30600.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (153, 153, 'FAC-2025-0153', '2025-06-19', 30600.00, 0.00, 0.00, 30600.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (154, 154, 'FAC-2025-0154', '2025-06-19', 30600.00, 0.00, 0.00, 30600.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (155, 155, 'FAC-2025-0155', '2025-06-19', 30600.00, 0.00, 0.00, 30600.00, 'Pendiente');
INSERT INTO cartularium_ops.factura VALUES (156, 156, 'FAC-2025-0156', '2025-06-19', 30600.00, 0.00, 0.00, 30600.00, 'Pendiente');
INSERT INTO cartularium_ops.factura VALUES (157, 157, 'FAC-2025-0157', '2025-06-19', 30600.00, 0.00, 0.00, 30600.00, 'Pendiente');
INSERT INTO cartularium_ops.factura VALUES (158, 158, 'FAC-2025-0158', '2025-06-25', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (159, 159, 'FAC-2025-0159', '2025-06-25', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (160, 160, 'FAC-2025-0160', '2025-06-25', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (161, 161, 'FAC-2025-0161', '2025-06-25', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (162, 162, 'FAC-2025-0162', '2025-06-25', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (163, 163, 'FAC-2025-0163', '2025-06-25', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (164, 164, 'FAC-2025-0164', '2025-06-25', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (165, 165, 'FAC-2025-0165', '2025-06-25', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (166, 166, 'FAC-2025-0166', '2025-06-25', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (167, 167, 'FAC-2025-0167', '2025-06-25', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (168, 168, 'FAC-2025-0168', '2025-07-10', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (169, 169, 'FAC-2025-0169', '2025-07-10', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (170, 170, 'FAC-2025-0170', '2025-07-10', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (171, 171, 'FAC-2025-0171', '2025-07-10', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (172, 172, 'FAC-2025-0172', '2025-07-10', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (173, 173, 'FAC-2025-0173', '2025-07-10', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (174, 174, 'FAC-2025-0174', '2025-07-10', 25500.00, 0.00, 0.00, 25500.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (175, 175, 'FAC-2025-0175', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (176, 176, 'FAC-2025-0176', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (177, 177, 'FAC-2025-0177', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (178, 178, 'FAC-2025-0178', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (179, 179, 'FAC-2025-0179', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (180, 180, 'FAC-2025-0180', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (181, 181, 'FAC-2025-0181', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (182, 182, 'FAC-2025-0182', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (183, 183, 'FAC-2025-0183', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (184, 184, 'FAC-2025-0184', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (185, 185, 'FAC-2025-0185', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (186, 186, 'FAC-2025-0186', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (187, 187, 'FAC-2025-0187', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (188, 188, 'FAC-2025-0188', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (189, 189, 'FAC-2025-0189', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (190, 190, 'FAC-2025-0190', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (191, 191, 'FAC-2025-0191', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (192, 192, 'FAC-2025-0192', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (193, 193, 'FAC-2025-0193', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (194, 194, 'FAC-2025-0194', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (195, 195, 'FAC-2025-0195', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (196, 196, 'FAC-2025-0196', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (197, 197, 'FAC-2025-0197', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (198, 198, 'FAC-2025-0198', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (199, 199, 'FAC-2025-0199', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (200, 200, 'FAC-2025-0200', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (201, 201, 'FAC-2025-0201', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (202, 202, 'FAC-2025-0202', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (203, 203, 'FAC-2025-0203', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (204, 204, 'FAC-2025-0204', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (205, 205, 'FAC-2025-0205', '2025-09-16', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (206, 237, 'FAC-2025-0206', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (207, 238, 'FAC-2025-0207', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (208, 239, 'FAC-2025-0208', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (209, 240, 'FAC-2025-0209', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (210, 241, 'FAC-2025-0210', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (211, 242, 'FAC-2025-0211', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (212, 243, 'FAC-2025-0212', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (213, 244, 'FAC-2025-0213', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (214, 245, 'FAC-2025-0214', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (215, 246, 'FAC-2025-0215', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (216, 247, 'FAC-2025-0216', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (217, 248, 'FAC-2025-0217', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (218, 249, 'FAC-2025-0218', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (219, 250, 'FAC-2025-0219', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (220, 251, 'FAC-2025-0220', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (221, 252, 'FAC-2025-0221', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (222, 253, 'FAC-2025-0222', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (223, 254, 'FAC-2025-0223', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (224, 255, 'FAC-2025-0224', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (225, 256, 'FAC-2025-0225', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (226, 257, 'FAC-2025-0226', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (227, 258, 'FAC-2025-0227', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (228, 259, 'FAC-2025-0228', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (229, 260, 'FAC-2025-0229', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (230, 261, 'FAC-2025-0230', '2025-10-14', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (231, 287, 'FAC-2025-0231', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (232, 288, 'FAC-2025-0232', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (233, 289, 'FAC-2025-0233', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (234, 290, 'FAC-2025-0234', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (235, 291, 'FAC-2025-0235', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (236, 292, 'FAC-2025-0236', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (237, 293, 'FAC-2025-0237', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (238, 294, 'FAC-2025-0238', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (239, 295, 'FAC-2025-0239', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (240, 296, 'FAC-2025-0240', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (241, 297, 'FAC-2025-0241', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (242, 298, 'FAC-2025-0242', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (243, 299, 'FAC-2025-0243', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (244, 300, 'FAC-2025-0244', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (245, 301, 'FAC-2025-0245', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (246, 302, 'FAC-2025-0246', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (247, 303, 'FAC-2025-0247', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (248, 304, 'FAC-2025-0248', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (249, 305, 'FAC-2025-0249', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (250, 306, 'FAC-2025-0250', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (251, 307, 'FAC-2025-0251', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (252, 308, 'FAC-2025-0252', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (253, 309, 'FAC-2025-0253', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (254, 310, 'FAC-2025-0254', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (255, 311, 'FAC-2025-0255', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (256, 312, 'FAC-2025-0256', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (257, 313, 'FAC-2025-0257', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (258, 314, 'FAC-2025-0258', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (259, 315, 'FAC-2025-0259', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');
INSERT INTO cartularium_ops.factura VALUES (260, 316, 'FAC-2025-0260', '2025-11-04', 40800.00, 0.00, 0.00, 40800.00, 'Pagada');


--
-- TOC entry 5115 (class 0 OID 17704)
-- Dependencies: 233
-- Data for Name: pago; Type: TABLE DATA; Schema: cartularium_ops; Owner: -
--

INSERT INTO cartularium_ops.pago VALUES (1, 1, 'SINPE', 40800.00, '83745011', '2025-03-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (2, 2, 'SINPE', 40800.00, '83745012', '2025-03-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (3, 3, 'SINPE', 40800.00, '83745013', '2025-03-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (4, 4, 'SINPE', 40800.00, '83745014', '2025-03-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (5, 5, 'SINPE', 40800.00, '83745015', '2025-03-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (6, 6, 'SINPE', 40800.00, '83745016', '2025-03-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (7, 7, 'SINPE', 40800.00, '83745017', '2025-03-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (8, 8, 'SINPE', 40800.00, '83745018', '2025-03-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (9, 9, 'SINPE', 40800.00, '83745019', '2025-03-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (10, 10, 'SINPE', 40800.00, '83745020', '2025-03-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (11, 11, 'SINPE', 40800.00, '83745021', '2025-03-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (12, 12, 'SINPE', 40800.00, '83745022', '2025-03-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (13, 13, 'SINPE', 40800.00, '83745023', '2025-03-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (14, 14, 'SINPE', 40800.00, '83745024', '2025-03-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (15, 15, 'SINPE', 40800.00, '83745025', '2025-03-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (16, 16, 'SINPE', 40800.00, '83745026', '2025-03-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (17, 17, 'SINPE', 40800.00, '83745027', '2025-03-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (18, 18, 'SINPE', 40800.00, '83745028', '2025-03-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (19, 19, 'SINPE', 40800.00, '83745029', '2025-03-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (20, 20, 'SINPE', 40800.00, '83745030', '2025-03-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (21, 21, 'SINPE', 40800.00, '83745031', '2025-03-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (22, 22, 'SINPE', 20800.00, '83745032', '2025-03-25', 'Parcial');
INSERT INTO cartularium_ops.pago VALUES (23, 23, 'SINPE', 40800.00, '83745033', '2025-04-29', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (24, 24, 'SINPE', 40800.00, '83745034', '2025-04-29', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (25, 25, 'Transferencia bancaria', 40800.00, '83745035', '2025-04-29', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (26, 26, 'SINPE', 40800.00, '83745036', '2025-04-29', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (27, 27, 'SINPE', 40800.00, '83745037', '2025-04-29', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (28, 28, 'Transferencia bancaria', 40800.00, '83745038', '2025-04-29', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (29, 29, 'SINPE', 40800.00, '83745039', '2025-04-29', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (30, 30, 'SINPE', 40800.00, '83745040', '2025-04-29', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (31, 31, 'Transferencia bancaria', 40800.00, '83745041', '2025-04-29', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (32, 32, 'SINPE', 40800.00, '83745042', '2025-04-29', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (33, 33, 'SINPE', 40800.00, '83745043', '2025-04-29', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (34, 34, 'Transferencia bancaria', 40800.00, '83745044', '2025-04-29', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (35, 35, 'SINPE', 40800.00, '83745045', '2025-04-29', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (36, 36, 'SINPE', 40800.00, '83745046', '2025-04-29', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (37, 37, 'Transferencia bancaria', 40800.00, '83745047', '2025-04-29', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (38, 38, 'SINPE', 40800.00, '83745048', '2025-04-29', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (39, 39, 'SINPE', 40800.00, '83745049', '2025-04-29', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (40, 40, 'Transferencia bancaria', 40800.00, '83745050', '2025-04-29', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (41, 41, 'SINPE', 40800.00, '83745051', '2025-04-29', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (42, 42, 'SINPE', 40800.00, '83745052', '2025-04-29', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (43, 43, 'Transferencia bancaria', 40800.00, '83745053', '2025-04-29', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (44, 44, 'SINPE', 40800.00, '83745054', '2025-04-29', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (45, 45, 'SINPE', 40800.00, '83745055', '2025-04-29', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (46, 46, 'SINPE', 40800.00, '83745056', '2025-05-13', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (47, 47, 'Transferencia bancaria', 40800.00, '83745057', '2025-05-13', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (48, 48, 'SINPE', 40800.00, '83745058', '2025-05-13', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (49, 49, 'SINPE', 40800.00, '83745059', '2025-05-13', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (50, 50, 'Transferencia bancaria', 40800.00, '83745060', '2025-05-13', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (51, 51, 'SINPE', 40800.00, '83745061', '2025-05-13', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (52, 52, 'SINPE', 40800.00, '83745062', '2025-05-13', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (53, 53, 'Transferencia bancaria', 40800.00, '83745063', '2025-05-13', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (54, 54, 'SINPE', 40800.00, '83745064', '2025-05-13', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (55, 55, 'SINPE', 40800.00, '83745065', '2025-05-13', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (56, 56, 'Transferencia bancaria', 40800.00, '83745066', '2025-05-13', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (57, 57, 'SINPE', 40800.00, '83745067', '2025-05-13', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (58, 58, 'SINPE', 40800.00, '83745068', '2025-05-13', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (59, 59, 'Transferencia bancaria', 40800.00, '83745069', '2025-05-13', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (60, 60, 'SINPE', 40800.00, '83745070', '2025-05-13', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (61, 61, 'SINPE', 40800.00, '83745071', '2025-05-13', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (62, 62, 'Transferencia bancaria', 40800.00, '83745072', '2025-05-13', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (63, 63, 'SINPE', 40800.00, '83745073', '2025-05-13', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (64, 64, 'SINPE', 40800.00, '83745074', '2025-05-13', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (65, 65, 'SINPE', 25500.00, '83745075', '2025-05-22', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (66, 66, 'SINPE', 25500.00, '83745076', '2025-05-22', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (67, 67, 'Transferencia bancaria', 25500.00, '83745077', '2025-05-22', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (68, 68, 'SINPE', 25500.00, '83745078', '2025-05-22', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (69, 69, 'SINPE', 25500.00, '83745079', '2025-05-22', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (70, 70, 'Transferencia bancaria', 25500.00, '83745080', '2025-05-22', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (71, 71, 'SINPE', 25500.00, '83745081', '2025-05-22', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (72, 72, 'SINPE', 25500.00, '83745082', '2025-05-22', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (73, 73, 'Transferencia bancaria', 25500.00, '83745083', '2025-05-22', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (74, 74, 'SINPE', 25500.00, '83745084', '2025-05-22', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (75, 75, 'SINPE', 25500.00, '83745085', '2025-05-22', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (76, 76, 'Transferencia bancaria', 25500.00, '83745086', '2025-05-22', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (77, 77, 'SINPE', 25500.00, '83745087', '2025-05-22', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (78, 78, 'SINPE', 25500.00, '83745088', '2025-05-22', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (79, 79, 'Transferencia bancaria', 25500.00, '83745089', '2025-05-22', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (80, 80, 'SINPE', 25500.00, '83745090', '2025-05-22', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (81, 81, 'SINPE', 25500.00, '83745091', '2025-05-22', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (82, 82, 'Transferencia bancaria', 25500.00, '83745092', '2025-05-22', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (83, 83, 'SINPE', 25500.00, '83745093', '2025-05-22', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (84, 84, 'SINPE', 25500.00, '83745094', '2025-05-22', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (85, 85, 'Transferencia bancaria', 25500.00, '83745095', '2025-05-22', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (86, 86, 'SINPE', 25500.00, '83745096', '2025-05-22', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (87, 87, 'SINPE', 0.00, 'PEND-C4-001', '2025-05-22', 'Pendiente');
INSERT INTO cartularium_ops.pago VALUES (88, 88, 'SINPE', 0.00, 'PEND-C4-002', '2025-05-22', 'Pendiente');
INSERT INTO cartularium_ops.pago VALUES (89, 89, 'SINPE', 35700.00, '83745097', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (90, 90, 'Transferencia bancaria', 35700.00, '83745098', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (91, 91, 'SINPE', 35700.00, '83745099', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (92, 92, 'SINPE', 35700.00, '83745100', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (93, 93, 'Transferencia bancaria', 35700.00, '83745101', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (94, 94, 'SINPE', 35700.00, '83745102', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (95, 95, 'SINPE', 35700.00, '83745103', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (96, 96, 'Transferencia bancaria', 35700.00, '83745104', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (97, 97, 'SINPE', 35700.00, '83745105', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (98, 98, 'SINPE', 35700.00, '83745106', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (99, 99, 'Transferencia bancaria', 35700.00, '83745107', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (100, 100, 'SINPE', 35700.00, '83745108', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (101, 101, 'SINPE', 35700.00, '83745109', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (102, 102, 'Transferencia bancaria', 35700.00, '83745110', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (103, 103, 'SINPE', 35700.00, '83745111', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (104, 104, 'SINPE', 35700.00, '83745112', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (105, 105, 'Transferencia bancaria', 35700.00, '83745113', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (106, 106, 'SINPE', 35700.00, '83745114', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (107, 107, 'SINPE', 35700.00, '83745115', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (108, 108, 'Transferencia bancaria', 35700.00, '83745116', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (109, 109, 'SINPE', 35700.00, '83745117', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (110, 110, 'SINPE', 35700.00, '83745118', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (111, 111, 'Transferencia bancaria', 35700.00, '83745119', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (112, 112, 'SINPE', 35700.00, '83745120', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (113, 113, 'SINPE', 35700.00, '83745121', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (114, 114, 'Transferencia bancaria', 35700.00, '83745122', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (115, 115, 'SINPE', 35700.00, '83745123', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (116, 116, 'SINPE', 35700.00, '83745124', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (117, 117, 'Transferencia bancaria', 35700.00, '83745125', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (118, 118, 'SINPE', 35700.00, '83745126', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (119, 119, 'SINPE', 35700.00, '83745127', '2025-05-27', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (120, 120, 'SINPE', 0.00, 'PEND-C5-001', '2025-05-27', 'Pendiente');
INSERT INTO cartularium_ops.pago VALUES (121, 121, 'SINPE', 0.00, 'PEND-C5-002', '2025-05-27', 'Pendiente');
INSERT INTO cartularium_ops.pago VALUES (122, 122, 'SINPE', 0.00, 'PEND-C5-003', '2025-05-27', 'Pendiente');
INSERT INTO cartularium_ops.pago VALUES (123, 123, 'SINPE', 35700.00, '83745128', '2025-06-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (124, 124, 'Transferencia bancaria', 35700.00, '83745129', '2025-06-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (125, 125, 'SINPE', 35700.00, '83745130', '2025-06-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (126, 126, 'SINPE', 35700.00, '83745131', '2025-06-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (127, 127, 'Transferencia bancaria', 35700.00, '83745132', '2025-06-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (128, 128, 'SINPE', 35700.00, '83745133', '2025-06-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (129, 129, 'SINPE', 35700.00, '83745134', '2025-06-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (130, 130, 'Transferencia bancaria', 35700.00, '83745135', '2025-06-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (131, 131, 'SINPE', 35700.00, '83745136', '2025-06-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (132, 132, 'SINPE', 35700.00, '83745137', '2025-06-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (133, 133, 'Transferencia bancaria', 35700.00, '83745138', '2025-06-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (134, 134, 'SINPE', 35700.00, '83745139', '2025-06-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (135, 135, 'SINPE', 35700.00, '83745140', '2025-06-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (136, 136, 'Transferencia bancaria', 35700.00, '83745141', '2025-06-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (137, 137, 'SINPE', 35700.00, '83745142', '2025-06-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (138, 138, 'SINPE', 35700.00, '83745143', '2025-06-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (139, 139, 'Transferencia bancaria', 35700.00, '83745144', '2025-06-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (140, 140, 'SINPE', 35700.00, '83745145', '2025-06-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (141, 141, 'SINPE', 35700.00, '83745146', '2025-06-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (142, 142, 'Transferencia bancaria', 35700.00, '83745147', '2025-06-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (143, 143, 'SINPE', 35700.00, '83745148', '2025-06-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (144, 144, 'SINPE', 35700.00, '83745149', '2025-06-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (145, 145, 'Transferencia bancaria', 35700.00, '83745150', '2025-06-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (146, 146, 'SINPE', 0.00, 'PEND-C6-001', '2025-06-10', 'Pendiente');
INSERT INTO cartularium_ops.pago VALUES (147, 147, 'SINPE', 0.00, 'PEND-C6-002', '2025-06-10', 'Pendiente');
INSERT INTO cartularium_ops.pago VALUES (148, 148, 'SINPE', 0.00, 'PEND-C6-003', '2025-06-10', 'Pendiente');
INSERT INTO cartularium_ops.pago VALUES (149, 149, 'SINPE', 0.00, 'PEND-C6-004', '2025-06-10', 'Pendiente');
INSERT INTO cartularium_ops.pago VALUES (150, 150, 'SINPE', 30600.00, '83745151', '2025-06-19', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (151, 151, 'Transferencia bancaria', 30600.00, '83745152', '2025-06-19', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (152, 152, 'SINPE', 30600.00, '83745153', '2025-06-19', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (153, 153, 'SINPE', 30600.00, '83745154', '2025-06-19', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (154, 154, 'Transferencia bancaria', 30600.00, '83745155', '2025-06-19', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (155, 155, 'SINPE', 0.00, 'PEND-C7-001', '2025-06-19', 'Pendiente');
INSERT INTO cartularium_ops.pago VALUES (156, 156, 'SINPE', 0.00, 'PEND-C7-002', '2025-06-19', 'Pendiente');
INSERT INTO cartularium_ops.pago VALUES (157, 157, 'SINPE', 0.00, 'PEND-C7-003', '2025-06-19', 'Pendiente');
INSERT INTO cartularium_ops.pago VALUES (158, 158, 'SINPE', 25500.00, '83745156', '2025-06-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (159, 159, 'Transferencia bancaria', 25500.00, '83745157', '2025-06-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (160, 160, 'SINPE', 25500.00, '83745158', '2025-06-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (161, 161, 'SINPE', 25500.00, '83745159', '2025-06-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (162, 162, 'Transferencia bancaria', 25500.00, '83745160', '2025-06-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (163, 163, 'SINPE', 25500.00, '83745161', '2025-06-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (164, 164, 'SINPE', 25500.00, '83745162', '2025-06-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (165, 165, 'Transferencia bancaria', 25500.00, '83745163', '2025-06-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (166, 166, 'SINPE', 25500.00, '83745164', '2025-06-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (167, 167, 'SINPE', 25500.00, '83745165', '2025-06-25', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (168, 168, 'SINPE', 25500.00, '83745166', '2025-07-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (169, 169, 'Transferencia bancaria', 25500.00, '83745167', '2025-07-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (170, 170, 'SINPE', 25500.00, '83745168', '2025-07-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (171, 171, 'SINPE', 25500.00, '83745169', '2025-07-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (172, 172, 'Transferencia bancaria', 25500.00, '83745170', '2025-07-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (173, 173, 'SINPE', 25500.00, '83745171', '2025-07-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (174, 174, 'SINPE', 25500.00, '83745172', '2025-07-10', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (175, 175, 'SINPE', 40800.00, '83745173', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (176, 176, 'Transferencia bancaria', 40800.00, '83745174', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (177, 177, 'SINPE', 40800.00, '83745175', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (178, 178, 'SINPE', 40800.00, '83745176', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (179, 179, 'Transferencia bancaria', 40800.00, '83745177', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (180, 180, 'SINPE', 40800.00, '83745178', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (181, 181, 'SINPE', 40800.00, '83745179', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (182, 182, 'Transferencia bancaria', 40800.00, '83745180', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (183, 183, 'SINPE', 40800.00, '83745181', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (184, 184, 'SINPE', 40800.00, '83745182', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (185, 185, 'Transferencia bancaria', 40800.00, '83745183', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (186, 186, 'SINPE', 40800.00, '83745184', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (187, 187, 'SINPE', 40800.00, '83745185', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (188, 188, 'Transferencia bancaria', 40800.00, '83745186', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (189, 189, 'SINPE', 40800.00, '83745187', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (190, 190, 'SINPE', 40800.00, '83745188', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (191, 191, 'Transferencia bancaria', 40800.00, '83745189', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (192, 192, 'SINPE', 40800.00, '83745190', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (193, 193, 'SINPE', 40800.00, '83745191', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (194, 194, 'Transferencia bancaria', 40800.00, '83745192', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (195, 195, 'SINPE', 40800.00, '83745193', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (196, 196, 'SINPE', 40800.00, '83745194', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (197, 197, 'Transferencia bancaria', 40800.00, '83745195', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (198, 198, 'SINPE', 40800.00, '83745196', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (199, 199, 'SINPE', 40800.00, '83745197', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (200, 200, 'Transferencia bancaria', 40800.00, '83745198', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (201, 201, 'SINPE', 40800.00, '83745199', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (202, 202, 'SINPE', 40800.00, '83745200', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (203, 203, 'Transferencia bancaria', 40800.00, '83745201', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (204, 204, 'SINPE', 40800.00, '83745202', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (205, 205, 'SINPE', 40800.00, '83745203', '2025-09-16', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (206, 206, 'SINPE', 40800.00, '83745204', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (207, 207, 'Transferencia bancaria', 40800.00, '83745205', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (208, 208, 'SINPE', 40800.00, '83745206', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (209, 209, 'SINPE', 40800.00, '83745207', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (210, 210, 'Transferencia bancaria', 40800.00, '83745208', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (211, 211, 'SINPE', 40800.00, '83745209', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (212, 212, 'SINPE', 40800.00, '83745210', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (213, 213, 'Transferencia bancaria', 40800.00, '83745211', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (214, 214, 'SINPE', 40800.00, '83745212', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (215, 215, 'SINPE', 40800.00, '83745213', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (216, 216, 'Transferencia bancaria', 40800.00, '83745214', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (217, 217, 'SINPE', 40800.00, '83745215', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (218, 218, 'SINPE', 40800.00, '83745216', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (219, 219, 'Transferencia bancaria', 40800.00, '83745217', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (220, 220, 'SINPE', 40800.00, '83745218', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (221, 221, 'SINPE', 40800.00, '83745219', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (222, 222, 'Transferencia bancaria', 40800.00, '83745220', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (223, 223, 'SINPE', 40800.00, '83745221', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (224, 224, 'SINPE', 40800.00, '83745222', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (225, 225, 'Transferencia bancaria', 40800.00, '83745223', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (226, 226, 'SINPE', 40800.00, '83745224', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (227, 227, 'SINPE', 40800.00, '83745225', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (228, 228, 'Transferencia bancaria', 40800.00, '83745226', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (229, 229, 'SINPE', 40800.00, '83745227', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (230, 230, 'SINPE', 40800.00, '83745228', '2025-10-14', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (231, 231, 'SINPE', 40800.00, '83745229', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (232, 232, 'Transferencia bancaria', 40800.00, '83745230', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (233, 233, 'SINPE', 40800.00, '83745231', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (234, 234, 'SINPE', 40800.00, '83745232', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (235, 235, 'Transferencia bancaria', 40800.00, '83745233', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (236, 236, 'SINPE', 40800.00, '83745234', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (237, 237, 'SINPE', 40800.00, '83745235', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (238, 238, 'Transferencia bancaria', 40800.00, '83745236', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (239, 239, 'SINPE', 40800.00, '83745237', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (240, 240, 'SINPE', 40800.00, '83745238', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (241, 241, 'Transferencia bancaria', 40800.00, '83745239', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (242, 242, 'SINPE', 40800.00, '83745240', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (243, 243, 'SINPE', 40800.00, '83745241', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (244, 244, 'Transferencia bancaria', 40800.00, '83745242', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (245, 245, 'SINPE', 40800.00, '83745243', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (246, 246, 'SINPE', 40800.00, '83745244', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (247, 247, 'Transferencia bancaria', 40800.00, '83745245', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (248, 248, 'SINPE', 40800.00, '83745246', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (249, 249, 'SINPE', 40800.00, '83745247', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (250, 250, 'Transferencia bancaria', 40800.00, '83745248', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (251, 251, 'SINPE', 40800.00, '83745249', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (252, 252, 'SINPE', 40800.00, '83745250', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (253, 253, 'Transferencia bancaria', 40800.00, '83745251', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (254, 254, 'SINPE', 40800.00, '83745252', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (255, 255, 'SINPE', 40800.00, '83745253', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (256, 256, 'Transferencia bancaria', 40800.00, '83745254', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (257, 257, 'SINPE', 40800.00, '83745255', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (258, 258, 'SINPE', 40800.00, '83745256', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (259, 259, 'Transferencia bancaria', 40800.00, '83745257', '2025-11-04', 'Pagado');
INSERT INTO cartularium_ops.pago VALUES (260, 260, 'SINPE', 40800.00, '83745258', '2025-11-04', 'Pagado');


--
-- TOC entry 5111 (class 0 OID 17658)
-- Dependencies: 229
-- Data for Name: participante; Type: TABLE DATA; Schema: cartularium_ops; Owner: -
--

INSERT INTO cartularium_ops.participante VALUES (1, 1, 1, 'María Fernanda Calderón Rojas', '2025-03-20', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (2, 2, 1, 'José Pablo Araya Méndez', '2025-03-20', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (3, 3, 1, 'Daniela Valverde Soto', '2025-03-20', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (4, 4, 1, 'Luis Diego Ramírez Castro', '2025-03-20', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (5, 5, 1, 'Adriana Chaves Mora', '2025-03-20', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (6, 6, 1, 'Carlos Andrés Brenes Vargas', '2025-03-20', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (7, 7, 1, 'Sofía Jiménez Aguilar', '2025-03-20', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (8, 8, 1, 'Esteban Morales Quesada', '2025-03-20', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (9, 9, 1, 'Natalia Cordero Fernández', '2025-03-20', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (10, 10, 1, 'Andrés Gutiérrez Salazar', '2025-03-20', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (11, 11, 1, 'Paola Vargas Montero', '2025-03-20', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (12, 12, 1, 'Ricardo Solano Alfaro', '2025-03-20', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (13, 13, 1, 'Laura Méndez Herrera', '2025-03-20', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (14, 14, 1, 'Fernando Acuña Rojas', '2025-03-20', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (15, 15, 1, 'Gabriela León Campos', '2025-03-20', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (16, 16, 1, 'Manuel Rojas Pineda', '2025-03-20', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (17, 17, 1, 'Valeria Hidalgo Núñez', '2025-03-20', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (18, 18, 1, 'Sebastián Mora Céspedes', '2025-03-20', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (19, 19, 1, 'Karla Rodríguez Arias', '2025-03-20', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (20, 20, 1, 'Javier Salas Umaña', '2025-03-20', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (21, 21, 1, 'Mónica Esquivel Porras', '2025-03-20', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (22, 22, 1, 'Diego Navarro Segura', '2025-03-20', 'Confirmado', false, 'No asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (23, 23, 2, 'Ana Lucía Vargas Cordero', '2025-04-24', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (24, 24, 2, 'Pablo Enrique Soto Jiménez', '2025-04-24', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (25, 25, 2, 'Mariana Rojas Bermúdez', '2025-04-24', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (26, 26, 2, 'Francisco Javier Molina Castro', '2025-04-24', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (27, 27, 2, 'Silvia Elena Pacheco Mora', '2025-04-24', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (28, 28, 2, 'Roberto Andrés Fallas León', '2025-04-24', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (29, 29, 2, 'Camila Fernández Arce', '2025-04-24', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (30, 30, 2, 'Héctor Daniel Salazar Núñez', '2025-04-24', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (31, 31, 2, 'Valentina Quesada Alfaro', '2025-04-24', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (32, 32, 2, 'Óscar Alberto Chacón Vega', '2025-04-24', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (33, 33, 2, 'Gabriela María Solís Herrera', '2025-04-24', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (34, 34, 2, 'Mauricio Céspedes Ramírez', '2025-04-24', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (35, 35, 2, 'Daniela María Arias Brenes', '2025-04-24', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (36, 36, 2, 'Jorge Luis Hidalgo Castro', '2025-04-24', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (37, 37, 2, 'Nicole Patricia Campos Rojas', '2025-04-24', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (38, 38, 2, 'Rafael Ángel Mora Gamboa', '2025-04-24', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (39, 39, 2, 'Tatiana Jiménez Villalobos', '2025-04-24', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (40, 40, 2, 'Felipe Andrés Montero Pineda', '2025-04-24', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (41, 41, 2, 'Carolina Esquivel Zúñiga', '2025-04-24', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (42, 42, 2, 'Sergio Iván Ramírez Aguilar', '2025-04-24', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (43, 43, 2, 'María José Castro Murillo', '2025-04-24', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (44, 44, 2, 'Alejandro Brenes Salas', '2025-04-24', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (45, 45, 2, 'Laura Isabel Méndez Corrales', '2025-04-24', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (46, 46, 3, 'Lucía Fernanda Mora Salas', '2025-05-08', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (47, 47, 3, 'Carlos Eduardo Jiménez Rojas', '2025-05-08', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (48, 48, 3, 'María Paula Castro Núñez', '2025-05-08', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (49, 49, 3, 'Andrés Felipe Solano Vargas', '2025-05-08', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (50, 50, 3, 'Katherine Rodríguez Brenes', '2025-05-08', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (51, 51, 3, 'Javier Enrique Porras León', '2025-05-08', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (52, 52, 3, 'Sofía Valverde Chacón', '2025-05-08', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (53, 53, 3, 'Roberto Daniel Acuña Mora', '2025-05-08', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (54, 54, 3, 'Valeria Campos Hernández', '2025-05-08', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (55, 55, 3, 'Mauricio Andrés Brenes Soto', '2025-05-08', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (56, 56, 3, 'Daniela Jiménez Araya', '2025-05-08', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (57, 57, 3, 'Pablo Antonio Méndez Castro', '2025-05-08', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (58, 58, 3, 'Gabriela Fernández Aguilar', '2025-05-08', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (59, 59, 3, 'Diego Alejandro Rojas Alfaro', '2025-05-08', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (60, 60, 3, 'Natalia María Hidalgo Vargas', '2025-05-08', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (61, 61, 3, 'Óscar Gerardo Salas Quesada', '2025-05-08', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (62, 62, 3, 'Camila Pacheco Montero', '2025-05-08', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (63, 63, 3, 'Fernando Luis Cordero Arias', '2025-05-08', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (64, 64, 3, 'Mariana Esquivel Ramírez', '2025-05-08', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (65, 65, 4, 'Andrea Valeria Solís Mora', '2025-05-17', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (66, 66, 4, 'Luis Fernando Araya Campos', '2025-05-17', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (67, 67, 4, 'María José Pineda Chaves', '2025-05-17', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (68, 68, 4, 'Esteban Ramírez Monge', '2025-05-17', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (69, 69, 4, 'Natalia Brenes Alfaro', '2025-05-17', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (70, 70, 4, 'Pablo Andrés Castro Rojas', '2025-05-17', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (71, 71, 4, 'Gabriela Montero Jiménez', '2025-05-17', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (72, 72, 4, 'Ricardo Vargas León', '2025-05-17', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (73, 73, 4, 'Daniela Cordero Núñez', '2025-05-17', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (74, 74, 4, 'Jorge Alberto Salas Brenes', '2025-05-17', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (75, 75, 4, 'Camila Hidalgo Quesada', '2025-05-17', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (76, 76, 4, 'Mauricio Fallas Soto', '2025-05-17', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (77, 77, 4, 'Valentina Rojas Herrera', '2025-05-17', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (78, 78, 4, 'Sebastián Mora Pacheco', '2025-05-17', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (79, 79, 4, 'Laura Patricia Arias Vega', '2025-05-17', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (80, 80, 4, 'Óscar Daniel Chacón Mora', '2025-05-17', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (81, 81, 4, 'Mariana Esquivel Soto', '2025-05-17', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (82, 82, 4, 'Fernando Cordero Ramírez', '2025-05-17', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (83, 83, 4, 'Karla Rodríguez Montero', '2025-05-17', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (84, 84, 4, 'Felipe Andrés Quesada Brenes', '2025-05-17', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (85, 85, 4, 'Sofía Fernández Campos', '2025-05-17', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (86, 86, 4, 'Roberto Daniel Vargas Alfaro', '2025-05-17', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (87, 87, 4, 'Carolina Méndez Aguilar', '2025-05-17', 'Confirmado', false, 'No asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (88, 88, 4, 'Héctor Iván Jiménez Salazar', '2025-05-17', 'Confirmado', false, 'No asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (89, 89, 5, 'Fernanda Arias Calderón', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (90, 90, 5, 'José Andrés Vargas Mora', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (91, 91, 5, 'María Paula Salazar Rojas', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (92, 92, 5, 'Luis Diego Chacón Brenes', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (93, 93, 5, 'Natalia Montero Alfaro', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (94, 94, 5, 'Pablo Esteban Castro Solís', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (95, 95, 5, 'Gabriela León Jiménez', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (96, 96, 5, 'Ricardo Quesada Vargas', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (97, 97, 5, 'Daniela Cordero Pacheco', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (98, 98, 5, 'Jorge Alberto Brenes Méndez', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (99, 99, 5, 'Camila Hidalgo Soto', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (100, 100, 5, 'Mauricio Fallas Ramírez', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (101, 101, 5, 'Valentina Rojas Segura', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (102, 102, 5, 'Sebastián Mora Arce', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (103, 103, 5, 'Laura Patricia Arias Núñez', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (104, 104, 5, 'Óscar Daniel Chacón Salas', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (105, 105, 5, 'Mariana Esquivel Porras', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (106, 106, 5, 'Fernando Cordero Valverde', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (107, 107, 5, 'Karla Rodríguez Campos', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (108, 108, 5, 'Felipe Andrés Quesada Mora', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (109, 109, 5, 'Sofía Fernández Aguilar', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (110, 110, 5, 'Roberto Vargas Alfaro', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (111, 111, 5, 'Carolina Méndez Aguilar', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (112, 112, 5, 'Héctor Iván Jiménez Salazar', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (113, 113, 5, 'Patricia Valverde Rojas', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (114, 114, 5, 'Adrián Molina Céspedes', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (115, 115, 5, 'Isabel Cristina Pacheco Mora', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (116, 116, 5, 'Tomás Andrés Rojas León', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (117, 117, 5, 'Marcela Jiménez Vargas', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (118, 118, 5, 'Rodrigo Salas Cordero', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (119, 119, 5, 'Elena Sofía Brenes Castro', '2025-05-22', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (120, 120, 5, 'Gustavo Enrique Mora Pineda', '2025-05-22', 'Confirmado', false, 'No asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (121, 121, 5, 'Adriana María Castro Solano', '2025-05-22', 'Confirmado', false, 'No asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (122, 122, 5, 'Daniel Rojas Fernández', '2025-05-22', 'Confirmado', false, 'No asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (123, 123, 6, 'María Fernanda Solano Rojas', '2025-06-05', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (124, 124, 6, 'José Daniel Vargas Brenes', '2025-06-05', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (125, 125, 6, 'Laura Patricia Chacón Mora', '2025-06-05', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (126, 126, 6, 'Luis Fernando Ramírez Soto', '2025-06-05', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (127, 127, 6, 'Natalia Méndez Alfaro', '2025-06-05', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (128, 128, 6, 'Pablo Andrés Castro León', '2025-06-05', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (129, 129, 6, 'Gabriela Jiménez Salas', '2025-06-05', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (130, 130, 6, 'Ricardo Quesada Montero', '2025-06-05', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (131, 131, 6, 'Daniela Pacheco Cordero', '2025-06-05', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (132, 132, 6, 'Jorge Alberto Brenes Valverde', '2025-06-05', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (133, 133, 6, 'Camila Hidalgo Mora', '2025-06-05', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (134, 134, 6, 'Mauricio Fallas Cordero', '2025-06-05', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (135, 135, 6, 'Valentina Rojas Porras', '2025-06-05', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (136, 136, 6, 'Sebastián Mora Calderón', '2025-06-05', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (137, 137, 6, 'Laura Patricia Arias Campos', '2025-06-05', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (138, 138, 6, 'Óscar Daniel Salas Chacón', '2025-06-05', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (139, 139, 6, 'Mariana Porras Esquivel', '2025-06-05', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (140, 140, 6, 'Fernando Valverde Cordero', '2025-06-05', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (141, 141, 6, 'Karla Campos Rodríguez', '2025-06-05', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (142, 142, 6, 'Felipe Andrés Mora Quesada', '2025-06-05', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (143, 143, 6, 'Sofía Aguilar Fernández', '2025-06-05', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (144, 144, 6, 'Roberto Alfaro Vargas', '2025-06-05', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (145, 145, 6, 'Carolina Aguilar Méndez', '2025-06-05', 'Confirmado', true, 'Asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (146, 146, 6, 'Héctor Jiménez Salazar', '2025-06-05', 'Confirmado', false, 'No asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (147, 147, 6, 'Patricia Rojas Valverde', '2025-06-05', 'Confirmado', false, 'No asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (148, 148, 6, 'Adrián Céspedes Molina', '2025-06-05', 'Confirmado', false, 'No asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (149, 149, 6, 'Isabel Cristina Mora Pacheco', '2025-06-05', 'Confirmado', false, 'No asistió', 35700.00);
INSERT INTO cartularium_ops.participante VALUES (150, 150, 7, 'Gabriela María Rojas Chaves', '2025-06-14', 'Confirmado', true, 'Asistió', 30600.00);
INSERT INTO cartularium_ops.participante VALUES (151, 151, 7, 'Luis Alberto Méndez Vargas', '2025-06-14', 'Confirmado', true, 'Asistió', 30600.00);
INSERT INTO cartularium_ops.participante VALUES (152, 152, 7, 'María José Alfaro Solís', '2025-06-14', 'Confirmado', true, 'Asistió', 30600.00);
INSERT INTO cartularium_ops.participante VALUES (153, 153, 7, 'Carlos Eduardo Porras León', '2025-06-14', 'Confirmado', true, 'Asistió', 30600.00);
INSERT INTO cartularium_ops.participante VALUES (154, 154, 7, 'Valeria Montero Campos', '2025-06-14', 'Confirmado', true, 'Asistió', 30600.00);
INSERT INTO cartularium_ops.participante VALUES (155, 155, 7, 'Jorge Andrés Castro Núñez', '2025-06-14', 'Confirmado', true, 'Asistió', 30600.00);
INSERT INTO cartularium_ops.participante VALUES (156, 156, 7, 'Daniela Brenes Mora', '2025-06-14', 'Confirmado', true, 'Asistió', 30600.00);
INSERT INTO cartularium_ops.participante VALUES (157, 157, 7, 'Ricardo Salazar Jiménez', '2025-06-14', 'Confirmado', true, 'Asistió', 30600.00);
INSERT INTO cartularium_ops.participante VALUES (158, 158, 8, 'María José Vargas Calderón', '2025-06-20', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (159, 159, 8, 'José Andrés Rojas Salas', '2025-06-20', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (160, 160, 8, 'Laura Daniela Méndez Solís', '2025-06-20', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (161, 161, 8, 'Carlos Alberto Chaves Mora', '2025-06-20', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (162, 162, 8, 'Natalia Pacheco Araya', '2025-06-20', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (163, 163, 8, 'Pablo Esteban Alfaro Núñez', '2025-06-20', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (164, 164, 8, 'Gabriela Castro León', '2025-06-20', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (165, 165, 8, 'Ricardo Jiménez Valverde', '2025-06-20', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (166, 166, 8, 'Daniela Montero Campos', '2025-06-20', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (167, 167, 8, 'Jorge Andrés Brenes Soto', '2025-06-20', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (168, 168, 9, 'María Fernanda Castro Rojas', '2025-07-05', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (169, 169, 9, 'José Daniel Alfaro Méndez', '2025-07-05', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (170, 170, 9, 'Laura Valeria Chaves Solís', '2025-07-05', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (171, 171, 9, 'Carlos Andrés Porras Mora', '2025-07-05', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (172, 172, 9, 'Natalia Jiménez Araya', '2025-07-05', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (173, 173, 9, 'Pablo Esteban Vargas Núñez', '2025-07-05', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (174, 174, 9, 'Gabriela Brenes León', '2025-07-05', 'Confirmado', true, 'Asistió', 25500.00);
INSERT INTO cartularium_ops.participante VALUES (175, 175, 10, 'María Fernanda Araya Solano', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (176, 176, 10, 'José Pablo Vargas León', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (177, 177, 10, 'Laura Daniela Salas Mora', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (178, 178, 10, 'Carlos Eduardo Brenes Soto', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (179, 179, 10, 'Natalia Jiménez Pacheco', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (180, 180, 10, 'Pablo Esteban Chaves Núñez', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (181, 181, 10, 'Gabriela Castro Montero', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (182, 182, 10, 'Ricardo Jiménez Calderón', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (183, 183, 10, 'Daniela Montero Rojas', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (184, 184, 10, 'Jorge Andrés Brenes Campos', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (185, 185, 10, 'Camila Hidalgo Alfaro', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (186, 186, 10, 'Mauricio Fallas Valverde', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (187, 187, 10, 'Valentina Rojas Brenes', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (188, 188, 10, 'Sebastián Mora Salazar', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (189, 189, 10, 'Laura Patricia Arias Porras', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (190, 190, 10, 'Óscar Daniel Chacón Vargas', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (191, 191, 10, 'Mariana Porras Alfaro', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (192, 192, 10, 'Fernando Valverde Solano', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (193, 193, 10, 'Karla Campos Mora', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (194, 194, 10, 'Felipe Andrés Quesada Soto', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (195, 195, 10, 'Sofía Fernández Valverde', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (196, 196, 10, 'Roberto Alfaro Méndez', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (197, 197, 10, 'Carolina Aguilar Soto', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (198, 198, 10, 'Héctor Jiménez Rojas', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (199, 199, 10, 'Patricia Rojas Mora', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (200, 200, 10, 'Adrián Céspedes Vargas', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (201, 201, 10, 'Isabel Cristina Mora León', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (202, 202, 10, 'Tomás Andrés Salas Cordero', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (203, 203, 10, 'Marcela Jiménez Porras', '2025-09-11', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (204, 204, 10, 'Rodrigo Salas Brenes', '2025-09-11', 'Confirmado', false, 'No asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (205, 205, 10, 'Elena Sofía Brenes Rojas', '2025-09-11', 'Confirmado', false, 'No asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (206, 175, 11, 'María Fernanda Araya Solano', '2025-09-11', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (207, 176, 11, 'José Pablo Vargas León', '2025-09-11', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (208, 177, 11, 'Laura Daniela Salas Mora', '2025-09-11', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (209, 178, 11, 'Carlos Eduardo Brenes Soto', '2025-09-11', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (210, 179, 11, 'Natalia Jiménez Pacheco', '2025-09-11', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (211, 180, 11, 'Pablo Esteban Chaves Núñez', '2025-09-11', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (212, 181, 11, 'Gabriela Castro Montero', '2025-09-11', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (213, 182, 11, 'Ricardo Jiménez Calderón', '2025-09-11', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (214, 183, 11, 'Daniela Montero Rojas', '2025-09-11', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (215, 184, 11, 'Jorge Andrés Brenes Campos', '2025-09-11', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (216, 185, 11, 'Camila Hidalgo Alfaro', '2025-09-11', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (217, 186, 11, 'Mauricio Fallas Valverde', '2025-09-11', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (218, 187, 11, 'Valentina Rojas Brenes', '2025-09-11', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (219, 188, 11, 'Sebastián Mora Salazar', '2025-09-11', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (220, 189, 11, 'Laura Patricia Arias Porras', '2025-09-11', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (221, 190, 11, 'Óscar Daniel Chacón Vargas', '2025-09-11', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (222, 191, 11, 'Mariana Porras Alfaro', '2025-09-11', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (223, 192, 11, 'Fernando Valverde Solano', '2025-09-11', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (224, 193, 11, 'Karla Campos Mora', '2025-09-11', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (225, 194, 11, 'Felipe Andrés Quesada Soto', '2025-09-11', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (226, 195, 11, 'Sofía Fernández Valverde', '2025-09-11', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (227, 196, 11, 'Roberto Alfaro Méndez', '2025-09-11', 'Confirmado', false, 'No asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (228, 197, 11, 'Carolina Aguilar Soto', '2025-09-11', 'Confirmado', false, 'No asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (229, 198, 11, 'Héctor Jiménez Rojas', '2025-09-11', 'Confirmado', false, 'No asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (230, 199, 11, 'Patricia Rojas Mora', '2025-09-11', 'Confirmado', false, 'No asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (231, 200, 11, 'Adrián Céspedes Vargas', '2025-09-11', 'Confirmado', false, 'No asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (232, 201, 11, 'Isabel Cristina Mora León', '2025-09-11', 'Confirmado', false, 'No asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (233, 202, 11, 'Tomás Andrés Salas Cordero', '2025-09-11', 'Confirmado', false, 'No asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (234, 203, 11, 'Marcela Jiménez Porras', '2025-09-11', 'Confirmado', false, 'No asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (235, 204, 11, 'Rodrigo Salas Brenes', '2025-09-11', 'Confirmado', false, 'No asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (236, 205, 11, 'Elena Sofía Brenes Rojas', '2025-09-11', 'Confirmado', false, 'No asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (237, 206, 12, 'María Fernanda Chaves Mora', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (238, 207, 12, 'José Daniel Rojas Vargas', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (239, 208, 12, 'Laura Daniela Brenes Salas', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (240, 209, 12, 'Carlos Eduardo Mora Soto', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (241, 210, 12, 'Natalia Jiménez Alfaro', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (242, 211, 12, 'Pablo Esteban Cordero Núñez', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (243, 212, 12, 'Gabriela Castro Pacheco', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (244, 213, 12, 'Ricardo Jiménez Valverde', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (245, 214, 12, 'Daniela Montero Solano', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (246, 215, 12, 'Jorge Andrés Brenes Porras', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (247, 216, 12, 'Camila Hidalgo Rojas', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (248, 217, 12, 'Mauricio Fallas Méndez', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (249, 218, 12, 'Valentina Rojas Campos', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (250, 219, 12, 'Sebastián Mora Quesada', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (251, 220, 12, 'Laura Patricia Arias Castro', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (252, 221, 12, 'Óscar Daniel Chacón Pineda', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (253, 222, 12, 'Mariana Porras Vargas', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (254, 223, 12, 'Fernando Valverde Mora', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (255, 224, 12, 'Karla Campos Brenes', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (256, 225, 12, 'Felipe Andrés Quesada Alfaro', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (257, 226, 12, 'Sofía Fernández Solís', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (258, 227, 12, 'Roberto Alfaro Cordero', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (259, 228, 12, 'Carolina Aguilar Vargas', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (260, 229, 12, 'Héctor Jiménez Brenes', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (261, 230, 12, 'Patricia Rojas Salas', '2025-10-09', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (262, 206, 13, 'María Fernanda Chaves Mora', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (263, 207, 13, 'José Daniel Rojas Vargas', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (264, 208, 13, 'Laura Daniela Brenes Salas', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (265, 209, 13, 'Carlos Eduardo Mora Soto', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (266, 210, 13, 'Natalia Jiménez Alfaro', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (267, 211, 13, 'Pablo Esteban Cordero Núñez', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (268, 212, 13, 'Gabriela Castro Pacheco', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (269, 213, 13, 'Ricardo Jiménez Valverde', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (270, 214, 13, 'Daniela Montero Solano', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (271, 215, 13, 'Jorge Andrés Brenes Porras', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (272, 216, 13, 'Camila Hidalgo Rojas', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (273, 217, 13, 'Mauricio Fallas Méndez', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (274, 218, 13, 'Valentina Rojas Campos', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (275, 219, 13, 'Sebastián Mora Quesada', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (276, 220, 13, 'Laura Patricia Arias Castro', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (277, 221, 13, 'Óscar Daniel Chacón Pineda', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (278, 222, 13, 'Mariana Porras Vargas', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (279, 223, 13, 'Fernando Valverde Mora', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (280, 224, 13, 'Karla Campos Brenes', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (281, 225, 13, 'Felipe Andrés Quesada Alfaro', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (282, 226, 13, 'Sofía Fernández Solís', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (283, 227, 13, 'Roberto Alfaro Cordero', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (284, 228, 13, 'Carolina Aguilar Vargas', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (285, 229, 13, 'Héctor Jiménez Brenes', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (286, 230, 13, 'Patricia Rojas Salas', '2025-10-09', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (287, 231, 14, 'María Fernanda Solís Calderón', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (288, 232, 14, 'José Daniel Araya Vargas', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (289, 233, 14, 'Laura Daniela Rojas Brenes', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (290, 234, 14, 'Carlos Eduardo Mora Chaves', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (291, 235, 14, 'Natalia Jiménez Castro', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (292, 236, 14, 'Pablo Esteban Cordero Salas', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (293, 237, 14, 'Gabriela Castro Méndez', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (294, 238, 14, 'Ricardo Jiménez Porras', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (295, 239, 14, 'Daniela Montero Alfaro', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (296, 240, 14, 'Jorge Andrés Brenes Rojas', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (297, 241, 14, 'Camila Hidalgo Mora', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (298, 242, 14, 'Mauricio Fallas Alfaro', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (299, 243, 14, 'Valentina Rojas Pineda', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (300, 244, 14, 'Sebastián Mora Valverde', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (301, 245, 14, 'Laura Patricia Arias Jiménez', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (302, 246, 14, 'Óscar Daniel Chacón Solís', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (303, 247, 14, 'Mariana Porras Chaves', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (304, 248, 14, 'Fernando Valverde Castro', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (305, 249, 14, 'Karla Campos Solano', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (306, 250, 14, 'Felipe Andrés Quesada Brenes', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (307, 251, 14, 'Sofía Fernández Vargas', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (308, 252, 14, 'Roberto Alfaro Salazar', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (309, 253, 14, 'Carolina Aguilar Pacheco', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (310, 254, 14, 'Héctor Jiménez Mora', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (311, 255, 14, 'Patricia Rojas Brenes', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (312, 256, 14, 'Adrián Céspedes Rojas', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (313, 257, 14, 'Isabel Cristina Mora Vargas', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (314, 258, 14, 'Tomás Andrés Salas Jiménez', '2025-10-30', 'Confirmado', true, 'Asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (315, 259, 14, 'Marcela Jiménez Alfaro', '2025-10-30', 'Confirmado', false, 'No asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (316, 260, 14, 'Rodrigo Salas Montero', '2025-10-30', 'Confirmado', false, 'No asistió', 40800.00);
INSERT INTO cartularium_ops.participante VALUES (317, 231, 15, 'María Fernanda Solís Calderón', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (318, 232, 15, 'José Daniel Araya Vargas', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (319, 233, 15, 'Laura Daniela Rojas Brenes', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (320, 234, 15, 'Carlos Eduardo Mora Chaves', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (321, 235, 15, 'Natalia Jiménez Castro', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (322, 236, 15, 'Pablo Esteban Cordero Salas', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (323, 237, 15, 'Gabriela Castro Méndez', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (324, 238, 15, 'Ricardo Jiménez Porras', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (325, 239, 15, 'Daniela Montero Alfaro', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (326, 240, 15, 'Jorge Andrés Brenes Rojas', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (327, 241, 15, 'Camila Hidalgo Mora', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (328, 242, 15, 'Mauricio Fallas Alfaro', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (329, 243, 15, 'Valentina Rojas Pineda', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (330, 244, 15, 'Sebastián Mora Valverde', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (331, 245, 15, 'Laura Patricia Arias Jiménez', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (332, 246, 15, 'Óscar Daniel Chacón Solís', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (333, 247, 15, 'Mariana Porras Chaves', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (334, 248, 15, 'Fernando Valverde Castro', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (335, 249, 15, 'Karla Campos Solano', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (336, 250, 15, 'Felipe Andrés Quesada Brenes', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (337, 251, 15, 'Sofía Fernández Vargas', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (338, 252, 15, 'Roberto Alfaro Salazar', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (339, 253, 15, 'Carolina Aguilar Pacheco', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (340, 254, 15, 'Héctor Jiménez Mora', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (341, 255, 15, 'Patricia Rojas Brenes', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (342, 256, 15, 'Adrián Céspedes Rojas', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (343, 257, 15, 'Isabel Cristina Mora Vargas', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (344, 258, 15, 'Tomás Andrés Salas Jiménez', '2025-10-30', 'Confirmado', true, 'Asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (345, 259, 15, 'Marcela Jiménez Alfaro', '2025-10-30', 'Confirmado', false, 'No asistió', 0.00);
INSERT INTO cartularium_ops.participante VALUES (346, 260, 15, 'Rodrigo Salas Montero', '2025-10-30', 'Confirmado', false, 'No asistió', 0.00);


--
-- TOC entry 5131 (class 0 OID 0)
-- Dependencies: 234
-- Name: certificado_id_certificado_seq; Type: SEQUENCE SET; Schema: cartularium_ops; Owner: -
--

SELECT pg_catalog.setval('cartularium_ops.certificado_id_certificado_seq', 1, false);


--
-- TOC entry 5132 (class 0 OID 0)
-- Dependencies: 226
-- Name: cliente_id_cliente_seq; Type: SEQUENCE SET; Schema: cartularium_ops; Owner: -
--

SELECT pg_catalog.setval('cartularium_ops.cliente_id_cliente_seq', 1, false);


--
-- TOC entry 5133 (class 0 OID 0)
-- Dependencies: 220
-- Name: curso_id_curso_seq; Type: SEQUENCE SET; Schema: cartularium_ops; Owner: -
--

SELECT pg_catalog.setval('cartularium_ops.curso_id_curso_seq', 1, false);


--
-- TOC entry 5134 (class 0 OID 0)
-- Dependencies: 224
-- Name: edicion_curso_id_edicion_seq; Type: SEQUENCE SET; Schema: cartularium_ops; Owner: -
--

SELECT pg_catalog.setval('cartularium_ops.edicion_curso_id_edicion_seq', 1, false);


--
-- TOC entry 5135 (class 0 OID 0)
-- Dependencies: 222
-- Name: expositor_id_expositor_seq; Type: SEQUENCE SET; Schema: cartularium_ops; Owner: -
--

SELECT pg_catalog.setval('cartularium_ops.expositor_id_expositor_seq', 1, false);


--
-- TOC entry 5136 (class 0 OID 0)
-- Dependencies: 230
-- Name: factura_id_factura_seq; Type: SEQUENCE SET; Schema: cartularium_ops; Owner: -
--

SELECT pg_catalog.setval('cartularium_ops.factura_id_factura_seq', 1, false);


--
-- TOC entry 5137 (class 0 OID 0)
-- Dependencies: 232
-- Name: pago_id_pago_seq; Type: SEQUENCE SET; Schema: cartularium_ops; Owner: -
--

SELECT pg_catalog.setval('cartularium_ops.pago_id_pago_seq', 1, false);


--
-- TOC entry 5138 (class 0 OID 0)
-- Dependencies: 228
-- Name: participante_id_participante_seq; Type: SEQUENCE SET; Schema: cartularium_ops; Owner: -
--

SELECT pg_catalog.setval('cartularium_ops.participante_id_participante_seq', 1, false);


--
-- TOC entry 4942 (class 2606 OID 17727)
-- Name: certificado certificado_pkey; Type: CONSTRAINT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.certificado
    ADD CONSTRAINT certificado_pkey PRIMARY KEY (id_certificado);


--
-- TOC entry 4926 (class 2606 OID 17656)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id_cliente);


--
-- TOC entry 4916 (class 2606 OID 17608)
-- Name: curso curso_pkey; Type: CONSTRAINT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (id_curso);


--
-- TOC entry 4922 (class 2606 OID 17635)
-- Name: edicion_curso edicion_curso_pkey; Type: CONSTRAINT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.edicion_curso
    ADD CONSTRAINT edicion_curso_pkey PRIMARY KEY (id_edicion);


--
-- TOC entry 4920 (class 2606 OID 17622)
-- Name: expositor expositor_pkey; Type: CONSTRAINT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.expositor
    ADD CONSTRAINT expositor_pkey PRIMARY KEY (id_expositor);


--
-- TOC entry 4934 (class 2606 OID 17695)
-- Name: factura factura_pkey; Type: CONSTRAINT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.factura
    ADD CONSTRAINT factura_pkey PRIMARY KEY (id_factura);


--
-- TOC entry 4940 (class 2606 OID 17712)
-- Name: pago pago_pkey; Type: CONSTRAINT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.pago
    ADD CONSTRAINT pago_pkey PRIMARY KEY (id_pago);


--
-- TOC entry 4930 (class 2606 OID 17668)
-- Name: participante participante_pkey; Type: CONSTRAINT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.participante
    ADD CONSTRAINT participante_pkey PRIMARY KEY (id_participante);


--
-- TOC entry 4945 (class 2606 OID 17729)
-- Name: certificado uq_certificado_participante; Type: CONSTRAINT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.certificado
    ADD CONSTRAINT uq_certificado_participante UNIQUE (id_participante);


--
-- TOC entry 4932 (class 2606 OID 17670)
-- Name: participante uq_cliente_edicion; Type: CONSTRAINT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.participante
    ADD CONSTRAINT uq_cliente_edicion UNIQUE (id_cliente, id_edicion);


--
-- TOC entry 4947 (class 2606 OID 17731)
-- Name: certificado uq_codigo_certificado; Type: CONSTRAINT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.certificado
    ADD CONSTRAINT uq_codigo_certificado UNIQUE (codigo_certificado);


--
-- TOC entry 4918 (class 2606 OID 17610)
-- Name: curso uq_curso_nombre; Type: CONSTRAINT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.curso
    ADD CONSTRAINT uq_curso_nombre UNIQUE (nombre_curso);


--
-- TOC entry 4937 (class 2606 OID 17697)
-- Name: factura uq_numero_factura; Type: CONSTRAINT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.factura
    ADD CONSTRAINT uq_numero_factura UNIQUE (numero_factura);


--
-- TOC entry 4943 (class 1259 OID 17743)
-- Name: idx_certificado_id_participante; Type: INDEX; Schema: cartularium_ops; Owner: -
--

CREATE INDEX idx_certificado_id_participante ON cartularium_ops.certificado USING btree (id_participante);


--
-- TOC entry 4923 (class 1259 OID 17737)
-- Name: idx_edicion_curso_id_curso; Type: INDEX; Schema: cartularium_ops; Owner: -
--

CREATE INDEX idx_edicion_curso_id_curso ON cartularium_ops.edicion_curso USING btree (id_curso);


--
-- TOC entry 4924 (class 1259 OID 17738)
-- Name: idx_edicion_curso_id_expositor; Type: INDEX; Schema: cartularium_ops; Owner: -
--

CREATE INDEX idx_edicion_curso_id_expositor ON cartularium_ops.edicion_curso USING btree (id_expositor);


--
-- TOC entry 4935 (class 1259 OID 17741)
-- Name: idx_factura_id_participante; Type: INDEX; Schema: cartularium_ops; Owner: -
--

CREATE INDEX idx_factura_id_participante ON cartularium_ops.factura USING btree (id_participante);


--
-- TOC entry 4938 (class 1259 OID 17742)
-- Name: idx_pago_id_factura; Type: INDEX; Schema: cartularium_ops; Owner: -
--

CREATE INDEX idx_pago_id_factura ON cartularium_ops.pago USING btree (id_factura);


--
-- TOC entry 4927 (class 1259 OID 17739)
-- Name: idx_participante_id_cliente; Type: INDEX; Schema: cartularium_ops; Owner: -
--

CREATE INDEX idx_participante_id_cliente ON cartularium_ops.participante USING btree (id_cliente);


--
-- TOC entry 4928 (class 1259 OID 17740)
-- Name: idx_participante_id_edicion; Type: INDEX; Schema: cartularium_ops; Owner: -
--

CREATE INDEX idx_participante_id_edicion ON cartularium_ops.participante USING btree (id_edicion);


--
-- TOC entry 4954 (class 2606 OID 17732)
-- Name: certificado fk_certificado_participante; Type: FK CONSTRAINT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.certificado
    ADD CONSTRAINT fk_certificado_participante FOREIGN KEY (id_participante) REFERENCES cartularium_ops.participante(id_participante);


--
-- TOC entry 4948 (class 2606 OID 17636)
-- Name: edicion_curso fk_edicion_curso; Type: FK CONSTRAINT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.edicion_curso
    ADD CONSTRAINT fk_edicion_curso FOREIGN KEY (id_curso) REFERENCES cartularium_ops.curso(id_curso);


--
-- TOC entry 4949 (class 2606 OID 17641)
-- Name: edicion_curso fk_edicion_expositor; Type: FK CONSTRAINT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.edicion_curso
    ADD CONSTRAINT fk_edicion_expositor FOREIGN KEY (id_expositor) REFERENCES cartularium_ops.expositor(id_expositor);


--
-- TOC entry 4952 (class 2606 OID 17698)
-- Name: factura fk_factura_participante; Type: FK CONSTRAINT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.factura
    ADD CONSTRAINT fk_factura_participante FOREIGN KEY (id_participante) REFERENCES cartularium_ops.participante(id_participante);


--
-- TOC entry 4953 (class 2606 OID 17713)
-- Name: pago fk_pago_factura; Type: FK CONSTRAINT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.pago
    ADD CONSTRAINT fk_pago_factura FOREIGN KEY (id_factura) REFERENCES cartularium_ops.factura(id_factura);


--
-- TOC entry 4950 (class 2606 OID 17671)
-- Name: participante fk_participante_cliente; Type: FK CONSTRAINT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.participante
    ADD CONSTRAINT fk_participante_cliente FOREIGN KEY (id_cliente) REFERENCES cartularium_ops.cliente(id_cliente);


--
-- TOC entry 4951 (class 2606 OID 17676)
-- Name: participante fk_participante_edicion; Type: FK CONSTRAINT; Schema: cartularium_ops; Owner: -
--

ALTER TABLE ONLY cartularium_ops.participante
    ADD CONSTRAINT fk_participante_edicion FOREIGN KEY (id_edicion) REFERENCES cartularium_ops.edicion_curso(id_edicion);


-- Completed on 2026-05-25 18:58:23

--
-- PostgreSQL database dump complete
--

\unrestrict kcjhWQisnjhX2pQ7qoBo4OnwBTCNlpDE7RbBibpvFJZvw8lBBfpZD62XQeE5CpZ

