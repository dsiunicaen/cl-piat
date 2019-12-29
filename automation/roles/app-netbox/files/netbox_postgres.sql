--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO netbox;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO netbox;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO netbox;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO netbox;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO netbox;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO netbox;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO netbox;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO netbox;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO netbox;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO netbox;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO netbox;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO netbox;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: circuits_circuit; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_circuit (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    cid character varying(50) NOT NULL,
    install_date date,
    commit_rate integer,
    comments text NOT NULL,
    provider_id integer NOT NULL,
    type_id integer NOT NULL,
    tenant_id integer,
    description character varying(100) NOT NULL,
    status smallint NOT NULL,
    CONSTRAINT circuits_circuit_commit_rate_check CHECK ((commit_rate >= 0)),
    CONSTRAINT circuits_circuit_status_check CHECK ((status >= 0))
);


ALTER TABLE public.circuits_circuit OWNER TO netbox;

--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_circuit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_circuit_id_seq OWNER TO netbox;

--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_circuit_id_seq OWNED BY public.circuits_circuit.id;


--
-- Name: circuits_circuittermination; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_circuittermination (
    id integer NOT NULL,
    term_side character varying(1) NOT NULL,
    port_speed integer NOT NULL,
    upstream_speed integer,
    xconnect_id character varying(50) NOT NULL,
    pp_info character varying(100) NOT NULL,
    circuit_id integer NOT NULL,
    site_id integer NOT NULL,
    connected_endpoint_id integer,
    connection_status boolean,
    cable_id integer,
    description character varying(100) NOT NULL,
    CONSTRAINT circuits_circuittermination_port_speed_check CHECK ((port_speed >= 0)),
    CONSTRAINT circuits_circuittermination_upstream_speed_check CHECK ((upstream_speed >= 0))
);


ALTER TABLE public.circuits_circuittermination OWNER TO netbox;

--
-- Name: circuits_circuittermination_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_circuittermination_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_circuittermination_id_seq OWNER TO netbox;

--
-- Name: circuits_circuittermination_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_circuittermination_id_seq OWNED BY public.circuits_circuittermination.id;


--
-- Name: circuits_circuittype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_circuittype (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.circuits_circuittype OWNER TO netbox;

--
-- Name: circuits_circuittype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_circuittype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_circuittype_id_seq OWNER TO netbox;

--
-- Name: circuits_circuittype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_circuittype_id_seq OWNED BY public.circuits_circuittype.id;


--
-- Name: circuits_provider; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_provider (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    asn bigint,
    account character varying(30) NOT NULL,
    portal_url character varying(200) NOT NULL,
    noc_contact text NOT NULL,
    admin_contact text NOT NULL,
    comments text NOT NULL
);


ALTER TABLE public.circuits_provider OWNER TO netbox;

--
-- Name: circuits_provider_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_provider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_provider_id_seq OWNER TO netbox;

--
-- Name: circuits_provider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_provider_id_seq OWNED BY public.circuits_provider.id;


--
-- Name: dcim_cable; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_cable (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    termination_a_id integer NOT NULL,
    termination_b_id integer NOT NULL,
    type smallint,
    status boolean NOT NULL,
    label character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    length smallint,
    length_unit smallint,
    _abs_length numeric(10,4),
    termination_a_type_id integer NOT NULL,
    termination_b_type_id integer NOT NULL,
    _termination_a_device_id integer,
    _termination_b_device_id integer,
    CONSTRAINT dcim_cable_length_check CHECK ((length >= 0)),
    CONSTRAINT dcim_cable_length_unit_check CHECK ((length_unit >= 0)),
    CONSTRAINT dcim_cable_termination_a_id_check CHECK ((termination_a_id >= 0)),
    CONSTRAINT dcim_cable_termination_b_id_check CHECK ((termination_b_id >= 0)),
    CONSTRAINT dcim_cable_type_check CHECK ((type >= 0))
);


ALTER TABLE public.dcim_cable OWNER TO netbox;

--
-- Name: dcim_cable_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_cable_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_cable_id_seq OWNER TO netbox;

--
-- Name: dcim_cable_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_cable_id_seq OWNED BY public.dcim_cable.id;


--
-- Name: dcim_consoleport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleport (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    connection_status boolean,
    connected_endpoint_id integer,
    device_id integer NOT NULL,
    cable_id integer,
    description character varying(100) NOT NULL
);


ALTER TABLE public.dcim_consoleport OWNER TO netbox;

--
-- Name: dcim_consoleport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleport_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleport_id_seq OWNED BY public.dcim_consoleport.id;


--
-- Name: dcim_consoleporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleporttemplate (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    device_type_id integer NOT NULL
);


ALTER TABLE public.dcim_consoleporttemplate OWNER TO netbox;

--
-- Name: dcim_consoleporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleporttemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleporttemplate_id_seq OWNED BY public.dcim_consoleporttemplate.id;


--
-- Name: dcim_consoleserverport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleserverport (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    device_id integer NOT NULL,
    cable_id integer,
    connection_status boolean,
    description character varying(100) NOT NULL
);


ALTER TABLE public.dcim_consoleserverport OWNER TO netbox;

--
-- Name: dcim_consoleserverport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleserverport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleserverport_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleserverport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleserverport_id_seq OWNED BY public.dcim_consoleserverport.id;


--
-- Name: dcim_consoleserverporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleserverporttemplate (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    device_type_id integer NOT NULL
);


ALTER TABLE public.dcim_consoleserverporttemplate OWNER TO netbox;

--
-- Name: dcim_consoleserverporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleserverporttemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleserverporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleserverporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleserverporttemplate_id_seq OWNED BY public.dcim_consoleserverporttemplate.id;


--
-- Name: dcim_device; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_device (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(64),
    serial character varying(50) NOT NULL,
    "position" smallint,
    face smallint,
    status smallint NOT NULL,
    comments text NOT NULL,
    device_role_id integer NOT NULL,
    device_type_id integer NOT NULL,
    platform_id integer,
    rack_id integer,
    primary_ip4_id integer,
    primary_ip6_id integer,
    tenant_id integer,
    asset_tag character varying(50),
    site_id integer NOT NULL,
    cluster_id integer,
    virtual_chassis_id integer,
    vc_position smallint,
    vc_priority smallint,
    local_context_data jsonb,
    CONSTRAINT dcim_device_face_check CHECK ((face >= 0)),
    CONSTRAINT dcim_device_position_check CHECK (("position" >= 0)),
    CONSTRAINT dcim_device_status_4f698226_check CHECK ((status >= 0)),
    CONSTRAINT dcim_device_vc_position_check CHECK ((vc_position >= 0)),
    CONSTRAINT dcim_device_vc_priority_check CHECK ((vc_priority >= 0))
);


ALTER TABLE public.dcim_device OWNER TO netbox;

--
-- Name: dcim_device_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_device_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_device_id_seq OWNER TO netbox;

--
-- Name: dcim_device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_device_id_seq OWNED BY public.dcim_device.id;


--
-- Name: dcim_devicebay; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicebay (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    device_id integer NOT NULL,
    installed_device_id integer,
    description character varying(100) NOT NULL
);


ALTER TABLE public.dcim_devicebay OWNER TO netbox;

--
-- Name: dcim_devicebay_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicebay_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicebay_id_seq OWNER TO netbox;

--
-- Name: dcim_devicebay_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicebay_id_seq OWNED BY public.dcim_devicebay.id;


--
-- Name: dcim_devicebaytemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicebaytemplate (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    device_type_id integer NOT NULL
);


ALTER TABLE public.dcim_devicebaytemplate OWNER TO netbox;

--
-- Name: dcim_devicebaytemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicebaytemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicebaytemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_devicebaytemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicebaytemplate_id_seq OWNED BY public.dcim_devicebaytemplate.id;


--
-- Name: dcim_devicerole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicerole (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    color character varying(6) NOT NULL,
    vm_role boolean NOT NULL,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_devicerole OWNER TO netbox;

--
-- Name: dcim_devicerole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicerole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicerole_id_seq OWNER TO netbox;

--
-- Name: dcim_devicerole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicerole_id_seq OWNED BY public.dcim_devicerole.id;


--
-- Name: dcim_devicetype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicetype (
    id integer NOT NULL,
    model character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    u_height smallint NOT NULL,
    is_full_depth boolean NOT NULL,
    manufacturer_id integer NOT NULL,
    subdevice_role boolean,
    part_number character varying(50) NOT NULL,
    comments text NOT NULL,
    created date,
    last_updated timestamp with time zone,
    CONSTRAINT dcim_devicetype_u_height_check CHECK ((u_height >= 0))
);


ALTER TABLE public.dcim_devicetype OWNER TO netbox;

--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicetype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicetype_id_seq OWNER TO netbox;

--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicetype_id_seq OWNED BY public.dcim_devicetype.id;


--
-- Name: dcim_frontport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_frontport (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    type smallint NOT NULL,
    rear_port_position smallint NOT NULL,
    description character varying(100) NOT NULL,
    device_id integer NOT NULL,
    rear_port_id integer NOT NULL,
    cable_id integer,
    CONSTRAINT dcim_frontport_rear_port_position_check CHECK ((rear_port_position >= 0)),
    CONSTRAINT dcim_frontport_type_check CHECK ((type >= 0))
);


ALTER TABLE public.dcim_frontport OWNER TO netbox;

--
-- Name: dcim_frontport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_frontport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_frontport_id_seq OWNER TO netbox;

--
-- Name: dcim_frontport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_frontport_id_seq OWNED BY public.dcim_frontport.id;


--
-- Name: dcim_frontporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_frontporttemplate (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    type smallint NOT NULL,
    rear_port_position smallint NOT NULL,
    device_type_id integer NOT NULL,
    rear_port_id integer NOT NULL,
    CONSTRAINT dcim_frontporttemplate_rear_port_position_check CHECK ((rear_port_position >= 0)),
    CONSTRAINT dcim_frontporttemplate_type_check CHECK ((type >= 0))
);


ALTER TABLE public.dcim_frontporttemplate OWNER TO netbox;

--
-- Name: dcim_frontporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_frontporttemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_frontporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_frontporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_frontporttemplate_id_seq OWNED BY public.dcim_frontporttemplate.id;


--
-- Name: dcim_interface; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interface (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    type smallint NOT NULL,
    mgmt_only boolean NOT NULL,
    description character varying(100) NOT NULL,
    device_id integer,
    mac_address macaddr,
    lag_id integer,
    enabled boolean NOT NULL,
    mtu integer,
    virtual_machine_id integer,
    mode smallint,
    untagged_vlan_id integer,
    _connected_circuittermination_id integer,
    _connected_interface_id integer,
    connection_status boolean,
    cable_id integer,
    CONSTRAINT dcim_interface_mode_check CHECK ((mode >= 0)),
    CONSTRAINT dcim_interface_mtu_check CHECK ((mtu >= 0)),
    CONSTRAINT dcim_interface_type_b8044832_check CHECK ((type >= 0))
);


ALTER TABLE public.dcim_interface OWNER TO netbox;

--
-- Name: dcim_interface_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interface_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interface_id_seq OWNER TO netbox;

--
-- Name: dcim_interface_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interface_id_seq OWNED BY public.dcim_interface.id;


--
-- Name: dcim_interface_tagged_vlans; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interface_tagged_vlans (
    id integer NOT NULL,
    interface_id integer NOT NULL,
    vlan_id integer NOT NULL
);


ALTER TABLE public.dcim_interface_tagged_vlans OWNER TO netbox;

--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interface_tagged_vlans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interface_tagged_vlans_id_seq OWNER TO netbox;

--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interface_tagged_vlans_id_seq OWNED BY public.dcim_interface_tagged_vlans.id;


--
-- Name: dcim_interfacetemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interfacetemplate (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    type smallint NOT NULL,
    mgmt_only boolean NOT NULL,
    device_type_id integer NOT NULL,
    CONSTRAINT dcim_interfacetemplate_type_ebd08d49_check CHECK ((type >= 0))
);


ALTER TABLE public.dcim_interfacetemplate OWNER TO netbox;

--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interfacetemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interfacetemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interfacetemplate_id_seq OWNED BY public.dcim_interfacetemplate.id;


--
-- Name: dcim_inventoryitem; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_inventoryitem (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    part_id character varying(50) NOT NULL,
    serial character varying(50) NOT NULL,
    discovered boolean NOT NULL,
    device_id integer NOT NULL,
    parent_id integer,
    manufacturer_id integer,
    asset_tag character varying(50),
    description character varying(100) NOT NULL
);


ALTER TABLE public.dcim_inventoryitem OWNER TO netbox;

--
-- Name: dcim_manufacturer; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_manufacturer (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_manufacturer OWNER TO netbox;

--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_manufacturer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_manufacturer_id_seq OWNER TO netbox;

--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_manufacturer_id_seq OWNED BY public.dcim_manufacturer.id;


--
-- Name: dcim_module_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_module_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_module_id_seq OWNER TO netbox;

--
-- Name: dcim_module_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_module_id_seq OWNED BY public.dcim_inventoryitem.id;


--
-- Name: dcim_platform; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_platform (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    napalm_driver character varying(50) NOT NULL,
    manufacturer_id integer,
    created date,
    last_updated timestamp with time zone,
    napalm_args jsonb
);


ALTER TABLE public.dcim_platform OWNER TO netbox;

--
-- Name: dcim_platform_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_platform_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_platform_id_seq OWNER TO netbox;

--
-- Name: dcim_platform_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_platform_id_seq OWNED BY public.dcim_platform.id;


--
-- Name: dcim_powerfeed; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerfeed (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(50) NOT NULL,
    status smallint NOT NULL,
    type smallint NOT NULL,
    supply smallint NOT NULL,
    phase smallint NOT NULL,
    voltage smallint NOT NULL,
    amperage smallint NOT NULL,
    max_utilization smallint NOT NULL,
    available_power smallint NOT NULL,
    comments text NOT NULL,
    cable_id integer,
    power_panel_id integer NOT NULL,
    rack_id integer,
    connected_endpoint_id integer,
    connection_status boolean,
    CONSTRAINT dcim_powerfeed_amperage_check CHECK ((amperage >= 0)),
    CONSTRAINT dcim_powerfeed_available_power_check CHECK ((available_power >= 0)),
    CONSTRAINT dcim_powerfeed_max_utilization_check CHECK ((max_utilization >= 0)),
    CONSTRAINT dcim_powerfeed_phase_check CHECK ((phase >= 0)),
    CONSTRAINT dcim_powerfeed_status_check CHECK ((status >= 0)),
    CONSTRAINT dcim_powerfeed_supply_check CHECK ((supply >= 0)),
    CONSTRAINT dcim_powerfeed_type_check CHECK ((type >= 0)),
    CONSTRAINT dcim_powerfeed_voltage_check CHECK ((voltage >= 0))
);


ALTER TABLE public.dcim_powerfeed OWNER TO netbox;

--
-- Name: dcim_powerfeed_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerfeed_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerfeed_id_seq OWNER TO netbox;

--
-- Name: dcim_powerfeed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerfeed_id_seq OWNED BY public.dcim_powerfeed.id;


--
-- Name: dcim_poweroutlet; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_poweroutlet (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    device_id integer NOT NULL,
    cable_id integer,
    connection_status boolean,
    description character varying(100) NOT NULL,
    feed_leg smallint,
    power_port_id integer,
    CONSTRAINT dcim_poweroutlet_feed_leg_check CHECK ((feed_leg >= 0))
);


ALTER TABLE public.dcim_poweroutlet OWNER TO netbox;

--
-- Name: dcim_poweroutlet_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_poweroutlet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_poweroutlet_id_seq OWNER TO netbox;

--
-- Name: dcim_poweroutlet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_poweroutlet_id_seq OWNED BY public.dcim_poweroutlet.id;


--
-- Name: dcim_poweroutlettemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_poweroutlettemplate (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    device_type_id integer NOT NULL,
    feed_leg smallint,
    power_port_id integer,
    CONSTRAINT dcim_poweroutlettemplate_feed_leg_check CHECK ((feed_leg >= 0))
);


ALTER TABLE public.dcim_poweroutlettemplate OWNER TO netbox;

--
-- Name: dcim_poweroutlettemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_poweroutlettemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_poweroutlettemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_poweroutlettemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_poweroutlettemplate_id_seq OWNED BY public.dcim_poweroutlettemplate.id;


--
-- Name: dcim_powerpanel; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerpanel (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(50) NOT NULL,
    rack_group_id integer,
    site_id integer NOT NULL
);


ALTER TABLE public.dcim_powerpanel OWNER TO netbox;

--
-- Name: dcim_powerpanel_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerpanel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerpanel_id_seq OWNER TO netbox;

--
-- Name: dcim_powerpanel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerpanel_id_seq OWNED BY public.dcim_powerpanel.id;


--
-- Name: dcim_powerport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerport (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    connection_status boolean,
    device_id integer NOT NULL,
    _connected_poweroutlet_id integer,
    cable_id integer,
    description character varying(100) NOT NULL,
    _connected_powerfeed_id integer,
    allocated_draw smallint,
    maximum_draw smallint,
    CONSTRAINT dcim_powerport_allocated_draw_check CHECK ((allocated_draw >= 0)),
    CONSTRAINT dcim_powerport_maximum_draw_check CHECK ((maximum_draw >= 0))
);


ALTER TABLE public.dcim_powerport OWNER TO netbox;

--
-- Name: dcim_powerport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerport_id_seq OWNER TO netbox;

--
-- Name: dcim_powerport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerport_id_seq OWNED BY public.dcim_powerport.id;


--
-- Name: dcim_powerporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerporttemplate (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    device_type_id integer NOT NULL,
    allocated_draw smallint,
    maximum_draw smallint,
    CONSTRAINT dcim_powerporttemplate_allocated_draw_check CHECK ((allocated_draw >= 0)),
    CONSTRAINT dcim_powerporttemplate_maximum_draw_check CHECK ((maximum_draw >= 0))
);


ALTER TABLE public.dcim_powerporttemplate OWNER TO netbox;

--
-- Name: dcim_powerporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerporttemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_powerporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerporttemplate_id_seq OWNED BY public.dcim_powerporttemplate.id;


--
-- Name: dcim_rack; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rack (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(50) NOT NULL,
    facility_id character varying(50),
    u_height smallint NOT NULL,
    comments text NOT NULL,
    group_id integer,
    site_id integer NOT NULL,
    tenant_id integer,
    type smallint,
    width smallint NOT NULL,
    role_id integer,
    desc_units boolean NOT NULL,
    serial character varying(50) NOT NULL,
    status smallint NOT NULL,
    asset_tag character varying(50),
    outer_depth smallint,
    outer_unit smallint,
    outer_width smallint,
    CONSTRAINT dcim_rack_outer_depth_check CHECK ((outer_depth >= 0)),
    CONSTRAINT dcim_rack_outer_unit_check CHECK ((outer_unit >= 0)),
    CONSTRAINT dcim_rack_outer_width_check CHECK ((outer_width >= 0)),
    CONSTRAINT dcim_rack_status_check CHECK ((status >= 0)),
    CONSTRAINT dcim_rack_type_check CHECK ((type >= 0)),
    CONSTRAINT dcim_rack_u_height_check CHECK ((u_height >= 0)),
    CONSTRAINT dcim_rack_width_check CHECK ((width >= 0))
);


ALTER TABLE public.dcim_rack OWNER TO netbox;

--
-- Name: dcim_rack_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rack_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rack_id_seq OWNER TO netbox;

--
-- Name: dcim_rack_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rack_id_seq OWNED BY public.dcim_rack.id;


--
-- Name: dcim_rackgroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rackgroup (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    site_id integer NOT NULL,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_rackgroup OWNER TO netbox;

--
-- Name: dcim_rackgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rackgroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rackgroup_id_seq OWNER TO netbox;

--
-- Name: dcim_rackgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rackgroup_id_seq OWNED BY public.dcim_rackgroup.id;


--
-- Name: dcim_rackreservation; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rackreservation (
    id integer NOT NULL,
    units smallint[] NOT NULL,
    created date,
    description character varying(100) NOT NULL,
    rack_id integer NOT NULL,
    user_id integer NOT NULL,
    tenant_id integer,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_rackreservation OWNER TO netbox;

--
-- Name: dcim_rackreservation_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rackreservation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rackreservation_id_seq OWNER TO netbox;

--
-- Name: dcim_rackreservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rackreservation_id_seq OWNED BY public.dcim_rackreservation.id;


--
-- Name: dcim_rackrole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rackrole (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    color character varying(6) NOT NULL,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_rackrole OWNER TO netbox;

--
-- Name: dcim_rackrole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rackrole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rackrole_id_seq OWNER TO netbox;

--
-- Name: dcim_rackrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rackrole_id_seq OWNED BY public.dcim_rackrole.id;


--
-- Name: dcim_rearport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rearport (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    type smallint NOT NULL,
    positions smallint NOT NULL,
    description character varying(100) NOT NULL,
    device_id integer NOT NULL,
    cable_id integer,
    CONSTRAINT dcim_rearport_positions_check CHECK ((positions >= 0)),
    CONSTRAINT dcim_rearport_type_check CHECK ((type >= 0))
);


ALTER TABLE public.dcim_rearport OWNER TO netbox;

--
-- Name: dcim_rearport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rearport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rearport_id_seq OWNER TO netbox;

--
-- Name: dcim_rearport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rearport_id_seq OWNED BY public.dcim_rearport.id;


--
-- Name: dcim_rearporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rearporttemplate (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    type smallint NOT NULL,
    positions smallint NOT NULL,
    device_type_id integer NOT NULL,
    CONSTRAINT dcim_rearporttemplate_positions_check CHECK ((positions >= 0)),
    CONSTRAINT dcim_rearporttemplate_type_check CHECK ((type >= 0))
);


ALTER TABLE public.dcim_rearporttemplate OWNER TO netbox;

--
-- Name: dcim_rearporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rearporttemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rearporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_rearporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rearporttemplate_id_seq OWNED BY public.dcim_rearporttemplate.id;


--
-- Name: dcim_region; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_region (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id integer,
    created date,
    last_updated timestamp with time zone,
    CONSTRAINT dcim_region_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_region_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_region_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_region_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_region OWNER TO netbox;

--
-- Name: dcim_region_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_region_id_seq OWNER TO netbox;

--
-- Name: dcim_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_region_id_seq OWNED BY public.dcim_region.id;


--
-- Name: dcim_site; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_site (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    facility character varying(50) NOT NULL,
    asn bigint,
    physical_address character varying(200) NOT NULL,
    shipping_address character varying(200) NOT NULL,
    comments text NOT NULL,
    tenant_id integer,
    contact_email character varying(254) NOT NULL,
    contact_name character varying(50) NOT NULL,
    contact_phone character varying(20) NOT NULL,
    region_id integer,
    description character varying(100) NOT NULL,
    status smallint NOT NULL,
    time_zone character varying(63) NOT NULL,
    latitude numeric(8,6),
    longitude numeric(9,6),
    CONSTRAINT dcim_site_status_check CHECK ((status >= 0))
);


ALTER TABLE public.dcim_site OWNER TO netbox;

--
-- Name: dcim_site_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_site_id_seq OWNER TO netbox;

--
-- Name: dcim_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_site_id_seq OWNED BY public.dcim_site.id;


--
-- Name: dcim_virtualchassis; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_virtualchassis (
    id integer NOT NULL,
    domain character varying(30) NOT NULL,
    master_id integer NOT NULL,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.dcim_virtualchassis OWNER TO netbox;

--
-- Name: dcim_virtualchassis_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_virtualchassis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_virtualchassis_id_seq OWNER TO netbox;

--
-- Name: dcim_virtualchassis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_virtualchassis_id_seq OWNED BY public.dcim_virtualchassis.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: netbox
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


ALTER TABLE public.django_admin_log OWNER TO netbox;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO netbox;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO netbox;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO netbox;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO netbox;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO netbox;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO netbox;

--
-- Name: extras_configcontext; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    weight smallint NOT NULL,
    description character varying(100) NOT NULL,
    is_active boolean NOT NULL,
    data jsonb NOT NULL,
    CONSTRAINT extras_configcontext_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_configcontext OWNER TO netbox;

--
-- Name: extras_configcontext_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_id_seq OWNED BY public.extras_configcontext.id;


--
-- Name: extras_configcontext_platforms; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_platforms (
    id integer NOT NULL,
    configcontext_id integer NOT NULL,
    platform_id integer NOT NULL
);


ALTER TABLE public.extras_configcontext_platforms OWNER TO netbox;

--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_platforms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_platforms_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_platforms_id_seq OWNED BY public.extras_configcontext_platforms.id;


--
-- Name: extras_configcontext_regions; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_regions (
    id integer NOT NULL,
    configcontext_id integer NOT NULL,
    region_id integer NOT NULL
);


ALTER TABLE public.extras_configcontext_regions OWNER TO netbox;

--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_regions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_regions_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_regions_id_seq OWNED BY public.extras_configcontext_regions.id;


--
-- Name: extras_configcontext_roles; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_roles (
    id integer NOT NULL,
    configcontext_id integer NOT NULL,
    devicerole_id integer NOT NULL
);


ALTER TABLE public.extras_configcontext_roles OWNER TO netbox;

--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_roles_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_roles_id_seq OWNED BY public.extras_configcontext_roles.id;


--
-- Name: extras_configcontext_sites; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_sites (
    id integer NOT NULL,
    configcontext_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.extras_configcontext_sites OWNER TO netbox;

--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_sites_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_sites_id_seq OWNED BY public.extras_configcontext_sites.id;


--
-- Name: extras_configcontext_tenant_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_tenant_groups (
    id integer NOT NULL,
    configcontext_id integer NOT NULL,
    tenantgroup_id integer NOT NULL
);


ALTER TABLE public.extras_configcontext_tenant_groups OWNER TO netbox;

--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_tenant_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tenant_groups_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_tenant_groups_id_seq OWNED BY public.extras_configcontext_tenant_groups.id;


--
-- Name: extras_configcontext_tenants; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_configcontext_tenants (
    id integer NOT NULL,
    configcontext_id integer NOT NULL,
    tenant_id integer NOT NULL
);


ALTER TABLE public.extras_configcontext_tenants OWNER TO netbox;

--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_configcontext_tenants_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_configcontext_tenants_id_seq OWNER TO netbox;

--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_configcontext_tenants_id_seq OWNED BY public.extras_configcontext_tenants.id;


--
-- Name: extras_customfield; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customfield (
    id integer NOT NULL,
    type smallint NOT NULL,
    name character varying(50) NOT NULL,
    label character varying(50) NOT NULL,
    description character varying(100) NOT NULL,
    required boolean NOT NULL,
    "default" character varying(100) NOT NULL,
    weight smallint NOT NULL,
    filter_logic smallint NOT NULL,
    CONSTRAINT extras_customfield_filter_logic_check CHECK ((filter_logic >= 0)),
    CONSTRAINT extras_customfield_type_check CHECK ((type >= 0)),
    CONSTRAINT extras_customfield_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_customfield OWNER TO netbox;

--
-- Name: extras_customfield_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customfield_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customfield_id_seq OWNER TO netbox;

--
-- Name: extras_customfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customfield_id_seq OWNED BY public.extras_customfield.id;


--
-- Name: extras_customfield_obj_type; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customfield_obj_type (
    id integer NOT NULL,
    customfield_id integer NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_customfield_obj_type OWNER TO netbox;

--
-- Name: extras_customfield_obj_type_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customfield_obj_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customfield_obj_type_id_seq OWNER TO netbox;

--
-- Name: extras_customfield_obj_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customfield_obj_type_id_seq OWNED BY public.extras_customfield_obj_type.id;


--
-- Name: extras_customfieldchoice; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customfieldchoice (
    id integer NOT NULL,
    value character varying(100) NOT NULL,
    weight smallint NOT NULL,
    field_id integer NOT NULL,
    CONSTRAINT extras_customfieldchoice_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_customfieldchoice OWNER TO netbox;

--
-- Name: extras_customfieldchoice_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customfieldchoice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customfieldchoice_id_seq OWNER TO netbox;

--
-- Name: extras_customfieldchoice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customfieldchoice_id_seq OWNED BY public.extras_customfieldchoice.id;


--
-- Name: extras_customfieldvalue; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customfieldvalue (
    id integer NOT NULL,
    obj_id integer NOT NULL,
    serialized_value character varying(255) NOT NULL,
    field_id integer NOT NULL,
    obj_type_id integer NOT NULL,
    CONSTRAINT extras_customfieldvalue_obj_id_check CHECK ((obj_id >= 0))
);


ALTER TABLE public.extras_customfieldvalue OWNER TO netbox;

--
-- Name: extras_customfieldvalue_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customfieldvalue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customfieldvalue_id_seq OWNER TO netbox;

--
-- Name: extras_customfieldvalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customfieldvalue_id_seq OWNED BY public.extras_customfieldvalue.id;


--
-- Name: extras_customlink; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customlink (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    text character varying(500) NOT NULL,
    url character varying(500) NOT NULL,
    weight smallint NOT NULL,
    group_name character varying(50) NOT NULL,
    button_class character varying(30) NOT NULL,
    new_window boolean NOT NULL,
    content_type_id integer NOT NULL,
    CONSTRAINT extras_customlink_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_customlink OWNER TO netbox;

--
-- Name: extras_customlink_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customlink_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customlink_id_seq OWNER TO netbox;

--
-- Name: extras_customlink_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customlink_id_seq OWNED BY public.extras_customlink.id;


--
-- Name: extras_exporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_exporttemplate (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    template_code text NOT NULL,
    mime_type character varying(50) NOT NULL,
    file_extension character varying(15) NOT NULL,
    content_type_id integer NOT NULL,
    description character varying(200) NOT NULL,
    template_language smallint NOT NULL,
    CONSTRAINT extras_exporttemplate_template_language_check CHECK ((template_language >= 0))
);


ALTER TABLE public.extras_exporttemplate OWNER TO netbox;

--
-- Name: extras_exporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_exporttemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_exporttemplate_id_seq OWNER TO netbox;

--
-- Name: extras_exporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_exporttemplate_id_seq OWNED BY public.extras_exporttemplate.id;


--
-- Name: extras_graph; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_graph (
    id integer NOT NULL,
    type smallint NOT NULL,
    weight smallint NOT NULL,
    name character varying(100) NOT NULL,
    source character varying(500) NOT NULL,
    link character varying(200) NOT NULL,
    CONSTRAINT extras_graph_type_check CHECK ((type >= 0)),
    CONSTRAINT extras_graph_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_graph OWNER TO netbox;

--
-- Name: extras_graph_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_graph_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_graph_id_seq OWNER TO netbox;

--
-- Name: extras_graph_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_graph_id_seq OWNED BY public.extras_graph.id;


--
-- Name: extras_imageattachment; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_imageattachment (
    id integer NOT NULL,
    object_id integer NOT NULL,
    image character varying(100) NOT NULL,
    image_height smallint NOT NULL,
    image_width smallint NOT NULL,
    name character varying(50) NOT NULL,
    created timestamp with time zone NOT NULL,
    content_type_id integer NOT NULL,
    CONSTRAINT extras_imageattachment_image_height_check CHECK ((image_height >= 0)),
    CONSTRAINT extras_imageattachment_image_width_check CHECK ((image_width >= 0)),
    CONSTRAINT extras_imageattachment_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.extras_imageattachment OWNER TO netbox;

--
-- Name: extras_imageattachment_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_imageattachment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_imageattachment_id_seq OWNER TO netbox;

--
-- Name: extras_imageattachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_imageattachment_id_seq OWNED BY public.extras_imageattachment.id;


--
-- Name: extras_objectchange; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_objectchange (
    id integer NOT NULL,
    "time" timestamp with time zone NOT NULL,
    user_name character varying(150) NOT NULL,
    request_id uuid NOT NULL,
    action smallint NOT NULL,
    changed_object_id integer NOT NULL,
    related_object_id integer,
    object_repr character varying(200) NOT NULL,
    object_data jsonb NOT NULL,
    changed_object_type_id integer NOT NULL,
    related_object_type_id integer,
    user_id integer,
    CONSTRAINT extras_objectchange_action_check CHECK ((action >= 0)),
    CONSTRAINT extras_objectchange_changed_object_id_check CHECK ((changed_object_id >= 0)),
    CONSTRAINT extras_objectchange_related_object_id_check CHECK ((related_object_id >= 0))
);


ALTER TABLE public.extras_objectchange OWNER TO netbox;

--
-- Name: extras_objectchange_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_objectchange_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_objectchange_id_seq OWNER TO netbox;

--
-- Name: extras_objectchange_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_objectchange_id_seq OWNED BY public.extras_objectchange.id;


--
-- Name: extras_reportresult; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_reportresult (
    id integer NOT NULL,
    report character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    failed boolean NOT NULL,
    data jsonb NOT NULL,
    user_id integer
);


ALTER TABLE public.extras_reportresult OWNER TO netbox;

--
-- Name: extras_reportresult_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_reportresult_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_reportresult_id_seq OWNER TO netbox;

--
-- Name: extras_reportresult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_reportresult_id_seq OWNED BY public.extras_reportresult.id;


--
-- Name: extras_tag; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL,
    color character varying(6) NOT NULL,
    comments text NOT NULL,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.extras_tag OWNER TO netbox;

--
-- Name: extras_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_tag_id_seq OWNER TO netbox;

--
-- Name: extras_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_tag_id_seq OWNED BY public.extras_tag.id;


--
-- Name: extras_taggeditem; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.extras_taggeditem OWNER TO netbox;

--
-- Name: extras_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_taggeditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_taggeditem_id_seq OWNER TO netbox;

--
-- Name: extras_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_taggeditem_id_seq OWNED BY public.extras_taggeditem.id;


--
-- Name: extras_topologymap; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_topologymap (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    device_patterns text NOT NULL,
    description character varying(100) NOT NULL,
    site_id integer,
    type smallint NOT NULL,
    CONSTRAINT extras_topologymap_type_check CHECK ((type >= 0))
);


ALTER TABLE public.extras_topologymap OWNER TO netbox;

--
-- Name: extras_topologymap_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_topologymap_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_topologymap_id_seq OWNER TO netbox;

--
-- Name: extras_topologymap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_topologymap_id_seq OWNED BY public.extras_topologymap.id;


--
-- Name: extras_webhook; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_webhook (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    type_create boolean NOT NULL,
    type_update boolean NOT NULL,
    type_delete boolean NOT NULL,
    payload_url character varying(500) NOT NULL,
    http_content_type smallint NOT NULL,
    secret character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    ssl_verification boolean NOT NULL,
    ca_file_path character varying(4096),
    additional_headers jsonb,
    CONSTRAINT extras_webhook_http_content_type_check CHECK ((http_content_type >= 0))
);


ALTER TABLE public.extras_webhook OWNER TO netbox;

--
-- Name: extras_webhook_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_webhook_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_webhook_id_seq OWNER TO netbox;

--
-- Name: extras_webhook_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_webhook_id_seq OWNED BY public.extras_webhook.id;


--
-- Name: extras_webhook_obj_type; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_webhook_obj_type (
    id integer NOT NULL,
    webhook_id integer NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_webhook_obj_type OWNER TO netbox;

--
-- Name: extras_webhook_obj_type_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_webhook_obj_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_webhook_obj_type_id_seq OWNER TO netbox;

--
-- Name: extras_webhook_obj_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_webhook_obj_type_id_seq OWNED BY public.extras_webhook_obj_type.id;


--
-- Name: ipam_aggregate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_aggregate (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    family smallint NOT NULL,
    prefix cidr NOT NULL,
    date_added date,
    description character varying(100) NOT NULL,
    rir_id integer NOT NULL,
    CONSTRAINT ipam_aggregate_family_check CHECK ((family >= 0))
);


ALTER TABLE public.ipam_aggregate OWNER TO netbox;

--
-- Name: ipam_aggregate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_aggregate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_aggregate_id_seq OWNER TO netbox;

--
-- Name: ipam_aggregate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_aggregate_id_seq OWNED BY public.ipam_aggregate.id;


--
-- Name: ipam_ipaddress; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_ipaddress (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    family smallint NOT NULL,
    address inet NOT NULL,
    description character varying(100) NOT NULL,
    interface_id integer,
    nat_inside_id integer,
    vrf_id integer,
    tenant_id integer,
    status smallint NOT NULL,
    role smallint,
    dns_name character varying(255) NOT NULL,
    CONSTRAINT ipam_ipaddress_family_check CHECK ((family >= 0)),
    CONSTRAINT ipam_ipaddress_role_check CHECK ((role >= 0)),
    CONSTRAINT ipam_ipaddress_status_check CHECK ((status >= 0))
);


ALTER TABLE public.ipam_ipaddress OWNER TO netbox;

--
-- Name: ipam_ipaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_ipaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_ipaddress_id_seq OWNER TO netbox;

--
-- Name: ipam_ipaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_ipaddress_id_seq OWNED BY public.ipam_ipaddress.id;


--
-- Name: ipam_prefix; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_prefix (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    family smallint NOT NULL,
    prefix cidr NOT NULL,
    status smallint NOT NULL,
    description character varying(100) NOT NULL,
    role_id integer,
    site_id integer,
    vlan_id integer,
    vrf_id integer,
    tenant_id integer,
    is_pool boolean NOT NULL,
    CONSTRAINT ipam_prefix_family_check CHECK ((family >= 0)),
    CONSTRAINT ipam_prefix_status_check CHECK ((status >= 0))
);


ALTER TABLE public.ipam_prefix OWNER TO netbox;

--
-- Name: ipam_prefix_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_prefix_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_prefix_id_seq OWNER TO netbox;

--
-- Name: ipam_prefix_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_prefix_id_seq OWNED BY public.ipam_prefix.id;


--
-- Name: ipam_rir; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_rir (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    is_private boolean NOT NULL,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.ipam_rir OWNER TO netbox;

--
-- Name: ipam_rir_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_rir_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_rir_id_seq OWNER TO netbox;

--
-- Name: ipam_rir_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_rir_id_seq OWNED BY public.ipam_rir.id;


--
-- Name: ipam_role; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_role (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    weight smallint NOT NULL,
    created date,
    last_updated timestamp with time zone,
    CONSTRAINT ipam_role_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.ipam_role OWNER TO netbox;

--
-- Name: ipam_role_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_role_id_seq OWNER TO netbox;

--
-- Name: ipam_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_role_id_seq OWNED BY public.ipam_role.id;


--
-- Name: ipam_service; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_service (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(30) NOT NULL,
    protocol smallint NOT NULL,
    port integer NOT NULL,
    description character varying(100) NOT NULL,
    device_id integer,
    virtual_machine_id integer,
    CONSTRAINT ipam_service_port_check CHECK ((port >= 0)),
    CONSTRAINT ipam_service_protocol_check CHECK ((protocol >= 0))
);


ALTER TABLE public.ipam_service OWNER TO netbox;

--
-- Name: ipam_service_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_service_id_seq OWNER TO netbox;

--
-- Name: ipam_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_service_id_seq OWNED BY public.ipam_service.id;


--
-- Name: ipam_service_ipaddresses; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_service_ipaddresses (
    id integer NOT NULL,
    service_id integer NOT NULL,
    ipaddress_id integer NOT NULL
);


ALTER TABLE public.ipam_service_ipaddresses OWNER TO netbox;

--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_service_ipaddresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_service_ipaddresses_id_seq OWNER TO netbox;

--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_service_ipaddresses_id_seq OWNED BY public.ipam_service_ipaddresses.id;


--
-- Name: ipam_vlan; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vlan (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    vid smallint NOT NULL,
    name character varying(64) NOT NULL,
    status smallint NOT NULL,
    role_id integer,
    site_id integer,
    group_id integer,
    description character varying(100) NOT NULL,
    tenant_id integer,
    CONSTRAINT ipam_vlan_status_check CHECK ((status >= 0)),
    CONSTRAINT ipam_vlan_vid_check CHECK ((vid >= 0))
);


ALTER TABLE public.ipam_vlan OWNER TO netbox;

--
-- Name: ipam_vlan_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vlan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vlan_id_seq OWNER TO netbox;

--
-- Name: ipam_vlan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vlan_id_seq OWNED BY public.ipam_vlan.id;


--
-- Name: ipam_vlangroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vlangroup (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    site_id integer,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.ipam_vlangroup OWNER TO netbox;

--
-- Name: ipam_vlangroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vlangroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vlangroup_id_seq OWNER TO netbox;

--
-- Name: ipam_vlangroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vlangroup_id_seq OWNED BY public.ipam_vlangroup.id;


--
-- Name: ipam_vrf; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vrf (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(50) NOT NULL,
    rd character varying(21),
    description character varying(100) NOT NULL,
    enforce_unique boolean NOT NULL,
    tenant_id integer
);


ALTER TABLE public.ipam_vrf OWNER TO netbox;

--
-- Name: ipam_vrf_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vrf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vrf_id_seq OWNER TO netbox;

--
-- Name: ipam_vrf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vrf_id_seq OWNED BY public.ipam_vrf.id;


--
-- Name: secrets_secret; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.secrets_secret (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    ciphertext bytea NOT NULL,
    hash character varying(128) NOT NULL,
    device_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.secrets_secret OWNER TO netbox;

--
-- Name: secrets_secret_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.secrets_secret_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secrets_secret_id_seq OWNER TO netbox;

--
-- Name: secrets_secret_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.secrets_secret_id_seq OWNED BY public.secrets_secret.id;


--
-- Name: secrets_secretrole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.secrets_secretrole (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.secrets_secretrole OWNER TO netbox;

--
-- Name: secrets_secretrole_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.secrets_secretrole_groups (
    id integer NOT NULL,
    secretrole_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.secrets_secretrole_groups OWNER TO netbox;

--
-- Name: secrets_secretrole_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.secrets_secretrole_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secrets_secretrole_groups_id_seq OWNER TO netbox;

--
-- Name: secrets_secretrole_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.secrets_secretrole_groups_id_seq OWNED BY public.secrets_secretrole_groups.id;


--
-- Name: secrets_secretrole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.secrets_secretrole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secrets_secretrole_id_seq OWNER TO netbox;

--
-- Name: secrets_secretrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.secrets_secretrole_id_seq OWNED BY public.secrets_secretrole.id;


--
-- Name: secrets_secretrole_users; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.secrets_secretrole_users (
    id integer NOT NULL,
    secretrole_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.secrets_secretrole_users OWNER TO netbox;

--
-- Name: secrets_secretrole_users_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.secrets_secretrole_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secrets_secretrole_users_id_seq OWNER TO netbox;

--
-- Name: secrets_secretrole_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.secrets_secretrole_users_id_seq OWNED BY public.secrets_secretrole_users.id;


--
-- Name: secrets_sessionkey; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.secrets_sessionkey (
    id integer NOT NULL,
    cipher bytea NOT NULL,
    hash character varying(128) NOT NULL,
    created timestamp with time zone NOT NULL,
    userkey_id integer NOT NULL
);


ALTER TABLE public.secrets_sessionkey OWNER TO netbox;

--
-- Name: secrets_sessionkey_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.secrets_sessionkey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secrets_sessionkey_id_seq OWNER TO netbox;

--
-- Name: secrets_sessionkey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.secrets_sessionkey_id_seq OWNED BY public.secrets_sessionkey.id;


--
-- Name: secrets_userkey; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.secrets_userkey (
    id integer NOT NULL,
    created date NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    public_key text NOT NULL,
    master_key_cipher bytea,
    user_id integer NOT NULL
);


ALTER TABLE public.secrets_userkey OWNER TO netbox;

--
-- Name: secrets_userkey_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.secrets_userkey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secrets_userkey_id_seq OWNER TO netbox;

--
-- Name: secrets_userkey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.secrets_userkey_id_seq OWNED BY public.secrets_userkey.id;


--
-- Name: taggit_tag; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.taggit_tag (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    slug character varying(100) NOT NULL
);


ALTER TABLE public.taggit_tag OWNER TO netbox;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.taggit_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_tag_id_seq OWNER TO netbox;

--
-- Name: taggit_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.taggit_tag_id_seq OWNED BY public.taggit_tag.id;


--
-- Name: taggit_taggeditem; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.taggit_taggeditem (
    id integer NOT NULL,
    object_id integer NOT NULL,
    content_type_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.taggit_taggeditem OWNER TO netbox;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.taggit_taggeditem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taggit_taggeditem_id_seq OWNER TO netbox;

--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.taggit_taggeditem_id_seq OWNED BY public.taggit_taggeditem.id;


--
-- Name: tenancy_tenant; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_tenant (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(30) NOT NULL,
    slug character varying(50) NOT NULL,
    description character varying(100) NOT NULL,
    comments text NOT NULL,
    group_id integer
);


ALTER TABLE public.tenancy_tenant OWNER TO netbox;

--
-- Name: tenancy_tenant_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_tenant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_tenant_id_seq OWNER TO netbox;

--
-- Name: tenancy_tenant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_tenant_id_seq OWNED BY public.tenancy_tenant.id;


--
-- Name: tenancy_tenantgroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_tenantgroup (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.tenancy_tenantgroup OWNER TO netbox;

--
-- Name: tenancy_tenantgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_tenantgroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_tenantgroup_id_seq OWNER TO netbox;

--
-- Name: tenancy_tenantgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_tenantgroup_id_seq OWNED BY public.tenancy_tenantgroup.id;


--
-- Name: users_token; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_token (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    expires timestamp with time zone,
    key character varying(40) NOT NULL,
    write_enabled boolean NOT NULL,
    description character varying(100) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_token OWNER TO netbox;

--
-- Name: users_token_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_token_id_seq OWNER TO netbox;

--
-- Name: users_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_token_id_seq OWNED BY public.users_token.id;


--
-- Name: virtualization_cluster; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_cluster (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(100) NOT NULL,
    comments text NOT NULL,
    group_id integer,
    type_id integer NOT NULL,
    site_id integer
);


ALTER TABLE public.virtualization_cluster OWNER TO netbox;

--
-- Name: virtualization_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_cluster_id_seq OWNER TO netbox;

--
-- Name: virtualization_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_cluster_id_seq OWNED BY public.virtualization_cluster.id;


--
-- Name: virtualization_clustergroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_clustergroup (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.virtualization_clustergroup OWNER TO netbox;

--
-- Name: virtualization_clustergroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_clustergroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_clustergroup_id_seq OWNER TO netbox;

--
-- Name: virtualization_clustergroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_clustergroup_id_seq OWNED BY public.virtualization_clustergroup.id;


--
-- Name: virtualization_clustertype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_clustertype (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    created date,
    last_updated timestamp with time zone
);


ALTER TABLE public.virtualization_clustertype OWNER TO netbox;

--
-- Name: virtualization_clustertype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_clustertype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_clustertype_id_seq OWNER TO netbox;

--
-- Name: virtualization_clustertype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_clustertype_id_seq OWNED BY public.virtualization_clustertype.id;


--
-- Name: virtualization_virtualmachine; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_virtualmachine (
    id integer NOT NULL,
    created date,
    last_updated timestamp with time zone,
    name character varying(64) NOT NULL,
    vcpus smallint,
    memory integer,
    disk integer,
    comments text NOT NULL,
    cluster_id integer NOT NULL,
    platform_id integer,
    primary_ip4_id integer,
    primary_ip6_id integer,
    tenant_id integer,
    status smallint NOT NULL,
    role_id integer,
    local_context_data jsonb,
    CONSTRAINT virtualization_virtualmachine_disk_check CHECK ((disk >= 0)),
    CONSTRAINT virtualization_virtualmachine_memory_check CHECK ((memory >= 0)),
    CONSTRAINT virtualization_virtualmachine_status_check CHECK ((status >= 0)),
    CONSTRAINT virtualization_virtualmachine_vcpus_check CHECK ((vcpus >= 0))
);


ALTER TABLE public.virtualization_virtualmachine OWNER TO netbox;

--
-- Name: virtualization_virtualmachine_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_virtualmachine_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_virtualmachine_id_seq OWNER TO netbox;

--
-- Name: virtualization_virtualmachine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_virtualmachine_id_seq OWNED BY public.virtualization_virtualmachine.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: circuits_circuit id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit ALTER COLUMN id SET DEFAULT nextval('public.circuits_circuit_id_seq'::regclass);


--
-- Name: circuits_circuittermination id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination ALTER COLUMN id SET DEFAULT nextval('public.circuits_circuittermination_id_seq'::regclass);


--
-- Name: circuits_circuittype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype ALTER COLUMN id SET DEFAULT nextval('public.circuits_circuittype_id_seq'::regclass);


--
-- Name: circuits_provider id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider ALTER COLUMN id SET DEFAULT nextval('public.circuits_provider_id_seq'::regclass);


--
-- Name: dcim_cable id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable ALTER COLUMN id SET DEFAULT nextval('public.dcim_cable_id_seq'::regclass);


--
-- Name: dcim_consoleport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleport_id_seq'::regclass);


--
-- Name: dcim_consoleporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleporttemplate_id_seq'::regclass);


--
-- Name: dcim_consoleserverport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleserverport_id_seq'::regclass);


--
-- Name: dcim_consoleserverporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleserverporttemplate_id_seq'::regclass);


--
-- Name: dcim_device id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device ALTER COLUMN id SET DEFAULT nextval('public.dcim_device_id_seq'::regclass);


--
-- Name: dcim_devicebay id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicebay_id_seq'::regclass);


--
-- Name: dcim_devicebaytemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicebaytemplate_id_seq'::regclass);


--
-- Name: dcim_devicerole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicerole_id_seq'::regclass);


--
-- Name: dcim_devicetype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicetype_id_seq'::regclass);


--
-- Name: dcim_frontport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport ALTER COLUMN id SET DEFAULT nextval('public.dcim_frontport_id_seq'::regclass);


--
-- Name: dcim_frontporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_frontporttemplate_id_seq'::regclass);


--
-- Name: dcim_interface id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface ALTER COLUMN id SET DEFAULT nextval('public.dcim_interface_id_seq'::regclass);


--
-- Name: dcim_interface_tagged_vlans id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans ALTER COLUMN id SET DEFAULT nextval('public.dcim_interface_tagged_vlans_id_seq'::regclass);


--
-- Name: dcim_interfacetemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_interfacetemplate_id_seq'::regclass);


--
-- Name: dcim_inventoryitem id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem ALTER COLUMN id SET DEFAULT nextval('public.dcim_module_id_seq'::regclass);


--
-- Name: dcim_manufacturer id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer ALTER COLUMN id SET DEFAULT nextval('public.dcim_manufacturer_id_seq'::regclass);


--
-- Name: dcim_platform id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform ALTER COLUMN id SET DEFAULT nextval('public.dcim_platform_id_seq'::regclass);


--
-- Name: dcim_powerfeed id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerfeed_id_seq'::regclass);


--
-- Name: dcim_poweroutlet id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet ALTER COLUMN id SET DEFAULT nextval('public.dcim_poweroutlet_id_seq'::regclass);


--
-- Name: dcim_poweroutlettemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_poweroutlettemplate_id_seq'::regclass);


--
-- Name: dcim_powerpanel id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerpanel_id_seq'::regclass);


--
-- Name: dcim_powerport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerport_id_seq'::regclass);


--
-- Name: dcim_powerporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerporttemplate_id_seq'::regclass);


--
-- Name: dcim_rack id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack ALTER COLUMN id SET DEFAULT nextval('public.dcim_rack_id_seq'::regclass);


--
-- Name: dcim_rackgroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackgroup ALTER COLUMN id SET DEFAULT nextval('public.dcim_rackgroup_id_seq'::regclass);


--
-- Name: dcim_rackreservation id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation ALTER COLUMN id SET DEFAULT nextval('public.dcim_rackreservation_id_seq'::regclass);


--
-- Name: dcim_rackrole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole ALTER COLUMN id SET DEFAULT nextval('public.dcim_rackrole_id_seq'::regclass);


--
-- Name: dcim_rearport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport ALTER COLUMN id SET DEFAULT nextval('public.dcim_rearport_id_seq'::regclass);


--
-- Name: dcim_rearporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_rearporttemplate_id_seq'::regclass);


--
-- Name: dcim_region id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region ALTER COLUMN id SET DEFAULT nextval('public.dcim_region_id_seq'::regclass);


--
-- Name: dcim_site id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site ALTER COLUMN id SET DEFAULT nextval('public.dcim_site_id_seq'::regclass);


--
-- Name: dcim_virtualchassis id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis ALTER COLUMN id SET DEFAULT nextval('public.dcim_virtualchassis_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: extras_configcontext id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_id_seq'::regclass);


--
-- Name: extras_configcontext_platforms id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_platforms_id_seq'::regclass);


--
-- Name: extras_configcontext_regions id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_regions_id_seq'::regclass);


--
-- Name: extras_configcontext_roles id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_roles_id_seq'::regclass);


--
-- Name: extras_configcontext_sites id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_sites_id_seq'::regclass);


--
-- Name: extras_configcontext_tenant_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tenant_groups_id_seq'::regclass);


--
-- Name: extras_configcontext_tenants id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants ALTER COLUMN id SET DEFAULT nextval('public.extras_configcontext_tenants_id_seq'::regclass);


--
-- Name: extras_customfield id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield ALTER COLUMN id SET DEFAULT nextval('public.extras_customfield_id_seq'::regclass);


--
-- Name: extras_customfield_obj_type id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_obj_type ALTER COLUMN id SET DEFAULT nextval('public.extras_customfield_obj_type_id_seq'::regclass);


--
-- Name: extras_customfieldchoice id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfieldchoice ALTER COLUMN id SET DEFAULT nextval('public.extras_customfieldchoice_id_seq'::regclass);


--
-- Name: extras_customfieldvalue id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfieldvalue ALTER COLUMN id SET DEFAULT nextval('public.extras_customfieldvalue_id_seq'::regclass);


--
-- Name: extras_customlink id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink ALTER COLUMN id SET DEFAULT nextval('public.extras_customlink_id_seq'::regclass);


--
-- Name: extras_exporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate ALTER COLUMN id SET DEFAULT nextval('public.extras_exporttemplate_id_seq'::regclass);


--
-- Name: extras_graph id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_graph ALTER COLUMN id SET DEFAULT nextval('public.extras_graph_id_seq'::regclass);


--
-- Name: extras_imageattachment id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_imageattachment ALTER COLUMN id SET DEFAULT nextval('public.extras_imageattachment_id_seq'::regclass);


--
-- Name: extras_objectchange id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange ALTER COLUMN id SET DEFAULT nextval('public.extras_objectchange_id_seq'::regclass);


--
-- Name: extras_reportresult id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_reportresult ALTER COLUMN id SET DEFAULT nextval('public.extras_reportresult_id_seq'::regclass);


--
-- Name: extras_tag id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag ALTER COLUMN id SET DEFAULT nextval('public.extras_tag_id_seq'::regclass);


--
-- Name: extras_taggeditem id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.extras_taggeditem_id_seq'::regclass);


--
-- Name: extras_topologymap id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_topologymap ALTER COLUMN id SET DEFAULT nextval('public.extras_topologymap_id_seq'::regclass);


--
-- Name: extras_webhook id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook ALTER COLUMN id SET DEFAULT nextval('public.extras_webhook_id_seq'::regclass);


--
-- Name: extras_webhook_obj_type id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_obj_type ALTER COLUMN id SET DEFAULT nextval('public.extras_webhook_obj_type_id_seq'::regclass);


--
-- Name: ipam_aggregate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate ALTER COLUMN id SET DEFAULT nextval('public.ipam_aggregate_id_seq'::regclass);


--
-- Name: ipam_ipaddress id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress ALTER COLUMN id SET DEFAULT nextval('public.ipam_ipaddress_id_seq'::regclass);


--
-- Name: ipam_prefix id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix ALTER COLUMN id SET DEFAULT nextval('public.ipam_prefix_id_seq'::regclass);


--
-- Name: ipam_rir id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir ALTER COLUMN id SET DEFAULT nextval('public.ipam_rir_id_seq'::regclass);


--
-- Name: ipam_role id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role ALTER COLUMN id SET DEFAULT nextval('public.ipam_role_id_seq'::regclass);


--
-- Name: ipam_service id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service ALTER COLUMN id SET DEFAULT nextval('public.ipam_service_id_seq'::regclass);


--
-- Name: ipam_service_ipaddresses id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses ALTER COLUMN id SET DEFAULT nextval('public.ipam_service_ipaddresses_id_seq'::regclass);


--
-- Name: ipam_vlan id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan ALTER COLUMN id SET DEFAULT nextval('public.ipam_vlan_id_seq'::regclass);


--
-- Name: ipam_vlangroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup ALTER COLUMN id SET DEFAULT nextval('public.ipam_vlangroup_id_seq'::regclass);


--
-- Name: ipam_vrf id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_id_seq'::regclass);


--
-- Name: secrets_secret id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secret ALTER COLUMN id SET DEFAULT nextval('public.secrets_secret_id_seq'::regclass);


--
-- Name: secrets_secretrole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole ALTER COLUMN id SET DEFAULT nextval('public.secrets_secretrole_id_seq'::regclass);


--
-- Name: secrets_secretrole_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole_groups ALTER COLUMN id SET DEFAULT nextval('public.secrets_secretrole_groups_id_seq'::regclass);


--
-- Name: secrets_secretrole_users id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole_users ALTER COLUMN id SET DEFAULT nextval('public.secrets_secretrole_users_id_seq'::regclass);


--
-- Name: secrets_sessionkey id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_sessionkey ALTER COLUMN id SET DEFAULT nextval('public.secrets_sessionkey_id_seq'::regclass);


--
-- Name: secrets_userkey id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_userkey ALTER COLUMN id SET DEFAULT nextval('public.secrets_userkey_id_seq'::regclass);


--
-- Name: taggit_tag id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag ALTER COLUMN id SET DEFAULT nextval('public.taggit_tag_id_seq'::regclass);


--
-- Name: taggit_taggeditem id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem ALTER COLUMN id SET DEFAULT nextval('public.taggit_taggeditem_id_seq'::regclass);


--
-- Name: tenancy_tenant id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant ALTER COLUMN id SET DEFAULT nextval('public.tenancy_tenant_id_seq'::regclass);


--
-- Name: tenancy_tenantgroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup ALTER COLUMN id SET DEFAULT nextval('public.tenancy_tenantgroup_id_seq'::regclass);


--
-- Name: users_token id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token ALTER COLUMN id SET DEFAULT nextval('public.users_token_id_seq'::regclass);


--
-- Name: virtualization_cluster id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster ALTER COLUMN id SET DEFAULT nextval('public.virtualization_cluster_id_seq'::regclass);


--
-- Name: virtualization_clustergroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup ALTER COLUMN id SET DEFAULT nextval('public.virtualization_clustergroup_id_seq'::regclass);


--
-- Name: virtualization_clustertype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype ALTER COLUMN id SET DEFAULT nextval('public.virtualization_clustertype_id_seq'::regclass);


--
-- Name: virtualization_virtualmachine id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine ALTER COLUMN id SET DEFAULT nextval('public.virtualization_virtualmachine_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add circuit	7	add_circuit
20	Can change circuit	7	change_circuit
21	Can delete circuit	7	delete_circuit
22	Can add circuit type	8	add_circuittype
23	Can change circuit type	8	change_circuittype
24	Can delete circuit type	8	delete_circuittype
25	Can add provider	9	add_provider
26	Can change provider	9	change_provider
27	Can delete provider	9	delete_provider
28	Can add circuit termination	10	add_circuittermination
29	Can change circuit termination	10	change_circuittermination
30	Can delete circuit termination	10	delete_circuittermination
31	Can add console port	11	add_consoleport
32	Can change console port	11	change_consoleport
33	Can delete console port	11	delete_consoleport
34	Can add console port template	12	add_consoleporttemplate
35	Can change console port template	12	change_consoleporttemplate
36	Can delete console port template	12	delete_consoleporttemplate
37	Can add console server port	13	add_consoleserverport
38	Can change console server port	13	change_consoleserverport
39	Can delete console server port	13	delete_consoleserverport
40	Can add console server port template	14	add_consoleserverporttemplate
41	Can change console server port template	14	change_consoleserverporttemplate
42	Can delete console server port template	14	delete_consoleserverporttemplate
43	Can add device	15	add_device
44	Can change device	15	change_device
45	Can delete device	15	delete_device
46	Read-only access to devices via NAPALM	15	napalm_read
47	Read/write access to devices via NAPALM	15	napalm_write
48	Can add device role	16	add_devicerole
49	Can change device role	16	change_devicerole
50	Can delete device role	16	delete_devicerole
51	Can add device type	17	add_devicetype
52	Can change device type	17	change_devicetype
53	Can delete device type	17	delete_devicetype
54	Can add interface	18	add_interface
55	Can change interface	18	change_interface
56	Can delete interface	18	delete_interface
60	Can add interface template	20	add_interfacetemplate
61	Can change interface template	20	change_interfacetemplate
62	Can delete interface template	20	delete_interfacetemplate
63	Can add manufacturer	21	add_manufacturer
64	Can change manufacturer	21	change_manufacturer
65	Can delete manufacturer	21	delete_manufacturer
66	Can add platform	22	add_platform
67	Can change platform	22	change_platform
68	Can delete platform	22	delete_platform
69	Can add power outlet	23	add_poweroutlet
70	Can change power outlet	23	change_poweroutlet
71	Can delete power outlet	23	delete_poweroutlet
72	Can add power outlet template	24	add_poweroutlettemplate
73	Can change power outlet template	24	change_poweroutlettemplate
74	Can delete power outlet template	24	delete_poweroutlettemplate
75	Can add power port	25	add_powerport
76	Can change power port	25	change_powerport
77	Can delete power port	25	delete_powerport
78	Can add power port template	26	add_powerporttemplate
79	Can change power port template	26	change_powerporttemplate
80	Can delete power port template	26	delete_powerporttemplate
81	Can add rack	27	add_rack
82	Can change rack	27	change_rack
83	Can delete rack	27	delete_rack
84	Can add rack group	28	add_rackgroup
85	Can change rack group	28	change_rackgroup
86	Can delete rack group	28	delete_rackgroup
87	Can add site	29	add_site
88	Can change site	29	change_site
89	Can delete site	29	delete_site
90	Can add device bay	30	add_devicebay
91	Can change device bay	30	change_devicebay
92	Can delete device bay	30	delete_devicebay
93	Can add device bay template	31	add_devicebaytemplate
94	Can change device bay template	31	change_devicebaytemplate
95	Can delete device bay template	31	delete_devicebaytemplate
96	Can add rack role	32	add_rackrole
97	Can change rack role	32	change_rackrole
98	Can delete rack role	32	delete_rackrole
99	Can add rack reservation	33	add_rackreservation
100	Can change rack reservation	33	change_rackreservation
101	Can delete rack reservation	33	delete_rackreservation
102	Can add region	34	add_region
103	Can change region	34	change_region
104	Can delete region	34	delete_region
105	Can add inventory item	35	add_inventoryitem
106	Can change inventory item	35	change_inventoryitem
107	Can delete inventory item	35	delete_inventoryitem
108	Can add virtual chassis	36	add_virtualchassis
109	Can change virtual chassis	36	change_virtualchassis
110	Can delete virtual chassis	36	delete_virtualchassis
111	Can add aggregate	37	add_aggregate
112	Can change aggregate	37	change_aggregate
113	Can delete aggregate	37	delete_aggregate
114	Can add IP address	38	add_ipaddress
115	Can change IP address	38	change_ipaddress
116	Can delete IP address	38	delete_ipaddress
117	Can add prefix	39	add_prefix
118	Can change prefix	39	change_prefix
119	Can delete prefix	39	delete_prefix
120	Can add RIR	40	add_rir
121	Can change RIR	40	change_rir
122	Can delete RIR	40	delete_rir
123	Can add role	41	add_role
124	Can change role	41	change_role
125	Can delete role	41	delete_role
126	Can add VLAN	42	add_vlan
127	Can change VLAN	42	change_vlan
128	Can delete VLAN	42	delete_vlan
129	Can add VRF	43	add_vrf
130	Can change VRF	43	change_vrf
131	Can delete VRF	43	delete_vrf
132	Can add VLAN group	44	add_vlangroup
133	Can change VLAN group	44	change_vlangroup
134	Can delete VLAN group	44	delete_vlangroup
135	Can add service	45	add_service
136	Can change service	45	change_service
137	Can delete service	45	delete_service
138	Can add export template	46	add_exporttemplate
139	Can change export template	46	change_exporttemplate
140	Can delete export template	46	delete_exporttemplate
141	Can add graph	47	add_graph
142	Can change graph	47	change_graph
143	Can delete graph	47	delete_graph
144	Can add topology map	48	add_topologymap
145	Can change topology map	48	change_topologymap
146	Can delete topology map	48	delete_topologymap
147	Can add user action	49	add_useraction
148	Can change user action	49	change_useraction
149	Can delete user action	49	delete_useraction
150	Can add custom field	50	add_customfield
151	Can change custom field	50	change_customfield
152	Can delete custom field	50	delete_customfield
153	Can add custom field choice	51	add_customfieldchoice
154	Can change custom field choice	51	change_customfieldchoice
155	Can delete custom field choice	51	delete_customfieldchoice
156	Can add custom field value	52	add_customfieldvalue
157	Can change custom field value	52	change_customfieldvalue
158	Can delete custom field value	52	delete_customfieldvalue
159	Can add image attachment	53	add_imageattachment
160	Can change image attachment	53	change_imageattachment
161	Can delete image attachment	53	delete_imageattachment
162	Can add report result	54	add_reportresult
163	Can change report result	54	change_reportresult
164	Can delete report result	54	delete_reportresult
165	Can add secret	55	add_secret
166	Can change secret	55	change_secret
167	Can delete secret	55	delete_secret
168	Can add secret role	56	add_secretrole
169	Can change secret role	56	change_secretrole
170	Can delete secret role	56	delete_secretrole
171	Can add user key	57	add_userkey
172	Can change user key	57	change_userkey
173	Can delete user key	57	delete_userkey
174	Can activate user keys for decryption	57	activate_userkey
175	Can add session key	58	add_sessionkey
176	Can change session key	58	change_sessionkey
177	Can delete session key	58	delete_sessionkey
178	Can add tenant	59	add_tenant
179	Can change tenant	59	change_tenant
180	Can delete tenant	59	delete_tenant
181	Can add tenant group	60	add_tenantgroup
182	Can change tenant group	60	change_tenantgroup
183	Can delete tenant group	60	delete_tenantgroup
184	Can add cluster	62	add_cluster
185	Can change cluster	62	change_cluster
186	Can delete cluster	62	delete_cluster
187	Can add cluster group	63	add_clustergroup
188	Can change cluster group	63	change_clustergroup
189	Can delete cluster group	63	delete_clustergroup
190	Can add cluster type	64	add_clustertype
191	Can change cluster type	64	change_clustertype
192	Can delete cluster type	64	delete_clustertype
193	Can add virtual machine	65	add_virtualmachine
194	Can change virtual machine	65	change_virtualmachine
195	Can delete virtual machine	65	delete_virtualmachine
196	Can view log entry	1	view_logentry
197	Can view permission	2	view_permission
198	Can view group	3	view_group
199	Can view user	4	view_user
200	Can view content type	5	view_contenttype
201	Can view session	6	view_session
202	Can add Tag	66	add_tag
203	Can change Tag	66	change_tag
204	Can delete Tag	66	delete_tag
205	Can view Tag	66	view_tag
206	Can add Tagged Item	67	add_taggeditem
207	Can change Tagged Item	67	change_taggeditem
208	Can delete Tagged Item	67	delete_taggeditem
209	Can view Tagged Item	67	view_taggeditem
210	Can view provider	9	view_provider
211	Can view circuit type	8	view_circuittype
212	Can view circuit	7	view_circuit
213	Can view circuit termination	10	view_circuittermination
214	Can view console port	11	view_consoleport
215	Can view console port template	12	view_consoleporttemplate
216	Can view console server port	13	view_consoleserverport
217	Can view console server port template	14	view_consoleserverporttemplate
218	Can view device	15	view_device
219	Can view device role	16	view_devicerole
220	Can view device type	17	view_devicetype
221	Can view interface	18	view_interface
222	Can view interface template	20	view_interfacetemplate
223	Can view manufacturer	21	view_manufacturer
224	Can view platform	22	view_platform
225	Can view power outlet	23	view_poweroutlet
226	Can view power outlet template	24	view_poweroutlettemplate
227	Can view power port	25	view_powerport
228	Can view power port template	26	view_powerporttemplate
229	Can view rack	27	view_rack
230	Can view rack group	28	view_rackgroup
231	Can view site	29	view_site
232	Can view device bay	30	view_devicebay
233	Can view device bay template	31	view_devicebaytemplate
234	Can view rack role	32	view_rackrole
235	Can view rack reservation	33	view_rackreservation
236	Can view region	34	view_region
237	Can view inventory item	35	view_inventoryitem
238	Can view virtual chassis	36	view_virtualchassis
239	Can add front port	68	add_frontport
240	Can change front port	68	change_frontport
241	Can delete front port	68	delete_frontport
242	Can view front port	68	view_frontport
243	Can add front port template	69	add_frontporttemplate
244	Can change front port template	69	change_frontporttemplate
245	Can delete front port template	69	delete_frontporttemplate
246	Can view front port template	69	view_frontporttemplate
247	Can add rear port	70	add_rearport
248	Can change rear port	70	change_rearport
249	Can delete rear port	70	delete_rearport
250	Can view rear port	70	view_rearport
251	Can add rear port template	71	add_rearporttemplate
252	Can change rear port template	71	change_rearporttemplate
253	Can delete rear port template	71	delete_rearporttemplate
254	Can view rear port template	71	view_rearporttemplate
255	Can add cable	72	add_cable
256	Can change cable	72	change_cable
257	Can delete cable	72	delete_cable
258	Can view cable	72	view_cable
259	Can add power feed	73	add_powerfeed
260	Can change power feed	73	change_powerfeed
261	Can delete power feed	73	delete_powerfeed
262	Can view power feed	73	view_powerfeed
263	Can add power panel	74	add_powerpanel
264	Can change power panel	74	change_powerpanel
265	Can delete power panel	74	delete_powerpanel
266	Can view power panel	74	view_powerpanel
267	Can view aggregate	37	view_aggregate
268	Can view IP address	38	view_ipaddress
269	Can view prefix	39	view_prefix
270	Can view RIR	40	view_rir
271	Can view role	41	view_role
272	Can view VLAN	42	view_vlan
273	Can view VRF	43	view_vrf
274	Can view VLAN group	44	view_vlangroup
275	Can view service	45	view_service
276	Can view export template	46	view_exporttemplate
277	Can view graph	47	view_graph
278	Can view topology map	48	view_topologymap
279	Can view custom field	50	view_customfield
280	Can view custom field choice	51	view_customfieldchoice
281	Can view custom field value	52	view_customfieldvalue
282	Can view image attachment	53	view_imageattachment
283	Can view report result	54	view_reportresult
284	Can add webhook	75	add_webhook
285	Can change webhook	75	change_webhook
286	Can delete webhook	75	delete_webhook
287	Can view webhook	75	view_webhook
288	Can add object change	76	add_objectchange
289	Can change object change	76	change_objectchange
290	Can delete object change	76	delete_objectchange
291	Can view object change	76	view_objectchange
292	Can add config context	77	add_configcontext
293	Can change config context	77	change_configcontext
294	Can delete config context	77	delete_configcontext
295	Can view config context	77	view_configcontext
296	Can add tag	78	add_tag
297	Can change tag	78	change_tag
298	Can delete tag	78	delete_tag
299	Can view tag	78	view_tag
300	Can add tagged item	79	add_taggeditem
301	Can change tagged item	79	change_taggeditem
302	Can delete tagged item	79	delete_taggeditem
303	Can view tagged item	79	view_taggeditem
304	Can add custom link	80	add_customlink
305	Can change custom link	80	change_customlink
306	Can delete custom link	80	delete_customlink
307	Can view custom link	80	view_customlink
308	Can add script	81	add_script
309	Can change script	81	change_script
310	Can delete script	81	delete_script
311	Can view script	81	view_script
312	Can run script	81	run_script
313	Can view secret role	56	view_secretrole
314	Can view secret	55	view_secret
315	Can view user key	57	view_userkey
316	Can view session key	58	view_sessionkey
317	Can view tenant	59	view_tenant
318	Can view tenant group	60	view_tenantgroup
319	Can add token	61	add_token
320	Can change token	61	change_token
321	Can delete token	61	delete_token
322	Can view token	61	view_token
323	Can view cluster	62	view_cluster
324	Can view cluster group	63	view_clustergroup
325	Can view cluster type	64	view_clustertype
326	Can view virtual machine	65	view_virtualmachine
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$q6Z1TSrq70NI$EYoSJjgAqqsgT7L/94/1UcLCuTl20cvJY0ht7dE4yOg=	2019-12-29 11:10:15.418679+00	t	admin			admin@example.com	t	t	2018-06-03 16:17:44.788445+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: circuits_circuit; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_circuit (id, created, last_updated, cid, install_date, commit_rate, comments, provider_id, type_id, tenant_id, description, status) FROM stdin;
\.


--
-- Data for Name: circuits_circuittermination; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_circuittermination (id, term_side, port_speed, upstream_speed, xconnect_id, pp_info, circuit_id, site_id, connected_endpoint_id, connection_status, cable_id, description) FROM stdin;
\.


--
-- Data for Name: circuits_circuittype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_circuittype (id, name, slug, created, last_updated) FROM stdin;
\.


--
-- Data for Name: circuits_provider; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_provider (id, created, last_updated, name, slug, asn, account, portal_url, noc_contact, admin_contact, comments) FROM stdin;
\.


--
-- Data for Name: dcim_cable; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_cable (id, created, last_updated, termination_a_id, termination_b_id, type, status, label, color, length, length_unit, _abs_length, termination_a_type_id, termination_b_type_id, _termination_a_device_id, _termination_b_device_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleport (id, name, connection_status, connected_endpoint_id, device_id, cable_id, description) FROM stdin;
\.


--
-- Data for Name: dcim_consoleporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleporttemplate (id, name, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleserverport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleserverport (id, name, device_id, cable_id, connection_status, description) FROM stdin;
\.


--
-- Data for Name: dcim_consoleserverporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleserverporttemplate (id, name, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_device; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_device (id, created, last_updated, name, serial, "position", face, status, comments, device_role_id, device_type_id, platform_id, rack_id, primary_ip4_id, primary_ip6_id, tenant_id, asset_tag, site_id, cluster_id, virtual_chassis_id, vc_position, vc_priority, local_context_data) FROM stdin;
5	2018-06-08	2018-06-08 21:58:28.048198+00	spine01		\N	\N	1		2	1	\N	2	\N	\N	\N	\N	1	\N	\N	\N	\N	\N
6	2018-06-08	2018-06-08 22:35:21.708373+00	spine02		\N	\N	1		2	1	\N	2	\N	\N	\N	\N	1	\N	\N	\N	\N	\N
7	2018-06-08	2018-06-09 07:42:23.365687+00	leaf03		\N	\N	1		1	1	\N	3	\N	\N	\N	\N	1	\N	\N	\N	\N	\N
11	2018-06-09	2018-06-09 08:15:21.61264+00	super01		\N	\N	1		2	1	\N	5	\N	\N	\N	\N	1	\N	\N	\N	\N	\N
12	2018-06-09	2018-06-09 08:15:35.44707+00	super02		\N	\N	1		2	1	\N	5	\N	\N	\N	\N	1	\N	\N	\N	\N	\N
15	2018-06-09	2018-06-09 10:56:18.130143+00	rtr01		\N	\N	0		1	1	\N	6	\N	\N	\N	\N	1	\N	\N	\N	\N	\N
16	2018-06-09	2018-06-09 10:56:18.153524+00	rtr02		\N	\N	0		1	1	\N	6	\N	\N	\N	\N	1	\N	\N	\N	\N	\N
1	2018-06-03	2018-11-07 16:57:09.294214+00	leaf01		\N	\N	1		1	1	1	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N
4	2018-06-08	2018-11-07 16:57:09.324612+00	leaf02		\N	\N	1		1	1	1	1	\N	\N	\N	\N	1	\N	\N	\N	\N	\N
8	2018-06-09	2018-11-08 18:52:42.84008+00	leaf04		\N	\N	1		1	1	\N	3	\N	\N	\N	\N	1	\N	\N	\N	\N	\N
9	2018-06-09	2019-06-08 15:19:27.946342+00	service01		\N	\N	1		1	1	\N	4	\N	\N	\N	\N	1	\N	\N	\N	\N	\N
10	2018-06-09	2019-06-08 15:19:45.693987+00	service02		\N	\N	1		1	1	\N	4	\N	\N	\N	\N	1	\N	\N	\N	\N	\N
13	2018-06-09	2019-06-08 15:20:08.981553+00	exit01		\N	\N	0		1	1	\N	6	\N	\N	\N	\N	1	\N	\N	\N	\N	\N
14	2018-06-09	2019-06-08 15:20:30.346048+00	exit02		\N	\N	0		1	1	\N	6	\N	\N	\N	\N	1	\N	\N	\N	\N	\N
\.


--
-- Data for Name: dcim_devicebay; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicebay (id, name, device_id, installed_device_id, description) FROM stdin;
\.


--
-- Data for Name: dcim_devicebaytemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicebaytemplate (id, name, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_devicerole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicerole (id, name, slug, color, vm_role, created, last_updated) FROM stdin;
1	Leaf	leaf	aa1409	f	2019-12-29	2019-12-29 11:09:41.654834+00
2	Spine	spine	aa1409	f	2019-12-29	2019-12-29 11:09:41.654834+00
\.


--
-- Data for Name: dcim_devicetype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicetype (id, model, slug, u_height, is_full_depth, manufacturer_id, subdevice_role, part_number, comments, created, last_updated) FROM stdin;
1	Cumulus VX	cumulus-vx	0	f	1	\N			2019-12-29	2019-12-29 11:09:41.772023+00
\.


--
-- Data for Name: dcim_frontport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_frontport (id, name, type, rear_port_position, description, device_id, rear_port_id, cable_id) FROM stdin;
\.


--
-- Data for Name: dcim_frontporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_frontporttemplate (id, name, type, rear_port_position, device_type_id, rear_port_id) FROM stdin;
\.


--
-- Data for Name: dcim_interface; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interface (id, name, type, mgmt_only, description, device_id, mac_address, lag_id, enabled, mtu, virtual_machine_id, mode, untagged_vlan_id, _connected_circuittermination_id, _connected_interface_id, connection_status, cable_id) FROM stdin;
2	swp1	1000	f		1	\N	1	t	\N	\N	\N	\N	\N	\N	\N	\N
108	irb2501	0	f	bgp_external	13	\N	\N	t	\N	\N	100	7	\N	\N	\N	\N
4	lo	0	f		1	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
9	clagd-vxlan-anycast-ip	0	f		1	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
109	irb2502	0	f	bgp_external	13	\N	\N	t	\N	\N	100	8	\N	\N	\N	\N
87	peerlink.4094	0	f	bgp_underlay	10	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
94	lo	0	f		11	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
68	bond01	200	f		9	\N	\N	t	\N	\N	200	\N	\N	\N	\N	\N
110	irb2503	0	f	bgp_external	13	\N	\N	t	\N	\N	100	9	\N	\N	\N	\N
13	swp2	1000	f		1	\N	12	t	\N	\N	\N	\N	\N	\N	\N	\N
111	irb2504	0	f	bgp_external	13	\N	\N	t	\N	\N	100	19	\N	\N	\N	\N
3	irb1000	0	f		1	\N	\N	t	\N	\N	100	1	\N	\N	\N	\N
137	irb1002	0	f		1	\N	\N	t	\N	\N	100	3	\N	\N	\N	\N
5	peerlink	200	f		1	44:38:39:ff:01:02	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
8	peerlink.4094	0	f	bgp_underlay	1	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
16	bond02	200	f		4	\N	\N	t	\N	\N	200	\N	\N	\N	\N	\N
69	bond02	200	f		9	\N	\N	t	\N	\N	200	\N	\N	\N	\N	\N
17	clagd-vxlan-anycast-ip	0	f		4	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
71	irb1000	0	f		9	\N	\N	t	\N	\N	100	1	\N	\N	\N	\N
19	lo	0	f		4	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
21	peerlink.4094	0	f	bgp_underlay	4	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
20	peerlink	200	f		4	44:38:39:ff:01:02	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
22	swp1	1000	f		4	\N	15	t	\N	\N	\N	\N	\N	\N	\N	\N
23	swp2	1000	f		4	\N	16	t	\N	\N	\N	\N	\N	\N	\N	\N
18	irb1000	0	f		4	\N	\N	t	\N	\N	100	1	\N	\N	\N	\N
28	lo	0	f		5	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
29	swp1	1000	f	bgp_underlay	5	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
30	swp2	1000	f	bgp_underlay	5	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
31	swp3	1000	f	bgp_underlay	5	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
32	swp4	1000	f	bgp_underlay	5	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
33	swp5	1000	f	bgp_underlay	5	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
34	swp6	1000	f	bgp_underlay	5	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
35	lo	0	f		6	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
36	swp1	1000	f	bgp_underlay	6	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
37	swp2	1000	f	bgp_underlay	6	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
38	swp3	1000	f	bgp_underlay	6	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
39	swp4	1000	f	bgp_underlay	6	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
40	swp5	1000	f	bgp_underlay	6	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
41	swp6	1000	f	bgp_underlay	6	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
46	lo	0	f		7	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
48	peerlink.4094	0	f	bgp_underlay	7	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
81	bond01	200	f		10	\N	\N	t	\N	\N	200	\N	\N	\N	\N	\N
70	clagd-vxlan-anycast-ip	0	f		9	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1	bond01	200	f		1	\N	\N	t	\N	\N	200	\N	\N	\N	\N	\N
59	lo	0	f		8	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
60	peerlink	200	f		8	44:38:39:ff:01:34	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
47	peerlink	200	f		7	44:38:39:ff:01:34	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
61	peerlink.4094	0	f	bgp_underlay	8	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
72	lo	0	f		9	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
74	peerlink.4094	0	f	bgp_underlay	9	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
75	swp1	1000	f		9	\N	68	t	\N	\N	\N	\N	\N	\N	\N	\N
76	swp2	1000	f		9	\N	69	t	\N	\N	\N	\N	\N	\N	\N	\N
73	peerlink	200	f		9	44:38:39:ff:01:56	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
83	clagd-vxlan-anycast-ip	0	f		10	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
85	lo	0	f		10	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
88	swp1	1000	f		10	\N	81	t	\N	\N	\N	\N	\N	\N	\N	\N
89	swp2	1000	f		10	\N	82	t	\N	\N	\N	\N	\N	\N	\N	\N
86	peerlink	200	f		10	44:38:39:ff:01:56	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
99	lo	0	f		12	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
100	swp1	1000	f	bgp_underlay	12	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
101	swp2	1000	f	bgp_underlay	12	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
95	swp1	1000	f	bgp_underlay	11	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
96	swp2	1000	f	bgp_underlay	11	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
104	swp1	1000	f	bgp_underlay	13	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
105	swp2	1000	f	bgp_underlay	13	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
12	bond02	200	f		1	\N	\N	t	\N	\N	200	1	\N	\N	\N	\N
15	bond01	200	f		4	\N	\N	t	\N	\N	200	\N	\N	\N	\N	\N
82	bond02	200	f		10	\N	\N	t	\N	\N	200	\N	\N	\N	\N	\N
106	swp49	1000	f		13	\N	\N	t	\N	\N	200	\N	\N	\N	\N	\N
107	swp50	1000	f		13	\N	\N	t	\N	\N	200	\N	\N	\N	\N	\N
115	irb2508	0	f	bgp_external	14	\N	\N	t	\N	\N	100	14	\N	\N	\N	\N
116	swp1	1000	f	bgp_underlay	14	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
117	swp2	1000	f	bgp_underlay	14	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
129	swp2	1000	f		16	\N	\N	t	\N	\N	200	\N	\N	\N	\N	\N
120	swp1	1000	f		15	\N	\N	t	\N	\N	200	\N	\N	\N	\N	\N
121	swp2	1000	f		15	\N	\N	t	\N	\N	200	\N	\N	\N	\N	\N
62	swp1	1000	f	bgp_underlay	8	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
63	swp2	1000	f	bgp_underlay	8	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
122	irb2501	0	f	bgp_underlay	15	\N	\N	t	\N	\N	100	7	\N	\N	\N	\N
123	irb2502	0	f	bgp_underlay	15	\N	\N	t	\N	\N	100	8	\N	\N	\N	\N
124	irb2505	0	f	bgp_underlay	15	\N	\N	t	\N	\N	100	11	\N	\N	\N	\N
125	irb2506	0	f	bgp_underlay	15	\N	\N	t	\N	\N	100	12	\N	\N	\N	\N
126	irb2701	0	f	bgp_external	15	\N	\N	t	\N	\N	100	16	\N	\N	\N	\N
127	irb2702	0	f	bgp_external	15	\N	\N	t	\N	\N	100	17	\N	\N	\N	\N
141	irb1001	0	f		4	\N	\N	t	\N	\N	100	2	\N	\N	\N	\N
128	swp1	1000	f		16	\N	\N	t	\N	\N	200	\N	\N	\N	\N	\N
142	irb1002	0	f		4	\N	\N	t	\N	\N	100	3	\N	\N	\N	\N
11	swp52	1000	f	bgp_underlay	1	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
6	swp49	1000	f		1	\N	5	t	\N	\N	\N	\N	\N	\N	\N	\N
7	swp50	1000	f		1	\N	5	t	\N	\N	\N	\N	\N	\N	\N	\N
27	swp52	1000	f	bgp_underlay	4	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
25	swp50	1000	f		4	\N	20	t	\N	\N	\N	\N	\N	\N	\N	\N
24	swp49	1000	f		4	\N	20	t	\N	\N	\N	\N	\N	\N	\N	\N
54	swp52	1000	f	bgp_underlay	7	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
53	swp51	1000	f	bgp_underlay	7	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
52	swp50	1000	f		7	\N	47	t	\N	\N	\N	\N	\N	\N	\N	\N
51	swp49	1000	f		7	\N	47	t	\N	\N	\N	\N	\N	\N	\N	\N
67	swp52	1000	f	bgp_underlay	8	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
66	swp51	1000	f	bgp_underlay	8	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
65	swp50	1000	f		8	\N	60	t	\N	\N	\N	\N	\N	\N	\N	\N
64	swp49	1000	f		8	\N	60	t	\N	\N	\N	\N	\N	\N	\N	\N
79	swp53	1000	f	bgp_underlay	9	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
80	swp54	1000	f	bgp_underlay	9	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
77	swp49	1000	f		9	\N	73	t	\N	\N	\N	\N	\N	\N	\N	\N
78	swp50	1000	f		9	\N	73	t	\N	\N	\N	\N	\N	\N	\N	\N
92	swp53	1000	f	bgp_underlay	10	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
93	swp54	1000	f	bgp_underlay	10	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
90	swp49	1000	f		10	\N	86	t	\N	\N	\N	\N	\N	\N	\N	\N
91	swp50	1000	f		10	\N	86	t	\N	\N	\N	\N	\N	\N	\N	\N
98	swp7	1000	f	bgp_underlay	11	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
102	swp6	1000	f	bgp_underlay	12	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
103	swp7	1000	f	bgp_underlay	12	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
130	irb2503	0	f	bgp_underlay	16	\N	\N	t	\N	\N	100	9	\N	\N	\N	\N
131	irb2504	0	f	bgp_underlay	16	\N	\N	t	\N	\N	100	10	\N	\N	\N	\N
132	irb2507	0	f	bgp_underlay	16	\N	\N	t	\N	\N	100	13	\N	\N	\N	\N
133	irb2508	0	f	bgp_underlay	16	\N	\N	t	\N	\N	100	14	\N	\N	\N	\N
134	irb2703	0	f	bgp_external	16	\N	\N	t	\N	\N	100	18	\N	\N	\N	\N
135	irb2704	0	f	bgp_external	16	\N	\N	t	\N	\N	100	19	\N	\N	\N	\N
143	irb1003	0	f		4	\N	\N	t	\N	\N	100	4	\N	\N	\N	\N
118	swp49	1000	f		14	\N	\N	t	\N	\N	200	\N	\N	\N	\N	\N
144	irb1004	0	f		4	\N	\N	t	\N	\N	100	5	\N	\N	\N	\N
119	swp50	1000	f		14	\N	\N	t	\N	\N	200	\N	\N	\N	\N	\N
112	irb2505	0	f	bgp_external	14	\N	\N	t	\N	\N	100	11	\N	\N	\N	\N
145	irb1005	0	f		4	\N	\N	t	\N	\N	100	6	\N	\N	\N	\N
113	irb2506	0	f	bgp_external	14	\N	\N	t	\N	\N	100	12	\N	\N	\N	\N
114	irb2507	0	f	bgp_external	14	\N	\N	t	\N	\N	100	13	\N	\N	\N	\N
156	irb1001	0	f		9	\N	\N	t	\N	\N	100	2	\N	\N	\N	\N
157	irb1002	0	f		9	\N	\N	t	\N	\N	100	3	\N	\N	\N	\N
158	irb1003	0	f		9	\N	\N	t	\N	\N	100	4	\N	\N	\N	\N
159	irb1004	0	f		9	\N	\N	t	\N	\N	100	5	\N	\N	\N	\N
160	irb1005	0	f		9	\N	\N	t	\N	\N	100	6	\N	\N	\N	\N
136	irb1001	0	f		1	\N	\N	t	\N	\N	100	2	\N	\N	\N	\N
138	irb1003	0	f		1	\N	\N	t	\N	\N	100	4	\N	\N	\N	\N
139	irb1004	0	f		1	\N	\N	t	\N	\N	100	5	\N	\N	\N	\N
140	irb1005	0	f		1	\N	\N	t	\N	\N	100	6	\N	\N	\N	\N
161	irb1001	0	f		10	\N	\N	t	\N	\N	100	2	\N	\N	\N	\N
162	irb1002	0	f		10	\N	\N	t	\N	\N	100	3	\N	\N	\N	\N
163	irb1003	0	f		10	\N	\N	t	\N	\N	100	4	\N	\N	\N	\N
164	irb1004	0	f		10	\N	\N	t	\N	\N	100	5	\N	\N	\N	\N
165	irb1005	0	f		10	\N	\N	t	\N	\N	100	6	\N	\N	\N	\N
84	irb1000	0	f		10	\N	\N	t	\N	\N	100	1	\N	\N	\N	\N
166	swp51	1000	f	bgp_underlay	9	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
167	swp52	1000	f	bgp_underlay	9	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
168	swp51	1000	f	bgp_underlay	10	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
169	swp52	1000	f	bgp_underlay	10	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
49	swp1	1000	f	bgp_underlay	7	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
50	swp2	1000	f	bgp_underlay	7	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
10	swp51	1000	f	bgp_underlay	1	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
26	swp51	1000	f	bgp_underlay	4	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
97	swp6	1000	f	bgp_underlay	11	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: dcim_interface_tagged_vlans; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interface_tagged_vlans (id, interface_id, vlan_id) FROM stdin;
3	1	2
4	1	1
5	12	1
6	12	2
7	15	1
8	15	2
9	16	1
10	16	2
19	68	1
20	68	2
21	69	1
22	69	2
23	106	7
24	106	8
25	107	9
26	107	10
27	120	7
28	120	8
29	121	11
30	121	12
39	128	9
40	128	10
43	118	11
44	118	12
45	119	13
46	119	14
47	129	13
48	129	14
49	1	3
50	1	4
51	1	5
52	1	6
53	12	3
54	12	4
55	12	5
56	12	6
57	15	3
58	15	4
59	15	5
60	15	6
61	16	3
62	16	4
63	16	5
64	16	6
81	68	3
82	68	4
83	68	5
84	68	6
85	69	3
86	69	4
87	69	5
88	69	6
89	81	1
90	81	2
91	81	3
92	81	4
93	81	5
94	81	6
95	82	1
96	82	2
97	82	3
98	82	4
99	82	5
100	82	6
\.


--
-- Data for Name: dcim_interfacetemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interfacetemplate (id, name, type, mgmt_only, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_inventoryitem; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_inventoryitem (id, name, part_id, serial, discovered, device_id, parent_id, manufacturer_id, asset_tag, description) FROM stdin;
\.


--
-- Data for Name: dcim_manufacturer; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_manufacturer (id, name, slug, created, last_updated) FROM stdin;
1	Cumulus Networks	cumulus-networks	2019-12-29	2019-12-29 11:09:41.8681+00
\.


--
-- Data for Name: dcim_platform; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_platform (id, name, slug, napalm_driver, manufacturer_id, created, last_updated, napalm_args) FROM stdin;
1	Cumulus VX	cumulus-vx		1	2019-12-29	2019-12-29 11:09:41.953044+00	\N
\.


--
-- Data for Name: dcim_powerfeed; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerfeed (id, created, last_updated, name, status, type, supply, phase, voltage, amperage, max_utilization, available_power, comments, cable_id, power_panel_id, rack_id, connected_endpoint_id, connection_status) FROM stdin;
\.


--
-- Data for Name: dcim_poweroutlet; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_poweroutlet (id, name, device_id, cable_id, connection_status, description, feed_leg, power_port_id) FROM stdin;
\.


--
-- Data for Name: dcim_poweroutlettemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_poweroutlettemplate (id, name, device_type_id, feed_leg, power_port_id) FROM stdin;
\.


--
-- Data for Name: dcim_powerpanel; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerpanel (id, created, last_updated, name, rack_group_id, site_id) FROM stdin;
\.


--
-- Data for Name: dcim_powerport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerport (id, name, connection_status, device_id, _connected_poweroutlet_id, cable_id, description, _connected_powerfeed_id, allocated_draw, maximum_draw) FROM stdin;
\.


--
-- Data for Name: dcim_powerporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerporttemplate (id, name, device_type_id, allocated_draw, maximum_draw) FROM stdin;
\.


--
-- Data for Name: dcim_rack; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rack (id, created, last_updated, name, facility_id, u_height, comments, group_id, site_id, tenant_id, type, width, role_id, desc_units, serial, status, asset_tag, outer_depth, outer_unit, outer_width) FROM stdin;
1	2018-06-03	2018-06-09 00:29:07.362749+00	Rack1-pod1	\N	42		1	1	\N	\N	19	\N	f		3	\N	\N	\N	\N
2	2018-06-08	2018-06-09 00:29:24.68451+00	Spine-pod1	\N	42		1	1	\N	\N	19	\N	f		3	\N	\N	\N	\N
3	2018-06-09	2018-06-09 07:40:04.44653+00	Rack2-pod1	\N	42		1	1	\N	\N	19	\N	f		3	\N	\N	\N	\N
4	2018-06-09	2018-06-09 07:40:04.458497+00	Rack3-pod1	\N	42		1	1	\N	\N	19	\N	f		3	\N	\N	\N	\N
5	2018-06-09	2018-06-09 07:41:25.050604+00	Superspine	\N	42		3	1	\N	\N	19	\N	f		3	\N	\N	\N	\N
6	2018-06-09	2018-06-09 07:41:44.847313+00	Edge	\N	42		2	1	\N	\N	19	\N	f		3	\N	\N	\N	\N
7	2018-06-09	2018-06-09 07:44:02.190232+00	exit02	\N	42		1	1	\N	\N	19	\N	f		3	\N	\N	\N	\N
\.


--
-- Data for Name: dcim_rackgroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rackgroup (id, name, slug, site_id, created, last_updated) FROM stdin;
1	Pod1	pod1	1	2019-12-29	2019-12-29 11:09:42.04854+00
2	Edge	edge	1	2019-12-29	2019-12-29 11:09:42.04854+00
3	Superspine	superspine	1	2019-12-29	2019-12-29 11:09:42.04854+00
\.


--
-- Data for Name: dcim_rackreservation; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rackreservation (id, units, created, description, rack_id, user_id, tenant_id, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_rackrole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rackrole (id, name, slug, color, created, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_rearport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rearport (id, name, type, positions, description, device_id, cable_id) FROM stdin;
\.


--
-- Data for Name: dcim_rearporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rearporttemplate (id, name, type, positions, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_region; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_region (id, name, slug, lft, rght, tree_id, level, parent_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: dcim_site; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_site (id, created, last_updated, name, slug, facility, asn, physical_address, shipping_address, comments, tenant_id, contact_email, contact_name, contact_phone, region_id, description, status, time_zone, latitude, longitude) FROM stdin;
1	2018-06-03	2018-06-03 16:38:35.013009+00	Virtual Topology	virtual-topology		\N				\N				\N		1		\N	\N
\.


--
-- Data for Name: dcim_virtualchassis; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_virtualchassis (id, domain, master_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-06-03 16:25:40.914279+00	1	Asn	1	[{"added": {}}]	50	1
2	2018-06-03 16:27:46.686262+00	1	Asn	3		50	1
3	2018-06-03 16:29:13.64178+00	2	Asn	1	[{"added": {}}]	50	1
4	2018-06-07 05:43:14.135238+00	3	Clag-peer-ip	1	[{"added": {}}]	50	1
5	2018-06-07 05:43:34.180853+00	4	Clag-backup-ip	1	[{"added": {}}]	50	1
6	2018-06-07 17:15:46.458673+00	4	Clag backup ip	2	[{"changed": {"fields": ["name"]}}]	50	1
7	2018-06-07 17:16:01.316937+00	3	Clag peer ip	2	[{"changed": {"fields": ["name"]}}]	50	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	circuits	circuit
8	circuits	circuittype
9	circuits	provider
10	circuits	circuittermination
11	dcim	consoleport
12	dcim	consoleporttemplate
13	dcim	consoleserverport
14	dcim	consoleserverporttemplate
15	dcim	device
16	dcim	devicerole
17	dcim	devicetype
18	dcim	interface
20	dcim	interfacetemplate
21	dcim	manufacturer
22	dcim	platform
23	dcim	poweroutlet
24	dcim	poweroutlettemplate
25	dcim	powerport
26	dcim	powerporttemplate
27	dcim	rack
28	dcim	rackgroup
29	dcim	site
30	dcim	devicebay
31	dcim	devicebaytemplate
32	dcim	rackrole
33	dcim	rackreservation
34	dcim	region
35	dcim	inventoryitem
36	dcim	virtualchassis
37	ipam	aggregate
38	ipam	ipaddress
39	ipam	prefix
40	ipam	rir
41	ipam	role
42	ipam	vlan
43	ipam	vrf
44	ipam	vlangroup
45	ipam	service
46	extras	exporttemplate
47	extras	graph
48	extras	topologymap
49	extras	useraction
50	extras	customfield
51	extras	customfieldchoice
52	extras	customfieldvalue
53	extras	imageattachment
54	extras	reportresult
55	secrets	secret
56	secrets	secretrole
57	secrets	userkey
58	secrets	sessionkey
59	tenancy	tenant
60	tenancy	tenantgroup
61	users	token
62	virtualization	cluster
63	virtualization	clustergroup
64	virtualization	clustertype
65	virtualization	virtualmachine
66	taggit	tag
67	taggit	taggeditem
68	dcim	frontport
69	dcim	frontporttemplate
70	dcim	rearport
71	dcim	rearporttemplate
72	dcim	cable
73	dcim	powerfeed
74	dcim	powerpanel
75	extras	webhook
76	extras	objectchange
77	extras	configcontext
78	extras	tag
79	extras	taggeditem
80	extras	customlink
81	extras	script
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-06-03 16:17:20.578801+00
2	auth	0001_initial	2018-06-03 16:17:20.689919+00
3	admin	0001_initial	2018-06-03 16:17:20.842157+00
4	admin	0002_logentry_remove_auto_add	2018-06-03 16:17:20.877575+00
5	contenttypes	0002_remove_content_type_name	2018-06-03 16:17:20.998743+00
6	auth	0002_alter_permission_name_max_length	2018-06-03 16:17:21.061729+00
7	auth	0003_alter_user_email_max_length	2018-06-03 16:17:21.133473+00
8	auth	0004_alter_user_username_opts	2018-06-03 16:17:21.200301+00
9	auth	0005_alter_user_last_login_null	2018-06-03 16:17:21.27122+00
10	auth	0006_require_contenttypes_0002	2018-06-03 16:17:21.280404+00
11	auth	0007_alter_validators_add_error_messages	2018-06-03 16:17:21.309452+00
12	auth	0008_alter_user_username_max_length	2018-06-03 16:17:21.345091+00
13	tenancy	0001_initial	2018-06-03 16:17:21.470322+00
14	dcim	0001_initial	2018-06-03 16:17:22.069796+00
15	ipam	0001_initial	2018-06-03 16:17:22.395409+00
16	dcim	0002_auto_20160622_1821	2018-06-03 16:17:23.13812+00
17	dcim	0003_auto_20160628_1721	2018-06-03 16:17:23.298502+00
18	dcim	0004_auto_20160701_2049	2018-06-03 16:17:23.423694+00
19	dcim	0005_auto_20160706_1722	2018-06-03 16:17:23.465615+00
20	dcim	0006_add_device_primary_ip4_ip6	2018-06-03 16:17:23.536778+00
21	dcim	0007_device_copy_primary_ip	2018-06-03 16:17:23.61124+00
22	dcim	0008_device_remove_primary_ip	2018-06-03 16:17:23.660392+00
23	dcim	0009_site_32bit_asn_support	2018-06-03 16:17:23.708887+00
24	dcim	0010_devicebay_installed_device_set_null	2018-06-03 16:17:23.746221+00
25	dcim	0011_devicetype_part_number	2018-06-03 16:17:23.892476+00
26	dcim	0012_site_rack_device_add_tenant	2018-06-03 16:17:24.13287+00
27	dcim	0013_add_interface_form_factors	2018-06-03 16:17:24.232075+00
28	dcim	0014_rack_add_type_width	2018-06-03 16:17:24.594961+00
29	dcim	0015_rack_add_u_height_validator	2018-06-03 16:17:24.634592+00
30	dcim	0016_module_add_manufacturer	2018-06-03 16:17:24.778807+00
31	dcim	0017_rack_add_role	2018-06-03 16:17:24.934397+00
32	dcim	0018_device_add_asset_tag	2018-06-03 16:17:25.090352+00
33	dcim	0019_new_iface_form_factors	2018-06-03 16:17:25.146524+00
34	dcim	0020_rack_desc_units	2018-06-03 16:17:25.272485+00
35	dcim	0021_add_ff_flexstack	2018-06-03 16:17:25.399281+00
36	dcim	0022_color_names_to_rgb	2018-06-03 16:17:25.568485+00
37	circuits	0001_initial	2018-06-03 16:17:25.645228+00
38	circuits	0002_auto_20160622_1821	2018-06-03 16:17:25.833157+00
39	circuits	0003_provider_32bit_asn_support	2018-06-03 16:17:25.876523+00
40	circuits	0004_circuit_add_tenant	2018-06-03 16:17:25.946359+00
41	circuits	0005_circuit_add_upstream_speed	2018-06-03 16:17:25.986178+00
42	circuits	0006_terminations	2018-06-03 16:17:26.541588+00
43	circuits	0007_circuit_add_description	2018-06-03 16:17:26.597899+00
44	circuits	0008_circuittermination_interface_protect_on_delete	2018-06-03 16:17:26.657712+00
45	circuits	0009_unicode_literals	2018-06-03 16:17:26.897243+00
46	circuits	0010_circuit_status	2018-06-03 16:17:26.97874+00
47	tenancy	0002_tenant_group_optional	2018-06-03 16:17:27.035265+00
48	tenancy	0003_unicode_literals	2018-06-03 16:17:27.059498+00
49	ipam	0002_vrf_add_enforce_unique	2018-06-03 16:17:27.084474+00
50	ipam	0003_ipam_add_vlangroups	2018-06-03 16:17:27.225546+00
51	ipam	0004_ipam_vlangroup_uniqueness	2018-06-03 16:17:27.296774+00
52	ipam	0005_auto_20160725_1842	2018-06-03 16:17:27.391261+00
53	ipam	0006_vrf_vlan_add_tenant	2018-06-03 16:17:27.530865+00
54	ipam	0007_prefix_ipaddress_add_tenant	2018-06-03 16:17:27.644991+00
55	ipam	0008_prefix_change_order	2018-06-03 16:17:27.680189+00
56	ipam	0009_ipaddress_add_status	2018-06-03 16:17:27.738797+00
57	ipam	0010_ipaddress_help_texts	2018-06-03 16:17:27.975217+00
58	ipam	0011_rir_add_is_private	2018-06-03 16:17:28.016664+00
59	ipam	0012_services	2018-06-03 16:17:28.250729+00
60	ipam	0013_prefix_add_is_pool	2018-06-03 16:17:28.62504+00
61	ipam	0014_ipaddress_status_add_deprecated	2018-06-03 16:17:28.662862+00
62	ipam	0015_global_vlans	2018-06-03 16:17:28.778031+00
63	ipam	0016_unicode_literals	2018-06-03 16:17:29.759058+00
64	ipam	0017_ipaddress_roles	2018-06-03 16:17:29.842275+00
65	ipam	0018_remove_service_uniqueness_constraint	2018-06-03 16:17:29.891022+00
66	dcim	0023_devicetype_comments	2018-06-03 16:17:30.013881+00
67	dcim	0024_site_add_contact_fields	2018-06-03 16:17:30.256645+00
68	dcim	0025_devicetype_add_interface_ordering	2018-06-03 16:17:30.339808+00
69	dcim	0026_add_rack_reservations	2018-06-03 16:17:30.509397+00
70	dcim	0027_device_add_site	2018-06-03 16:17:30.579058+00
71	dcim	0028_device_copy_rack_to_site	2018-06-03 16:17:30.658211+00
72	dcim	0029_allow_rackless_devices	2018-06-03 16:17:30.801876+00
73	dcim	0030_interface_add_lag	2018-06-03 16:17:30.9374+00
74	dcim	0031_regions	2018-06-03 16:17:31.104145+00
75	dcim	0032_device_increase_name_length	2018-06-03 16:17:31.170766+00
76	dcim	0033_rackreservation_rack_editable	2018-06-03 16:17:31.265201+00
77	dcim	0034_rename_module_to_inventoryitem	2018-06-03 16:17:31.68422+00
78	dcim	0035_device_expand_status_choices	2018-06-03 16:17:32.124607+00
79	dcim	0036_add_ff_juniper_vcp	2018-06-03 16:17:32.181053+00
80	dcim	0037_unicode_literals	2018-06-03 16:17:33.315532+00
81	dcim	0038_wireless_interfaces	2018-06-03 16:17:33.36169+00
82	dcim	0039_interface_add_enabled_mtu	2018-06-03 16:17:33.450872+00
83	dcim	0040_inventoryitem_add_asset_tag_description	2018-06-03 16:17:33.563687+00
84	dcim	0041_napalm_integration	2018-06-03 16:17:33.806955+00
85	dcim	0042_interface_ff_10ge_cx4	2018-06-03 16:17:33.871898+00
86	dcim	0043_device_component_name_lengths	2018-06-03 16:17:34.130402+00
87	virtualization	0001_virtualization	2018-06-03 16:17:34.650822+00
88	ipam	0019_virtualization	2018-06-03 16:17:34.846199+00
89	ipam	0020_ipaddress_add_role_carp	2018-06-03 16:17:34.893961+00
90	dcim	0044_virtualization	2018-06-03 16:17:35.064684+00
91	dcim	0045_devicerole_vm_role	2018-06-03 16:17:35.266744+00
92	dcim	0046_rack_lengthen_facility_id	2018-06-03 16:17:35.302049+00
93	dcim	0047_more_100ge_form_factors	2018-06-03 16:17:35.35008+00
94	dcim	0048_rack_serial	2018-06-03 16:17:35.532927+00
95	dcim	0049_rackreservation_change_user	2018-06-03 16:17:35.734012+00
96	dcim	0050_interface_vlan_tagging	2018-06-03 16:17:35.982638+00
97	dcim	0051_rackreservation_tenant	2018-06-03 16:17:36.083179+00
98	dcim	0052_virtual_chassis	2018-06-03 16:17:36.460654+00
99	dcim	0053_platform_manufacturer	2018-06-03 16:17:36.63668+00
100	dcim	0054_site_status_timezone_description	2018-06-03 16:17:37.125463+00
101	dcim	0055_virtualchassis_ordering	2018-06-03 16:17:37.372256+00
102	extras	0001_initial	2018-06-03 16:17:37.720037+00
103	extras	0002_custom_fields	2018-06-03 16:17:38.137722+00
104	extras	0003_exporttemplate_add_description	2018-06-03 16:17:38.212434+00
105	extras	0004_topologymap_change_comma_to_semicolon	2018-06-03 16:17:38.257194+00
106	extras	0005_useraction_add_bulk_create	2018-06-03 16:17:38.292181+00
107	extras	0006_add_imageattachments	2018-06-03 16:17:38.386276+00
108	extras	0007_unicode_literals	2018-06-03 16:17:38.92683+00
109	extras	0008_reports	2018-06-03 16:17:39.151332+00
110	extras	0009_topologymap_type	2018-06-03 16:17:39.256282+00
111	extras	0010_customfield_filter_logic	2018-06-03 16:17:39.479313+00
112	ipam	0021_vrf_ordering	2018-06-03 16:17:39.527466+00
113	secrets	0001_initial	2018-06-03 16:17:40.066616+00
114	secrets	0002_userkey_add_session_key	2018-06-03 16:17:40.462775+00
115	secrets	0003_unicode_literals	2018-06-03 16:17:40.529241+00
116	sessions	0001_initial	2018-06-03 16:17:40.574016+00
117	users	0001_api_tokens	2018-06-03 16:17:40.825916+00
118	users	0002_unicode_literals	2018-06-03 16:17:40.952544+00
119	virtualization	0002_virtualmachine_add_status	2018-06-03 16:17:41.159908+00
120	virtualization	0003_cluster_add_site	2018-06-03 16:17:41.29214+00
121	virtualization	0004_virtualmachine_add_role	2018-06-03 16:17:41.404554+00
122	admin	0003_logentry_add_action_flag_choices	2019-12-29 11:09:39.430005+00
123	auth	0009_alter_user_last_name_max_length	2019-12-29 11:09:39.451182+00
124	auth	0010_alter_group_name_max_length	2019-12-29 11:09:39.468087+00
125	auth	0011_update_proxy_permissions	2019-12-29 11:09:39.529037+00
126	taggit	0001_initial	2019-12-29 11:09:39.561795+00
127	taggit	0002_auto_20150616_2121	2019-12-29 11:09:39.590578+00
128	tenancy	0004_tags	2019-12-29 11:09:39.744639+00
129	tenancy	0005_change_logging	2019-12-29 11:09:39.823149+00
130	extras	0011_django2	2019-12-29 11:09:40.032989+00
131	extras	0012_webhooks	2019-12-29 11:09:40.124234+00
132	extras	0013_objectchange	2019-12-29 11:09:40.226621+00
133	dcim	0056_django2	2019-12-29 11:09:40.409317+00
134	dcim	0057_tags	2019-12-29 11:09:41.451608+00
135	dcim	0058_relax_rack_naming_constraints	2019-12-29 11:09:41.534207+00
136	dcim	0059_site_latitude_longitude	2019-12-29 11:09:41.603434+00
137	dcim	0060_change_logging	2019-12-29 11:09:42.729807+00
138	dcim	0061_platform_napalm_args	2019-12-29 11:09:42.75398+00
139	extras	0014_configcontexts	2019-12-29 11:09:43.068475+00
140	extras	0015_remove_useraction	2019-12-29 11:09:43.3428+00
141	extras	0016_exporttemplate_add_cable	2019-12-29 11:09:43.571428+00
142	extras	0017_exporttemplate_mime_type_length	2019-12-29 11:09:43.594135+00
143	extras	0018_exporttemplate_add_jinja2	2019-12-29 11:09:43.709202+00
144	extras	0019_tag_taggeditem	2019-12-29 11:09:43.805301+00
145	dcim	0062_interface_mtu	2019-12-29 11:09:43.937129+00
146	dcim	0063_device_local_context_data	2019-12-29 11:09:43.971013+00
147	dcim	0064_remove_platform_rpc_client	2019-12-29 11:09:43.988708+00
148	dcim	0065_front_rear_ports	2019-12-29 11:09:44.734306+00
149	dcim	0066_cables	2019-12-29 11:09:47.200293+00
150	circuits	0011_tags	2019-12-29 11:09:47.547983+00
151	circuits	0012_change_logging	2019-12-29 11:09:47.738473+00
152	circuits	0013_cables	2019-12-29 11:09:48.048914+00
153	circuits	0014_circuittermination_description	2019-12-29 11:09:48.113247+00
154	circuits	0015_custom_tag_models	2019-12-29 11:09:48.40512+00
155	virtualization	0005_django2	2019-12-29 11:09:48.477065+00
156	virtualization	0006_tags	2019-12-29 11:09:48.605912+00
157	virtualization	0007_change_logging	2019-12-29 11:09:48.8883+00
158	virtualization	0008_virtualmachine_local_context_data	2019-12-29 11:09:48.927548+00
159	virtualization	0009_custom_tag_models	2019-12-29 11:09:49.069739+00
160	tenancy	0006_custom_tag_models	2019-12-29 11:09:49.369364+00
161	secrets	0004_tags	2019-12-29 11:09:49.443368+00
162	secrets	0005_change_logging	2019-12-29 11:09:49.595149+00
163	secrets	0006_custom_tag_models	2019-12-29 11:09:49.661392+00
164	ipam	0022_tags	2019-12-29 11:09:50.309986+00
165	ipam	0023_change_logging	2019-12-29 11:09:50.908553+00
166	ipam	0024_vrf_allow_null_rd	2019-12-29 11:09:50.943427+00
167	ipam	0025_custom_tag_models	2019-12-29 11:09:51.475889+00
168	dcim	0067_device_type_remove_qualifiers	2019-12-29 11:09:51.555497+00
169	dcim	0068_rack_new_fields	2019-12-29 11:09:51.755026+00
170	dcim	0069_deprecate_nullablecharfield	2019-12-29 11:09:52.097556+00
171	dcim	0070_custom_tag_models	2019-12-29 11:09:53.362702+00
172	extras	0020_tag_data	2019-12-29 11:09:53.84232+00
173	extras	0021_add_color_comments_changelog_to_tag	2019-12-29 11:09:54.132555+00
174	dcim	0071_device_components_add_description	2019-12-29 11:09:54.614342+00
175	dcim	0072_powerfeeds	2019-12-29 11:09:55.769476+00
176	dcim	0073_interface_form_factor_to_type	2019-12-29 11:09:55.9561+00
177	dcim	0074_increase_field_length_platform_name_slug	2019-12-29 11:09:56.001294+00
178	dcim	0075_cable_devices	2019-12-29 11:09:56.477052+00
179	extras	0022_custom_links	2019-12-29 11:09:56.854751+00
180	extras	0023_fix_tag_sequences	2019-12-29 11:09:56.878661+00
181	extras	0024_scripts	2019-12-29 11:09:56.887558+00
182	extras	0025_objectchange_time_index	2019-12-29 11:09:56.919924+00
183	extras	0026_webhook_ca_file_path	2019-12-29 11:09:56.940257+00
184	extras	0027_webhook_additional_headers	2019-12-29 11:09:56.958968+00
185	ipam	0026_prefix_ordering_vrf_nulls_first	2019-12-29 11:09:57.191347+00
186	ipam	0027_ipaddress_add_dns_name	2019-12-29 11:09:57.275965+00
187	taggit	0003_taggeditem_add_unique_index	2019-12-29 11:09:57.298029+00
188	users	0003_token_permissions	2019-12-29 11:09:57.319783+00
189	circuits	0001_initial_squashed_0010_circuit_status	2019-12-29 11:09:57.330047+00
190	dcim	0023_devicetype_comments_squashed_0043_device_component_name_lengths	2019-12-29 11:09:57.332216+00
191	dcim	0002_auto_20160622_1821_squashed_0022_color_names_to_rgb	2019-12-29 11:09:57.333963+00
192	dcim	0044_virtualization_squashed_0055_virtualchassis_ordering	2019-12-29 11:09:57.335687+00
193	ipam	0002_vrf_add_enforce_unique_squashed_0018_remove_service_uniqueness_constraint	2019-12-29 11:09:57.337267+00
194	ipam	0019_virtualization_squashed_0020_ipaddress_add_role_carp	2019-12-29 11:09:57.339175+00
195	extras	0001_initial_squashed_0010_customfield_filter_logic	2019-12-29 11:09:57.340786+00
196	secrets	0001_initial_squashed_0003_unicode_literals	2019-12-29 11:09:57.34259+00
197	tenancy	0002_tenant_group_optional_squashed_0003_unicode_literals	2019-12-29 11:09:57.344239+00
198	users	0001_api_tokens_squashed_0002_unicode_literals	2019-12-29 11:09:57.345907+00
199	virtualization	0002_virtualmachine_add_status_squashed_0004_virtualmachine_add_role	2019-12-29 11:09:57.349484+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
czyfvr6s07tikkqorkj3cpuefj8ggdh5	OWRmMzZkNzJiNGNjYzNkNjJmYTkyMmU0MGQ3MTZmNmZhNjdjMmQwNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5M2RiMmMyMzFiY2M3NmQzZjkyMmRmNDA0MmM5OGQ0NzU0NzJkOTVmIn0=	2018-06-17 16:20:42.39863+00
w0iodv1mnxosfpa14r1ci8g3q6r0smwc	OWRmMzZkNzJiNGNjYzNkNjJmYTkyMmU0MGQ3MTZmNmZhNjdjMmQwNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5M2RiMmMyMzFiY2M3NmQzZjkyMmRmNDA0MmM5OGQ0NzU0NzJkOTVmIn0=	2018-06-23 08:06:39.472226+00
4cq56ympmhiax6s49ruxg8k4uzlpdske	OWRmMzZkNzJiNGNjYzNkNjJmYTkyMmU0MGQ3MTZmNmZhNjdjMmQwNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5M2RiMmMyMzFiY2M3NmQzZjkyMmRmNDA0MmM5OGQ0NzU0NzJkOTVmIn0=	2018-11-21 16:46:12.853948+00
9h2c8w1m0snowc5woe4bj5jthfnp6v3x	OWRmMzZkNzJiNGNjYzNkNjJmYTkyMmU0MGQ3MTZmNmZhNjdjMmQwNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5M2RiMmMyMzFiY2M3NmQzZjkyMmRmNDA0MmM5OGQ0NzU0NzJkOTVmIn0=	2019-06-22 15:18:24.791615+00
cfap2t1gcwkc3os14v1p81uwib2r14jf	NDgxYTU0NGE3Y2ZhNDYzMzIzM2ZkZWIyNTUzMDlkMDBiMWM0Yjg2MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXRpbGl0aWVzLmF1dGhfYmFja2VuZHMuVmlld0V4ZW1wdE1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjE2MDY2MmY4N2IyMDM3NzdkNjA3NDE1OGZiNTZkYjI2NTE0OGNlMjkifQ==	2020-01-12 11:10:15.42396+00
\.


--
-- Data for Name: extras_configcontext; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext (id, name, weight, description, is_active, data) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_platforms; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_platforms (id, configcontext_id, platform_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_regions; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_regions (id, configcontext_id, region_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_roles; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_roles (id, configcontext_id, devicerole_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_sites; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_sites (id, configcontext_id, site_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tenant_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_tenant_groups (id, configcontext_id, tenantgroup_id) FROM stdin;
\.


--
-- Data for Name: extras_configcontext_tenants; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_configcontext_tenants (id, configcontext_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: extras_customfield; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customfield (id, type, name, label, description, required, "default", weight, filter_logic) FROM stdin;
2	200	ASN			f		100	1
4	100	clag_backup_ip			f		100	1
3	100	clag_peer_ip			f		100	1
\.


--
-- Data for Name: extras_customfield_obj_type; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customfield_obj_type (id, customfield_id, contenttype_id) FROM stdin;
2	2	15
3	3	38
4	4	38
\.


--
-- Data for Name: extras_customfieldchoice; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customfieldchoice (id, value, weight, field_id) FROM stdin;
\.


--
-- Data for Name: extras_customfieldvalue; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customfieldvalue (id, obj_id, serialized_value, field_id, obj_type_id) FROM stdin;
1	1	65111	2	15
4	7	192.168.200.19	4	38
5	7	169.254.1.2	3	38
7	8	192.168.200.21	4	38
8	8	169.254.1.1	3	38
6	4	65112	2	15
9	5	65101	2	15
10	6	65102	2	15
12	22	192.168.200.17	4	38
13	22	169.254.1.2	3	38
15	27	192.168.200.20	4	38
16	27	169.254.1.1	3	38
11	7	65121	2	15
19	11	65901	2	15
20	12	65902	2	15
23	15	65701	2	15
24	16	65702	2	15
25	36	192.168.200.29	4	38
26	36	169.254.1.2	3	38
27	43	192.168.200.32	4	38
28	43	169.254.1.1	3	38
14	8	65122	2	15
17	9	65131	2	15
18	10	65132	2	15
21	13	65801	2	15
22	14	65802	2	15
\.


--
-- Data for Name: extras_customlink; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customlink (id, name, text, url, weight, group_name, button_class, new_window, content_type_id) FROM stdin;
\.


--
-- Data for Name: extras_exporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_exporttemplate (id, name, template_code, mime_type, file_extension, content_type_id, description, template_language) FROM stdin;
\.


--
-- Data for Name: extras_graph; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_graph (id, type, weight, name, source, link) FROM stdin;
\.


--
-- Data for Name: extras_imageattachment; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_imageattachment (id, object_id, image, image_height, image_width, name, created, content_type_id) FROM stdin;
\.


--
-- Data for Name: extras_objectchange; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_objectchange (id, "time", user_name, request_id, action, changed_object_id, related_object_id, object_repr, object_data, changed_object_type_id, related_object_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: extras_reportresult; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_reportresult (id, report, created, failed, data, user_id) FROM stdin;
\.


--
-- Data for Name: extras_tag; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_tag (id, name, slug, color, comments, created, last_updated) FROM stdin;
\.


--
-- Data for Name: extras_taggeditem; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Data for Name: extras_topologymap; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_topologymap (id, name, slug, device_patterns, description, site_id, type) FROM stdin;
\.


--
-- Data for Name: extras_webhook; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_webhook (id, name, type_create, type_update, type_delete, payload_url, http_content_type, secret, enabled, ssl_verification, ca_file_path, additional_headers) FROM stdin;
\.


--
-- Data for Name: extras_webhook_obj_type; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_webhook_obj_type (id, webhook_id, contenttype_id) FROM stdin;
\.


--
-- Data for Name: ipam_aggregate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_aggregate (id, created, last_updated, family, prefix, date_added, description, rir_id) FROM stdin;
\.


--
-- Data for Name: ipam_ipaddress; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_ipaddress (id, created, last_updated, family, address, description, interface_id, nat_inside_id, vrf_id, tenant_id, status, role, dns_name) FROM stdin;
56	2018-06-09	2018-06-09 10:48:20.743316+00	4	192.168.12.2/24		137	\N	2	2	1	\N	
62	2018-06-09	2018-06-09 10:48:39.040862+00	4	192.168.13.2/24		138	\N	2	2	1	\N	
68	2018-06-09	2018-06-09 10:49:40.251921+00	4	192.168.14.2/24		139	\N	3	3	1	\N	
9	2018-06-03	2018-06-03 17:28:59.410321+00	4	10.10.10.1		4	\N	\N	\N	1	10	
74	2018-06-09	2018-06-09 10:49:53.894667+00	4	192.168.15.2/24		140	\N	3	3	1	\N	
86	2018-06-09	2018-06-09 10:53:42.687133+00	6	fc00:12::2/64		137	\N	2	2	1	\N	
92	2018-06-09	2018-06-09 10:54:23.916168+00	6	fc00:13::2/64		138	\N	2	2	1	\N	
98	2018-06-09	2018-06-09 10:54:42.020742+00	6	fc00:14::2/64		139	\N	3	3	1	\N	
120	2018-06-09	2018-06-09 19:51:37.028337+00	4	192.168.11.1/24		161	\N	1	1	1	41	
49	2018-06-09	2018-06-09 08:58:45.482406+00	4	10.10.30.2		99	\N	\N	\N	1	10	
122	2018-06-09	2018-06-09 19:52:44.302551+00	4	192.168.13.1/24		163	\N	2	2	1	41	
124	2018-06-09	2018-06-09 19:53:48.876302+00	4	192.168.15.1/24		165	\N	3	3	1	41	
126	2018-06-09	2018-06-09 19:54:50.332847+00	4	192.168.12.1/24		142	\N	2	2	1	41	
128	2018-06-09	2018-06-09 19:55:30.045081+00	4	192.168.14.1/24		144	\N	3	3	1	41	
130	2018-06-09	2018-06-09 19:56:22.588307+00	6	fc00:11::1/64		141	\N	1	1	1	41	
132	2018-06-09	2018-06-09 19:56:55.134519+00	6	fc00:13::1/64		143	\N	2	2	1	41	
7	2018-06-03	2018-06-08 16:53:47.050852+00	4	169.254.1.1/30		8	\N	\N	\N	1	\N	
134	2018-06-09	2018-06-09 19:57:25.643063+00	6	fc00:15::1/64		145	\N	3	3	1	41	
87	2018-06-09	2018-06-09 19:58:35.058177+00	6	fc00:12::3/64		142	\N	2	2	1	\N	
93	2018-06-09	2018-06-09 19:59:00.601134+00	6	fc00:13::3/64		143	\N	2	2	1	\N	
99	2018-06-09	2018-06-09 19:59:16.304608+00	6	fc00:14::3/64		144	\N	3	3	1	\N	
51	2018-06-09	2018-06-09 20:00:12.396717+00	4	192.168.11.3/24		141	\N	1	1	1	\N	
11	2018-06-08	2018-06-08 20:17:59.798689+00	4	10.10.10.2		19	\N	\N	\N	1	10	
8	2018-06-03	2018-06-08 20:20:21.168161+00	4	169.254.1.2/30		21	\N	\N	\N	1	\N	
57	2018-06-09	2018-06-09 20:00:24.869895+00	4	192.168.12.3/24		142	\N	2	2	1	\N	
63	2018-06-09	2018-06-09 20:00:37.953922+00	4	192.168.13.3/24		143	\N	2	2	1	\N	
69	2018-06-09	2018-06-09 20:00:58.253397+00	4	192.168.14.3/24		144	\N	3	3	1	\N	
75	2018-06-09	2018-06-09 20:01:13.646992+00	4	192.168.15.3/24		145	\N	3	3	1	\N	
10	2018-06-03	2018-06-08 21:24:46.126106+00	4	10.100.100.12		9	\N	\N	\N	1	30	
15	2018-06-08	2018-06-08 21:30:04.433543+00	4	10.100.100.12		17	\N	\N	\N	1	30	
18	2018-06-08	2018-06-08 22:36:50.542167+00	4	10.10.20.1		28	\N	\N	\N	1	10	
19	2018-06-08	2018-06-08 22:38:33.425144+00	4	10.10.20.2		35	\N	\N	\N	1	10	
16	2018-06-08	2018-06-08 23:21:39.662181+00	4	192.168.10.1/24		3	\N	1	1	1	41	
12	2018-06-08	2018-06-08 23:21:48.785744+00	4	192.168.10.1/24		18	\N	1	1	1	41	
13	2018-06-08	2018-06-08 23:21:56.237071+00	4	192.168.10.2/24		3	\N	1	1	1	\N	
14	2018-06-08	2018-06-08 23:22:04.35702+00	4	192.168.10.3/24		18	\N	1	1	1	\N	
4	2018-06-03	2018-06-08 23:22:15.27877+00	6	fc00:10::1/64		18	\N	1	1	1	41	
5	2018-06-03	2018-06-08 23:22:27.540686+00	6	fc00:10::2/64		3	\N	1	1	1	\N	
6	2018-06-03	2018-06-08 23:22:46.362188+00	6	fc00:10::3/64		18	\N	1	1	1	\N	
21	2018-06-08	2018-06-08 23:59:01.661535+00	4	10.10.10.3		46	\N	\N	\N	1	10	
22	2018-06-09	2018-06-09 00:00:28.026116+00	4	169.254.1.1/30		48	\N	\N	\N	1	\N	
17	2018-06-08	2018-06-09 00:04:25.854341+00	6	fc00:10::1/64		3	\N	1	1	1	41	
27	2018-06-09	2018-06-09 00:15:54.709314+00	4	169.254.1.2/30		61	\N	\N	\N	1	\N	
34	2018-06-09	2018-06-09 08:37:02.310354+00	4	10.100.100.56		70	\N	\N	\N	1	30	
35	2018-06-09	2018-06-09 08:37:33.395269+00	4	10.10.10.5		72	\N	\N	\N	1	10	
36	2018-06-09	2018-06-09 08:39:11.687954+00	4	169.254.1.1/30		74	\N	\N	\N	1	\N	
41	2018-06-09	2018-06-09 08:48:52.770896+00	4	10.100.100.56		83	\N	\N	\N	1	30	
42	2018-06-09	2018-06-09 08:49:57.197178+00	4	10.10.10.6		85	\N	\N	\N	1	10	
43	2018-06-09	2018-06-09 08:51:12.140443+00	4	169.254.1.2/30		87	\N	\N	\N	1	\N	
48	2018-06-09	2018-06-09 08:54:31.276043+00	4	10.10.30.1		94	\N	\N	\N	1	10	
54	2018-06-09	2018-06-09 20:35:00.51934+00	4	192.168.11.6/24		156	\N	1	1	1	\N	
60	2018-06-09	2018-06-09 20:35:13.015298+00	4	192.168.12.6/24		157	\N	2	2	1	\N	
66	2018-06-09	2018-06-09 20:35:26.35718+00	4	192.168.13.6/24		158	\N	2	2	1	\N	
72	2018-06-09	2018-06-09 20:35:37.269083+00	4	192.168.14.6/24		159	\N	3	3	1	\N	
45	2018-06-09	2018-06-09 10:05:30.547499+00	4	192.168.10.7/24		84	\N	1	1	1	\N	
28	2018-06-09	2018-06-09 10:06:15.15478+00	4	10.10.10.4		59	\N	\N	\N	1	10	
78	2018-06-09	2018-06-09 20:35:51.193111+00	4	192.168.15.6/24		160	\N	3	3	1	\N	
90	2018-06-09	2018-06-09 20:36:38.637933+00	6	fc00:12::6/64		157	\N	2	2	1	\N	
40	2018-06-09	2018-06-09 10:14:08.887747+00	6	fc00:10::1/64		71	\N	1	1	1	41	
46	2018-06-09	2018-06-09 10:14:08.893935+00	6	fc00:10::1/64		84	\N	1	1	1	41	
91	2018-06-09	2018-06-09 20:39:51.423013+00	6	fc00:12::7/64		162	\N	2	2	1	\N	
55	2018-06-09	2018-06-09 20:40:56.586391+00	4	192.168.11.7/24		161	\N	1	1	1	\N	
61	2018-06-09	2018-06-09 20:41:10.993366+00	4	192.168.12.7/24		162	\N	2	2	1	\N	
73	2018-06-09	2018-06-09 20:41:32.918289+00	4	192.168.14.7/24		164	\N	3	3	1	\N	
79	2018-06-09	2018-06-09 20:41:45.053978+00	4	192.168.15.7/24		165	\N	3	3	1	\N	
50	2018-06-09	2018-06-09 10:45:00.558226+00	4	192.168.11.2/24		136	\N	1	1	1	\N	
38	2018-06-09	2018-06-09 10:04:52.146074+00	4	192.168.10.6/24		71	\N	1	1	1	\N	
37	2018-06-09	2018-06-09 10:05:52.622032+00	4	192.168.10.1/24		71	\N	1	1	1	41	
44	2018-06-09	2018-06-09 10:05:52.630131+00	4	192.168.10.1/24		84	\N	1	1	1	41	
115	2018-06-09	2018-06-09 10:51:21.927845+00	6	fc00:11::1/64		136	\N	1	1	1	41	
116	2018-06-09	2018-06-09 10:51:53.153056+00	6	fc00:12::1/64		137	\N	2	2	1	41	
117	2018-06-09	2018-06-09 10:52:08.888119+00	6	fc00:13::1/64		138	\N	2	2	1	41	
118	2018-06-09	2018-06-09 10:52:31.369316+00	6	fc00:14::1/64		139	\N	3	3	1	41	
119	2018-06-09	2018-06-09 10:52:56.1531+00	6	fc00:15::1/64		140	\N	3	3	1	41	
80	2018-06-09	2018-06-09 10:53:26.858314+00	6	fc00:11::2/64		136	\N	1	1	1	\N	
104	2018-06-09	2018-06-09 10:54:58.958957+00	6	fc00:15::2/64		140	\N	3	3	1	\N	
123	2018-06-09	2018-06-09 19:53:08.740336+00	4	192.168.14.1/24		164	\N	3	3	1	41	
125	2018-06-09	2018-06-09 19:54:35.398377+00	4	192.168.11.1/24		141	\N	1	1	1	41	
129	2018-06-09	2018-06-09 19:55:45.52175+00	4	192.168.15.1/24		145	\N	3	3	1	41	
131	2018-06-09	2018-06-09 19:56:40.680239+00	6	fc00:12::1/64		142	\N	2	2	1	41	
133	2018-06-09	2018-06-09 19:57:10.388924+00	6	fc00:14::1/64		144	\N	3	3	1	41	
81	2018-06-09	2018-06-09 19:58:19.005782+00	6	fc00:11::3/64		141	\N	1	1	1	\N	
105	2018-06-09	2018-06-09 19:59:30.920288+00	6	fc00:15::3/64		145	\N	3	3	1	\N	
39	2018-06-09	2018-06-09 10:13:35.532328+00	6	fc00:10::6/64		71	\N	1	1	1	\N	
47	2018-06-09	2018-06-09 10:13:35.540608+00	6	fc00:10::7/64		84	\N	1	1	1	\N	
127	2018-06-09	2018-06-09 20:48:05.676037+00	4	192.168.13.1/24		143	\N	1	2	1	41	
96	2018-06-09	2018-06-09 20:36:53.220312+00	6	fc00:13::6/64		158	\N	2	2	1	\N	
102	2018-06-09	2018-06-09 20:37:08.244069+00	6	fc00:14::6/64		159	\N	3	3	1	\N	
108	2018-06-09	2018-06-09 20:37:28.611635+00	6	fc00:15::6/64		160	\N	3	3	1	\N	
165	2018-06-09	2018-06-09 20:38:10.179972+00	6	fc00:11::1/64		161	\N	1	1	1	41	
110	2018-06-09	2018-06-09 10:45:52.595965+00	4	192.168.11.1/24		136	\N	1	1	1	41	
111	2018-06-09	2018-06-09 10:46:35.0743+00	4	192.168.12.1/24		137	\N	2	2	1	41	
112	2018-06-09	2018-06-09 10:46:52.321546+00	4	192.168.13.1/24		138	\N	2	2	1	41	
113	2018-06-09	2018-06-09 10:47:12.440114+00	4	192.168.14.1/24		139	\N	3	3	1	41	
114	2018-06-09	2018-06-09 10:47:34.379552+00	4	192.168.15.1/24		140	\N	3	3	1	41	
155	2018-06-09	2018-06-09 20:32:16.585849+00	4	192.168.11.1/24		156	\N	1	1	1	41	
156	2018-06-09	2018-06-09 20:32:29.915115+00	6	fc00:11::1/64		156	\N	1	1	1	41	
157	2018-06-09	2018-06-09 20:32:44.76192+00	4	192.168.12.1/24		157	\N	2	2	1	41	
158	2018-06-09	2018-06-09 20:32:59.432429+00	6	fc00:12::1/64		157	\N	2	2	1	41	
159	2018-06-09	2018-06-09 20:33:10.620229+00	4	192.168.13.1/24		158	\N	2	2	1	41	
160	2018-06-09	2018-06-09 20:33:24.164546+00	6	fc00:13::1/64		158	\N	2	2	1	41	
161	2018-06-09	2018-06-09 20:33:39.459045+00	4	192.168.14.1/24		159	\N	3	3	1	41	
162	2018-06-09	2018-06-09 20:33:54.627912+00	6	fc00:14::1/64		159	\N	3	3	1	41	
163	2018-06-09	2018-06-09 20:34:07.400939+00	4	192.168.15.1/24		160	\N	3	3	1	41	
164	2018-06-09	2018-06-09 20:34:28.218622+00	6	fc00:15::1/64		160	\N	3	3	1	41	
84	2018-06-09	2018-06-09 20:36:17.526537+00	6	fc00:11::6/64		156	\N	1	1	1	\N	
166	2018-06-09	2018-06-09 20:38:21.848697+00	6	fc00:12::1/64		162	\N	2	2	1	41	
167	2018-06-09	2018-06-09 20:38:38.68772+00	6	fc00:13::1/64		163	\N	2	2	1	41	
168	2018-06-09	2018-06-09 20:38:51.17949+00	6	fc00:14::1/64		164	\N	3	3	1	41	
169	2018-06-09	2018-06-09 20:39:07.863229+00	6	fc00:15::1/64		165	\N	3	3	1	41	
85	2018-06-09	2018-06-09 20:39:38.399468+00	6	fc00:11::7/64		161	\N	1	1	1	\N	
97	2018-06-09	2018-06-09 20:40:06.835903+00	6	fc00:13::7/64		163	\N	2	2	1	\N	
103	2018-06-09	2018-06-09 20:40:20.317366+00	6	fc00:14::7/64		164	\N	3	3	1	\N	
109	2018-06-09	2018-06-09 20:40:31.752772+00	6	fc00:15::7/64		165	\N	3	3	1	\N	
67	2018-06-09	2018-06-09 20:41:21.421193+00	4	192.168.13.7/24		163	\N	2	2	1	\N	
121	2018-06-09	2018-06-09 20:43:40.279345+00	4	192.168.12.1/24		162	\N	2	2	1	41	
\.


--
-- Data for Name: ipam_prefix; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_prefix (id, created, last_updated, family, prefix, status, description, role_id, site_id, vlan_id, vrf_id, tenant_id, is_pool) FROM stdin;
\.


--
-- Data for Name: ipam_rir; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_rir (id, name, slug, is_private, created, last_updated) FROM stdin;
\.


--
-- Data for Name: ipam_role; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_role (id, name, slug, weight, created, last_updated) FROM stdin;
\.


--
-- Data for Name: ipam_service; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_service (id, created, last_updated, name, protocol, port, description, device_id, virtual_machine_id) FROM stdin;
\.


--
-- Data for Name: ipam_service_ipaddresses; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_service_ipaddresses (id, service_id, ipaddress_id) FROM stdin;
\.


--
-- Data for Name: ipam_vlan; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vlan (id, created, last_updated, vid, name, status, role_id, site_id, group_id, description, tenant_id) FROM stdin;
1	2018-06-03	2018-06-03 17:03:23.145948+00	1000	Vlan1000	1	\N	1	\N		\N
2	2018-06-03	2018-06-03 17:04:33.134388+00	1001	Vlan1001	1	\N	1	\N		\N
3	2018-06-09	2018-06-09 09:08:27.251969+00	1002	Vlan1002	1	\N	1	\N		\N
4	2018-06-09	2018-06-09 09:08:49.648987+00	1003	Vlan1003	1	\N	1	\N		\N
5	2018-06-09	2018-06-09 09:09:13.613934+00	1004	Vlan1004	1	\N	1	\N		\N
6	2018-06-09	2018-06-09 09:09:26.857202+00	1005	Vlan1005	1	\N	1	\N		\N
7	2018-06-09	2018-06-09 09:10:04.457964+00	2501	Vlan2501	1	\N	1	\N		\N
9	2018-06-09	2018-06-09 09:10:36.250134+00	2503	Vlan2503	1	\N	1	\N		\N
10	2018-06-09	2018-06-09 09:10:48.996452+00	2504	Vlan2504	1	\N	1	\N		\N
11	2018-06-09	2018-06-09 09:11:02.479483+00	2505	Vlan2505	1	\N	1	\N		\N
12	2018-06-09	2018-06-09 09:11:15.205472+00	2506	Vlan2506	1	\N	1	\N		\N
13	2018-06-09	2018-06-09 09:11:39.566879+00	2507	Vlan2507	1	\N	1	\N		\N
14	2018-06-09	2018-06-09 09:11:50.387545+00	2508	Vlan2508	1	\N	1	\N		\N
8	2018-06-09	2018-06-09 09:12:17.090306+00	2502	Vlan2502	1	\N	1	\N		\N
16	2018-06-09	2018-06-09 09:13:14.371242+00	2701	Vlan2701	1	\N	1	\N		\N
17	2018-06-09	2018-06-09 09:13:34.406514+00	2702	Vlan2702	1	\N	1	\N		\N
18	2018-06-09	2018-06-09 09:13:48.129519+00	2703	Vlan2703	1	\N	1	\N		\N
19	2018-06-09	2018-06-09 09:14:08.255639+00	2704	Vlan2704	1	\N	1	\N		\N
\.


--
-- Data for Name: ipam_vlangroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vlangroup (id, name, slug, site_id, created, last_updated) FROM stdin;
\.


--
-- Data for Name: ipam_vrf; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vrf (id, created, last_updated, name, rd, description, enforce_unique, tenant_id) FROM stdin;
1	2018-06-03	2018-06-08 21:42:26.159854+00	4001	0		f	\N
2	2018-06-03	2018-06-08 21:42:43.357052+00	4002	1		f	\N
3	2018-06-09	2018-06-09 20:45:51.961098+00	4003	2		f	\N
\.


--
-- Data for Name: secrets_secret; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.secrets_secret (id, created, last_updated, name, ciphertext, hash, device_id, role_id) FROM stdin;
\.


--
-- Data for Name: secrets_secretrole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.secrets_secretrole (id, name, slug, created, last_updated) FROM stdin;
\.


--
-- Data for Name: secrets_secretrole_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.secrets_secretrole_groups (id, secretrole_id, group_id) FROM stdin;
\.


--
-- Data for Name: secrets_secretrole_users; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.secrets_secretrole_users (id, secretrole_id, user_id) FROM stdin;
\.


--
-- Data for Name: secrets_sessionkey; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.secrets_sessionkey (id, cipher, hash, created, userkey_id) FROM stdin;
\.


--
-- Data for Name: secrets_userkey; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.secrets_userkey (id, created, last_updated, public_key, master_key_cipher, user_id) FROM stdin;
\.


--
-- Data for Name: taggit_tag; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.taggit_tag (id, name, slug) FROM stdin;
\.


--
-- Data for Name: taggit_taggeditem; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.taggit_taggeditem (id, object_id, content_type_id, tag_id) FROM stdin;
\.


--
-- Data for Name: tenancy_tenant; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_tenant (id, created, last_updated, name, slug, description, comments, group_id) FROM stdin;
1	2018-06-03	2018-06-03 17:42:29.468252+00	Tenant1	tenant1			\N
2	2018-06-03	2018-06-03 17:42:41.348098+00	Tenant2	tenant2			\N
3	2018-06-09	2018-06-09 09:58:35.020239+00	Tenant3	tenant3			\N
\.


--
-- Data for Name: tenancy_tenantgroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_tenantgroup (id, name, slug, created, last_updated) FROM stdin;
\.


--
-- Data for Name: users_token; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_token (id, created, expires, key, write_enabled, description, user_id) FROM stdin;
1	2018-06-03 16:17:44.850794+00	\N	0123456789abcdef0123456789abcdefcumulus	t		1
\.


--
-- Data for Name: virtualization_cluster; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_cluster (id, created, last_updated, name, comments, group_id, type_id, site_id) FROM stdin;
\.


--
-- Data for Name: virtualization_clustergroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_clustergroup (id, name, slug, created, last_updated) FROM stdin;
\.


--
-- Data for Name: virtualization_clustertype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_clustertype (id, name, slug, created, last_updated) FROM stdin;
\.


--
-- Data for Name: virtualization_virtualmachine; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_virtualmachine (id, created, last_updated, name, vcpus, memory, disk, comments, cluster_id, platform_id, primary_ip4_id, primary_ip6_id, tenant_id, status, role_id, local_context_data) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 326, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_circuit_id_seq', 1, true);


--
-- Name: circuits_circuittermination_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_circuittermination_id_seq', 1, true);


--
-- Name: circuits_circuittype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_circuittype_id_seq', 1, true);


--
-- Name: circuits_provider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_provider_id_seq', 1, true);


--
-- Name: dcim_cable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_cable_id_seq', 1, false);


--
-- Name: dcim_consoleport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleport_id_seq', 1, false);


--
-- Name: dcim_consoleporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleporttemplate_id_seq', 1, false);


--
-- Name: dcim_consoleserverport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleserverport_id_seq', 1, false);


--
-- Name: dcim_consoleserverporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleserverporttemplate_id_seq', 1, false);


--
-- Name: dcim_device_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_device_id_seq', 16, true);


--
-- Name: dcim_devicebay_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicebay_id_seq', 1, false);


--
-- Name: dcim_devicebaytemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicebaytemplate_id_seq', 1, false);


--
-- Name: dcim_devicerole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicerole_id_seq', 2, true);


--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicetype_id_seq', 1, true);


--
-- Name: dcim_frontport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_frontport_id_seq', 1, false);


--
-- Name: dcim_frontporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_frontporttemplate_id_seq', 1, false);


--
-- Name: dcim_interface_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interface_id_seq', 169, true);


--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interface_tagged_vlans_id_seq', 100, true);


--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interfacetemplate_id_seq', 1, false);


--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_manufacturer_id_seq', 1, true);


--
-- Name: dcim_module_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_module_id_seq', 1, false);


--
-- Name: dcim_platform_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_platform_id_seq', 1, true);


--
-- Name: dcim_powerfeed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerfeed_id_seq', 1, false);


--
-- Name: dcim_poweroutlet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_poweroutlet_id_seq', 1, false);


--
-- Name: dcim_poweroutlettemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_poweroutlettemplate_id_seq', 1, false);


--
-- Name: dcim_powerpanel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerpanel_id_seq', 1, false);


--
-- Name: dcim_powerport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerport_id_seq', 1, false);


--
-- Name: dcim_powerporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerporttemplate_id_seq', 1, false);


--
-- Name: dcim_rack_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rack_id_seq', 7, true);


--
-- Name: dcim_rackgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rackgroup_id_seq', 3, true);


--
-- Name: dcim_rackreservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rackreservation_id_seq', 1, false);


--
-- Name: dcim_rackrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rackrole_id_seq', 1, false);


--
-- Name: dcim_rearport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rearport_id_seq', 1, false);


--
-- Name: dcim_rearporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rearporttemplate_id_seq', 1, false);


--
-- Name: dcim_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_region_id_seq', 1, false);


--
-- Name: dcim_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_site_id_seq', 1, true);


--
-- Name: dcim_virtualchassis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_virtualchassis_id_seq', 1, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 7, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 81, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 199, true);


--
-- Name: extras_configcontext_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_id_seq', 1, false);


--
-- Name: extras_configcontext_platforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_platforms_id_seq', 1, false);


--
-- Name: extras_configcontext_regions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_regions_id_seq', 1, false);


--
-- Name: extras_configcontext_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_roles_id_seq', 1, false);


--
-- Name: extras_configcontext_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_sites_id_seq', 1, false);


--
-- Name: extras_configcontext_tenant_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_tenant_groups_id_seq', 1, false);


--
-- Name: extras_configcontext_tenants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_configcontext_tenants_id_seq', 1, false);


--
-- Name: extras_customfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customfield_id_seq', 4, true);


--
-- Name: extras_customfield_obj_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customfield_obj_type_id_seq', 4, true);


--
-- Name: extras_customfieldchoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customfieldchoice_id_seq', 1, false);


--
-- Name: extras_customfieldvalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customfieldvalue_id_seq', 28, true);


--
-- Name: extras_customlink_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customlink_id_seq', 1, false);


--
-- Name: extras_exporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_exporttemplate_id_seq', 1, false);


--
-- Name: extras_graph_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_graph_id_seq', 1, false);


--
-- Name: extras_imageattachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_imageattachment_id_seq', 1, false);


--
-- Name: extras_objectchange_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_objectchange_id_seq', 1, false);


--
-- Name: extras_reportresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_reportresult_id_seq', 1, false);


--
-- Name: extras_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_tag_id_seq', 1, false);


--
-- Name: extras_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_taggeditem_id_seq', 1, false);


--
-- Name: extras_topologymap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_topologymap_id_seq', 1, false);


--
-- Name: extras_webhook_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_webhook_id_seq', 1, false);


--
-- Name: extras_webhook_obj_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_webhook_obj_type_id_seq', 1, false);


--
-- Name: ipam_aggregate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_aggregate_id_seq', 1, false);


--
-- Name: ipam_ipaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_ipaddress_id_seq', 169, true);


--
-- Name: ipam_prefix_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_prefix_id_seq', 2, true);


--
-- Name: ipam_rir_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_rir_id_seq', 1, false);


--
-- Name: ipam_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_role_id_seq', 1, false);


--
-- Name: ipam_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_service_id_seq', 1, false);


--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_service_ipaddresses_id_seq', 1, false);


--
-- Name: ipam_vlan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vlan_id_seq', 19, true);


--
-- Name: ipam_vlangroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vlangroup_id_seq', 1, false);


--
-- Name: ipam_vrf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vrf_id_seq', 3, true);


--
-- Name: secrets_secret_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.secrets_secret_id_seq', 1, false);


--
-- Name: secrets_secretrole_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.secrets_secretrole_groups_id_seq', 1, false);


--
-- Name: secrets_secretrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.secrets_secretrole_id_seq', 1, false);


--
-- Name: secrets_secretrole_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.secrets_secretrole_users_id_seq', 1, false);


--
-- Name: secrets_sessionkey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.secrets_sessionkey_id_seq', 1, false);


--
-- Name: secrets_userkey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.secrets_userkey_id_seq', 1, false);


--
-- Name: taggit_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.taggit_tag_id_seq', 1, false);


--
-- Name: taggit_taggeditem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.taggit_taggeditem_id_seq', 1, false);


--
-- Name: tenancy_tenant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_tenant_id_seq', 3, true);


--
-- Name: tenancy_tenantgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_tenantgroup_id_seq', 1, false);


--
-- Name: users_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_token_id_seq', 1, true);


--
-- Name: virtualization_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_cluster_id_seq', 1, false);


--
-- Name: virtualization_clustergroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_clustergroup_id_seq', 1, false);


--
-- Name: virtualization_clustertype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_clustertype_id_seq', 1, false);


--
-- Name: virtualization_virtualmachine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_virtualmachine_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: circuits_circuit circuits_circuit_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuit circuits_circuit_provider_id_cid_b6f29862_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_provider_id_cid_b6f29862_uniq UNIQUE (provider_id, cid);


--
-- Name: circuits_circuittermination circuits_circuittermination_circuit_id_term_side_b13efd0e_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_circuit_id_term_side_b13efd0e_uniq UNIQUE (circuit_id, term_side);


--
-- Name: circuits_circuittermination circuits_circuittermination_connected_endpoint_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_connected_endpoint_id_key UNIQUE (connected_endpoint_id);


--
-- Name: circuits_circuittermination circuits_circuittermination_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuittype circuits_circuittype_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_name_key UNIQUE (name);


--
-- Name: circuits_circuittype circuits_circuittype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuittype circuits_circuittype_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_slug_key UNIQUE (slug);


--
-- Name: circuits_provider circuits_provider_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_name_key UNIQUE (name);


--
-- Name: circuits_provider circuits_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_pkey PRIMARY KEY (id);


--
-- Name: circuits_provider circuits_provider_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_slug_key UNIQUE (slug);


--
-- Name: dcim_cable dcim_cable_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_pkey PRIMARY KEY (id);


--
-- Name: dcim_cable dcim_cable_termination_a_type_id_termination_a_id_e9d24bad_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_a_type_id_termination_a_id_e9d24bad_uniq UNIQUE (termination_a_type_id, termination_a_id);


--
-- Name: dcim_cable dcim_cable_termination_b_type_id_termination_b_id_057fc21f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_b_type_id_termination_b_id_057fc21f_uniq UNIQUE (termination_b_type_id, termination_b_id);


--
-- Name: dcim_consoleport dcim_consoleport_cs_port_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_cs_port_id_key UNIQUE (connected_endpoint_id);


--
-- Name: dcim_consoleport dcim_consoleport_device_id_name_293786b6_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_device_id_name_293786b6_uniq UNIQUE (device_id, name);


--
-- Name: dcim_consoleport dcim_consoleport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemplate_device_type_id_name_8208f9ca_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemplate_device_type_id_name_8208f9ca_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleserverport dcim_consoleserverport_device_id_name_fb1c5999_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_device_id_name_fb1c5999_uniq UNIQUE (device_id, name);


--
-- Name: dcim_consoleserverport dcim_consoleserverport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverportte_device_type_id_name_a05c974d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverportte_device_type_id_name_a05c974d_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_device dcim_device_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_device dcim_device_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_name_key UNIQUE (name);


--
-- Name: dcim_device dcim_device_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_pkey PRIMARY KEY (id);


--
-- Name: dcim_device dcim_device_primary_ip4_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip4_id_key UNIQUE (primary_ip4_id);


--
-- Name: dcim_device dcim_device_primary_ip6_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip6_id_key UNIQUE (primary_ip6_id);


--
-- Name: dcim_device dcim_device_rack_id_position_face_43208a79_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_rack_id_position_face_43208a79_uniq UNIQUE (rack_id, "position", face);


--
-- Name: dcim_device dcim_device_virtual_chassis_id_vc_position_efea7133_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_virtual_chassis_id_vc_position_efea7133_uniq UNIQUE (virtual_chassis_id, vc_position);


--
-- Name: dcim_devicebay dcim_devicebay_device_id_name_2475a67b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_device_id_name_2475a67b_uniq UNIQUE (device_id, name);


--
-- Name: dcim_devicebay dcim_devicebay_installed_device_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_installed_device_id_key UNIQUE (installed_device_id);


--
-- Name: dcim_devicebay dcim_devicebay_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicebaytemplate dcim_devicebaytemplate_device_type_id_name_8f4899fe_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytemplate_device_type_id_name_8f4899fe_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_devicebaytemplate dcim_devicebaytemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicerole dcim_devicerole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_name_key UNIQUE (name);


--
-- Name: dcim_devicerole dcim_devicerole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicerole dcim_devicerole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_slug_key UNIQUE (slug);


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_model_17948c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_model_17948c0c_uniq UNIQUE (manufacturer_id, model);


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_slug_a0b931cb_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_slug_a0b931cb_uniq UNIQUE (manufacturer_id, slug);


--
-- Name: dcim_devicetype dcim_devicetype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontport dcim_frontport_device_id_name_235b7af2_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_device_id_name_235b7af2_uniq UNIQUE (device_id, name);


--
-- Name: dcim_frontport dcim_frontport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontport dcim_frontport_rear_port_id_rear_port_position_8b0bf7ca_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_rear_port_id_rear_port_position_8b0bf7ca_uniq UNIQUE (rear_port_id, rear_port_position);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_device_type_id_name_0a0a0e05_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_device_type_id_name_0a0a0e05_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_frontporttemplate dcim_frontporttemplate_rear_port_id_rear_port_p_401fe927_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttemplate_rear_port_id_rear_port_p_401fe927_uniq UNIQUE (rear_port_id, rear_port_position);


--
-- Name: dcim_interface dcim_interface__connected_circuittermination_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface__connected_circuittermination_id_key UNIQUE (_connected_circuittermination_id);


--
-- Name: dcim_interface dcim_interface__connected_interface_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface__connected_interface_id_key UNIQUE (_connected_interface_id);


--
-- Name: dcim_interface dcim_interface_device_id_name_bffc4ec4_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_device_id_name_bffc4ec4_uniq UNIQUE (device_id, name);


--
-- Name: dcim_interface dcim_interface_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_pkey PRIMARY KEY (id);


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_interface_id_vlan_id_0d55c576_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_interface_id_vlan_id_0d55c576_uniq UNIQUE (interface_id, vlan_id);


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_pkey PRIMARY KEY (id);


--
-- Name: dcim_interfacetemplate dcim_interfacetemplate_device_type_id_name_3a847237_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetemplate_device_type_id_name_3a847237_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_interfacetemplate dcim_interfacetemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_inventoryitem dcim_inventoryitem_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_manufacturer dcim_manufacturer_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_name_key UNIQUE (name);


--
-- Name: dcim_manufacturer dcim_manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_pkey PRIMARY KEY (id);


--
-- Name: dcim_manufacturer dcim_manufacturer_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_slug_key UNIQUE (slug);


--
-- Name: dcim_inventoryitem dcim_module_device_id_parent_id_name_4d8292af_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_module_device_id_parent_id_name_4d8292af_uniq UNIQUE (device_id, parent_id, name);


--
-- Name: dcim_inventoryitem dcim_module_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_module_pkey PRIMARY KEY (id);


--
-- Name: dcim_platform dcim_platform_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_name_key UNIQUE (name);


--
-- Name: dcim_platform dcim_platform_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_pkey PRIMARY KEY (id);


--
-- Name: dcim_platform dcim_platform_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_slug_key UNIQUE (slug);


--
-- Name: dcim_powerfeed dcim_powerfeed_connected_endpoint_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_connected_endpoint_id_key UNIQUE (connected_endpoint_id);


--
-- Name: dcim_powerfeed dcim_powerfeed_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerfeed dcim_powerfeed_power_panel_id_name_0fbaae9f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_power_panel_id_name_0fbaae9f_uniq UNIQUE (power_panel_id, name);


--
-- Name: dcim_poweroutlet dcim_poweroutlet_device_id_name_981b00c1_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_device_id_name_981b00c1_uniq UNIQUE (device_id, name);


--
-- Name: dcim_poweroutlet dcim_poweroutlet_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_pkey PRIMARY KEY (id);


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemplate_device_type_id_name_eafbb07d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemplate_device_type_id_name_eafbb07d_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerpanel dcim_powerpanel_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerpanel dcim_powerpanel_site_id_name_804df4c0_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_site_id_name_804df4c0_uniq UNIQUE (site_id, name);


--
-- Name: dcim_powerport dcim_powerport__connected_powerfeed_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport__connected_powerfeed_id_key UNIQUE (_connected_powerfeed_id);


--
-- Name: dcim_powerport dcim_powerport_device_id_name_948af82c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_device_id_name_948af82c_uniq UNIQUE (device_id, name);


--
-- Name: dcim_powerport dcim_powerport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerport dcim_powerport_power_outlet_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_power_outlet_id_key UNIQUE (_connected_poweroutlet_id);


--
-- Name: dcim_powerporttemplate dcim_powerporttemplate_device_type_id_name_b4e9689f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttemplate_device_type_id_name_b4e9689f_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_powerporttemplate dcim_powerporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_rack dcim_rack_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_rack dcim_rack_group_id_facility_id_f16a53ae_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_group_id_facility_id_f16a53ae_uniq UNIQUE (group_id, facility_id);


--
-- Name: dcim_rack dcim_rack_group_id_name_846f3826_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_group_id_name_846f3826_uniq UNIQUE (group_id, name);


--
-- Name: dcim_rack dcim_rack_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackgroup dcim_rackgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackgroup dcim_rackgroup_site_id_name_c9bd921f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_site_id_name_c9bd921f_uniq UNIQUE (site_id, name);


--
-- Name: dcim_rackgroup dcim_rackgroup_site_id_slug_7fbfd118_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_site_id_slug_7fbfd118_uniq UNIQUE (site_id, slug);


--
-- Name: dcim_rackreservation dcim_rackreservation_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackrole dcim_rackrole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_name_key UNIQUE (name);


--
-- Name: dcim_rackrole dcim_rackrole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackrole dcim_rackrole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_slug_key UNIQUE (slug);


--
-- Name: dcim_rearport dcim_rearport_device_id_name_4b14dde6_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_device_id_name_4b14dde6_uniq UNIQUE (device_id, name);


--
-- Name: dcim_rearport dcim_rearport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_pkey PRIMARY KEY (id);


--
-- Name: dcim_rearporttemplate dcim_rearporttemplate_device_type_id_name_9bdddb29_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplate_device_type_id_name_9bdddb29_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_rearporttemplate dcim_rearporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_region dcim_region_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_name_key UNIQUE (name);


--
-- Name: dcim_region dcim_region_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_pkey PRIMARY KEY (id);


--
-- Name: dcim_region dcim_region_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_slug_key UNIQUE (slug);


--
-- Name: dcim_site dcim_site_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_name_key UNIQUE (name);


--
-- Name: dcim_site dcim_site_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_pkey PRIMARY KEY (id);


--
-- Name: dcim_site dcim_site_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_slug_key UNIQUE (slug);


--
-- Name: dcim_virtualchassis dcim_virtualchassis_master_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_master_id_key UNIQUE (master_id);


--
-- Name: dcim_virtualchassis dcim_virtualchassis_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: extras_configcontext extras_configcontext_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext
    ADD CONSTRAINT extras_configcontext_name_key UNIQUE (name);


--
-- Name: extras_configcontext extras_configcontext_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext
    ADD CONSTRAINT extras_configcontext_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_platforms extras_configcontext_pla_configcontext_id_platfor_3c67c104_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_pla_configcontext_id_platfor_3c67c104_uniq UNIQUE (configcontext_id, platform_id);


--
-- Name: extras_configcontext_platforms extras_configcontext_platforms_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_platforms_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_regions extras_configcontext_reg_configcontext_id_region__d4a1d77f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_reg_configcontext_id_region__d4a1d77f_uniq UNIQUE (configcontext_id, region_id);


--
-- Name: extras_configcontext_regions extras_configcontext_regions_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_regions_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_roles extras_configcontext_rol_configcontext_id_devicer_4d8dbb50_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_rol_configcontext_id_devicer_4d8dbb50_uniq UNIQUE (configcontext_id, devicerole_id);


--
-- Name: extras_configcontext_roles extras_configcontext_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_roles_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_sites extras_configcontext_sit_configcontext_id_site_id_a4fe5f4f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sit_configcontext_id_site_id_a4fe5f4f_uniq UNIQUE (configcontext_id, site_id);


--
-- Name: extras_configcontext_sites extras_configcontext_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sites_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tenants extras_configcontext_ten_configcontext_id_tenant__aefb257d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_ten_configcontext_id_tenant__aefb257d_uniq UNIQUE (configcontext_id, tenant_id);


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_ten_configcontext_id_tenantg_d6afc6f5_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_ten_configcontext_id_tenantg_d6afc6f5_uniq UNIQUE (configcontext_id, tenantgroup_id);


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_tenant_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_tenant_groups_pkey PRIMARY KEY (id);


--
-- Name: extras_configcontext_tenants extras_configcontext_tenants_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_tenants_pkey PRIMARY KEY (id);


--
-- Name: extras_customfield extras_customfield_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_name_key UNIQUE (name);


--
-- Name: extras_customfield_obj_type extras_customfield_obj_t_customfield_id_contentty_77878958_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_obj_type
    ADD CONSTRAINT extras_customfield_obj_t_customfield_id_contentty_77878958_uniq UNIQUE (customfield_id, contenttype_id);


--
-- Name: extras_customfield_obj_type extras_customfield_obj_type_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_obj_type
    ADD CONSTRAINT extras_customfield_obj_type_pkey PRIMARY KEY (id);


--
-- Name: extras_customfield extras_customfield_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_pkey PRIMARY KEY (id);


--
-- Name: extras_customfieldchoice extras_customfieldchoice_field_id_value_f959a108_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfieldchoice
    ADD CONSTRAINT extras_customfieldchoice_field_id_value_f959a108_uniq UNIQUE (field_id, value);


--
-- Name: extras_customfieldchoice extras_customfieldchoice_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfieldchoice
    ADD CONSTRAINT extras_customfieldchoice_pkey PRIMARY KEY (id);


--
-- Name: extras_customfieldvalue extras_customfieldvalue_field_id_obj_type_id_obj_876f6d9c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfieldvalue
    ADD CONSTRAINT extras_customfieldvalue_field_id_obj_type_id_obj_876f6d9c_uniq UNIQUE (field_id, obj_type_id, obj_id);


--
-- Name: extras_customfieldvalue extras_customfieldvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfieldvalue
    ADD CONSTRAINT extras_customfieldvalue_pkey PRIMARY KEY (id);


--
-- Name: extras_customlink extras_customlink_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_name_key UNIQUE (name);


--
-- Name: extras_customlink extras_customlink_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_pkey PRIMARY KEY (id);


--
-- Name: extras_exporttemplate extras_exporttemplate_content_type_id_name_edca9b9b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplate_content_type_id_name_edca9b9b_uniq UNIQUE (content_type_id, name);


--
-- Name: extras_exporttemplate extras_exporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplate_pkey PRIMARY KEY (id);


--
-- Name: extras_graph extras_graph_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_graph
    ADD CONSTRAINT extras_graph_pkey PRIMARY KEY (id);


--
-- Name: extras_imageattachment extras_imageattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_imageattachment
    ADD CONSTRAINT extras_imageattachment_pkey PRIMARY KEY (id);


--
-- Name: extras_objectchange extras_objectchange_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_pkey PRIMARY KEY (id);


--
-- Name: extras_reportresult extras_reportresult_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_reportresult
    ADD CONSTRAINT extras_reportresult_pkey PRIMARY KEY (id);


--
-- Name: extras_reportresult extras_reportresult_report_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_reportresult
    ADD CONSTRAINT extras_reportresult_report_key UNIQUE (report);


--
-- Name: extras_tag extras_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_name_key UNIQUE (name);


--
-- Name: extras_tag extras_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_pkey PRIMARY KEY (id);


--
-- Name: extras_tag extras_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_tag
    ADD CONSTRAINT extras_tag_slug_key UNIQUE (slug);


--
-- Name: extras_taggeditem extras_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: extras_topologymap extras_topologymap_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_topologymap
    ADD CONSTRAINT extras_topologymap_name_key UNIQUE (name);


--
-- Name: extras_topologymap extras_topologymap_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_topologymap
    ADD CONSTRAINT extras_topologymap_pkey PRIMARY KEY (id);


--
-- Name: extras_topologymap extras_topologymap_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_topologymap
    ADD CONSTRAINT extras_topologymap_slug_key UNIQUE (slug);


--
-- Name: extras_webhook extras_webhook_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_name_key UNIQUE (name);


--
-- Name: extras_webhook_obj_type extras_webhook_obj_type_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_obj_type
    ADD CONSTRAINT extras_webhook_obj_type_pkey PRIMARY KEY (id);


--
-- Name: extras_webhook_obj_type extras_webhook_obj_type_webhook_id_contenttype_id_99b8b9c3_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_obj_type
    ADD CONSTRAINT extras_webhook_obj_type_webhook_id_contenttype_id_99b8b9c3_uniq UNIQUE (webhook_id, contenttype_id);


--
-- Name: extras_webhook extras_webhook_payload_url_type_create__dd332134_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_payload_url_type_create__dd332134_uniq UNIQUE (payload_url, type_create, type_update, type_delete);


--
-- Name: extras_webhook extras_webhook_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook
    ADD CONSTRAINT extras_webhook_pkey PRIMARY KEY (id);


--
-- Name: ipam_aggregate ipam_aggregate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_pkey PRIMARY KEY (id);


--
-- Name: ipam_ipaddress ipam_ipaddress_nat_inside_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_nat_inside_id_key UNIQUE (nat_inside_id);


--
-- Name: ipam_ipaddress ipam_ipaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_pkey PRIMARY KEY (id);


--
-- Name: ipam_prefix ipam_prefix_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_pkey PRIMARY KEY (id);


--
-- Name: ipam_rir ipam_rir_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_name_key UNIQUE (name);


--
-- Name: ipam_rir ipam_rir_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_pkey PRIMARY KEY (id);


--
-- Name: ipam_rir ipam_rir_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_slug_key UNIQUE (slug);


--
-- Name: ipam_role ipam_role_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_name_key UNIQUE (name);


--
-- Name: ipam_role ipam_role_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_pkey PRIMARY KEY (id);


--
-- Name: ipam_role ipam_role_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_slug_key UNIQUE (slug);


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_pkey PRIMARY KEY (id);


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_service_id_ipaddress_id_d019a805_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_service_id_ipaddress_id_d019a805_uniq UNIQUE (service_id, ipaddress_id);


--
-- Name: ipam_service ipam_service_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlan ipam_vlan_group_id_name_e53919df_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_name_e53919df_uniq UNIQUE (group_id, name);


--
-- Name: ipam_vlan ipam_vlan_group_id_vid_5ca4cc47_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_vid_5ca4cc47_uniq UNIQUE (group_id, vid);


--
-- Name: ipam_vlan ipam_vlan_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlangroup ipam_vlangroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlangroup ipam_vlangroup_site_id_name_a38e981b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_site_id_name_a38e981b_uniq UNIQUE (site_id, name);


--
-- Name: ipam_vlangroup ipam_vlangroup_site_id_slug_6372a304_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_site_id_slug_6372a304_uniq UNIQUE (site_id, slug);


--
-- Name: ipam_vrf ipam_vrf_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf ipam_vrf_rd_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_rd_key UNIQUE (rd);


--
-- Name: secrets_secret secrets_secret_device_id_role_id_name_f8acc218_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secret
    ADD CONSTRAINT secrets_secret_device_id_role_id_name_f8acc218_uniq UNIQUE (device_id, role_id, name);


--
-- Name: secrets_secret secrets_secret_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secret
    ADD CONSTRAINT secrets_secret_pkey PRIMARY KEY (id);


--
-- Name: secrets_secretrole_groups secrets_secretrole_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole_groups
    ADD CONSTRAINT secrets_secretrole_groups_pkey PRIMARY KEY (id);


--
-- Name: secrets_secretrole_groups secrets_secretrole_groups_secretrole_id_group_id_1c7f7ee5_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole_groups
    ADD CONSTRAINT secrets_secretrole_groups_secretrole_id_group_id_1c7f7ee5_uniq UNIQUE (secretrole_id, group_id);


--
-- Name: secrets_secretrole secrets_secretrole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole
    ADD CONSTRAINT secrets_secretrole_name_key UNIQUE (name);


--
-- Name: secrets_secretrole secrets_secretrole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole
    ADD CONSTRAINT secrets_secretrole_pkey PRIMARY KEY (id);


--
-- Name: secrets_secretrole secrets_secretrole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole
    ADD CONSTRAINT secrets_secretrole_slug_key UNIQUE (slug);


--
-- Name: secrets_secretrole_users secrets_secretrole_users_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole_users
    ADD CONSTRAINT secrets_secretrole_users_pkey PRIMARY KEY (id);


--
-- Name: secrets_secretrole_users secrets_secretrole_users_secretrole_id_user_id_41832d38_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole_users
    ADD CONSTRAINT secrets_secretrole_users_secretrole_id_user_id_41832d38_uniq UNIQUE (secretrole_id, user_id);


--
-- Name: secrets_sessionkey secrets_sessionkey_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_sessionkey
    ADD CONSTRAINT secrets_sessionkey_pkey PRIMARY KEY (id);


--
-- Name: secrets_sessionkey secrets_sessionkey_userkey_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_sessionkey
    ADD CONSTRAINT secrets_sessionkey_userkey_id_key UNIQUE (userkey_id);


--
-- Name: secrets_userkey secrets_userkey_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_userkey
    ADD CONSTRAINT secrets_userkey_pkey PRIMARY KEY (id);


--
-- Name: secrets_userkey secrets_userkey_user_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_userkey
    ADD CONSTRAINT secrets_userkey_user_id_key UNIQUE (user_id);


--
-- Name: taggit_tag taggit_tag_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_name_key UNIQUE (name);


--
-- Name: taggit_tag taggit_tag_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_pkey PRIMARY KEY (id);


--
-- Name: taggit_tag taggit_tag_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_tag
    ADD CONSTRAINT taggit_tag_slug_key UNIQUE (slug);


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_object_i_4bb97a8e_uniq UNIQUE (content_type_id, object_id, tag_id);


--
-- Name: taggit_taggeditem taggit_taggeditem_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenant tenancy_tenant_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_name_key UNIQUE (name);


--
-- Name: tenancy_tenant tenancy_tenant_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenant tenancy_tenant_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_slug_key UNIQUE (slug);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_name_key UNIQUE (name);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_slug_key UNIQUE (slug);


--
-- Name: users_token users_token_key_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_key_key UNIQUE (key);


--
-- Name: users_token users_token_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_pkey PRIMARY KEY (id);


--
-- Name: virtualization_cluster virtualization_cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_name_key UNIQUE (name);


--
-- Name: virtualization_cluster virtualization_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_name_key UNIQUE (name);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_slug_key UNIQUE (slug);


--
-- Name: virtualization_clustertype virtualization_clustertype_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_name_key UNIQUE (name);


--
-- Name: virtualization_clustertype virtualization_clustertype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustertype virtualization_clustertype_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_slug_key UNIQUE (slug);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_name_key UNIQUE (name);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_pkey PRIMARY KEY (id);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_primary_ip4_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_primary_ip4_id_key UNIQUE (primary_ip4_id);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_primary_ip6_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_primary_ip6_id_key UNIQUE (primary_ip6_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: circuits_circuit_provider_id_d9195418; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_provider_id_d9195418 ON public.circuits_circuit USING btree (provider_id);


--
-- Name: circuits_circuit_tenant_id_812508a5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_tenant_id_812508a5 ON public.circuits_circuit USING btree (tenant_id);


--
-- Name: circuits_circuit_type_id_1b9f485a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_type_id_1b9f485a ON public.circuits_circuit USING btree (type_id);


--
-- Name: circuits_circuittermination_cable_id_35e9f703; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_cable_id_35e9f703 ON public.circuits_circuittermination USING btree (cable_id);


--
-- Name: circuits_circuittermination_circuit_id_257e87e7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_circuit_id_257e87e7 ON public.circuits_circuittermination USING btree (circuit_id);


--
-- Name: circuits_circuittermination_site_id_e6fe5652; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_site_id_e6fe5652 ON public.circuits_circuittermination USING btree (site_id);


--
-- Name: circuits_circuittype_name_8256ea9a_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittype_name_8256ea9a_like ON public.circuits_circuittype USING btree (name varchar_pattern_ops);


--
-- Name: circuits_circuittype_slug_9b4b3cf9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittype_slug_9b4b3cf9_like ON public.circuits_circuittype USING btree (slug varchar_pattern_ops);


--
-- Name: circuits_provider_name_8f2514f5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_provider_name_8f2514f5_like ON public.circuits_provider USING btree (name varchar_pattern_ops);


--
-- Name: circuits_provider_slug_c3c0aa10_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_provider_slug_c3c0aa10_like ON public.circuits_provider USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_cable__termination_a_device_id_e59cde1c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable__termination_a_device_id_e59cde1c ON public.dcim_cable USING btree (_termination_a_device_id);


--
-- Name: dcim_cable__termination_b_device_id_a9073762; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable__termination_b_device_id_a9073762 ON public.dcim_cable USING btree (_termination_b_device_id);


--
-- Name: dcim_cable_termination_a_type_id_a614bab8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable_termination_a_type_id_a614bab8 ON public.dcim_cable USING btree (termination_a_type_id);


--
-- Name: dcim_cable_termination_b_type_id_a91595d0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_cable_termination_b_type_id_a91595d0 ON public.dcim_cable USING btree (termination_b_type_id);


--
-- Name: dcim_consoleport_cable_id_a9ae5465; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport_cable_id_a9ae5465 ON public.dcim_consoleport USING btree (cable_id);


--
-- Name: dcim_consoleport_device_id_f2d90d3c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport_device_id_f2d90d3c ON public.dcim_consoleport USING btree (device_id);


--
-- Name: dcim_consoleporttemplate_device_type_id_075d4015; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleporttemplate_device_type_id_075d4015 ON public.dcim_consoleporttemplate USING btree (device_type_id);


--
-- Name: dcim_consoleserverport_cable_id_f2940dfd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport_cable_id_f2940dfd ON public.dcim_consoleserverport USING btree (cable_id);


--
-- Name: dcim_consoleserverport_device_id_d9866581; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport_device_id_d9866581 ON public.dcim_consoleserverport USING btree (device_id);


--
-- Name: dcim_consoleserverporttemplate_device_type_id_579bdc86; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverporttemplate_device_type_id_579bdc86 ON public.dcim_consoleserverporttemplate USING btree (device_type_id);


--
-- Name: dcim_device_asset_tag_8dac1079_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_asset_tag_8dac1079_like ON public.dcim_device USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_device_cluster_id_cf852f78; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_cluster_id_cf852f78 ON public.dcim_device USING btree (cluster_id);


--
-- Name: dcim_device_device_role_id_682e8188; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_device_role_id_682e8188 ON public.dcim_device USING btree (device_role_id);


--
-- Name: dcim_device_device_type_id_d61b4086; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_device_type_id_d61b4086 ON public.dcim_device USING btree (device_type_id);


--
-- Name: dcim_device_name_cfa61dd8_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_name_cfa61dd8_like ON public.dcim_device USING btree (name varchar_pattern_ops);


--
-- Name: dcim_device_platform_id_468138f1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_platform_id_468138f1 ON public.dcim_device USING btree (platform_id);


--
-- Name: dcim_device_rack_id_23bde71f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_rack_id_23bde71f ON public.dcim_device USING btree (rack_id);


--
-- Name: dcim_device_site_id_ff897cf6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_site_id_ff897cf6 ON public.dcim_device USING btree (site_id);


--
-- Name: dcim_device_tenant_id_dcea7969; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_tenant_id_dcea7969 ON public.dcim_device USING btree (tenant_id);


--
-- Name: dcim_device_virtual_chassis_id_aed51693; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_virtual_chassis_id_aed51693 ON public.dcim_device USING btree (virtual_chassis_id);


--
-- Name: dcim_devicebay_device_id_0c8a1218; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicebay_device_id_0c8a1218 ON public.dcim_devicebay USING btree (device_id);


--
-- Name: dcim_devicebaytemplate_device_type_id_f4b24a29; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicebaytemplate_device_type_id_f4b24a29 ON public.dcim_devicebaytemplate USING btree (device_type_id);


--
-- Name: dcim_devicerole_name_1c813306_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicerole_name_1c813306_like ON public.dcim_devicerole USING btree (name varchar_pattern_ops);


--
-- Name: dcim_devicerole_slug_7952643b_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicerole_slug_7952643b_like ON public.dcim_devicerole USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_devicetype_manufacturer_id_a3e8029e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicetype_manufacturer_id_a3e8029e ON public.dcim_devicetype USING btree (manufacturer_id);


--
-- Name: dcim_devicetype_slug_448745bd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicetype_slug_448745bd ON public.dcim_devicetype USING btree (slug);


--
-- Name: dcim_devicetype_slug_448745bd_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicetype_slug_448745bd_like ON public.dcim_devicetype USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_frontport_cable_id_04ff8aab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport_cable_id_04ff8aab ON public.dcim_frontport USING btree (cable_id);


--
-- Name: dcim_frontport_device_id_950557b5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport_device_id_950557b5 ON public.dcim_frontport USING btree (device_id);


--
-- Name: dcim_frontport_rear_port_id_78df2532; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontport_rear_port_id_78df2532 ON public.dcim_frontport USING btree (rear_port_id);


--
-- Name: dcim_frontporttemplate_device_type_id_f088b952; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontporttemplate_device_type_id_f088b952 ON public.dcim_frontporttemplate USING btree (device_type_id);


--
-- Name: dcim_frontporttemplate_rear_port_id_9775411b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_frontporttemplate_rear_port_id_9775411b ON public.dcim_frontporttemplate USING btree (rear_port_id);


--
-- Name: dcim_interface_cable_id_1b264edb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_cable_id_1b264edb ON public.dcim_interface USING btree (cable_id);


--
-- Name: dcim_interface_device_id_359c6115; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_device_id_359c6115 ON public.dcim_interface USING btree (device_id);


--
-- Name: dcim_interface_lag_id_ea1a1d12; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_lag_id_ea1a1d12 ON public.dcim_interface USING btree (lag_id);


--
-- Name: dcim_interface_tagged_vlans_interface_id_5870c9e9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_tagged_vlans_interface_id_5870c9e9 ON public.dcim_interface_tagged_vlans USING btree (interface_id);


--
-- Name: dcim_interface_tagged_vlans_vlan_id_e027005c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_tagged_vlans_vlan_id_e027005c ON public.dcim_interface_tagged_vlans USING btree (vlan_id);


--
-- Name: dcim_interface_untagged_vlan_id_838dc7be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_untagged_vlan_id_838dc7be ON public.dcim_interface USING btree (untagged_vlan_id);


--
-- Name: dcim_interface_virtual_machine_id_2afd2d50; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_virtual_machine_id_2afd2d50 ON public.dcim_interface USING btree (virtual_machine_id);


--
-- Name: dcim_interfacetemplate_device_type_id_4bfcbfab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interfacetemplate_device_type_id_4bfcbfab ON public.dcim_interfacetemplate USING btree (device_type_id);


--
-- Name: dcim_inventoryitem_asset_tag_d3289273_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_asset_tag_d3289273_like ON public.dcim_inventoryitem USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_manufacturer_name_841fcd92_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_manufacturer_name_841fcd92_like ON public.dcim_manufacturer USING btree (name varchar_pattern_ops);


--
-- Name: dcim_manufacturer_slug_00430749_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_manufacturer_slug_00430749_like ON public.dcim_manufacturer USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_module_device_id_53cfd5be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_module_device_id_53cfd5be ON public.dcim_inventoryitem USING btree (device_id);


--
-- Name: dcim_module_manufacturer_id_95322cbb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_module_manufacturer_id_95322cbb ON public.dcim_inventoryitem USING btree (manufacturer_id);


--
-- Name: dcim_module_parent_id_bb5d0341; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_module_parent_id_bb5d0341 ON public.dcim_inventoryitem USING btree (parent_id);


--
-- Name: dcim_platform_manufacturer_id_83f72d3d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_platform_manufacturer_id_83f72d3d ON public.dcim_platform USING btree (manufacturer_id);


--
-- Name: dcim_platform_name_c2f04255_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_platform_name_c2f04255_like ON public.dcim_platform USING btree (name varchar_pattern_ops);


--
-- Name: dcim_platform_slug_b0908ae4_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_platform_slug_b0908ae4_like ON public.dcim_platform USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_powerfeed_cable_id_ec44c4f8; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed_cable_id_ec44c4f8 ON public.dcim_powerfeed USING btree (cable_id);


--
-- Name: dcim_powerfeed_power_panel_id_32bde3be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed_power_panel_id_32bde3be ON public.dcim_powerfeed USING btree (power_panel_id);


--
-- Name: dcim_powerfeed_rack_id_7abba090; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerfeed_rack_id_7abba090 ON public.dcim_powerfeed USING btree (rack_id);


--
-- Name: dcim_poweroutlet_cable_id_8dbea1ec; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_cable_id_8dbea1ec ON public.dcim_poweroutlet USING btree (cable_id);


--
-- Name: dcim_poweroutlet_device_id_286351d7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_device_id_286351d7 ON public.dcim_poweroutlet USING btree (device_id);


--
-- Name: dcim_poweroutlet_power_port_id_9bdf4163; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_power_port_id_9bdf4163 ON public.dcim_poweroutlet USING btree (power_port_id);


--
-- Name: dcim_poweroutlettemplate_device_type_id_26b2316c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlettemplate_device_type_id_26b2316c ON public.dcim_poweroutlettemplate USING btree (device_type_id);


--
-- Name: dcim_poweroutlettemplate_power_port_id_c0fb0c42; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlettemplate_power_port_id_c0fb0c42 ON public.dcim_poweroutlettemplate USING btree (power_port_id);


--
-- Name: dcim_powerpanel_rack_group_id_76467cc9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerpanel_rack_group_id_76467cc9 ON public.dcim_powerpanel USING btree (rack_group_id);


--
-- Name: dcim_powerpanel_site_id_c430bc89; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerpanel_site_id_c430bc89 ON public.dcim_powerpanel USING btree (site_id);


--
-- Name: dcim_powerport_cable_id_c9682ba2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport_cable_id_c9682ba2 ON public.dcim_powerport USING btree (cable_id);


--
-- Name: dcim_powerport_device_id_ef7185ae; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport_device_id_ef7185ae ON public.dcim_powerport USING btree (device_id);


--
-- Name: dcim_powerporttemplate_device_type_id_1ddfbfcc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerporttemplate_device_type_id_1ddfbfcc ON public.dcim_powerporttemplate USING btree (device_type_id);


--
-- Name: dcim_rack_asset_tag_f88408e5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_asset_tag_f88408e5_like ON public.dcim_rack USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_rack_group_id_44e90ea9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_group_id_44e90ea9 ON public.dcim_rack USING btree (group_id);


--
-- Name: dcim_rack_role_id_62d6919e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_role_id_62d6919e ON public.dcim_rack USING btree (role_id);


--
-- Name: dcim_rack_site_id_403c7b3a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_site_id_403c7b3a ON public.dcim_rack USING btree (site_id);


--
-- Name: dcim_rack_tenant_id_7cdf3725; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_tenant_id_7cdf3725 ON public.dcim_rack USING btree (tenant_id);


--
-- Name: dcim_rackgroup_site_id_13520e89; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackgroup_site_id_13520e89 ON public.dcim_rackgroup USING btree (site_id);


--
-- Name: dcim_rackgroup_slug_3f4582a7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackgroup_slug_3f4582a7 ON public.dcim_rackgroup USING btree (slug);


--
-- Name: dcim_rackgroup_slug_3f4582a7_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackgroup_slug_3f4582a7_like ON public.dcim_rackgroup USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_rackreservation_rack_id_1ebbaa9b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackreservation_rack_id_1ebbaa9b ON public.dcim_rackreservation USING btree (rack_id);


--
-- Name: dcim_rackreservation_tenant_id_eb5e045f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackreservation_tenant_id_eb5e045f ON public.dcim_rackreservation USING btree (tenant_id);


--
-- Name: dcim_rackreservation_user_id_0785a527; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackreservation_user_id_0785a527 ON public.dcim_rackreservation USING btree (user_id);


--
-- Name: dcim_rackrole_name_9077cfcc_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackrole_name_9077cfcc_like ON public.dcim_rackrole USING btree (name varchar_pattern_ops);


--
-- Name: dcim_rackrole_slug_40bbcd3a_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackrole_slug_40bbcd3a_like ON public.dcim_rackrole USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_rearport_cable_id_42c0e4e7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearport_cable_id_42c0e4e7 ON public.dcim_rearport USING btree (cable_id);


--
-- Name: dcim_rearport_device_id_0bdfe9c0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearport_device_id_0bdfe9c0 ON public.dcim_rearport USING btree (device_id);


--
-- Name: dcim_rearporttemplate_device_type_id_6a02fd01; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rearporttemplate_device_type_id_6a02fd01 ON public.dcim_rearporttemplate USING btree (device_type_id);


--
-- Name: dcim_region_level_2cee781b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_level_2cee781b ON public.dcim_region USING btree (level);


--
-- Name: dcim_region_lft_923d059c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_lft_923d059c ON public.dcim_region USING btree (lft);


--
-- Name: dcim_region_name_ba5a7082_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_name_ba5a7082_like ON public.dcim_region USING btree (name varchar_pattern_ops);


--
-- Name: dcim_region_parent_id_2486f5d4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_parent_id_2486f5d4 ON public.dcim_region USING btree (parent_id);


--
-- Name: dcim_region_rght_20f888e3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_rght_20f888e3 ON public.dcim_region USING btree (rght);


--
-- Name: dcim_region_slug_ff078a66_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_slug_ff078a66_like ON public.dcim_region USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_region_tree_id_a09ea9a7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_tree_id_a09ea9a7 ON public.dcim_region USING btree (tree_id);


--
-- Name: dcim_site_name_8fe66c76_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_name_8fe66c76_like ON public.dcim_site USING btree (name varchar_pattern_ops);


--
-- Name: dcim_site_region_id_45210932; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_region_id_45210932 ON public.dcim_site USING btree (region_id);


--
-- Name: dcim_site_slug_4412c762_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_slug_4412c762_like ON public.dcim_site USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_site_tenant_id_15e7df63; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_tenant_id_15e7df63 ON public.dcim_site USING btree (tenant_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: extras_configcontext_name_4bbfe25d_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_name_4bbfe25d_like ON public.extras_configcontext USING btree (name varchar_pattern_ops);


--
-- Name: extras_configcontext_platforms_configcontext_id_2a516699; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_platforms_configcontext_id_2a516699 ON public.extras_configcontext_platforms USING btree (configcontext_id);


--
-- Name: extras_configcontext_platforms_platform_id_3fdfedc0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_platforms_platform_id_3fdfedc0 ON public.extras_configcontext_platforms USING btree (platform_id);


--
-- Name: extras_configcontext_regions_configcontext_id_73003dbc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_regions_configcontext_id_73003dbc ON public.extras_configcontext_regions USING btree (configcontext_id);


--
-- Name: extras_configcontext_regions_region_id_35c6ba9d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_regions_region_id_35c6ba9d ON public.extras_configcontext_regions USING btree (region_id);


--
-- Name: extras_configcontext_roles_configcontext_id_59b67386; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_roles_configcontext_id_59b67386 ON public.extras_configcontext_roles USING btree (configcontext_id);


--
-- Name: extras_configcontext_roles_devicerole_id_d3a84813; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_roles_devicerole_id_d3a84813 ON public.extras_configcontext_roles USING btree (devicerole_id);


--
-- Name: extras_configcontext_sites_configcontext_id_8c54feb9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_sites_configcontext_id_8c54feb9 ON public.extras_configcontext_sites USING btree (configcontext_id);


--
-- Name: extras_configcontext_sites_site_id_cbb76c96; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_sites_site_id_cbb76c96 ON public.extras_configcontext_sites USING btree (site_id);


--
-- Name: extras_configcontext_tenant_groups_configcontext_id_92f68345; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenant_groups_configcontext_id_92f68345 ON public.extras_configcontext_tenant_groups USING btree (configcontext_id);


--
-- Name: extras_configcontext_tenant_groups_tenantgroup_id_0909688d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenant_groups_tenantgroup_id_0909688d ON public.extras_configcontext_tenant_groups USING btree (tenantgroup_id);


--
-- Name: extras_configcontext_tenants_configcontext_id_b53552a6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenants_configcontext_id_b53552a6 ON public.extras_configcontext_tenants USING btree (configcontext_id);


--
-- Name: extras_configcontext_tenants_tenant_id_8d0aa28e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_configcontext_tenants_tenant_id_8d0aa28e ON public.extras_configcontext_tenants USING btree (tenant_id);


--
-- Name: extras_customfield_name_2fe72707_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_name_2fe72707_like ON public.extras_customfield USING btree (name varchar_pattern_ops);


--
-- Name: extras_customfield_obj_type_contenttype_id_6890b714; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_obj_type_contenttype_id_6890b714 ON public.extras_customfield_obj_type USING btree (contenttype_id);


--
-- Name: extras_customfield_obj_type_customfield_id_82480f86; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_obj_type_customfield_id_82480f86 ON public.extras_customfield_obj_type USING btree (customfield_id);


--
-- Name: extras_customfieldchoice_field_id_35006739; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfieldchoice_field_id_35006739 ON public.extras_customfieldchoice USING btree (field_id);


--
-- Name: extras_customfieldvalue_field_id_1a461f0d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfieldvalue_field_id_1a461f0d ON public.extras_customfieldvalue USING btree (field_id);


--
-- Name: extras_customfieldvalue_obj_type_id_b750b07b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfieldvalue_obj_type_id_b750b07b ON public.extras_customfieldvalue USING btree (obj_type_id);


--
-- Name: extras_customlink_content_type_id_4d35b063; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customlink_content_type_id_4d35b063 ON public.extras_customlink USING btree (content_type_id);


--
-- Name: extras_customlink_name_daed2d18_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customlink_name_daed2d18_like ON public.extras_customlink USING btree (name varchar_pattern_ops);


--
-- Name: extras_exporttemplate_content_type_id_59737e21; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_exporttemplate_content_type_id_59737e21 ON public.extras_exporttemplate USING btree (content_type_id);


--
-- Name: extras_imageattachment_content_type_id_90e0643d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_imageattachment_content_type_id_90e0643d ON public.extras_imageattachment USING btree (content_type_id);


--
-- Name: extras_objectchange_changed_object_type_id_b755bb60; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_changed_object_type_id_b755bb60 ON public.extras_objectchange USING btree (changed_object_type_id);


--
-- Name: extras_objectchange_related_object_type_id_fe6e521f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_related_object_type_id_fe6e521f ON public.extras_objectchange USING btree (related_object_type_id);


--
-- Name: extras_objectchange_time_224380ea; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_time_224380ea ON public.extras_objectchange USING btree ("time");


--
-- Name: extras_objectchange_user_id_7fdf8186; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_objectchange_user_id_7fdf8186 ON public.extras_objectchange USING btree (user_id);


--
-- Name: extras_reportresult_report_3575dd21_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_reportresult_report_3575dd21_like ON public.extras_reportresult USING btree (report varchar_pattern_ops);


--
-- Name: extras_reportresult_user_id_0df55b95; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_reportresult_user_id_0df55b95 ON public.extras_reportresult USING btree (user_id);


--
-- Name: extras_tag_name_9550b3d9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_tag_name_9550b3d9_like ON public.extras_tag USING btree (name varchar_pattern_ops);


--
-- Name: extras_tag_slug_aaa5b7e9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_tag_slug_aaa5b7e9_like ON public.extras_tag USING btree (slug varchar_pattern_ops);


--
-- Name: extras_taggeditem_content_type_id_ba5562ed; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_content_type_id_ba5562ed ON public.extras_taggeditem USING btree (content_type_id);


--
-- Name: extras_taggeditem_content_type_id_object_id_80e28e23_idx; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_content_type_id_object_id_80e28e23_idx ON public.extras_taggeditem USING btree (content_type_id, object_id);


--
-- Name: extras_taggeditem_object_id_31b2aa77; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_object_id_31b2aa77 ON public.extras_taggeditem USING btree (object_id);


--
-- Name: extras_taggeditem_tag_id_d48af7c7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_taggeditem_tag_id_d48af7c7 ON public.extras_taggeditem USING btree (tag_id);


--
-- Name: extras_topologymap_name_f377ebf1_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_topologymap_name_f377ebf1_like ON public.extras_topologymap USING btree (name varchar_pattern_ops);


--
-- Name: extras_topologymap_site_id_b56b3ceb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_topologymap_site_id_b56b3ceb ON public.extras_topologymap USING btree (site_id);


--
-- Name: extras_topologymap_slug_9ba3d31e_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_topologymap_slug_9ba3d31e_like ON public.extras_topologymap USING btree (slug varchar_pattern_ops);


--
-- Name: extras_webhook_name_82cf60b5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_webhook_name_82cf60b5_like ON public.extras_webhook USING btree (name varchar_pattern_ops);


--
-- Name: extras_webhook_obj_type_contenttype_id_85c7693b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_webhook_obj_type_contenttype_id_85c7693b ON public.extras_webhook_obj_type USING btree (contenttype_id);


--
-- Name: extras_webhook_obj_type_webhook_id_c7bed170; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_webhook_obj_type_webhook_id_c7bed170 ON public.extras_webhook_obj_type USING btree (webhook_id);


--
-- Name: ipam_aggregate_rir_id_ef7a27bd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_aggregate_rir_id_ef7a27bd ON public.ipam_aggregate USING btree (rir_id);


--
-- Name: ipam_ipaddress_interface_id_91e71d9d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_interface_id_91e71d9d ON public.ipam_ipaddress USING btree (interface_id);


--
-- Name: ipam_ipaddress_tenant_id_ac55acfd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_tenant_id_ac55acfd ON public.ipam_ipaddress USING btree (tenant_id);


--
-- Name: ipam_ipaddress_vrf_id_51fcc59b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_vrf_id_51fcc59b ON public.ipam_ipaddress USING btree (vrf_id);


--
-- Name: ipam_prefix_role_id_0a98d415; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_role_id_0a98d415 ON public.ipam_prefix USING btree (role_id);


--
-- Name: ipam_prefix_site_id_0b20df05; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_site_id_0b20df05 ON public.ipam_prefix USING btree (site_id);


--
-- Name: ipam_prefix_tenant_id_7ba1fcc4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_tenant_id_7ba1fcc4 ON public.ipam_prefix USING btree (tenant_id);


--
-- Name: ipam_prefix_vlan_id_1db91bff; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_vlan_id_1db91bff ON public.ipam_prefix USING btree (vlan_id);


--
-- Name: ipam_prefix_vrf_id_34f78ed0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_vrf_id_34f78ed0 ON public.ipam_prefix USING btree (vrf_id);


--
-- Name: ipam_rir_name_64a71982_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_rir_name_64a71982_like ON public.ipam_rir USING btree (name varchar_pattern_ops);


--
-- Name: ipam_rir_slug_ff1a369a_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_rir_slug_ff1a369a_like ON public.ipam_rir USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_role_name_13784849_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_role_name_13784849_like ON public.ipam_role USING btree (name varchar_pattern_ops);


--
-- Name: ipam_role_slug_309ca14c_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_role_slug_309ca14c_like ON public.ipam_role USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_service_device_id_b4d2bb9c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_device_id_b4d2bb9c ON public.ipam_service USING btree (device_id);


--
-- Name: ipam_service_ipaddresses_ipaddress_id_b4138c6d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_ipaddresses_ipaddress_id_b4138c6d ON public.ipam_service_ipaddresses USING btree (ipaddress_id);


--
-- Name: ipam_service_ipaddresses_service_id_ae26b9ab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_ipaddresses_service_id_ae26b9ab ON public.ipam_service_ipaddresses USING btree (service_id);


--
-- Name: ipam_service_virtual_machine_id_e8b53562; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_virtual_machine_id_e8b53562 ON public.ipam_service USING btree (virtual_machine_id);


--
-- Name: ipam_vlan_group_id_88cbfa62; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_group_id_88cbfa62 ON public.ipam_vlan USING btree (group_id);


--
-- Name: ipam_vlan_role_id_f5015962; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_role_id_f5015962 ON public.ipam_vlan USING btree (role_id);


--
-- Name: ipam_vlan_site_id_a59334e3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_site_id_a59334e3 ON public.ipam_vlan USING btree (site_id);


--
-- Name: ipam_vlan_tenant_id_71a8290d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_tenant_id_71a8290d ON public.ipam_vlan USING btree (tenant_id);


--
-- Name: ipam_vlangroup_site_id_264f36f6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlangroup_site_id_264f36f6 ON public.ipam_vlangroup USING btree (site_id);


--
-- Name: ipam_vlangroup_slug_40abcf6b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlangroup_slug_40abcf6b ON public.ipam_vlangroup USING btree (slug);


--
-- Name: ipam_vlangroup_slug_40abcf6b_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlangroup_slug_40abcf6b_like ON public.ipam_vlangroup USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_vrf_rd_0ac1bde1_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_rd_0ac1bde1_like ON public.ipam_vrf USING btree (rd varchar_pattern_ops);


--
-- Name: ipam_vrf_tenant_id_498b0051; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_tenant_id_498b0051 ON public.ipam_vrf USING btree (tenant_id);


--
-- Name: secrets_secret_device_id_c7c13124; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX secrets_secret_device_id_c7c13124 ON public.secrets_secret USING btree (device_id);


--
-- Name: secrets_secret_role_id_39d9347f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX secrets_secret_role_id_39d9347f ON public.secrets_secret USING btree (role_id);


--
-- Name: secrets_secretrole_groups_group_id_a687dd10; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX secrets_secretrole_groups_group_id_a687dd10 ON public.secrets_secretrole_groups USING btree (group_id);


--
-- Name: secrets_secretrole_groups_secretrole_id_3cf0338b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX secrets_secretrole_groups_secretrole_id_3cf0338b ON public.secrets_secretrole_groups USING btree (secretrole_id);


--
-- Name: secrets_secretrole_name_7b6ee7a4_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX secrets_secretrole_name_7b6ee7a4_like ON public.secrets_secretrole USING btree (name varchar_pattern_ops);


--
-- Name: secrets_secretrole_slug_a06c885e_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX secrets_secretrole_slug_a06c885e_like ON public.secrets_secretrole USING btree (slug varchar_pattern_ops);


--
-- Name: secrets_secretrole_users_secretrole_id_d2eac298; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX secrets_secretrole_users_secretrole_id_d2eac298 ON public.secrets_secretrole_users USING btree (secretrole_id);


--
-- Name: secrets_secretrole_users_user_id_25be95ad; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX secrets_secretrole_users_user_id_25be95ad ON public.secrets_secretrole_users USING btree (user_id);


--
-- Name: taggit_tag_name_58eb2ed9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_tag_name_58eb2ed9_like ON public.taggit_tag USING btree (name varchar_pattern_ops);


--
-- Name: taggit_tag_slug_6be58b2c_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_tag_slug_6be58b2c_like ON public.taggit_tag USING btree (slug varchar_pattern_ops);


--
-- Name: taggit_taggeditem_content_type_id_9957a03c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_content_type_id_9957a03c ON public.taggit_taggeditem USING btree (content_type_id);


--
-- Name: taggit_taggeditem_content_type_id_object_id_196cc965_idx; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_content_type_id_object_id_196cc965_idx ON public.taggit_taggeditem USING btree (content_type_id, object_id);


--
-- Name: taggit_taggeditem_object_id_e2d7d1df; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_object_id_e2d7d1df ON public.taggit_taggeditem USING btree (object_id);


--
-- Name: taggit_taggeditem_tag_id_f4f5b767; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX taggit_taggeditem_tag_id_f4f5b767 ON public.taggit_taggeditem USING btree (tag_id);


--
-- Name: tenancy_tenant_group_id_7daef6f4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenant_group_id_7daef6f4 ON public.tenancy_tenant USING btree (group_id);


--
-- Name: tenancy_tenant_name_f6e5b2f5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenant_name_f6e5b2f5_like ON public.tenancy_tenant USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_tenant_slug_0716575e_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenant_slug_0716575e_like ON public.tenancy_tenant USING btree (slug varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_name_53363199_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_name_53363199_like ON public.tenancy_tenantgroup USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_slug_e2af1cb6_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_slug_e2af1cb6_like ON public.tenancy_tenantgroup USING btree (slug varchar_pattern_ops);


--
-- Name: users_token_key_820deccd_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_token_key_820deccd_like ON public.users_token USING btree (key varchar_pattern_ops);


--
-- Name: users_token_user_id_af964690; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_token_user_id_af964690 ON public.users_token USING btree (user_id);


--
-- Name: virtualization_cluster_group_id_de379828; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_group_id_de379828 ON public.virtualization_cluster USING btree (group_id);


--
-- Name: virtualization_cluster_name_1b59a61b_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_name_1b59a61b_like ON public.virtualization_cluster USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_cluster_site_id_4d5af282; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_site_id_4d5af282 ON public.virtualization_cluster USING btree (site_id);


--
-- Name: virtualization_cluster_type_id_4efafb0a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_type_id_4efafb0a ON public.virtualization_cluster USING btree (type_id);


--
-- Name: virtualization_clustergroup_name_4fcd26b4_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustergroup_name_4fcd26b4_like ON public.virtualization_clustergroup USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_clustergroup_slug_57ca1d23_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustergroup_slug_57ca1d23_like ON public.virtualization_clustergroup USING btree (slug varchar_pattern_ops);


--
-- Name: virtualization_clustertype_name_ea854d3d_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustertype_name_ea854d3d_like ON public.virtualization_clustertype USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_clustertype_slug_8ee4d0e0_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustertype_slug_8ee4d0e0_like ON public.virtualization_clustertype USING btree (slug varchar_pattern_ops);


--
-- Name: virtualization_virtualmachine_cluster_id_6c9f9047; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_cluster_id_6c9f9047 ON public.virtualization_virtualmachine USING btree (cluster_id);


--
-- Name: virtualization_virtualmachine_name_266f6cdc_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_name_266f6cdc_like ON public.virtualization_virtualmachine USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_virtualmachine_platform_id_a6c5ccb2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_platform_id_a6c5ccb2 ON public.virtualization_virtualmachine USING btree (platform_id);


--
-- Name: virtualization_virtualmachine_role_id_0cc898f9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_role_id_0cc898f9 ON public.virtualization_virtualmachine USING btree (role_id);


--
-- Name: virtualization_virtualmachine_tenant_id_d00d1d77; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_tenant_id_d00d1d77 ON public.virtualization_virtualmachine USING btree (tenant_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_provider_id_d9195418_fk_circuits_provider_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_provider_id_d9195418_fk_circuits_provider_id FOREIGN KEY (provider_id) REFERENCES public.circuits_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_tenant_id_812508a5_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_tenant_id_812508a5_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_type_id_1b9f485a_fk_circuits_circuittype_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_type_id_1b9f485a_fk_circuits_circuittype_id FOREIGN KEY (type_id) REFERENCES public.circuits_circuittype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm_circuit_id_257e87e7_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm_circuit_id_257e87e7_fk_circuits_ FOREIGN KEY (circuit_id) REFERENCES public.circuits_circuit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm_connected_endpoint_i_eb10be43_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm_connected_endpoint_i_eb10be43_fk_dcim_inte FOREIGN KEY (connected_endpoint_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuittermination_cable_id_35e9f703_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_cable_id_35e9f703_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuittermination_site_id_e6fe5652_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_site_id_e6fe5652_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable__termination_a_device_id_e59cde1c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable__termination_a_device_id_e59cde1c_fk_dcim_device_id FOREIGN KEY (_termination_a_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable__termination_b_device_id_a9073762_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable__termination_b_device_id_a9073762_fk_dcim_device_id FOREIGN KEY (_termination_b_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable_termination_a_type_i_a614bab8_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_a_type_i_a614bab8_fk_django_co FOREIGN KEY (termination_a_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_cable dcim_cable_termination_b_type_i_a91595d0_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_cable
    ADD CONSTRAINT dcim_cable_termination_b_type_i_a91595d0_fk_django_co FOREIGN KEY (termination_b_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport_cable_id_a9ae5465_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_cable_id_a9ae5465_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport_connected_endpoint_i_efe0a825_fk_dcim_cons; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_connected_endpoint_i_efe0a825_fk_dcim_cons FOREIGN KEY (connected_endpoint_id) REFERENCES public.dcim_consoleserverport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport_device_id_f2d90d3c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_device_id_f2d90d3c_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemp_device_type_id_075d4015_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemp_device_type_id_075d4015_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverpo_device_type_id_579bdc86_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverpo_device_type_id_579bdc86_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport_cable_id_f2940dfd_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_cable_id_f2940dfd_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport_device_id_d9866581_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_device_id_d9866581_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_device_role_id_682e8188_fk_dcim_devicerole_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_device_role_id_682e8188_fk_dcim_devicerole_id FOREIGN KEY (device_role_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_device_type_id_d61b4086_fk_dcim_devicetype_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_device_type_id_d61b4086_fk_dcim_devicetype_id FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_platform_id_468138f1_fk_dcim_platform_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_platform_id_468138f1_fk_dcim_platform_id FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_primary_ip4_id_2ccd943a_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip4_id_2ccd943a_fk_ipam_ipaddress_id FOREIGN KEY (primary_ip4_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_primary_ip6_id_d180fe91_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip6_id_d180fe91_fk_ipam_ipaddress_id FOREIGN KEY (primary_ip6_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_rack_id_23bde71f_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_rack_id_23bde71f_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_site_id_ff897cf6_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_site_id_ff897cf6_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_tenant_id_dcea7969_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_tenant_id_dcea7969_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_virtual_chassis_id_aed51693_fk_dcim_virt; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_virtual_chassis_id_aed51693_fk_dcim_virt FOREIGN KEY (virtual_chassis_id) REFERENCES public.dcim_virtualchassis(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebay dcim_devicebay_device_id_0c8a1218_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_device_id_0c8a1218_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebay dcim_devicebay_installed_device_id_04618112_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_installed_device_id_04618112_fk_dcim_device_id FOREIGN KEY (installed_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebaytemplate dcim_devicebaytempla_device_type_id_f4b24a29_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytempla_device_type_id_f4b24a29_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_a3e8029e_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_a3e8029e_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_cable_id_04ff8aab_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_cable_id_04ff8aab_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_device_id_950557b5_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_device_id_950557b5_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontport dcim_frontport_rear_port_id_78df2532_fk_dcim_rearport_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontport
    ADD CONSTRAINT dcim_frontport_rear_port_id_78df2532_fk_dcim_rearport_id FOREIGN KEY (rear_port_id) REFERENCES public.dcim_rearport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontporttemplate dcim_frontporttempla_device_type_id_f088b952_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttempla_device_type_id_f088b952_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_frontporttemplate dcim_frontporttempla_rear_port_id_9775411b_fk_dcim_rear; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_frontporttemplate
    ADD CONSTRAINT dcim_frontporttempla_rear_port_id_9775411b_fk_dcim_rear FOREIGN KEY (rear_port_id) REFERENCES public.dcim_rearporttemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface__connected_circuitte_be36a3a3_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface__connected_circuitte_be36a3a3_fk_circuits_ FOREIGN KEY (_connected_circuittermination_id) REFERENCES public.circuits_circuittermination(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface__connected_interface_3dfcd87c_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface__connected_interface_3dfcd87c_fk_dcim_inte FOREIGN KEY (_connected_interface_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_cable_id_1b264edb_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_cable_id_1b264edb_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_device_id_359c6115_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_device_id_359c6115_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id FOREIGN KEY (lag_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagge_interface_id_5870c9e9_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagge_interface_id_5870c9e9_fk_dcim_inte FOREIGN KEY (interface_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_vlan_id_e027005c_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_vlan_id_e027005c_fk_ipam_vlan_id FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id FOREIGN KEY (untagged_vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_virtual_machine_id_2afd2d50_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_virtual_machine_id_2afd2d50_fk_virtualiz FOREIGN KEY (virtual_machine_id) REFERENCES public.virtualization_virtualmachine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interfacetemplate dcim_interfacetempla_device_type_id_4bfcbfab_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetempla_device_type_id_4bfcbfab_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_device_id_033d83f8_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_device_id_033d83f8_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id FOREIGN KEY (parent_id) REFERENCES public.dcim_inventoryitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_platform dcim_platform_manufacturer_id_83f72d3d_fk_dcim_manufacturer_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_manufacturer_id_83f72d3d_fk_dcim_manufacturer_id FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_cable_id_ec44c4f8_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_cable_id_ec44c4f8_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_connected_endpoint_i_6ad0aad2_fk_dcim_powe; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_connected_endpoint_i_6ad0aad2_fk_dcim_powe FOREIGN KEY (connected_endpoint_id) REFERENCES public.dcim_powerport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_power_panel_id_32bde3be_fk_dcim_powerpanel_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_power_panel_id_32bde3be_fk_dcim_powerpanel_id FOREIGN KEY (power_panel_id) REFERENCES public.dcim_powerpanel(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerfeed dcim_powerfeed_rack_id_7abba090_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerfeed
    ADD CONSTRAINT dcim_powerfeed_rack_id_7abba090_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_cable_id_8dbea1ec_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_cable_id_8dbea1ec_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_device_id_286351d7_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_device_id_286351d7_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_power_port_id_9bdf4163_fk_dcim_powerport_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_power_port_id_9bdf4163_fk_dcim_powerport_id FOREIGN KEY (power_port_id) REFERENCES public.dcim_powerport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemp_device_type_id_26b2316c_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemp_device_type_id_26b2316c_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemp_power_port_id_c0fb0c42_fk_dcim_powe; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemp_power_port_id_c0fb0c42_fk_dcim_powe FOREIGN KEY (power_port_id) REFERENCES public.dcim_powerporttemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerpanel dcim_powerpanel_rack_group_id_76467cc9_fk_dcim_rackgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_rack_group_id_76467cc9_fk_dcim_rackgroup_id FOREIGN KEY (rack_group_id) REFERENCES public.dcim_rackgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerpanel dcim_powerpanel_site_id_c430bc89_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerpanel
    ADD CONSTRAINT dcim_powerpanel_site_id_c430bc89_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport__connected_powerfeed_8f5230a3_fk_dcim_powe; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport__connected_powerfeed_8f5230a3_fk_dcim_powe FOREIGN KEY (_connected_powerfeed_id) REFERENCES public.dcim_powerfeed(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport__connected_poweroutl_6c3ea413_fk_dcim_powe; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport__connected_poweroutl_6c3ea413_fk_dcim_powe FOREIGN KEY (_connected_poweroutlet_id) REFERENCES public.dcim_poweroutlet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport_cable_id_c9682ba2_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_cable_id_c9682ba2_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport_device_id_ef7185ae_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_device_id_ef7185ae_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerporttemplate dcim_powerporttempla_device_type_id_1ddfbfcc_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttempla_device_type_id_1ddfbfcc_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_group_id_44e90ea9_fk_dcim_rackgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_group_id_44e90ea9_fk_dcim_rackgroup_id FOREIGN KEY (group_id) REFERENCES public.dcim_rackgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_role_id_62d6919e_fk_dcim_rackrole_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_role_id_62d6919e_fk_dcim_rackrole_id FOREIGN KEY (role_id) REFERENCES public.dcim_rackrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_site_id_403c7b3a_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_site_id_403c7b3a_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_tenant_id_7cdf3725_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_tenant_id_7cdf3725_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackgroup dcim_rackgroup_site_id_13520e89_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_site_id_13520e89_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_rack_id_1ebbaa9b_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_rack_id_1ebbaa9b_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_tenant_id_eb5e045f_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_tenant_id_eb5e045f_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_user_id_0785a527_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_user_id_0785a527_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport_cable_id_42c0e4e7_fk_dcim_cable_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_cable_id_42c0e4e7_fk_dcim_cable_id FOREIGN KEY (cable_id) REFERENCES public.dcim_cable(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearport dcim_rearport_device_id_0bdfe9c0_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearport
    ADD CONSTRAINT dcim_rearport_device_id_0bdfe9c0_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rearporttemplate dcim_rearporttemplat_device_type_id_6a02fd01_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rearporttemplate
    ADD CONSTRAINT dcim_rearporttemplat_device_type_id_6a02fd01_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_region dcim_region_parent_id_2486f5d4_fk_dcim_region_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_parent_id_2486f5d4_fk_dcim_region_id FOREIGN KEY (parent_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_region_id_45210932_fk_dcim_region_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_region_id_45210932_fk_dcim_region_id FOREIGN KEY (region_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_tenant_id_15e7df63_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_tenant_id_15e7df63_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_virtualchassis dcim_virtualchassis_master_id_ab54cfc6_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_master_id_ab54cfc6_fk_dcim_device_id FOREIGN KEY (master_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_platforms extras_configcontext_configcontext_id_2a516699_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_configcontext_id_2a516699_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_roles extras_configcontext_configcontext_id_59b67386_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_configcontext_id_59b67386_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_regions extras_configcontext_configcontext_id_73003dbc_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_configcontext_id_73003dbc_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_sites extras_configcontext_configcontext_id_8c54feb9_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_configcontext_id_8c54feb9_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_configcontext_id_92f68345_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_configcontext_id_92f68345_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenants extras_configcontext_configcontext_id_b53552a6_fk_extras_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_configcontext_id_b53552a6_fk_extras_co FOREIGN KEY (configcontext_id) REFERENCES public.extras_configcontext(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_roles extras_configcontext_devicerole_id_d3a84813_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_roles
    ADD CONSTRAINT extras_configcontext_devicerole_id_d3a84813_fk_dcim_devi FOREIGN KEY (devicerole_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_platforms extras_configcontext_platform_id_3fdfedc0_fk_dcim_plat; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_platforms
    ADD CONSTRAINT extras_configcontext_platform_id_3fdfedc0_fk_dcim_plat FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_regions extras_configcontext_region_id_35c6ba9d_fk_dcim_regi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_regions
    ADD CONSTRAINT extras_configcontext_region_id_35c6ba9d_fk_dcim_regi FOREIGN KEY (region_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_sites extras_configcontext_sites_site_id_cbb76c96_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_sites
    ADD CONSTRAINT extras_configcontext_sites_site_id_cbb76c96_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenants extras_configcontext_tenant_id_8d0aa28e_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenants
    ADD CONSTRAINT extras_configcontext_tenant_id_8d0aa28e_fk_tenancy_t FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_configcontext_tenant_groups extras_configcontext_tenantgroup_id_0909688d_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_configcontext_tenant_groups
    ADD CONSTRAINT extras_configcontext_tenantgroup_id_0909688d_fk_tenancy_t FOREIGN KEY (tenantgroup_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfield_obj_type extras_customfield_o_contenttype_id_6890b714_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_obj_type
    ADD CONSTRAINT extras_customfield_o_contenttype_id_6890b714_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfield_obj_type extras_customfield_o_customfield_id_82480f86_fk_extras_cu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_obj_type
    ADD CONSTRAINT extras_customfield_o_customfield_id_82480f86_fk_extras_cu FOREIGN KEY (customfield_id) REFERENCES public.extras_customfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfieldchoice extras_customfieldch_field_id_35006739_fk_extras_cu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfieldchoice
    ADD CONSTRAINT extras_customfieldch_field_id_35006739_fk_extras_cu FOREIGN KEY (field_id) REFERENCES public.extras_customfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfieldvalue extras_customfieldva_field_id_1a461f0d_fk_extras_cu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfieldvalue
    ADD CONSTRAINT extras_customfieldva_field_id_1a461f0d_fk_extras_cu FOREIGN KEY (field_id) REFERENCES public.extras_customfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfieldvalue extras_customfieldva_obj_type_id_b750b07b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfieldvalue
    ADD CONSTRAINT extras_customfieldva_obj_type_id_b750b07b_fk_django_co FOREIGN KEY (obj_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customlink extras_customlink_content_type_id_4d35b063_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customlink
    ADD CONSTRAINT extras_customlink_content_type_id_4d35b063_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_exporttemplate extras_exporttemplat_content_type_id_59737e21_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplat_content_type_id_59737e21_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_imageattachment extras_imageattachme_content_type_id_90e0643d_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_imageattachment
    ADD CONSTRAINT extras_imageattachme_content_type_id_90e0643d_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_changed_object_type__b755bb60_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_changed_object_type__b755bb60_fk_django_co FOREIGN KEY (changed_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_related_object_type__fe6e521f_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_related_object_type__fe6e521f_fk_django_co FOREIGN KEY (related_object_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_objectchange extras_objectchange_user_id_7fdf8186_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_objectchange
    ADD CONSTRAINT extras_objectchange_user_id_7fdf8186_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_reportresult extras_reportresult_user_id_0df55b95_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_reportresult
    ADD CONSTRAINT extras_reportresult_user_id_0df55b95_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_taggeditem extras_taggeditem_content_type_id_ba5562ed_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_content_type_id_ba5562ed_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_taggeditem extras_taggeditem_tag_id_d48af7c7_fk_extras_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_taggeditem
    ADD CONSTRAINT extras_taggeditem_tag_id_d48af7c7_fk_extras_tag_id FOREIGN KEY (tag_id) REFERENCES public.extras_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_topologymap extras_topologymap_site_id_b56b3ceb_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_topologymap
    ADD CONSTRAINT extras_topologymap_site_id_b56b3ceb_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_webhook_obj_type extras_webhook_obj_t_contenttype_id_85c7693b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_obj_type
    ADD CONSTRAINT extras_webhook_obj_t_contenttype_id_85c7693b_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_webhook_obj_type extras_webhook_obj_t_webhook_id_c7bed170_fk_extras_we; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_webhook_obj_type
    ADD CONSTRAINT extras_webhook_obj_t_webhook_id_c7bed170_fk_extras_we FOREIGN KEY (webhook_id) REFERENCES public.extras_webhook(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_aggregate ipam_aggregate_rir_id_ef7a27bd_fk_ipam_rir_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_rir_id_ef7a27bd_fk_ipam_rir_id FOREIGN KEY (rir_id) REFERENCES public.ipam_rir(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_interface_id_91e71d9d_fk_dcim_interface_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_interface_id_91e71d9d_fk_dcim_interface_id FOREIGN KEY (interface_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_nat_inside_id_a45fb7c5_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_nat_inside_id_a45fb7c5_fk_ipam_ipaddress_id FOREIGN KEY (nat_inside_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_tenant_id_ac55acfd_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_tenant_id_ac55acfd_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_vrf_id_51fcc59b_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_vrf_id_51fcc59b_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_role_id_0a98d415_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_role_id_0a98d415_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_site_id_0b20df05_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_site_id_0b20df05_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_tenant_id_7ba1fcc4_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_tenant_id_7ba1fcc4_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_vlan_id_1db91bff_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_vlan_id_1db91bff_fk_ipam_vlan_id FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_vrf_id_34f78ed0_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_vrf_id_34f78ed0_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service ipam_service_device_id_b4d2bb9c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_device_id_b4d2bb9c_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddre_ipaddress_id_b4138c6d_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddre_ipaddress_id_b4138c6d_fk_ipam_ipad FOREIGN KEY (ipaddress_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_service_id_ae26b9ab_fk_ipam_service_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_service_id_ae26b9ab_fk_ipam_service_id FOREIGN KEY (service_id) REFERENCES public.ipam_service(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service ipam_service_virtual_machine_id_e8b53562_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_virtual_machine_id_e8b53562_fk_virtualiz FOREIGN KEY (virtual_machine_id) REFERENCES public.virtualization_virtualmachine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_group_id_88cbfa62_fk_ipam_vlangroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_88cbfa62_fk_ipam_vlangroup_id FOREIGN KEY (group_id) REFERENCES public.ipam_vlangroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_role_id_f5015962_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_role_id_f5015962_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_site_id_a59334e3_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_site_id_a59334e3_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlangroup ipam_vlangroup_site_id_264f36f6_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_site_id_264f36f6_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: secrets_secret secrets_secret_device_id_c7c13124_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secret
    ADD CONSTRAINT secrets_secret_device_id_c7c13124_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: secrets_secret secrets_secret_role_id_39d9347f_fk_secrets_secretrole_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secret
    ADD CONSTRAINT secrets_secret_role_id_39d9347f_fk_secrets_secretrole_id FOREIGN KEY (role_id) REFERENCES public.secrets_secretrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: secrets_secretrole_groups secrets_secretrole_g_secretrole_id_3cf0338b_fk_secrets_s; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole_groups
    ADD CONSTRAINT secrets_secretrole_g_secretrole_id_3cf0338b_fk_secrets_s FOREIGN KEY (secretrole_id) REFERENCES public.secrets_secretrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: secrets_secretrole_groups secrets_secretrole_groups_group_id_a687dd10_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole_groups
    ADD CONSTRAINT secrets_secretrole_groups_group_id_a687dd10_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: secrets_secretrole_users secrets_secretrole_u_secretrole_id_d2eac298_fk_secrets_s; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole_users
    ADD CONSTRAINT secrets_secretrole_u_secretrole_id_d2eac298_fk_secrets_s FOREIGN KEY (secretrole_id) REFERENCES public.secrets_secretrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: secrets_secretrole_users secrets_secretrole_users_user_id_25be95ad_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole_users
    ADD CONSTRAINT secrets_secretrole_users_user_id_25be95ad_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: secrets_sessionkey secrets_sessionkey_userkey_id_3ca6176b_fk_secrets_userkey_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_sessionkey
    ADD CONSTRAINT secrets_sessionkey_userkey_id_3ca6176b_fk_secrets_userkey_id FOREIGN KEY (userkey_id) REFERENCES public.secrets_userkey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: secrets_userkey secrets_userkey_user_id_13ada46b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_userkey
    ADD CONSTRAINT secrets_userkey_user_id_13ada46b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_content_type_id_9957a03c_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_content_type_id_9957a03c_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: taggit_taggeditem taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.taggit_taggeditem
    ADD CONSTRAINT taggit_taggeditem_tag_id_f4f5b767_fk_taggit_tag_id FOREIGN KEY (tag_id) REFERENCES public.taggit_tag(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_tenant tenancy_tenant_group_id_7daef6f4_fk_tenancy_tenantgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_group_id_7daef6f4_fk_tenancy_tenantgroup_id FOREIGN KEY (group_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_token users_token_user_id_af964690_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_user_id_af964690_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_clust_group_id_de379828_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_clust_group_id_de379828_fk_virtualiz FOREIGN KEY (group_id) REFERENCES public.virtualization_clustergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_clust_type_id_4efafb0a_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_clust_type_id_4efafb0a_fk_virtualiz FOREIGN KEY (type_id) REFERENCES public.virtualization_clustertype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_cluster_site_id_4d5af282_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_site_id_4d5af282_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_cluster_id_6c9f9047_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_cluster_id_6c9f9047_fk_virtualiz FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_primary_ip4_id_942e42ae_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_primary_ip4_id_942e42ae_fk_ipam_ipad FOREIGN KEY (primary_ip4_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_primary_ip6_id_b7904e73_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_primary_ip6_id_b7904e73_fk_ipam_ipad FOREIGN KEY (primary_ip6_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_role_id_0cc898f9_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_role_id_0cc898f9_fk_dcim_devi FOREIGN KEY (role_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_tenant_id_d00d1d77_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_tenant_id_d00d1d77_fk_tenancy_t FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

