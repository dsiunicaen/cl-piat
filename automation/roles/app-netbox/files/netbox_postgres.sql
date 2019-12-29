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
1	pbkdf2_sha256$150000$q6Z1TSrq70NI$EYoSJjgAqqsgT7L/94/1UcLCuTl20cvJY0ht7dE4yOg=	2019-12-29 11:50:34.71622+00	t	admin			admin@example.com	t	t	2018-06-03 16:17:44.788445+00
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
86	2019-12-29	2019-12-29 13:45:46.82127+00	oob-mgmt-switch		\N	\N	1		8	3	\N	15	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
87	2019-12-29	2019-12-29 13:45:46.855203+00	rtr01		\N	\N	1		7	1	\N	6	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
1	2018-06-03	2019-12-29 13:10:30.790156+00	leaf01		\N	\N	1		1	1	\N	1	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
88	2019-12-29	2019-12-29 13:45:46.901993+00	rtr02		\N	\N	1		7	1	\N	6	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
89	2019-12-29	2019-12-29 13:45:46.95204+00	server01		\N	\N	1		3	2	\N	1	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
90	2019-12-29	2019-12-29 13:45:46.982711+00	server02		\N	\N	1		3	2	\N	1	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
91	2019-12-29	2019-12-29 13:45:47.013544+00	server03		\N	\N	1		3	2	\N	1	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
92	2019-12-29	2019-12-29 13:45:47.043086+00	server04		\N	\N	1		3	2	\N	1	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
93	2019-12-29	2019-12-29 13:45:47.07286+00	server05		\N	\N	1		3	2	\N	3	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
94	2019-12-29	2019-12-29 13:45:47.102948+00	server06		\N	\N	1		3	2	\N	3	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
95	2019-12-29	2019-12-29 13:45:47.138479+00	server07		\N	\N	1		3	2	\N	3	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
71	2019-12-29	2019-12-29 13:45:46.152962+00	exit01		\N	\N	1		1	1	\N	6	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
72	2019-12-29	2019-12-29 13:45:46.206503+00	exit02		\N	\N	1		1	1	\N	6	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
73	2019-12-29	2019-12-29 13:45:46.250555+00	fw01		\N	\N	1		6	1	\N	9	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
74	2019-12-29	2019-12-29 13:45:46.295559+00	fw02		\N	\N	1		6	1	\N	9	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
75	2019-12-29	2019-12-29 13:45:46.340504+00	fw03		\N	\N	1		6	1	\N	12	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
76	2019-12-29	2019-12-29 13:45:46.385541+00	fw04		\N	\N	1		6	1	\N	12	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
77	2019-12-29	2019-12-29 13:45:46.431322+00	leaf02		\N	\N	1		1	1	\N	1	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
78	2019-12-29	2019-12-29 13:45:46.477885+00	leaf03		\N	\N	1		1	1	\N	3	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
79	2019-12-29	2019-12-29 13:45:46.528999+00	leaf04		\N	\N	1		1	1	\N	3	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
80	2019-12-29	2019-12-29 13:45:46.574463+00	leaf05		\N	\N	1		1	1	\N	10	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
81	2019-12-29	2019-12-29 13:45:46.621176+00	leaf06		\N	\N	1		1	1	\N	10	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
82	2019-12-29	2019-12-29 13:45:46.66625+00	leaf07		\N	\N	1		1	1	\N	11	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
83	2019-12-29	2019-12-29 13:45:46.718443+00	leaf08		\N	\N	1		1	1	\N	11	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
84	2019-12-29	2019-12-29 13:45:46.759367+00	netq-ts		\N	\N	1		3	3	\N	\N	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
85	2019-12-29	2019-12-29 13:45:46.789683+00	oob-mgmt-server		\N	\N	1		4	2	\N	15	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
96	2019-12-29	2019-12-29 13:45:47.169071+00	server08		\N	\N	1		3	2	\N	3	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
97	2019-12-29	2019-12-29 13:45:47.200676+00	server09		\N	\N	1		3	2	\N	9	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
98	2019-12-29	2019-12-29 13:45:47.233934+00	server10		\N	\N	1		3	2	\N	9	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
99	2019-12-29	2019-12-29 13:45:47.272921+00	server11		\N	\N	1		3	2	\N	12	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
100	2019-12-29	2019-12-29 13:45:47.307581+00	server12		\N	\N	1		3	2	\N	12	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
101	2019-12-29	2019-12-29 13:45:47.340074+00	server13		\N	\N	1		3	2	\N	10	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
102	2019-12-29	2019-12-29 13:45:47.37357+00	server14		\N	\N	1		3	2	\N	10	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
103	2019-12-29	2019-12-29 13:45:47.406552+00	server15		\N	\N	1		3	2	\N	11	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
104	2019-12-29	2019-12-29 13:45:47.439694+00	server16		\N	\N	1		3	2	\N	11	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
105	2019-12-29	2019-12-29 13:45:47.473203+00	server17		\N	\N	1		3	2	\N	11	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
106	2019-12-29	2019-12-29 13:45:47.505582+00	server18		\N	\N	1		3	2	\N	11	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
107	2019-12-29	2019-12-29 13:45:47.537308+00	server19		\N	\N	1		3	2	\N	11	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
108	2019-12-29	2019-12-29 13:45:47.577604+00	server20		\N	\N	1		3	2	\N	11	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
109	2019-12-29	2019-12-29 13:45:47.611142+00	service01		\N	\N	1		1	4	\N	9	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
110	2019-12-29	2019-12-29 13:45:47.656041+00	service02		\N	\N	1		1	4	\N	9	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
111	2019-12-29	2019-12-29 13:45:47.704324+00	service03		\N	\N	1		1	4	\N	12	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
112	2019-12-29	2019-12-29 13:45:47.751268+00	service04		\N	\N	1		1	4	\N	12	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
113	2019-12-29	2019-12-29 13:45:47.800482+00	spine01		\N	\N	1		2	4	\N	2	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
114	2019-12-29	2019-12-29 13:45:47.844875+00	spine02		\N	\N	1		2	4	\N	2	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
115	2019-12-29	2019-12-29 13:45:47.892722+00	spine03		\N	\N	1		2	4	\N	2	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
116	2019-12-29	2019-12-29 13:45:47.932673+00	spine04		\N	\N	1		2	4	\N	2	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
117	2019-12-29	2019-12-29 13:45:47.972594+00	spine05		\N	\N	1		2	4	\N	13	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
118	2019-12-29	2019-12-29 13:45:48.018026+00	spine06		\N	\N	1		2	4	\N	13	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
119	2019-12-29	2019-12-29 13:45:48.056205+00	spine07		\N	\N	1		2	4	\N	13	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
120	2019-12-29	2019-12-29 13:45:48.10376+00	spine08		\N	\N	1		2	4	\N	13	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
121	2019-12-29	2019-12-29 13:45:48.147295+00	super01		\N	\N	1		5	4	\N	14	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
122	2019-12-29	2019-12-29 13:45:48.187712+00	super02		\N	\N	1		5	4	\N	14	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
123	2019-12-29	2019-12-29 13:45:48.226842+00	super03		\N	\N	1		5	4	\N	14	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
124	2019-12-29	2019-12-29 13:45:48.272597+00	super04		\N	\N	1		5	4	\N	14	\N	\N	\N	\N	2	\N	\N	\N	\N	\N
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
2	Spine	spine	4caf50	f	2019-12-29	2019-12-29 12:13:37.277794+00
1	Leaf	leaf	8bc34a	f	2019-12-29	2019-12-29 12:13:55.629826+00
5	Superspine	superspine	2f6a31	f	2019-12-29	2019-12-29 12:14:35.373558+00
3	Server	server	3f51b5	t	2019-12-29	2019-12-29 12:15:17.08172+00
8	OOB Switch	oob-switch	cddc39	f	2019-12-29	2019-12-29 13:21:07.833177+00
4	OOB Server	oob-server	2196f3	f	2019-12-29	2019-12-29 13:23:23.016803+00
6	Firewall	firewall	f44336	f	2019-12-29	2019-12-29 13:26:38.429086+00
7	Router	router	cddc39	f	2019-12-29	2019-12-29 13:26:46.30013+00
\.


--
-- Data for Name: dcim_devicetype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicetype (id, model, slug, u_height, is_full_depth, manufacturer_id, subdevice_role, part_number, comments, created, last_updated) FROM stdin;
2	Ubuntu 18.04 vm	ubuntu-18-04-vm	1	t	2	\N			2019-12-29	2019-12-29 12:09:32.559825+00
3	NetQ Cloud VM appliance	netq-cloud-vm-appliance	1	t	1	\N			2019-12-29	2019-12-29 12:10:38.678388+00
1	Cumulus VX Leaf	cumulus-vx-leaf	0	f	1	\N			2019-12-29	2019-12-29 13:34:07.040218+00
4	Cumulus VX Spine	cumulus-vx-spine	1	t	1	\N			2019-12-29	2019-12-29 13:34:53.025896+00
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
170	eth0	1000	t		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
4	lo	0	f		1	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
9	clagd-vxlan-anycast-ip	0	f		1	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
171	swp1	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
172	swp2	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
173	swp3	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
174	swp4	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
175	swp5	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
13	swp2	1000	f		1	\N	12	t	\N	\N	\N	\N	\N	\N	\N	\N
176	swp6	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
3	irb1000	0	f		1	\N	\N	t	\N	\N	100	1	\N	\N	\N	\N
137	irb1002	0	f		1	\N	\N	t	\N	\N	100	3	\N	\N	\N	\N
5	peerlink	200	f		1	44:38:39:ff:01:02	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
8	peerlink.4094	0	f	bgp_underlay	1	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
177	swp7	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
178	swp8	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
179	swp9	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
180	swp10	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
181	swp11	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
182	swp12	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
183	swp13	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
184	swp14	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
185	swp15	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
186	swp16	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
187	swp17	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
188	swp18	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
189	swp19	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
190	swp20	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
191	swp21	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
192	swp22	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
193	swp23	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
194	swp24	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
195	swp25	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
196	swp26	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
197	swp27	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
198	swp28	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
199	swp29	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
200	swp30	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
201	swp31	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
202	swp32	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
203	swp33	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
204	swp34	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1	bond01	200	f		1	\N	\N	t	\N	\N	200	\N	\N	\N	\N	\N
205	swp35	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
206	swp36	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
207	swp37	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
208	swp38	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
209	swp39	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
210	swp40	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
211	swp41	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
212	swp42	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
213	swp43	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
214	swp44	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
215	swp45	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
216	swp46	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
217	swp47	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
218	swp48	1200	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
219	swp49	1600	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
220	swp50	1600	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
221	swp51	1600	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
222	swp52	1600	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
223	swp53	1600	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
224	swp54	1600	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
225	swp55	1600	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
12	bond02	200	f		1	\N	\N	t	\N	\N	200	1	\N	\N	\N	\N
226	swp56	1600	f		71	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
227	eth0	1000	t		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
228	swp1	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
229	swp2	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
230	swp3	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
231	swp4	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
232	swp5	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
233	swp6	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
234	swp7	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
235	swp8	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
236	swp9	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
237	swp10	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
238	swp11	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
239	swp12	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
240	swp13	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
241	swp14	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
242	swp15	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
243	swp16	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
244	swp17	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
245	swp18	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
246	swp19	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
11	swp52	1000	f	bgp_underlay	1	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
6	swp49	1000	f		1	\N	5	t	\N	\N	\N	\N	\N	\N	\N	\N
7	swp50	1000	f		1	\N	5	t	\N	\N	\N	\N	\N	\N	\N	\N
247	swp20	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
248	swp21	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
249	swp22	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
250	swp23	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
251	swp24	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
252	swp25	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
253	swp26	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
254	swp27	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
255	swp28	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
256	swp29	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
257	swp30	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
258	swp31	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
259	swp32	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
260	swp33	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
261	swp34	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
262	swp35	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
263	swp36	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
264	swp37	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
265	swp38	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
266	swp39	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
267	swp40	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
268	swp41	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
269	swp42	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
270	swp43	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
271	swp44	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
272	swp45	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
273	swp46	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
274	swp47	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
275	swp48	1200	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
276	swp49	1600	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
277	swp50	1600	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
278	swp51	1600	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
279	swp52	1600	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
280	swp53	1600	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
281	swp54	1600	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
282	swp55	1600	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
283	swp56	1600	f		72	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
284	eth0	1000	t		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
285	swp1	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
286	swp2	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
287	swp3	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
288	swp4	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
289	swp5	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
290	swp6	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
291	swp7	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
292	swp8	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
293	swp9	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
294	swp10	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
295	swp11	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
296	swp12	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
297	swp13	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
298	swp14	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
299	swp15	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
300	swp16	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
301	swp17	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
302	swp18	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
303	swp19	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
304	swp20	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
305	swp21	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
306	swp22	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
136	irb1001	0	f		1	\N	\N	t	\N	\N	100	2	\N	\N	\N	\N
138	irb1003	0	f		1	\N	\N	t	\N	\N	100	4	\N	\N	\N	\N
139	irb1004	0	f		1	\N	\N	t	\N	\N	100	5	\N	\N	\N	\N
140	irb1005	0	f		1	\N	\N	t	\N	\N	100	6	\N	\N	\N	\N
307	swp23	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
308	swp24	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
309	swp25	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
310	swp26	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
311	swp27	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
312	swp28	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
313	swp29	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
314	swp30	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
315	swp31	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
316	swp32	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
317	swp33	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
318	swp34	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
10	swp51	1000	f	bgp_underlay	1	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
319	swp35	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
320	swp36	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
321	swp37	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
322	swp38	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
323	swp39	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
324	swp40	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
325	swp41	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
326	swp42	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
327	swp43	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
328	swp44	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
329	swp45	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
330	swp46	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
331	swp47	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
332	swp48	1200	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
333	swp49	1600	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
334	swp50	1600	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
335	swp51	1600	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
336	swp52	1600	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
337	swp53	1600	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
338	swp54	1600	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
339	swp55	1600	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
340	swp56	1600	f		73	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
341	eth0	1000	t		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
342	swp1	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
343	swp2	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
344	swp3	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
345	swp4	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
346	swp5	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
347	swp6	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
348	swp7	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
349	swp8	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
350	swp9	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
351	swp10	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
352	swp11	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
353	swp12	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
354	swp13	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
355	swp14	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
356	swp15	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
357	swp16	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
358	swp17	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
359	swp18	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
360	swp19	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
361	swp20	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
362	swp21	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
363	swp22	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
364	swp23	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
365	swp24	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
366	swp25	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
367	swp26	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
368	swp27	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
369	swp28	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
370	swp29	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
371	swp30	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
372	swp31	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
373	swp32	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
374	swp33	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
375	swp34	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
376	swp35	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
377	swp36	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
378	swp37	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
379	swp38	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
380	swp39	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
381	swp40	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
382	swp41	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
383	swp42	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
384	swp43	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
385	swp44	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
386	swp45	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
387	swp46	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
388	swp47	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
389	swp48	1200	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
390	swp49	1600	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
391	swp50	1600	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
392	swp51	1600	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
393	swp52	1600	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
394	swp53	1600	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
395	swp54	1600	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
396	swp55	1600	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
397	swp56	1600	f		74	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
398	eth0	1000	t		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
399	swp1	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
400	swp2	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
401	swp3	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
402	swp4	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
403	swp5	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
404	swp6	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
405	swp7	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
406	swp8	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
407	swp9	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
408	swp10	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
409	swp11	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
410	swp12	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
411	swp13	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
412	swp14	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
413	swp15	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
414	swp16	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
415	swp17	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
416	swp18	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
417	swp19	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
418	swp20	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
419	swp21	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
420	swp22	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
421	swp23	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
422	swp24	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
423	swp25	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
424	swp26	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
425	swp27	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
426	swp28	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
427	swp29	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
428	swp30	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
429	swp31	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
430	swp32	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
431	swp33	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
432	swp34	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
433	swp35	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
434	swp36	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
435	swp37	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
436	swp38	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
437	swp39	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
438	swp40	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
439	swp41	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
440	swp42	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
441	swp43	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
442	swp44	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
443	swp45	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
444	swp46	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
445	swp47	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
446	swp48	1200	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
447	swp49	1600	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
448	swp50	1600	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
449	swp51	1600	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
450	swp52	1600	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
451	swp53	1600	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
452	swp54	1600	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
453	swp55	1600	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
454	swp56	1600	f		75	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
455	eth0	1000	t		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
456	swp1	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
457	swp2	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
458	swp3	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
459	swp4	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
460	swp5	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
461	swp6	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
462	swp7	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
463	swp8	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
464	swp9	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
465	swp10	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
466	swp11	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
467	swp12	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
468	swp13	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
469	swp14	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
470	swp15	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
471	swp16	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
472	swp17	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
473	swp18	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
474	swp19	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
475	swp20	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
476	swp21	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
477	swp22	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
478	swp23	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
479	swp24	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
480	swp25	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
481	swp26	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
482	swp27	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
483	swp28	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
484	swp29	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
485	swp30	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
486	swp31	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
487	swp32	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
488	swp33	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
489	swp34	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
490	swp35	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
491	swp36	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
492	swp37	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
493	swp38	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
494	swp39	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
495	swp40	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
496	swp41	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
497	swp42	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
498	swp43	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
499	swp44	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
500	swp45	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
501	swp46	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
502	swp47	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
503	swp48	1200	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
504	swp49	1600	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
505	swp50	1600	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
506	swp51	1600	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
507	swp52	1600	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
508	swp53	1600	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
509	swp54	1600	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
510	swp55	1600	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
511	swp56	1600	f		76	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
512	eth0	1000	t		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
513	swp1	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
514	swp2	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
515	swp3	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
516	swp4	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
517	swp5	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
518	swp6	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
519	swp7	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
520	swp8	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
521	swp9	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
522	swp10	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
523	swp11	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
524	swp12	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
525	swp13	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
526	swp14	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
527	swp15	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
528	swp16	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
529	swp17	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
530	swp18	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
531	swp19	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
532	swp20	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
533	swp21	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
534	swp22	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
535	swp23	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
536	swp24	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
537	swp25	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
538	swp26	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
539	swp27	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
540	swp28	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
541	swp29	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
542	swp30	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
543	swp31	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
544	swp32	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
545	swp33	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
546	swp34	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
547	swp35	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
548	swp36	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
549	swp37	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
550	swp38	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
551	swp39	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
552	swp40	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
553	swp41	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
554	swp42	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
555	swp43	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
556	swp44	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
557	swp45	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
558	swp46	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
559	swp47	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
560	swp48	1200	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
561	swp49	1600	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
562	swp50	1600	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
563	swp51	1600	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
564	swp52	1600	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
565	swp53	1600	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
566	swp54	1600	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
567	swp55	1600	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
568	swp56	1600	f		77	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
569	eth0	1000	t		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
570	swp1	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
571	swp2	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
572	swp3	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
573	swp4	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
574	swp5	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
575	swp6	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
576	swp7	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
577	swp8	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
578	swp9	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
579	swp10	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
580	swp11	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
581	swp12	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
582	swp13	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
583	swp14	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
584	swp15	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
585	swp16	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
586	swp17	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
587	swp18	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
588	swp19	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
589	swp20	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
590	swp21	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
591	swp22	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
592	swp23	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
593	swp24	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
594	swp25	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
595	swp26	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
596	swp27	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
597	swp28	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
598	swp29	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
599	swp30	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
600	swp31	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
601	swp32	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
602	swp33	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
603	swp34	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
604	swp35	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
605	swp36	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
606	swp37	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
607	swp38	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
608	swp39	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
609	swp40	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
610	swp41	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
611	swp42	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
612	swp43	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
613	swp44	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
614	swp45	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
615	swp46	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
616	swp47	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
617	swp48	1200	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
618	swp49	1600	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
619	swp50	1600	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
620	swp51	1600	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
621	swp52	1600	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
622	swp53	1600	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
623	swp54	1600	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
624	swp55	1600	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
625	swp56	1600	f		78	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
626	eth0	1000	t		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
627	swp1	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
628	swp2	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
629	swp3	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
630	swp4	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
631	swp5	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
632	swp6	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
633	swp7	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
634	swp8	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
635	swp9	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
636	swp10	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
637	swp11	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
638	swp12	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
639	swp13	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
640	swp14	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
641	swp15	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
642	swp16	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
643	swp17	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
644	swp18	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
645	swp19	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
646	swp20	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
647	swp21	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
648	swp22	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
649	swp23	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
650	swp24	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
651	swp25	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
652	swp26	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
653	swp27	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
654	swp28	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
655	swp29	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
656	swp30	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
657	swp31	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
658	swp32	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
659	swp33	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
660	swp34	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
661	swp35	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
662	swp36	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
663	swp37	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
664	swp38	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
665	swp39	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
666	swp40	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
667	swp41	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
668	swp42	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
669	swp43	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
670	swp44	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
671	swp45	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
672	swp46	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
673	swp47	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
674	swp48	1200	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
675	swp49	1600	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
676	swp50	1600	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
677	swp51	1600	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
678	swp52	1600	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
679	swp53	1600	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
680	swp54	1600	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
681	swp55	1600	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
682	swp56	1600	f		79	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
683	eth0	1000	t		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
684	swp1	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
685	swp2	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
686	swp3	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
687	swp4	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
688	swp5	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
689	swp6	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
690	swp7	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
691	swp8	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
692	swp9	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
693	swp10	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
694	swp11	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
695	swp12	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
696	swp13	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
697	swp14	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
698	swp15	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
699	swp16	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
700	swp17	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
701	swp18	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
702	swp19	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
703	swp20	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
704	swp21	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
705	swp22	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
706	swp23	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
707	swp24	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
708	swp25	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
709	swp26	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
710	swp27	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
711	swp28	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
712	swp29	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
713	swp30	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
714	swp31	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
715	swp32	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
716	swp33	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
717	swp34	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
718	swp35	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
719	swp36	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
720	swp37	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
721	swp38	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
722	swp39	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
723	swp40	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
724	swp41	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
725	swp42	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
726	swp43	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
727	swp44	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
728	swp45	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
729	swp46	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
730	swp47	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
731	swp48	1200	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
732	swp49	1600	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
733	swp50	1600	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
734	swp51	1600	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
735	swp52	1600	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
736	swp53	1600	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
737	swp54	1600	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
738	swp55	1600	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
739	swp56	1600	f		80	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
740	eth0	1000	t		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
741	swp1	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
742	swp2	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
743	swp3	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
744	swp4	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
745	swp5	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
746	swp6	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
747	swp7	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
748	swp8	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
749	swp9	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
750	swp10	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
751	swp11	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
752	swp12	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
753	swp13	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
754	swp14	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
755	swp15	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
756	swp16	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
757	swp17	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
758	swp18	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
759	swp19	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
760	swp20	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
761	swp21	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
762	swp22	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
763	swp23	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
764	swp24	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
765	swp25	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
766	swp26	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
767	swp27	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
768	swp28	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
769	swp29	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
770	swp30	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
771	swp31	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
772	swp32	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
773	swp33	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
774	swp34	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
775	swp35	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
776	swp36	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
777	swp37	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
778	swp38	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
779	swp39	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
780	swp40	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
781	swp41	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
782	swp42	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
783	swp43	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
784	swp44	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
785	swp45	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
786	swp46	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
787	swp47	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
788	swp48	1200	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
789	swp49	1600	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
790	swp50	1600	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
791	swp51	1600	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
792	swp52	1600	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
793	swp53	1600	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
794	swp54	1600	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
795	swp55	1600	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
796	swp56	1600	f		81	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
797	eth0	1000	t		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
798	swp1	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
799	swp2	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
800	swp3	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
801	swp4	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
802	swp5	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
803	swp6	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
804	swp7	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
805	swp8	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
806	swp9	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
807	swp10	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
808	swp11	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
809	swp12	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
810	swp13	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
811	swp14	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
812	swp15	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
813	swp16	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
814	swp17	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
815	swp18	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
816	swp19	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
817	swp20	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
818	swp21	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
819	swp22	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
820	swp23	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
821	swp24	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
822	swp25	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
823	swp26	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
824	swp27	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
825	swp28	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
826	swp29	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
827	swp30	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
828	swp31	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
829	swp32	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
830	swp33	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
831	swp34	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
832	swp35	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
833	swp36	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
834	swp37	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
835	swp38	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
836	swp39	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
837	swp40	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
838	swp41	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
839	swp42	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
840	swp43	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
841	swp44	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
842	swp45	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
843	swp46	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
844	swp47	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
845	swp48	1200	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
846	swp49	1600	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
847	swp50	1600	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
848	swp51	1600	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
849	swp52	1600	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
850	swp53	1600	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
851	swp54	1600	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
852	swp55	1600	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
853	swp56	1600	f		82	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
854	eth0	1000	t		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
855	swp1	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
856	swp2	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
857	swp3	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
858	swp4	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
859	swp5	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
860	swp6	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
861	swp7	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
862	swp8	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
863	swp9	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
864	swp10	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
865	swp11	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
866	swp12	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
867	swp13	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
868	swp14	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
869	swp15	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
870	swp16	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
871	swp17	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
872	swp18	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
873	swp19	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
874	swp20	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
875	swp21	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
876	swp22	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
877	swp23	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
878	swp24	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
879	swp25	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
880	swp26	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
881	swp27	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
882	swp28	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
883	swp29	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
884	swp30	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
885	swp31	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
886	swp32	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
887	swp33	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
888	swp34	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
889	swp35	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
890	swp36	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
891	swp37	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
892	swp38	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
893	swp39	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
894	swp40	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
895	swp41	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
896	swp42	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
897	swp43	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
898	swp44	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
899	swp45	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
900	swp46	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
901	swp47	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
902	swp48	1200	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
903	swp49	1600	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
904	swp50	1600	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
905	swp51	1600	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
906	swp52	1600	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
907	swp53	1600	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
908	swp54	1600	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
909	swp55	1600	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
910	swp56	1600	f		83	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
911	eth0	1000	t		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
912	swp1	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
913	swp2	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
914	swp3	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
915	swp4	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
916	swp5	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
917	swp6	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
918	swp7	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
919	swp8	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
920	swp9	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
921	swp10	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
922	swp11	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
923	swp12	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
924	swp13	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
925	swp14	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
926	swp15	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
927	swp16	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
928	swp17	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
929	swp18	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
930	swp19	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
931	swp20	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
932	swp21	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
933	swp22	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
934	swp23	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
935	swp24	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
936	swp25	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
937	swp26	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
938	swp27	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
939	swp28	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
940	swp29	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
941	swp30	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
942	swp31	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
943	swp32	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
944	swp33	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
945	swp34	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
946	swp35	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
947	swp36	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
948	swp37	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
949	swp38	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
950	swp39	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
951	swp40	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
952	swp41	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
953	swp42	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
954	swp43	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
955	swp44	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
956	swp45	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
957	swp46	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
958	swp47	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
959	swp48	1200	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
960	swp49	1600	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
961	swp50	1600	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
962	swp51	1600	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
963	swp52	1600	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
964	swp53	1600	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
965	swp54	1600	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
966	swp55	1600	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
967	swp56	1600	f		87	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
968	eth0	1000	t		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
969	swp1	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
970	swp2	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
971	swp3	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
972	swp4	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
973	swp5	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
974	swp6	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
975	swp7	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
976	swp8	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
977	swp9	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
978	swp10	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
979	swp11	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
980	swp12	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
981	swp13	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
982	swp14	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
983	swp15	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
984	swp16	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
985	swp17	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
986	swp18	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
987	swp19	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
988	swp20	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
989	swp21	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
990	swp22	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
991	swp23	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
992	swp24	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
993	swp25	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
994	swp26	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
995	swp27	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
996	swp28	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
997	swp29	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
998	swp30	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
999	swp31	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1000	swp32	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1001	swp33	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1002	swp34	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1003	swp35	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1004	swp36	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1005	swp37	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1006	swp38	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1007	swp39	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1008	swp40	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1009	swp41	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1010	swp42	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1011	swp43	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1012	swp44	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1013	swp45	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1014	swp46	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1015	swp47	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1016	swp48	1200	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1017	swp49	1600	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1018	swp50	1600	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1019	swp51	1600	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1020	swp52	1600	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1021	swp53	1600	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1022	swp54	1600	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1023	swp55	1600	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1024	swp56	1600	f		88	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1025	eth0	1000	t		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1026	swp1	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1027	swp2	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1028	swp3	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1029	swp4	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1030	swp5	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1031	swp6	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1032	swp7	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1033	swp8	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1034	swp9	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1035	swp10	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1036	swp11	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1037	swp12	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1038	swp13	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1039	swp14	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1040	swp15	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1041	swp16	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1042	swp17	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1043	swp18	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1044	swp19	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1045	swp20	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1046	swp21	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1047	swp22	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1048	swp23	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1049	swp24	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1050	swp25	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1051	swp26	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1052	swp27	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1053	swp28	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1054	swp29	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1055	swp30	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1056	swp31	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1057	swp32	1600	f		109	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1058	eth0	1000	t		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1059	swp1	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1060	swp2	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1061	swp3	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1062	swp4	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1063	swp5	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1064	swp6	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1065	swp7	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1066	swp8	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1067	swp9	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1068	swp10	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1069	swp11	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1070	swp12	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1071	swp13	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1072	swp14	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1073	swp15	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1074	swp16	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1075	swp17	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1076	swp18	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1077	swp19	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1078	swp20	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1079	swp21	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1080	swp22	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1081	swp23	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1082	swp24	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1083	swp25	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1084	swp26	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1085	swp27	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1086	swp28	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1087	swp29	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1088	swp30	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1089	swp31	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1090	swp32	1600	f		110	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1091	eth0	1000	t		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1092	swp1	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1093	swp2	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1094	swp3	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1095	swp4	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1096	swp5	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1097	swp6	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1098	swp7	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1099	swp8	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1100	swp9	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1101	swp10	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1102	swp11	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1103	swp12	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1104	swp13	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1105	swp14	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1106	swp15	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1107	swp16	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1108	swp17	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1109	swp18	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1110	swp19	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1111	swp20	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1112	swp21	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1113	swp22	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1114	swp23	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1115	swp24	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1116	swp25	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1117	swp26	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1118	swp27	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1119	swp28	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1120	swp29	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1121	swp30	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1122	swp31	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1123	swp32	1600	f		111	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1124	eth0	1000	t		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1125	swp1	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1126	swp2	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1127	swp3	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1128	swp4	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1129	swp5	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1130	swp6	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1131	swp7	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1132	swp8	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1133	swp9	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1134	swp10	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1135	swp11	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1136	swp12	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1137	swp13	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1138	swp14	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1139	swp15	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1140	swp16	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1141	swp17	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1142	swp18	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1143	swp19	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1144	swp20	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1145	swp21	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1146	swp22	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1147	swp23	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1148	swp24	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1149	swp25	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1150	swp26	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1151	swp27	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1152	swp28	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1153	swp29	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1154	swp30	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1155	swp31	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1156	swp32	1600	f		112	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1157	eth0	1000	t		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1158	swp1	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1159	swp2	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1160	swp3	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1161	swp4	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1162	swp5	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1163	swp6	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1164	swp7	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1165	swp8	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1166	swp9	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1167	swp10	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1168	swp11	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1169	swp12	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1170	swp13	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1171	swp14	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1172	swp15	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1173	swp16	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1174	swp17	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1175	swp18	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1176	swp19	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1177	swp20	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1178	swp21	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1179	swp22	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1180	swp23	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1181	swp24	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1182	swp25	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1183	swp26	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1184	swp27	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1185	swp28	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1186	swp29	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1187	swp30	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1188	swp31	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1189	swp32	1600	f		113	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1190	eth0	1000	t		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1191	swp1	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1192	swp2	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1193	swp3	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1194	swp4	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1195	swp5	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1196	swp6	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1197	swp7	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1198	swp8	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1199	swp9	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1200	swp10	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1201	swp11	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1202	swp12	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1203	swp13	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1204	swp14	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1205	swp15	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1206	swp16	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1207	swp17	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1208	swp18	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1209	swp19	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1210	swp20	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1211	swp21	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1212	swp22	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1213	swp23	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1214	swp24	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1215	swp25	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1216	swp26	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1217	swp27	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1218	swp28	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1219	swp29	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1220	swp30	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1221	swp31	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1222	swp32	1600	f		114	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1223	eth0	1000	t		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1224	swp1	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1225	swp2	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1226	swp3	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1227	swp4	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1228	swp5	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1229	swp6	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1230	swp7	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1231	swp8	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1232	swp9	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1233	swp10	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1234	swp11	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1235	swp12	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1236	swp13	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1237	swp14	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1238	swp15	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1239	swp16	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1240	swp17	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1241	swp18	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1242	swp19	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1243	swp20	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1244	swp21	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1245	swp22	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1246	swp23	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1247	swp24	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1248	swp25	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1249	swp26	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1250	swp27	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1251	swp28	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1252	swp29	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1253	swp30	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1254	swp31	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1255	swp32	1600	f		115	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1256	eth0	1000	t		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1257	swp1	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1258	swp2	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1259	swp3	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1260	swp4	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1261	swp5	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1262	swp6	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1263	swp7	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1264	swp8	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1265	swp9	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1266	swp10	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1267	swp11	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1268	swp12	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1269	swp13	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1270	swp14	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1271	swp15	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1272	swp16	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1273	swp17	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1274	swp18	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1275	swp19	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1276	swp20	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1277	swp21	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1278	swp22	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1279	swp23	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1280	swp24	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1281	swp25	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1282	swp26	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1283	swp27	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1284	swp28	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1285	swp29	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1286	swp30	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1287	swp31	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1288	swp32	1600	f		116	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1289	eth0	1000	t		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1290	swp1	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1291	swp2	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1292	swp3	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1293	swp4	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1294	swp5	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1295	swp6	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1296	swp7	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1297	swp8	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1298	swp9	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1299	swp10	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1300	swp11	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1301	swp12	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1302	swp13	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1303	swp14	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1304	swp15	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1305	swp16	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1306	swp17	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1307	swp18	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1308	swp19	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1309	swp20	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1310	swp21	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1311	swp22	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1312	swp23	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1313	swp24	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1314	swp25	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1315	swp26	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1316	swp27	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1317	swp28	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1318	swp29	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1319	swp30	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1320	swp31	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1321	swp32	1600	f		117	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1322	eth0	1000	t		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1323	swp1	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1324	swp2	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1325	swp3	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1326	swp4	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1327	swp5	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1328	swp6	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1329	swp7	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1330	swp8	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1331	swp9	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1332	swp10	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1333	swp11	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1334	swp12	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1335	swp13	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1336	swp14	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1337	swp15	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1338	swp16	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1339	swp17	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1340	swp18	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1341	swp19	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1342	swp20	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1343	swp21	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1344	swp22	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1345	swp23	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1346	swp24	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1347	swp25	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1348	swp26	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1349	swp27	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1350	swp28	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1351	swp29	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1352	swp30	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1353	swp31	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1354	swp32	1600	f		118	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1355	eth0	1000	t		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1356	swp1	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1357	swp2	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1358	swp3	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1359	swp4	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1360	swp5	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1361	swp6	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1362	swp7	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1363	swp8	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1364	swp9	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1365	swp10	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1366	swp11	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1367	swp12	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1368	swp13	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1369	swp14	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1370	swp15	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1371	swp16	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1372	swp17	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1373	swp18	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1374	swp19	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1375	swp20	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1376	swp21	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1377	swp22	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1378	swp23	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1379	swp24	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1380	swp25	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1381	swp26	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1382	swp27	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1383	swp28	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1384	swp29	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1385	swp30	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1386	swp31	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1387	swp32	1600	f		119	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1388	eth0	1000	t		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1389	swp1	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1390	swp2	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1391	swp3	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1392	swp4	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1393	swp5	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1394	swp6	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1395	swp7	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1396	swp8	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1397	swp9	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1398	swp10	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1399	swp11	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1400	swp12	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1401	swp13	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1402	swp14	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1403	swp15	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1404	swp16	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1405	swp17	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1406	swp18	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1407	swp19	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1408	swp20	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1409	swp21	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1410	swp22	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1411	swp23	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1412	swp24	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1413	swp25	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1414	swp26	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1415	swp27	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1416	swp28	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1417	swp29	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1418	swp30	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1419	swp31	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1420	swp32	1600	f		120	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1421	eth0	1000	t		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1422	swp1	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1423	swp2	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1424	swp3	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1425	swp4	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1426	swp5	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1427	swp6	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1428	swp7	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1429	swp8	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1430	swp9	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1431	swp10	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1432	swp11	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1433	swp12	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1434	swp13	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1435	swp14	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1436	swp15	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1437	swp16	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1438	swp17	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1439	swp18	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1440	swp19	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1441	swp20	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1442	swp21	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1443	swp22	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1444	swp23	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1445	swp24	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1446	swp25	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1447	swp26	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1448	swp27	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1449	swp28	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1450	swp29	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1451	swp30	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1452	swp31	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1453	swp32	1600	f		121	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1454	eth0	1000	t		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1455	swp1	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1456	swp2	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1457	swp3	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1458	swp4	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1459	swp5	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1460	swp6	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1461	swp7	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1462	swp8	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1463	swp9	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1464	swp10	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1465	swp11	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1466	swp12	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1467	swp13	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1468	swp14	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1469	swp15	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1470	swp16	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1471	swp17	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1472	swp18	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1473	swp19	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1474	swp20	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1475	swp21	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1476	swp22	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1477	swp23	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1478	swp24	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1479	swp25	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1480	swp26	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1481	swp27	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1482	swp28	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1483	swp29	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1484	swp30	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1485	swp31	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1486	swp32	1600	f		122	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1487	eth0	1000	t		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1488	swp1	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1489	swp2	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1490	swp3	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1491	swp4	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1492	swp5	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1493	swp6	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1494	swp7	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1495	swp8	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1496	swp9	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1497	swp10	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1498	swp11	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1499	swp12	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1500	swp13	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1501	swp14	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1502	swp15	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1503	swp16	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1504	swp17	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1505	swp18	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1506	swp19	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1507	swp20	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1508	swp21	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1509	swp22	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1510	swp23	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1511	swp24	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1512	swp25	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1513	swp26	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1514	swp27	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1515	swp28	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1516	swp29	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1517	swp30	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1518	swp31	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1519	swp32	1600	f		123	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1520	eth0	1000	t		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1521	swp1	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1522	swp2	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1523	swp3	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1524	swp4	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1525	swp5	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1526	swp6	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1527	swp7	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1528	swp8	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1529	swp9	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1530	swp10	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1531	swp11	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1532	swp12	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1533	swp13	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1534	swp14	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1535	swp15	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1536	swp16	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1537	swp17	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1538	swp18	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1539	swp19	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1540	swp20	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1541	swp21	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1542	swp22	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1543	swp23	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1544	swp24	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1545	swp25	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1546	swp26	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1547	swp27	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1548	swp28	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1549	swp29	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1550	swp30	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1551	swp31	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
1552	swp32	1600	f		124	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: dcim_interface_tagged_vlans; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interface_tagged_vlans (id, interface_id, vlan_id) FROM stdin;
3	1	2
4	1	1
5	12	1
6	12	2
49	1	3
50	1	4
51	1	5
52	1	6
53	12	3
54	12	4
55	12	5
56	12	6
\.


--
-- Data for Name: dcim_interfacetemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interfacetemplate (id, name, type, mgmt_only, device_type_id) FROM stdin;
1	eth0	1000	t	1
2	swp1	1200	f	1
3	swp2	1200	f	1
4	swp3	1200	f	1
5	swp4	1200	f	1
6	swp5	1200	f	1
7	swp6	1200	f	1
8	swp7	1200	f	1
9	swp8	1200	f	1
10	swp9	1200	f	1
11	swp10	1200	f	1
12	swp11	1200	f	1
13	swp12	1200	f	1
14	swp13	1200	f	1
15	swp14	1200	f	1
16	swp15	1200	f	1
17	swp16	1200	f	1
18	swp17	1200	f	1
19	swp18	1200	f	1
20	swp19	1200	f	1
21	swp20	1200	f	1
22	swp21	1200	f	1
23	swp22	1200	f	1
24	swp23	1200	f	1
25	swp24	1200	f	1
26	swp25	1200	f	1
27	swp26	1200	f	1
28	swp27	1200	f	1
29	swp28	1200	f	1
30	swp29	1200	f	1
31	swp30	1200	f	1
32	swp31	1200	f	1
33	swp32	1200	f	1
34	swp33	1200	f	1
35	swp34	1200	f	1
36	swp35	1200	f	1
37	swp36	1200	f	1
38	swp37	1200	f	1
39	swp38	1200	f	1
40	swp39	1200	f	1
41	swp40	1200	f	1
42	swp41	1200	f	1
43	swp42	1200	f	1
44	swp43	1200	f	1
45	swp44	1200	f	1
46	swp45	1200	f	1
47	swp46	1200	f	1
48	swp47	1200	f	1
49	swp48	1200	f	1
50	swp49	1600	f	1
51	swp50	1600	f	1
52	swp51	1600	f	1
53	swp52	1600	f	1
54	swp53	1600	f	1
55	swp54	1600	f	1
56	swp55	1600	f	1
57	swp56	1600	f	1
58	eth0	1000	t	4
59	swp1	1600	f	4
60	swp2	1600	f	4
61	swp3	1600	f	4
62	swp4	1600	f	4
63	swp5	1600	f	4
64	swp6	1600	f	4
65	swp7	1600	f	4
66	swp8	1600	f	4
67	swp9	1600	f	4
68	swp10	1600	f	4
69	swp11	1600	f	4
70	swp12	1600	f	4
71	swp13	1600	f	4
72	swp14	1600	f	4
73	swp15	1600	f	4
74	swp16	1600	f	4
75	swp17	1600	f	4
76	swp18	1600	f	4
77	swp19	1600	f	4
78	swp20	1600	f	4
79	swp21	1600	f	4
80	swp22	1600	f	4
81	swp23	1600	f	4
82	swp24	1600	f	4
83	swp25	1600	f	4
84	swp26	1600	f	4
85	swp27	1600	f	4
86	swp28	1600	f	4
87	swp29	1600	f	4
88	swp30	1600	f	4
89	swp31	1600	f	4
90	swp32	1600	f	4
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
2	Canonical	canonical	2019-12-29	2019-12-29 12:08:19.668268+00
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
6	2018-06-09	2019-12-29 11:56:59.965097+00	Edge	\N	42		7	2	\N	\N	19	\N	f		3	\N	\N	\N	\N
1	2018-06-03	2019-12-29 12:02:33.315106+00	Rack1-pod1	\N	42		4	2	\N	\N	19	\N	f		3	\N	\N	\N	\N
3	2018-06-09	2019-12-29 12:02:33.3314+00	Rack2-pod1	\N	42		4	2	\N	\N	19	\N	f		3	\N	\N	\N	\N
2	2018-06-08	2019-12-29 12:02:33.352099+00	Spine-pod1	\N	42		4	2	\N	\N	19	\N	f		3	\N	\N	\N	\N
9	2019-12-29	2019-12-29 12:03:27.404528+00	Service-pod1	\N	42		4	2	\N	\N	19	\N	f		3	\N	\N	\N	\N
10	2019-12-29	2019-12-29 12:05:36.429216+00	Rack1-pod2	\N	42		4	2	\N	\N	19	\N	f		3	\N	\N	\N	\N
11	2019-12-29	2019-12-29 12:05:36.436536+00	Rack2-pod2	\N	42		4	2	\N	\N	19	\N	f		3	\N	\N	\N	\N
12	2019-12-29	2019-12-29 12:05:36.443002+00	Service-pod2	\N	42		4	2	\N	\N	19	\N	f		3	\N	\N	\N	\N
13	2019-12-29	2019-12-29 12:05:36.449548+00	Spine-pod2	\N	42		4	2	\N	\N	19	\N	f		3	\N	\N	\N	\N
14	2019-12-29	2019-12-29 12:06:34.938474+00	3tier	\N	42		6	2	\N	\N	19	\N	f		3	\N	\N	\N	\N
15	2019-12-29	2019-12-29 12:10:08.472404+00	OOB	\N	42		\N	2	\N	\N	19	\N	f		3	\N	\N	\N	\N
\.


--
-- Data for Name: dcim_rackgroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rackgroup (id, name, slug, site_id, created, last_updated) FROM stdin;
4	pod1	pod1	2	2019-12-29	2019-12-29 11:54:39.763631+00
5	pod2	pod2	2	2019-12-29	2019-12-29 11:55:41.40499+00
6	3tier	3tier	2	2019-12-29	2019-12-29 11:55:53.104008+00
7	edge	edge	2	2019-12-29	2019-12-29 11:56:05.640659+00
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
2	2019-12-29	2019-12-29 11:52:35.899688+00	Cumulus Networks CLdemo2	cldemo2		\N				\N				\N		1		\N	\N
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
vvlyfselfigv6yrtdrp4zx7icmxfeoa5	NDgxYTU0NGE3Y2ZhNDYzMzIzM2ZkZWIyNTUzMDlkMDBiMWM0Yjg2MDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXRpbGl0aWVzLmF1dGhfYmFja2VuZHMuVmlld0V4ZW1wdE1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjE2MDY2MmY4N2IyMDM3NzdkNjA3NDE1OGZiNTZkYjI2NTE0OGNlMjkifQ==	2020-01-12 11:50:34.723594+00
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
1	2019-12-29 11:51:07.667203+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	4	\N	leaf02	{"face": null, "name": "leaf02", "rack": 1, "site": 1, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2018-06-08", "comments": "", "platform": 1, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2018-11-07T16:57:09.324Z", "custom_fields": {"ASN": "65112"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
2	2019-12-29 11:51:07.676287+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	5	\N	spine01	{"face": null, "name": "spine01", "rack": 2, "site": 1, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2018-06-08", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2018-06-08T21:58:28.048Z", "custom_fields": {"ASN": "65101"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
3	2019-12-29 11:51:07.680839+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	6	\N	spine02	{"face": null, "name": "spine02", "rack": 2, "site": 1, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2018-06-08", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2018-06-08T22:35:21.708Z", "custom_fields": {"ASN": "65102"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
4	2019-12-29 11:51:07.684908+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	7	\N	leaf03	{"face": null, "name": "leaf03", "rack": 3, "site": 1, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2018-06-08", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2018-06-09T07:42:23.365Z", "custom_fields": {"ASN": "65121"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
5	2019-12-29 11:51:07.688871+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	8	\N	leaf04	{"face": null, "name": "leaf04", "rack": 3, "site": 1, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2018-06-09", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2018-11-08T18:52:42.840Z", "custom_fields": {"ASN": "65122"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
6	2019-12-29 11:51:07.69265+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	9	\N	service01	{"face": null, "name": "service01", "rack": 4, "site": 1, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2018-06-09", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-06-08T15:19:27.946Z", "custom_fields": {"ASN": "65131"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
7	2019-12-29 11:51:07.6965+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	10	\N	service02	{"face": null, "name": "service02", "rack": 4, "site": 1, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2018-06-09", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-06-08T15:19:45.693Z", "custom_fields": {"ASN": "65132"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
8	2019-12-29 11:51:07.70021+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	11	\N	super01	{"face": null, "name": "super01", "rack": 5, "site": 1, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2018-06-09", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2018-06-09T08:15:21.612Z", "custom_fields": {"ASN": "65901"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
9	2019-12-29 11:51:07.703817+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	12	\N	super02	{"face": null, "name": "super02", "rack": 5, "site": 1, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2018-06-09", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2018-06-09T08:15:35.447Z", "custom_fields": {"ASN": "65902"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
10	2019-12-29 11:51:07.70734+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	13	\N	exit01	{"face": null, "name": "exit01", "rack": 6, "site": 1, "tags": [], "serial": "", "status": 0, "tenant": null, "cluster": null, "created": "2018-06-09", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-06-08T15:20:08.981Z", "custom_fields": {"ASN": "65801"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
11	2019-12-29 11:51:07.710584+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	14	\N	exit02	{"face": null, "name": "exit02", "rack": 6, "site": 1, "tags": [], "serial": "", "status": 0, "tenant": null, "cluster": null, "created": "2018-06-09", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-06-08T15:20:30.346Z", "custom_fields": {"ASN": "65802"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
12	2019-12-29 11:51:07.713657+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	15	\N	rtr01	{"face": null, "name": "rtr01", "rack": 6, "site": 1, "tags": [], "serial": "", "status": 0, "tenant": null, "cluster": null, "created": "2018-06-09", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2018-06-09T10:56:18.130Z", "custom_fields": {"ASN": "65701"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
13	2019-12-29 11:51:07.716574+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	16	\N	rtr02	{"face": null, "name": "rtr02", "rack": 6, "site": 1, "tags": [], "serial": "", "status": 0, "tenant": null, "cluster": null, "created": "2018-06-09", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2018-06-09T10:56:18.153Z", "custom_fields": {"ASN": "65702"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
14	2019-12-29 11:51:07.721549+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	4	\N	fc00:10::1/64	{"vrf": 1, "role": 41, "tags": [], "family": 6, "status": 1, "tenant": 1, "address": "fc00:10::1/64", "created": "2018-06-03", "dns_name": "", "interface": 18, "nat_inside": null, "description": "", "last_updated": "2018-06-08T23:22:15.278Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
15	2019-12-29 11:51:07.726621+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	6	\N	fc00:10::3/64	{"vrf": 1, "role": null, "tags": [], "family": 6, "status": 1, "tenant": 1, "address": "fc00:10::3/64", "created": "2018-06-03", "dns_name": "", "interface": 18, "nat_inside": null, "description": "", "last_updated": "2018-06-08T23:22:46.362Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
16	2019-12-29 11:51:07.731281+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	8	\N	169.254.1.2/30	{"vrf": null, "role": null, "tags": [], "family": 4, "status": 1, "tenant": null, "address": "169.254.1.2/30", "created": "2018-06-03", "dns_name": "", "interface": 21, "nat_inside": null, "description": "", "last_updated": "2018-06-08T20:20:21.168Z", "custom_fields": {"clag_peer_ip": "169.254.1.1", "clag_backup_ip": "192.168.200.21"}}	38	\N	1
17	2019-12-29 11:51:07.735967+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	11	\N	10.10.10.2/32	{"vrf": null, "role": 10, "tags": [], "family": 4, "status": 1, "tenant": null, "address": "10.10.10.2/32", "created": "2018-06-08", "dns_name": "", "interface": 19, "nat_inside": null, "description": "", "last_updated": "2018-06-08T20:17:59.798Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
18	2019-12-29 11:51:07.744382+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	12	\N	192.168.10.1/24	{"vrf": 1, "role": 41, "tags": [], "family": 4, "status": 1, "tenant": 1, "address": "192.168.10.1/24", "created": "2018-06-08", "dns_name": "", "interface": 18, "nat_inside": null, "description": "", "last_updated": "2018-06-08T23:21:48.785Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
19	2019-12-29 11:51:07.74857+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	14	\N	192.168.10.3/24	{"vrf": 1, "role": null, "tags": [], "family": 4, "status": 1, "tenant": 1, "address": "192.168.10.3/24", "created": "2018-06-08", "dns_name": "", "interface": 18, "nat_inside": null, "description": "", "last_updated": "2018-06-08T23:22:04.357Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
20	2019-12-29 11:51:07.753707+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	15	\N	10.100.100.12/32	{"vrf": null, "role": 30, "tags": [], "family": 4, "status": 1, "tenant": null, "address": "10.100.100.12/32", "created": "2018-06-08", "dns_name": "", "interface": 17, "nat_inside": null, "description": "", "last_updated": "2018-06-08T21:30:04.433Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
21	2019-12-29 11:51:07.758916+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	18	\N	10.10.20.1/32	{"vrf": null, "role": 10, "tags": [], "family": 4, "status": 1, "tenant": null, "address": "10.10.20.1/32", "created": "2018-06-08", "dns_name": "", "interface": 28, "nat_inside": null, "description": "", "last_updated": "2018-06-08T22:36:50.542Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
22	2019-12-29 11:51:07.763976+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	19	\N	10.10.20.2/32	{"vrf": null, "role": 10, "tags": [], "family": 4, "status": 1, "tenant": null, "address": "10.10.20.2/32", "created": "2018-06-08", "dns_name": "", "interface": 35, "nat_inside": null, "description": "", "last_updated": "2018-06-08T22:38:33.425Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
23	2019-12-29 11:51:07.768897+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	21	\N	10.10.10.3/32	{"vrf": null, "role": 10, "tags": [], "family": 4, "status": 1, "tenant": null, "address": "10.10.10.3/32", "created": "2018-06-08", "dns_name": "", "interface": 46, "nat_inside": null, "description": "", "last_updated": "2018-06-08T23:59:01.661Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
24	2019-12-29 11:51:07.773573+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	22	\N	169.254.1.1/30	{"vrf": null, "role": null, "tags": [], "family": 4, "status": 1, "tenant": null, "address": "169.254.1.1/30", "created": "2018-06-09", "dns_name": "", "interface": 48, "nat_inside": null, "description": "", "last_updated": "2018-06-09T00:00:28.026Z", "custom_fields": {"clag_peer_ip": "169.254.1.2", "clag_backup_ip": "192.168.200.17"}}	38	\N	1
25	2019-12-29 11:51:07.778665+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	27	\N	169.254.1.2/30	{"vrf": null, "role": null, "tags": [], "family": 4, "status": 1, "tenant": null, "address": "169.254.1.2/30", "created": "2018-06-09", "dns_name": "", "interface": 61, "nat_inside": null, "description": "", "last_updated": "2018-06-09T00:15:54.709Z", "custom_fields": {"clag_peer_ip": "169.254.1.1", "clag_backup_ip": "192.168.200.20"}}	38	\N	1
26	2019-12-29 11:51:07.783332+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	28	\N	10.10.10.4/32	{"vrf": null, "role": 10, "tags": [], "family": 4, "status": 1, "tenant": null, "address": "10.10.10.4/32", "created": "2018-06-09", "dns_name": "", "interface": 59, "nat_inside": null, "description": "", "last_updated": "2018-06-09T10:06:15.154Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
27	2019-12-29 11:51:07.788405+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	34	\N	10.100.100.56/32	{"vrf": null, "role": 30, "tags": [], "family": 4, "status": 1, "tenant": null, "address": "10.100.100.56/32", "created": "2018-06-09", "dns_name": "", "interface": 70, "nat_inside": null, "description": "", "last_updated": "2018-06-09T08:37:02.310Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
28	2019-12-29 11:51:07.793057+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	35	\N	10.10.10.5/32	{"vrf": null, "role": 10, "tags": [], "family": 4, "status": 1, "tenant": null, "address": "10.10.10.5/32", "created": "2018-06-09", "dns_name": "", "interface": 72, "nat_inside": null, "description": "", "last_updated": "2018-06-09T08:37:33.395Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
29	2019-12-29 11:51:07.798107+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	36	\N	169.254.1.1/30	{"vrf": null, "role": null, "tags": [], "family": 4, "status": 1, "tenant": null, "address": "169.254.1.1/30", "created": "2018-06-09", "dns_name": "", "interface": 74, "nat_inside": null, "description": "", "last_updated": "2018-06-09T08:39:11.687Z", "custom_fields": {"clag_peer_ip": "169.254.1.2", "clag_backup_ip": "192.168.200.29"}}	38	\N	1
254	2019-12-29 12:01:18.519033+00	admin	d65118f3-3f3a-4ea9-b156-23c0eb2ade0b	2	2	\N	1001 (Vlan1001)	{"vid": 1001, "name": "Vlan1001", "role": null, "site": 2, "tags": [], "group": null, "status": 1, "tenant": null, "created": "2018-06-03", "description": "", "last_updated": "2019-12-29T12:01:18.441Z", "custom_fields": {}}	42	\N	1
30	2019-12-29 11:51:07.802644+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	37	\N	192.168.10.1/24	{"vrf": 1, "role": 41, "tags": [], "family": 4, "status": 1, "tenant": 1, "address": "192.168.10.1/24", "created": "2018-06-09", "dns_name": "", "interface": 71, "nat_inside": null, "description": "", "last_updated": "2018-06-09T10:05:52.622Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
31	2019-12-29 11:51:07.806975+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	38	\N	192.168.10.6/24	{"vrf": 1, "role": null, "tags": [], "family": 4, "status": 1, "tenant": 1, "address": "192.168.10.6/24", "created": "2018-06-09", "dns_name": "", "interface": 71, "nat_inside": null, "description": "", "last_updated": "2018-06-09T10:04:52.146Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
32	2019-12-29 11:51:07.810906+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	39	\N	fc00:10::6/64	{"vrf": 1, "role": null, "tags": [], "family": 6, "status": 1, "tenant": 1, "address": "fc00:10::6/64", "created": "2018-06-09", "dns_name": "", "interface": 71, "nat_inside": null, "description": "", "last_updated": "2018-06-09T10:13:35.532Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
33	2019-12-29 11:51:07.814741+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	40	\N	fc00:10::1/64	{"vrf": 1, "role": 41, "tags": [], "family": 6, "status": 1, "tenant": 1, "address": "fc00:10::1/64", "created": "2018-06-09", "dns_name": "", "interface": 71, "nat_inside": null, "description": "", "last_updated": "2018-06-09T10:14:08.887Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
34	2019-12-29 11:51:07.819783+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	41	\N	10.100.100.56/32	{"vrf": null, "role": 30, "tags": [], "family": 4, "status": 1, "tenant": null, "address": "10.100.100.56/32", "created": "2018-06-09", "dns_name": "", "interface": 83, "nat_inside": null, "description": "", "last_updated": "2018-06-09T08:48:52.770Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
35	2019-12-29 11:51:07.824766+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	42	\N	10.10.10.6/32	{"vrf": null, "role": 10, "tags": [], "family": 4, "status": 1, "tenant": null, "address": "10.10.10.6/32", "created": "2018-06-09", "dns_name": "", "interface": 85, "nat_inside": null, "description": "", "last_updated": "2018-06-09T08:49:57.197Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
36	2019-12-29 11:51:07.831289+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	43	\N	169.254.1.2/30	{"vrf": null, "role": null, "tags": [], "family": 4, "status": 1, "tenant": null, "address": "169.254.1.2/30", "created": "2018-06-09", "dns_name": "", "interface": 87, "nat_inside": null, "description": "", "last_updated": "2018-06-09T08:51:12.140Z", "custom_fields": {"clag_peer_ip": "169.254.1.1", "clag_backup_ip": "192.168.200.32"}}	38	\N	1
37	2019-12-29 11:51:07.837926+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	44	\N	192.168.10.1/24	{"vrf": 1, "role": 41, "tags": [], "family": 4, "status": 1, "tenant": 1, "address": "192.168.10.1/24", "created": "2018-06-09", "dns_name": "", "interface": 84, "nat_inside": null, "description": "", "last_updated": "2018-06-09T10:05:52.630Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
38	2019-12-29 11:51:07.84305+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	45	\N	192.168.10.7/24	{"vrf": 1, "role": null, "tags": [], "family": 4, "status": 1, "tenant": 1, "address": "192.168.10.7/24", "created": "2018-06-09", "dns_name": "", "interface": 84, "nat_inside": null, "description": "", "last_updated": "2018-06-09T10:05:30.547Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
39	2019-12-29 11:51:07.84699+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	46	\N	fc00:10::1/64	{"vrf": 1, "role": 41, "tags": [], "family": 6, "status": 1, "tenant": 1, "address": "fc00:10::1/64", "created": "2018-06-09", "dns_name": "", "interface": 84, "nat_inside": null, "description": "", "last_updated": "2018-06-09T10:14:08.893Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
40	2019-12-29 11:51:07.850956+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	47	\N	fc00:10::7/64	{"vrf": 1, "role": null, "tags": [], "family": 6, "status": 1, "tenant": 1, "address": "fc00:10::7/64", "created": "2018-06-09", "dns_name": "", "interface": 84, "nat_inside": null, "description": "", "last_updated": "2018-06-09T10:13:35.540Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
41	2019-12-29 11:51:07.855857+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	48	\N	10.10.30.1/32	{"vrf": null, "role": 10, "tags": [], "family": 4, "status": 1, "tenant": null, "address": "10.10.30.1/32", "created": "2018-06-09", "dns_name": "", "interface": 94, "nat_inside": null, "description": "", "last_updated": "2018-06-09T08:54:31.276Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
42	2019-12-29 11:51:07.860989+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	49	\N	10.10.30.2/32	{"vrf": null, "role": 10, "tags": [], "family": 4, "status": 1, "tenant": null, "address": "10.10.30.2/32", "created": "2018-06-09", "dns_name": "", "interface": 99, "nat_inside": null, "description": "", "last_updated": "2018-06-09T08:58:45.482Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
43	2019-12-29 11:51:07.866344+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	51	\N	192.168.11.3/24	{"vrf": 1, "role": null, "tags": [], "family": 4, "status": 1, "tenant": 1, "address": "192.168.11.3/24", "created": "2018-06-09", "dns_name": "", "interface": 141, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:00:12.396Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
44	2019-12-29 11:51:07.871489+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	54	\N	192.168.11.6/24	{"vrf": 1, "role": null, "tags": [], "family": 4, "status": 1, "tenant": 1, "address": "192.168.11.6/24", "created": "2018-06-09", "dns_name": "", "interface": 156, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:35:00.519Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
45	2019-12-29 11:51:07.876766+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	55	\N	192.168.11.7/24	{"vrf": 1, "role": null, "tags": [], "family": 4, "status": 1, "tenant": 1, "address": "192.168.11.7/24", "created": "2018-06-09", "dns_name": "", "interface": 161, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:40:56.586Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
255	2019-12-29 12:01:18.529757+00	admin	d65118f3-3f3a-4ea9-b156-23c0eb2ade0b	2	3	\N	1002 (Vlan1002)	{"vid": 1002, "name": "Vlan1002", "role": null, "site": 2, "tags": [], "group": null, "status": 1, "tenant": null, "created": "2018-06-09", "description": "", "last_updated": "2019-12-29T12:01:18.444Z", "custom_fields": {}}	42	\N	1
46	2019-12-29 11:51:07.881384+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	57	\N	192.168.12.3/24	{"vrf": 2, "role": null, "tags": [], "family": 4, "status": 1, "tenant": 2, "address": "192.168.12.3/24", "created": "2018-06-09", "dns_name": "", "interface": 142, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:00:24.869Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
47	2019-12-29 11:51:07.886287+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	60	\N	192.168.12.6/24	{"vrf": 2, "role": null, "tags": [], "family": 4, "status": 1, "tenant": 2, "address": "192.168.12.6/24", "created": "2018-06-09", "dns_name": "", "interface": 157, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:35:13.015Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
48	2019-12-29 11:51:07.890967+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	61	\N	192.168.12.7/24	{"vrf": 2, "role": null, "tags": [], "family": 4, "status": 1, "tenant": 2, "address": "192.168.12.7/24", "created": "2018-06-09", "dns_name": "", "interface": 162, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:41:10.993Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
49	2019-12-29 11:51:07.89592+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	63	\N	192.168.13.3/24	{"vrf": 2, "role": null, "tags": [], "family": 4, "status": 1, "tenant": 2, "address": "192.168.13.3/24", "created": "2018-06-09", "dns_name": "", "interface": 143, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:00:37.953Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
50	2019-12-29 11:51:07.901432+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	66	\N	192.168.13.6/24	{"vrf": 2, "role": null, "tags": [], "family": 4, "status": 1, "tenant": 2, "address": "192.168.13.6/24", "created": "2018-06-09", "dns_name": "", "interface": 158, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:35:26.357Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
51	2019-12-29 11:51:07.906953+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	67	\N	192.168.13.7/24	{"vrf": 2, "role": null, "tags": [], "family": 4, "status": 1, "tenant": 2, "address": "192.168.13.7/24", "created": "2018-06-09", "dns_name": "", "interface": 163, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:41:21.421Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
52	2019-12-29 11:51:07.912022+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	69	\N	192.168.14.3/24	{"vrf": 3, "role": null, "tags": [], "family": 4, "status": 1, "tenant": 3, "address": "192.168.14.3/24", "created": "2018-06-09", "dns_name": "", "interface": 144, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:00:58.253Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
53	2019-12-29 11:51:07.917067+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	72	\N	192.168.14.6/24	{"vrf": 3, "role": null, "tags": [], "family": 4, "status": 1, "tenant": 3, "address": "192.168.14.6/24", "created": "2018-06-09", "dns_name": "", "interface": 159, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:35:37.269Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
54	2019-12-29 11:51:07.922021+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	73	\N	192.168.14.7/24	{"vrf": 3, "role": null, "tags": [], "family": 4, "status": 1, "tenant": 3, "address": "192.168.14.7/24", "created": "2018-06-09", "dns_name": "", "interface": 164, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:41:32.918Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
55	2019-12-29 11:51:07.927222+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	75	\N	192.168.15.3/24	{"vrf": 3, "role": null, "tags": [], "family": 4, "status": 1, "tenant": 3, "address": "192.168.15.3/24", "created": "2018-06-09", "dns_name": "", "interface": 145, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:01:13.646Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
56	2019-12-29 11:51:07.93211+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	78	\N	192.168.15.6/24	{"vrf": 3, "role": null, "tags": [], "family": 4, "status": 1, "tenant": 3, "address": "192.168.15.6/24", "created": "2018-06-09", "dns_name": "", "interface": 160, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:35:51.193Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
57	2019-12-29 11:51:07.937104+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	79	\N	192.168.15.7/24	{"vrf": 3, "role": null, "tags": [], "family": 4, "status": 1, "tenant": 3, "address": "192.168.15.7/24", "created": "2018-06-09", "dns_name": "", "interface": 165, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:41:45.053Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
58	2019-12-29 11:51:07.940963+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	81	\N	fc00:11::3/64	{"vrf": 1, "role": null, "tags": [], "family": 6, "status": 1, "tenant": 1, "address": "fc00:11::3/64", "created": "2018-06-09", "dns_name": "", "interface": 141, "nat_inside": null, "description": "", "last_updated": "2018-06-09T19:58:19.005Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
59	2019-12-29 11:51:07.944739+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	84	\N	fc00:11::6/64	{"vrf": 1, "role": null, "tags": [], "family": 6, "status": 1, "tenant": 1, "address": "fc00:11::6/64", "created": "2018-06-09", "dns_name": "", "interface": 156, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:36:17.526Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
60	2019-12-29 11:51:07.948481+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	85	\N	fc00:11::7/64	{"vrf": 1, "role": null, "tags": [], "family": 6, "status": 1, "tenant": 1, "address": "fc00:11::7/64", "created": "2018-06-09", "dns_name": "", "interface": 161, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:39:38.399Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
61	2019-12-29 11:51:07.952671+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	87	\N	fc00:12::3/64	{"vrf": 2, "role": null, "tags": [], "family": 6, "status": 1, "tenant": 2, "address": "fc00:12::3/64", "created": "2018-06-09", "dns_name": "", "interface": 142, "nat_inside": null, "description": "", "last_updated": "2018-06-09T19:58:35.058Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
256	2019-12-29 12:01:18.539576+00	admin	d65118f3-3f3a-4ea9-b156-23c0eb2ade0b	2	4	\N	1003 (Vlan1003)	{"vid": 1003, "name": "Vlan1003", "role": null, "site": 2, "tags": [], "group": null, "status": 1, "tenant": null, "created": "2018-06-09", "description": "", "last_updated": "2019-12-29T12:01:18.447Z", "custom_fields": {}}	42	\N	1
62	2019-12-29 11:51:07.956523+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	90	\N	fc00:12::6/64	{"vrf": 2, "role": null, "tags": [], "family": 6, "status": 1, "tenant": 2, "address": "fc00:12::6/64", "created": "2018-06-09", "dns_name": "", "interface": 157, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:36:38.637Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
63	2019-12-29 11:51:07.960399+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	91	\N	fc00:12::7/64	{"vrf": 2, "role": null, "tags": [], "family": 6, "status": 1, "tenant": 2, "address": "fc00:12::7/64", "created": "2018-06-09", "dns_name": "", "interface": 162, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:39:51.423Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
64	2019-12-29 11:51:07.964092+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	93	\N	fc00:13::3/64	{"vrf": 2, "role": null, "tags": [], "family": 6, "status": 1, "tenant": 2, "address": "fc00:13::3/64", "created": "2018-06-09", "dns_name": "", "interface": 143, "nat_inside": null, "description": "", "last_updated": "2018-06-09T19:59:00.601Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
65	2019-12-29 11:51:07.967929+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	96	\N	fc00:13::6/64	{"vrf": 2, "role": null, "tags": [], "family": 6, "status": 1, "tenant": 2, "address": "fc00:13::6/64", "created": "2018-06-09", "dns_name": "", "interface": 158, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:36:53.220Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
66	2019-12-29 11:51:07.971646+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	97	\N	fc00:13::7/64	{"vrf": 2, "role": null, "tags": [], "family": 6, "status": 1, "tenant": 2, "address": "fc00:13::7/64", "created": "2018-06-09", "dns_name": "", "interface": 163, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:40:06.835Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
67	2019-12-29 11:51:07.975501+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	99	\N	fc00:14::3/64	{"vrf": 3, "role": null, "tags": [], "family": 6, "status": 1, "tenant": 3, "address": "fc00:14::3/64", "created": "2018-06-09", "dns_name": "", "interface": 144, "nat_inside": null, "description": "", "last_updated": "2018-06-09T19:59:16.304Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
68	2019-12-29 11:51:07.979346+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	102	\N	fc00:14::6/64	{"vrf": 3, "role": null, "tags": [], "family": 6, "status": 1, "tenant": 3, "address": "fc00:14::6/64", "created": "2018-06-09", "dns_name": "", "interface": 159, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:37:08.244Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
69	2019-12-29 11:51:07.987182+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	103	\N	fc00:14::7/64	{"vrf": 3, "role": null, "tags": [], "family": 6, "status": 1, "tenant": 3, "address": "fc00:14::7/64", "created": "2018-06-09", "dns_name": "", "interface": 164, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:40:20.317Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
70	2019-12-29 11:51:07.99148+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	105	\N	fc00:15::3/64	{"vrf": 3, "role": null, "tags": [], "family": 6, "status": 1, "tenant": 3, "address": "fc00:15::3/64", "created": "2018-06-09", "dns_name": "", "interface": 145, "nat_inside": null, "description": "", "last_updated": "2018-06-09T19:59:30.920Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
71	2019-12-29 11:51:07.99583+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	108	\N	fc00:15::6/64	{"vrf": 3, "role": null, "tags": [], "family": 6, "status": 1, "tenant": 3, "address": "fc00:15::6/64", "created": "2018-06-09", "dns_name": "", "interface": 160, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:37:28.611Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
72	2019-12-29 11:51:07.999872+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	109	\N	fc00:15::7/64	{"vrf": 3, "role": null, "tags": [], "family": 6, "status": 1, "tenant": 3, "address": "fc00:15::7/64", "created": "2018-06-09", "dns_name": "", "interface": 165, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:40:31.752Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
73	2019-12-29 11:51:08.0041+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	120	\N	192.168.11.1/24	{"vrf": 1, "role": 41, "tags": [], "family": 4, "status": 1, "tenant": 1, "address": "192.168.11.1/24", "created": "2018-06-09", "dns_name": "", "interface": 161, "nat_inside": null, "description": "", "last_updated": "2018-06-09T19:51:37.028Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
74	2019-12-29 11:51:08.008044+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	121	\N	192.168.12.1/24	{"vrf": 2, "role": 41, "tags": [], "family": 4, "status": 1, "tenant": 2, "address": "192.168.12.1/24", "created": "2018-06-09", "dns_name": "", "interface": 162, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:43:40.279Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
75	2019-12-29 11:51:08.0119+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	122	\N	192.168.13.1/24	{"vrf": 2, "role": 41, "tags": [], "family": 4, "status": 1, "tenant": 2, "address": "192.168.13.1/24", "created": "2018-06-09", "dns_name": "", "interface": 163, "nat_inside": null, "description": "", "last_updated": "2018-06-09T19:52:44.302Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
76	2019-12-29 11:51:08.015869+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	123	\N	192.168.14.1/24	{"vrf": 3, "role": 41, "tags": [], "family": 4, "status": 1, "tenant": 3, "address": "192.168.14.1/24", "created": "2018-06-09", "dns_name": "", "interface": 164, "nat_inside": null, "description": "", "last_updated": "2018-06-09T19:53:08.740Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
77	2019-12-29 11:51:08.019718+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	124	\N	192.168.15.1/24	{"vrf": 3, "role": 41, "tags": [], "family": 4, "status": 1, "tenant": 3, "address": "192.168.15.1/24", "created": "2018-06-09", "dns_name": "", "interface": 165, "nat_inside": null, "description": "", "last_updated": "2018-06-09T19:53:48.876Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
398	2019-12-29 13:32:43.549307+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	18	1	swp17	{"name": "swp17", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
399	2019-12-29 13:32:43.551133+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	19	1	swp18	{"name": "swp18", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
78	2019-12-29 11:51:08.023541+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	125	\N	192.168.11.1/24	{"vrf": 1, "role": 41, "tags": [], "family": 4, "status": 1, "tenant": 1, "address": "192.168.11.1/24", "created": "2018-06-09", "dns_name": "", "interface": 141, "nat_inside": null, "description": "", "last_updated": "2018-06-09T19:54:35.398Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
79	2019-12-29 11:51:08.02764+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	126	\N	192.168.12.1/24	{"vrf": 2, "role": 41, "tags": [], "family": 4, "status": 1, "tenant": 2, "address": "192.168.12.1/24", "created": "2018-06-09", "dns_name": "", "interface": 142, "nat_inside": null, "description": "", "last_updated": "2018-06-09T19:54:50.332Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
80	2019-12-29 11:51:08.031501+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	127	\N	192.168.13.1/24	{"vrf": 1, "role": 41, "tags": [], "family": 4, "status": 1, "tenant": 2, "address": "192.168.13.1/24", "created": "2018-06-09", "dns_name": "", "interface": 143, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:48:05.676Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
81	2019-12-29 11:51:08.035249+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	128	\N	192.168.14.1/24	{"vrf": 3, "role": 41, "tags": [], "family": 4, "status": 1, "tenant": 3, "address": "192.168.14.1/24", "created": "2018-06-09", "dns_name": "", "interface": 144, "nat_inside": null, "description": "", "last_updated": "2018-06-09T19:55:30.045Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
82	2019-12-29 11:51:08.039044+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	129	\N	192.168.15.1/24	{"vrf": 3, "role": 41, "tags": [], "family": 4, "status": 1, "tenant": 3, "address": "192.168.15.1/24", "created": "2018-06-09", "dns_name": "", "interface": 145, "nat_inside": null, "description": "", "last_updated": "2018-06-09T19:55:45.521Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
83	2019-12-29 11:51:08.042822+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	130	\N	fc00:11::1/64	{"vrf": 1, "role": 41, "tags": [], "family": 6, "status": 1, "tenant": 1, "address": "fc00:11::1/64", "created": "2018-06-09", "dns_name": "", "interface": 141, "nat_inside": null, "description": "", "last_updated": "2018-06-09T19:56:22.588Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
84	2019-12-29 11:51:08.046538+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	131	\N	fc00:12::1/64	{"vrf": 2, "role": 41, "tags": [], "family": 6, "status": 1, "tenant": 2, "address": "fc00:12::1/64", "created": "2018-06-09", "dns_name": "", "interface": 142, "nat_inside": null, "description": "", "last_updated": "2018-06-09T19:56:40.680Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
85	2019-12-29 11:51:08.051194+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	132	\N	fc00:13::1/64	{"vrf": 2, "role": 41, "tags": [], "family": 6, "status": 1, "tenant": 2, "address": "fc00:13::1/64", "created": "2018-06-09", "dns_name": "", "interface": 143, "nat_inside": null, "description": "", "last_updated": "2018-06-09T19:56:55.134Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
86	2019-12-29 11:51:08.055106+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	133	\N	fc00:14::1/64	{"vrf": 3, "role": 41, "tags": [], "family": 6, "status": 1, "tenant": 3, "address": "fc00:14::1/64", "created": "2018-06-09", "dns_name": "", "interface": 144, "nat_inside": null, "description": "", "last_updated": "2018-06-09T19:57:10.388Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
87	2019-12-29 11:51:08.059032+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	134	\N	fc00:15::1/64	{"vrf": 3, "role": 41, "tags": [], "family": 6, "status": 1, "tenant": 3, "address": "fc00:15::1/64", "created": "2018-06-09", "dns_name": "", "interface": 145, "nat_inside": null, "description": "", "last_updated": "2018-06-09T19:57:25.643Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
88	2019-12-29 11:51:08.063054+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	155	\N	192.168.11.1/24	{"vrf": 1, "role": 41, "tags": [], "family": 4, "status": 1, "tenant": 1, "address": "192.168.11.1/24", "created": "2018-06-09", "dns_name": "", "interface": 156, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:32:16.585Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
89	2019-12-29 11:51:08.067039+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	156	\N	fc00:11::1/64	{"vrf": 1, "role": 41, "tags": [], "family": 6, "status": 1, "tenant": 1, "address": "fc00:11::1/64", "created": "2018-06-09", "dns_name": "", "interface": 156, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:32:29.915Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
90	2019-12-29 11:51:08.071027+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	157	\N	192.168.12.1/24	{"vrf": 2, "role": 41, "tags": [], "family": 4, "status": 1, "tenant": 2, "address": "192.168.12.1/24", "created": "2018-06-09", "dns_name": "", "interface": 157, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:32:44.761Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
91	2019-12-29 11:51:08.075549+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	158	\N	fc00:12::1/64	{"vrf": 2, "role": 41, "tags": [], "family": 6, "status": 1, "tenant": 2, "address": "fc00:12::1/64", "created": "2018-06-09", "dns_name": "", "interface": 157, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:32:59.432Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
92	2019-12-29 11:51:08.080136+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	159	\N	192.168.13.1/24	{"vrf": 2, "role": 41, "tags": [], "family": 4, "status": 1, "tenant": 2, "address": "192.168.13.1/24", "created": "2018-06-09", "dns_name": "", "interface": 158, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:33:10.620Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
93	2019-12-29 11:51:08.084353+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	160	\N	fc00:13::1/64	{"vrf": 2, "role": 41, "tags": [], "family": 6, "status": 1, "tenant": 2, "address": "fc00:13::1/64", "created": "2018-06-09", "dns_name": "", "interface": 158, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:33:24.164Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
400	2019-12-29 13:32:43.552796+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	20	1	swp19	{"name": "swp19", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
94	2019-12-29 11:51:08.08842+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	161	\N	192.168.14.1/24	{"vrf": 3, "role": 41, "tags": [], "family": 4, "status": 1, "tenant": 3, "address": "192.168.14.1/24", "created": "2018-06-09", "dns_name": "", "interface": 159, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:33:39.459Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
95	2019-12-29 11:51:08.092513+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	162	\N	fc00:14::1/64	{"vrf": 3, "role": 41, "tags": [], "family": 6, "status": 1, "tenant": 3, "address": "fc00:14::1/64", "created": "2018-06-09", "dns_name": "", "interface": 159, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:33:54.627Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
96	2019-12-29 11:51:08.096766+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	163	\N	192.168.15.1/24	{"vrf": 3, "role": 41, "tags": [], "family": 4, "status": 1, "tenant": 3, "address": "192.168.15.1/24", "created": "2018-06-09", "dns_name": "", "interface": 160, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:34:07.400Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
97	2019-12-29 11:51:08.10105+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	164	\N	fc00:15::1/64	{"vrf": 3, "role": 41, "tags": [], "family": 6, "status": 1, "tenant": 3, "address": "fc00:15::1/64", "created": "2018-06-09", "dns_name": "", "interface": 160, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:34:28.218Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
98	2019-12-29 11:51:08.109997+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	165	\N	fc00:11::1/64	{"vrf": 1, "role": 41, "tags": [], "family": 6, "status": 1, "tenant": 1, "address": "fc00:11::1/64", "created": "2018-06-09", "dns_name": "", "interface": 161, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:38:10.179Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
99	2019-12-29 11:51:08.114425+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	166	\N	fc00:12::1/64	{"vrf": 2, "role": 41, "tags": [], "family": 6, "status": 1, "tenant": 2, "address": "fc00:12::1/64", "created": "2018-06-09", "dns_name": "", "interface": 162, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:38:21.848Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
100	2019-12-29 11:51:08.118461+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	167	\N	fc00:13::1/64	{"vrf": 2, "role": 41, "tags": [], "family": 6, "status": 1, "tenant": 2, "address": "fc00:13::1/64", "created": "2018-06-09", "dns_name": "", "interface": 163, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:38:38.687Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
101	2019-12-29 11:51:08.122303+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	168	\N	fc00:14::1/64	{"vrf": 3, "role": 41, "tags": [], "family": 6, "status": 1, "tenant": 3, "address": "fc00:14::1/64", "created": "2018-06-09", "dns_name": "", "interface": 164, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:38:51.179Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
102	2019-12-29 11:51:08.126266+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	169	\N	fc00:15::1/64	{"vrf": 3, "role": 41, "tags": [], "family": 6, "status": 1, "tenant": 3, "address": "fc00:15::1/64", "created": "2018-06-09", "dns_name": "", "interface": 165, "nat_inside": null, "description": "", "last_updated": "2018-06-09T20:39:07.863Z", "custom_fields": {"clag_peer_ip": "None", "clag_backup_ip": "None"}}	38	\N	1
103	2019-12-29 11:51:08.135689+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	15	\N	bond01	{"lag": null, "mtu": null, "mode": 200, "name": "bond01", "tags": [], "type": 200, "cable": null, "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
104	2019-12-29 11:51:08.143864+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	16	\N	bond02	{"lag": null, "mtu": null, "mode": 200, "name": "bond02", "tags": [], "type": 200, "cable": null, "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
105	2019-12-29 11:51:08.15039+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	17	\N	clagd-vxlan-anycast-ip	{"lag": null, "mtu": null, "mode": null, "name": "clagd-vxlan-anycast-ip", "tags": [], "type": 0, "cable": null, "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
106	2019-12-29 11:51:08.157081+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	18	\N	irb1000	{"lag": null, "mtu": null, "mode": 100, "name": "irb1000", "tags": [], "type": 0, "cable": null, "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 1, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
107	2019-12-29 11:51:08.163518+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	19	\N	lo	{"lag": null, "mtu": null, "mode": null, "name": "lo", "tags": [], "type": 0, "cable": null, "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
108	2019-12-29 11:51:08.170276+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	20	\N	peerlink	{"lag": null, "mtu": null, "mode": null, "name": "peerlink", "tags": [], "type": 200, "cable": null, "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "44:38:39:FF:01:02", "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
109	2019-12-29 11:51:08.177342+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	21	\N	peerlink.4094	{"lag": null, "mtu": null, "mode": null, "name": "peerlink.4094", "tags": [], "type": 0, "cable": null, "device": 4, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
257	2019-12-29 12:01:18.549274+00	admin	d65118f3-3f3a-4ea9-b156-23c0eb2ade0b	2	5	\N	1004 (Vlan1004)	{"vid": 1004, "name": "Vlan1004", "role": null, "site": 2, "tags": [], "group": null, "status": 1, "tenant": null, "created": "2018-06-09", "description": "", "last_updated": "2019-12-29T12:01:18.450Z", "custom_fields": {}}	42	\N	1
110	2019-12-29 11:51:08.184319+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	22	\N	swp1	{"lag": 15, "mtu": null, "mode": null, "name": "swp1", "tags": [], "type": 1000, "cable": null, "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
111	2019-12-29 11:51:08.191316+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	23	\N	swp2	{"lag": 16, "mtu": null, "mode": null, "name": "swp2", "tags": [], "type": 1000, "cable": null, "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
112	2019-12-29 11:51:08.198335+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	24	\N	swp49	{"lag": 20, "mtu": null, "mode": null, "name": "swp49", "tags": [], "type": 1000, "cable": null, "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
113	2019-12-29 11:51:08.20568+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	25	\N	swp50	{"lag": 20, "mtu": null, "mode": null, "name": "swp50", "tags": [], "type": 1000, "cable": null, "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
114	2019-12-29 11:51:08.212371+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	26	\N	swp51	{"lag": null, "mtu": null, "mode": null, "name": "swp51", "tags": [], "type": 1000, "cable": null, "device": 4, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
115	2019-12-29 11:51:08.219029+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	27	\N	swp52	{"lag": null, "mtu": null, "mode": null, "name": "swp52", "tags": [], "type": 1000, "cable": null, "device": 4, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
116	2019-12-29 11:51:08.22681+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	28	\N	lo	{"lag": null, "mtu": null, "mode": null, "name": "lo", "tags": [], "type": 0, "cable": null, "device": 5, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
117	2019-12-29 11:51:08.233223+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	29	\N	swp1	{"lag": null, "mtu": null, "mode": null, "name": "swp1", "tags": [], "type": 1000, "cable": null, "device": 5, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
118	2019-12-29 11:51:08.239626+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	30	\N	swp2	{"lag": null, "mtu": null, "mode": null, "name": "swp2", "tags": [], "type": 1000, "cable": null, "device": 5, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
119	2019-12-29 11:51:08.246062+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	31	\N	swp3	{"lag": null, "mtu": null, "mode": null, "name": "swp3", "tags": [], "type": 1000, "cable": null, "device": 5, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
120	2019-12-29 11:51:08.253125+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	32	\N	swp4	{"lag": null, "mtu": null, "mode": null, "name": "swp4", "tags": [], "type": 1000, "cable": null, "device": 5, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
121	2019-12-29 11:51:08.260065+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	33	\N	swp5	{"lag": null, "mtu": null, "mode": null, "name": "swp5", "tags": [], "type": 1000, "cable": null, "device": 5, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
122	2019-12-29 11:51:08.266981+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	34	\N	swp6	{"lag": null, "mtu": null, "mode": null, "name": "swp6", "tags": [], "type": 1000, "cable": null, "device": 5, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
123	2019-12-29 11:51:08.274943+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	35	\N	lo	{"lag": null, "mtu": null, "mode": null, "name": "lo", "tags": [], "type": 0, "cable": null, "device": 6, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
124	2019-12-29 11:51:08.281763+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	36	\N	swp1	{"lag": null, "mtu": null, "mode": null, "name": "swp1", "tags": [], "type": 1000, "cable": null, "device": 6, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
125	2019-12-29 11:51:08.298288+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	37	\N	swp2	{"lag": null, "mtu": null, "mode": null, "name": "swp2", "tags": [], "type": 1000, "cable": null, "device": 6, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
126	2019-12-29 11:51:08.312107+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	38	\N	swp3	{"lag": null, "mtu": null, "mode": null, "name": "swp3", "tags": [], "type": 1000, "cable": null, "device": 6, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
393	2019-12-29 13:32:43.540169+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	13	1	swp12	{"name": "swp12", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
127	2019-12-29 11:51:08.32028+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	39	\N	swp4	{"lag": null, "mtu": null, "mode": null, "name": "swp4", "tags": [], "type": 1000, "cable": null, "device": 6, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
128	2019-12-29 11:51:08.328609+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	40	\N	swp5	{"lag": null, "mtu": null, "mode": null, "name": "swp5", "tags": [], "type": 1000, "cable": null, "device": 6, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
129	2019-12-29 11:51:08.336646+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	41	\N	swp6	{"lag": null, "mtu": null, "mode": null, "name": "swp6", "tags": [], "type": 1000, "cable": null, "device": 6, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
130	2019-12-29 11:51:08.346384+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	46	\N	lo	{"lag": null, "mtu": null, "mode": null, "name": "lo", "tags": [], "type": 0, "cable": null, "device": 7, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
131	2019-12-29 11:51:08.354304+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	47	\N	peerlink	{"lag": null, "mtu": null, "mode": null, "name": "peerlink", "tags": [], "type": 200, "cable": null, "device": 7, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "44:38:39:FF:01:34", "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
132	2019-12-29 11:51:08.361533+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	48	\N	peerlink.4094	{"lag": null, "mtu": null, "mode": null, "name": "peerlink.4094", "tags": [], "type": 0, "cable": null, "device": 7, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
133	2019-12-29 11:51:08.370661+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	49	\N	swp1	{"lag": null, "mtu": null, "mode": null, "name": "swp1", "tags": [], "type": 1000, "cable": null, "device": 7, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
134	2019-12-29 11:51:08.378833+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	50	\N	swp2	{"lag": null, "mtu": null, "mode": null, "name": "swp2", "tags": [], "type": 1000, "cable": null, "device": 7, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
135	2019-12-29 11:51:08.386654+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	51	\N	swp49	{"lag": 47, "mtu": null, "mode": null, "name": "swp49", "tags": [], "type": 1000, "cable": null, "device": 7, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
136	2019-12-29 11:51:08.393134+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	52	\N	swp50	{"lag": 47, "mtu": null, "mode": null, "name": "swp50", "tags": [], "type": 1000, "cable": null, "device": 7, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
137	2019-12-29 11:51:08.399629+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	53	\N	swp51	{"lag": null, "mtu": null, "mode": null, "name": "swp51", "tags": [], "type": 1000, "cable": null, "device": 7, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
138	2019-12-29 11:51:08.40765+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	54	\N	swp52	{"lag": null, "mtu": null, "mode": null, "name": "swp52", "tags": [], "type": 1000, "cable": null, "device": 7, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
139	2019-12-29 11:51:08.415806+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	59	\N	lo	{"lag": null, "mtu": null, "mode": null, "name": "lo", "tags": [], "type": 0, "cable": null, "device": 8, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
140	2019-12-29 11:51:08.422747+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	60	\N	peerlink	{"lag": null, "mtu": null, "mode": null, "name": "peerlink", "tags": [], "type": 200, "cable": null, "device": 8, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "44:38:39:FF:01:34", "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
141	2019-12-29 11:51:08.429415+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	61	\N	peerlink.4094	{"lag": null, "mtu": null, "mode": null, "name": "peerlink.4094", "tags": [], "type": 0, "cable": null, "device": 8, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
142	2019-12-29 11:51:08.44157+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	62	\N	swp1	{"lag": null, "mtu": null, "mode": null, "name": "swp1", "tags": [], "type": 1000, "cable": null, "device": 8, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
143	2019-12-29 11:51:08.44786+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	63	\N	swp2	{"lag": null, "mtu": null, "mode": null, "name": "swp2", "tags": [], "type": 1000, "cable": null, "device": 8, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
144	2019-12-29 11:51:08.454051+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	64	\N	swp49	{"lag": 60, "mtu": null, "mode": null, "name": "swp49", "tags": [], "type": 1000, "cable": null, "device": 8, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
145	2019-12-29 11:51:08.460548+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	65	\N	swp50	{"lag": 60, "mtu": null, "mode": null, "name": "swp50", "tags": [], "type": 1000, "cable": null, "device": 8, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
146	2019-12-29 11:51:08.466949+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	66	\N	swp51	{"lag": null, "mtu": null, "mode": null, "name": "swp51", "tags": [], "type": 1000, "cable": null, "device": 8, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
147	2019-12-29 11:51:08.47282+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	67	\N	swp52	{"lag": null, "mtu": null, "mode": null, "name": "swp52", "tags": [], "type": 1000, "cable": null, "device": 8, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
148	2019-12-29 11:51:08.482138+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	68	\N	bond01	{"lag": null, "mtu": null, "mode": 200, "name": "bond01", "tags": [], "type": 200, "cable": null, "device": 9, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
149	2019-12-29 11:51:08.489038+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	69	\N	bond02	{"lag": null, "mtu": null, "mode": 200, "name": "bond02", "tags": [], "type": 200, "cable": null, "device": 9, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
150	2019-12-29 11:51:08.497213+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	70	\N	clagd-vxlan-anycast-ip	{"lag": null, "mtu": null, "mode": null, "name": "clagd-vxlan-anycast-ip", "tags": [], "type": 0, "cable": null, "device": 9, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
151	2019-12-29 11:51:08.504701+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	71	\N	irb1000	{"lag": null, "mtu": null, "mode": 100, "name": "irb1000", "tags": [], "type": 0, "cable": null, "device": 9, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 1, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
152	2019-12-29 11:51:08.511546+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	72	\N	lo	{"lag": null, "mtu": null, "mode": null, "name": "lo", "tags": [], "type": 0, "cable": null, "device": 9, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
153	2019-12-29 11:51:08.517793+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	73	\N	peerlink	{"lag": null, "mtu": null, "mode": null, "name": "peerlink", "tags": [], "type": 200, "cable": null, "device": 9, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "44:38:39:FF:01:56", "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
154	2019-12-29 11:51:08.524252+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	74	\N	peerlink.4094	{"lag": null, "mtu": null, "mode": null, "name": "peerlink.4094", "tags": [], "type": 0, "cable": null, "device": 9, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
155	2019-12-29 11:51:08.530508+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	75	\N	swp1	{"lag": 68, "mtu": null, "mode": null, "name": "swp1", "tags": [], "type": 1000, "cable": null, "device": 9, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
156	2019-12-29 11:51:08.536437+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	76	\N	swp2	{"lag": 69, "mtu": null, "mode": null, "name": "swp2", "tags": [], "type": 1000, "cable": null, "device": 9, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
157	2019-12-29 11:51:08.542312+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	77	\N	swp49	{"lag": 73, "mtu": null, "mode": null, "name": "swp49", "tags": [], "type": 1000, "cable": null, "device": 9, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
158	2019-12-29 11:51:08.548129+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	78	\N	swp50	{"lag": 73, "mtu": null, "mode": null, "name": "swp50", "tags": [], "type": 1000, "cable": null, "device": 9, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
159	2019-12-29 11:51:08.553984+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	79	\N	swp53	{"lag": null, "mtu": null, "mode": null, "name": "swp53", "tags": [], "type": 1000, "cable": null, "device": 9, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
160	2019-12-29 11:51:08.559711+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	80	\N	swp54	{"lag": null, "mtu": null, "mode": null, "name": "swp54", "tags": [], "type": 1000, "cable": null, "device": 9, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
161	2019-12-29 11:51:08.56688+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	81	\N	bond01	{"lag": null, "mtu": null, "mode": 200, "name": "bond01", "tags": [], "type": 200, "cable": null, "device": 10, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
162	2019-12-29 11:51:08.578598+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	82	\N	bond02	{"lag": null, "mtu": null, "mode": 200, "name": "bond02", "tags": [], "type": 200, "cable": null, "device": 10, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
163	2019-12-29 11:51:08.584405+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	83	\N	clagd-vxlan-anycast-ip	{"lag": null, "mtu": null, "mode": null, "name": "clagd-vxlan-anycast-ip", "tags": [], "type": 0, "cable": null, "device": 10, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
164	2019-12-29 11:51:08.590072+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	84	\N	irb1000	{"lag": null, "mtu": null, "mode": 100, "name": "irb1000", "tags": [], "type": 0, "cable": null, "device": 10, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 1, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
165	2019-12-29 11:51:08.595757+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	85	\N	lo	{"lag": null, "mtu": null, "mode": null, "name": "lo", "tags": [], "type": 0, "cable": null, "device": 10, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
166	2019-12-29 11:51:08.601648+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	86	\N	peerlink	{"lag": null, "mtu": null, "mode": null, "name": "peerlink", "tags": [], "type": 200, "cable": null, "device": 10, "enabled": true, "mgmt_only": false, "description": "", "mac_address": "44:38:39:FF:01:56", "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
167	2019-12-29 11:51:08.607751+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	87	\N	peerlink.4094	{"lag": null, "mtu": null, "mode": null, "name": "peerlink.4094", "tags": [], "type": 0, "cable": null, "device": 10, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
168	2019-12-29 11:51:08.614619+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	88	\N	swp1	{"lag": 81, "mtu": null, "mode": null, "name": "swp1", "tags": [], "type": 1000, "cable": null, "device": 10, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
169	2019-12-29 11:51:08.620473+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	89	\N	swp2	{"lag": 82, "mtu": null, "mode": null, "name": "swp2", "tags": [], "type": 1000, "cable": null, "device": 10, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
170	2019-12-29 11:51:08.626285+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	90	\N	swp49	{"lag": 86, "mtu": null, "mode": null, "name": "swp49", "tags": [], "type": 1000, "cable": null, "device": 10, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
171	2019-12-29 11:51:08.631993+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	91	\N	swp50	{"lag": 86, "mtu": null, "mode": null, "name": "swp50", "tags": [], "type": 1000, "cable": null, "device": 10, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
172	2019-12-29 11:51:08.637778+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	92	\N	swp53	{"lag": null, "mtu": null, "mode": null, "name": "swp53", "tags": [], "type": 1000, "cable": null, "device": 10, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
173	2019-12-29 11:51:08.643597+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	93	\N	swp54	{"lag": null, "mtu": null, "mode": null, "name": "swp54", "tags": [], "type": 1000, "cable": null, "device": 10, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
174	2019-12-29 11:51:08.65085+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	94	\N	lo	{"lag": null, "mtu": null, "mode": null, "name": "lo", "tags": [], "type": 0, "cable": null, "device": 11, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
175	2019-12-29 11:51:08.656827+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	95	\N	swp1	{"lag": null, "mtu": null, "mode": null, "name": "swp1", "tags": [], "type": 1000, "cable": null, "device": 11, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
176	2019-12-29 11:51:08.662763+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	96	\N	swp2	{"lag": null, "mtu": null, "mode": null, "name": "swp2", "tags": [], "type": 1000, "cable": null, "device": 11, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
177	2019-12-29 11:51:08.668672+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	97	\N	swp6	{"lag": null, "mtu": null, "mode": null, "name": "swp6", "tags": [], "type": 1000, "cable": null, "device": 11, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
178	2019-12-29 11:51:08.675103+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	98	\N	swp7	{"lag": null, "mtu": null, "mode": null, "name": "swp7", "tags": [], "type": 1000, "cable": null, "device": 11, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
179	2019-12-29 11:51:08.682608+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	99	\N	lo	{"lag": null, "mtu": null, "mode": null, "name": "lo", "tags": [], "type": 0, "cable": null, "device": 12, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
180	2019-12-29 11:51:08.690065+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	100	\N	swp1	{"lag": null, "mtu": null, "mode": null, "name": "swp1", "tags": [], "type": 1000, "cable": null, "device": 12, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
181	2019-12-29 11:51:08.696634+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	101	\N	swp2	{"lag": null, "mtu": null, "mode": null, "name": "swp2", "tags": [], "type": 1000, "cable": null, "device": 12, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
182	2019-12-29 11:51:08.702585+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	102	\N	swp6	{"lag": null, "mtu": null, "mode": null, "name": "swp6", "tags": [], "type": 1000, "cable": null, "device": 12, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
183	2019-12-29 11:51:08.708906+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	103	\N	swp7	{"lag": null, "mtu": null, "mode": null, "name": "swp7", "tags": [], "type": 1000, "cable": null, "device": 12, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
184	2019-12-29 11:51:08.716393+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	104	\N	swp1	{"lag": null, "mtu": null, "mode": null, "name": "swp1", "tags": [], "type": 1000, "cable": null, "device": 13, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
185	2019-12-29 11:51:08.722019+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	105	\N	swp2	{"lag": null, "mtu": null, "mode": null, "name": "swp2", "tags": [], "type": 1000, "cable": null, "device": 13, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
186	2019-12-29 11:51:08.728381+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	106	\N	swp49	{"lag": null, "mtu": null, "mode": 200, "name": "swp49", "tags": [], "type": 1000, "cable": null, "device": 13, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
187	2019-12-29 11:51:08.734245+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	107	\N	swp50	{"lag": null, "mtu": null, "mode": 200, "name": "swp50", "tags": [], "type": 1000, "cable": null, "device": 13, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
188	2019-12-29 11:51:08.739777+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	108	\N	irb2501	{"lag": null, "mtu": null, "mode": 100, "name": "irb2501", "tags": [], "type": 0, "cable": null, "device": 13, "enabled": true, "mgmt_only": false, "description": "bgp_external", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 7, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
189	2019-12-29 11:51:08.745303+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	109	\N	irb2502	{"lag": null, "mtu": null, "mode": 100, "name": "irb2502", "tags": [], "type": 0, "cable": null, "device": 13, "enabled": true, "mgmt_only": false, "description": "bgp_external", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 8, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
190	2019-12-29 11:51:08.750778+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	110	\N	irb2503	{"lag": null, "mtu": null, "mode": 100, "name": "irb2503", "tags": [], "type": 0, "cable": null, "device": 13, "enabled": true, "mgmt_only": false, "description": "bgp_external", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 9, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
191	2019-12-29 11:51:08.756252+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	111	\N	irb2504	{"lag": null, "mtu": null, "mode": 100, "name": "irb2504", "tags": [], "type": 0, "cable": null, "device": 13, "enabled": true, "mgmt_only": false, "description": "bgp_external", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 19, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
192	2019-12-29 11:51:08.763+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	112	\N	irb2505	{"lag": null, "mtu": null, "mode": 100, "name": "irb2505", "tags": [], "type": 0, "cable": null, "device": 14, "enabled": true, "mgmt_only": false, "description": "bgp_external", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 11, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
193	2019-12-29 11:51:08.768672+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	113	\N	irb2506	{"lag": null, "mtu": null, "mode": 100, "name": "irb2506", "tags": [], "type": 0, "cable": null, "device": 14, "enabled": true, "mgmt_only": false, "description": "bgp_external", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 12, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
194	2019-12-29 11:51:08.774635+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	114	\N	irb2507	{"lag": null, "mtu": null, "mode": 100, "name": "irb2507", "tags": [], "type": 0, "cable": null, "device": 14, "enabled": true, "mgmt_only": false, "description": "bgp_external", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 13, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
195	2019-12-29 11:51:08.78026+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	115	\N	irb2508	{"lag": null, "mtu": null, "mode": 100, "name": "irb2508", "tags": [], "type": 0, "cable": null, "device": 14, "enabled": true, "mgmt_only": false, "description": "bgp_external", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 14, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
196	2019-12-29 11:51:08.786005+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	116	\N	swp1	{"lag": null, "mtu": null, "mode": null, "name": "swp1", "tags": [], "type": 1000, "cable": null, "device": 14, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
197	2019-12-29 11:51:08.794627+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	117	\N	swp2	{"lag": null, "mtu": null, "mode": null, "name": "swp2", "tags": [], "type": 1000, "cable": null, "device": 14, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
198	2019-12-29 11:51:08.804307+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	118	\N	swp49	{"lag": null, "mtu": null, "mode": 200, "name": "swp49", "tags": [], "type": 1000, "cable": null, "device": 14, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
199	2019-12-29 11:51:08.810297+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	119	\N	swp50	{"lag": null, "mtu": null, "mode": 200, "name": "swp50", "tags": [], "type": 1000, "cable": null, "device": 14, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
200	2019-12-29 11:51:08.817267+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	120	\N	swp1	{"lag": null, "mtu": null, "mode": 200, "name": "swp1", "tags": [], "type": 1000, "cable": null, "device": 15, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
201	2019-12-29 11:51:08.8228+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	121	\N	swp2	{"lag": null, "mtu": null, "mode": 200, "name": "swp2", "tags": [], "type": 1000, "cable": null, "device": 15, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
202	2019-12-29 11:51:08.828375+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	122	\N	irb2501	{"lag": null, "mtu": null, "mode": 100, "name": "irb2501", "tags": [], "type": 0, "cable": null, "device": 15, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 7, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
203	2019-12-29 11:51:08.833844+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	123	\N	irb2502	{"lag": null, "mtu": null, "mode": 100, "name": "irb2502", "tags": [], "type": 0, "cable": null, "device": 15, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 8, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
204	2019-12-29 11:51:08.840613+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	124	\N	irb2505	{"lag": null, "mtu": null, "mode": 100, "name": "irb2505", "tags": [], "type": 0, "cable": null, "device": 15, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 11, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
205	2019-12-29 11:51:08.847457+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	125	\N	irb2506	{"lag": null, "mtu": null, "mode": 100, "name": "irb2506", "tags": [], "type": 0, "cable": null, "device": 15, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 12, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
206	2019-12-29 11:51:08.853417+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	126	\N	irb2701	{"lag": null, "mtu": null, "mode": 100, "name": "irb2701", "tags": [], "type": 0, "cable": null, "device": 15, "enabled": true, "mgmt_only": false, "description": "bgp_external", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 16, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
207	2019-12-29 11:51:08.859179+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	127	\N	irb2702	{"lag": null, "mtu": null, "mode": 100, "name": "irb2702", "tags": [], "type": 0, "cable": null, "device": 15, "enabled": true, "mgmt_only": false, "description": "bgp_external", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 17, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
208	2019-12-29 11:51:08.865946+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	128	\N	swp1	{"lag": null, "mtu": null, "mode": 200, "name": "swp1", "tags": [], "type": 1000, "cable": null, "device": 16, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
209	2019-12-29 11:51:08.871497+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	129	\N	swp2	{"lag": null, "mtu": null, "mode": 200, "name": "swp2", "tags": [], "type": 1000, "cable": null, "device": 16, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
210	2019-12-29 11:51:08.877099+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	130	\N	irb2503	{"lag": null, "mtu": null, "mode": 100, "name": "irb2503", "tags": [], "type": 0, "cable": null, "device": 16, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 9, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
227	2019-12-29 11:51:08.993594+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	162	\N	irb1002	{"lag": null, "mtu": null, "mode": 100, "name": "irb1002", "tags": [], "type": 0, "cable": null, "device": 10, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 3, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
211	2019-12-29 11:51:08.882805+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	131	\N	irb2504	{"lag": null, "mtu": null, "mode": 100, "name": "irb2504", "tags": [], "type": 0, "cable": null, "device": 16, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 10, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
212	2019-12-29 11:51:08.888922+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	132	\N	irb2507	{"lag": null, "mtu": null, "mode": 100, "name": "irb2507", "tags": [], "type": 0, "cable": null, "device": 16, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 13, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
213	2019-12-29 11:51:08.896919+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	133	\N	irb2508	{"lag": null, "mtu": null, "mode": 100, "name": "irb2508", "tags": [], "type": 0, "cable": null, "device": 16, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 14, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
214	2019-12-29 11:51:08.903933+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	134	\N	irb2703	{"lag": null, "mtu": null, "mode": 100, "name": "irb2703", "tags": [], "type": 0, "cable": null, "device": 16, "enabled": true, "mgmt_only": false, "description": "bgp_external", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 18, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
215	2019-12-29 11:51:08.910934+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	135	\N	irb2704	{"lag": null, "mtu": null, "mode": 100, "name": "irb2704", "tags": [], "type": 0, "cable": null, "device": 16, "enabled": true, "mgmt_only": false, "description": "bgp_external", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 19, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
216	2019-12-29 11:51:08.917258+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	141	\N	irb1001	{"lag": null, "mtu": null, "mode": 100, "name": "irb1001", "tags": [], "type": 0, "cable": null, "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 2, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
217	2019-12-29 11:51:08.925208+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	142	\N	irb1002	{"lag": null, "mtu": null, "mode": 100, "name": "irb1002", "tags": [], "type": 0, "cable": null, "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 3, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
218	2019-12-29 11:51:08.932738+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	143	\N	irb1003	{"lag": null, "mtu": null, "mode": 100, "name": "irb1003", "tags": [], "type": 0, "cable": null, "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 4, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
219	2019-12-29 11:51:08.939166+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	144	\N	irb1004	{"lag": null, "mtu": null, "mode": 100, "name": "irb1004", "tags": [], "type": 0, "cable": null, "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 5, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
220	2019-12-29 11:51:08.945124+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	145	\N	irb1005	{"lag": null, "mtu": null, "mode": 100, "name": "irb1005", "tags": [], "type": 0, "cable": null, "device": 4, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 6, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
221	2019-12-29 11:51:08.951456+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	156	\N	irb1001	{"lag": null, "mtu": null, "mode": 100, "name": "irb1001", "tags": [], "type": 0, "cable": null, "device": 9, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 2, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
222	2019-12-29 11:51:08.958236+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	157	\N	irb1002	{"lag": null, "mtu": null, "mode": 100, "name": "irb1002", "tags": [], "type": 0, "cable": null, "device": 9, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 3, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
223	2019-12-29 11:51:08.966026+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	158	\N	irb1003	{"lag": null, "mtu": null, "mode": 100, "name": "irb1003", "tags": [], "type": 0, "cable": null, "device": 9, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 4, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
224	2019-12-29 11:51:08.973718+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	159	\N	irb1004	{"lag": null, "mtu": null, "mode": 100, "name": "irb1004", "tags": [], "type": 0, "cable": null, "device": 9, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 5, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
225	2019-12-29 11:51:08.980844+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	160	\N	irb1005	{"lag": null, "mtu": null, "mode": 100, "name": "irb1005", "tags": [], "type": 0, "cable": null, "device": 9, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 6, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
226	2019-12-29 11:51:08.987436+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	161	\N	irb1001	{"lag": null, "mtu": null, "mode": 100, "name": "irb1001", "tags": [], "type": 0, "cable": null, "device": 10, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 2, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
253	2019-12-29 12:01:18.507631+00	admin	d65118f3-3f3a-4ea9-b156-23c0eb2ade0b	2	1	\N	1000 (Vlan1000)	{"vid": 1000, "name": "Vlan1000", "role": null, "site": 2, "tags": [], "group": null, "status": 1, "tenant": null, "created": "2018-06-03", "description": "", "last_updated": "2019-12-29T12:01:18.438Z", "custom_fields": {}}	42	\N	1
228	2019-12-29 11:51:08.999506+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	163	\N	irb1003	{"lag": null, "mtu": null, "mode": 100, "name": "irb1003", "tags": [], "type": 0, "cable": null, "device": 10, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 4, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
229	2019-12-29 11:51:09.005573+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	164	\N	irb1004	{"lag": null, "mtu": null, "mode": 100, "name": "irb1004", "tags": [], "type": 0, "cable": null, "device": 10, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 5, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
230	2019-12-29 11:51:09.011594+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	165	\N	irb1005	{"lag": null, "mtu": null, "mode": 100, "name": "irb1005", "tags": [], "type": 0, "cable": null, "device": 10, "enabled": true, "mgmt_only": false, "description": "", "mac_address": null, "tagged_vlans": [], "untagged_vlan": 6, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
231	2019-12-29 11:51:09.017543+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	166	\N	swp51	{"lag": null, "mtu": null, "mode": null, "name": "swp51", "tags": [], "type": 1000, "cable": null, "device": 9, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
232	2019-12-29 11:51:09.023397+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	167	\N	swp52	{"lag": null, "mtu": null, "mode": null, "name": "swp52", "tags": [], "type": 1000, "cable": null, "device": 9, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
233	2019-12-29 11:51:09.029505+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	168	\N	swp51	{"lag": null, "mtu": null, "mode": null, "name": "swp51", "tags": [], "type": 1000, "cable": null, "device": 10, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
234	2019-12-29 11:51:09.035623+00	admin	6d0dfd83-75b4-4efc-9f3f-1d46ef5cc8ce	3	169	\N	swp52	{"lag": null, "mtu": null, "mode": null, "name": "swp52", "tags": [], "type": 1000, "cable": null, "device": 10, "enabled": true, "mgmt_only": false, "description": "bgp_underlay", "mac_address": null, "tagged_vlans": [], "untagged_vlan": null, "virtual_machine": null, "connection_status": null, "_connected_interface": null, "_connected_circuittermination": null}	18	\N	1
235	2019-12-29 11:52:35.922489+00	admin	9a1f2802-a7e0-464d-9a2a-c8c1a7d27264	1	2	\N	Cumulus Networks CLdemo2	{"asn": null, "name": "Cumulus Networks CLdemo2", "slug": "cldemo2", "tags": [], "region": null, "status": 1, "tenant": null, "created": "2019-12-29", "comments": "", "facility": "", "latitude": null, "longitude": null, "time_zone": "", "description": "", "contact_name": "", "last_updated": "2019-12-29T11:52:35.899Z", "contact_email": "", "contact_phone": "", "custom_fields": {}, "physical_address": "", "shipping_address": ""}	29	\N	1
236	2019-12-29 11:53:13.462916+00	admin	41c4df24-65f4-4cd1-86bf-286de192e61c	3	5	\N	Superspine	{"name": "Superspine", "role": null, "site": 1, "tags": [], "type": null, "group": 3, "width": 19, "serial": "", "status": 3, "tenant": null, "created": "2018-06-09", "comments": "", "u_height": 42, "asset_tag": null, "desc_units": false, "outer_unit": null, "facility_id": null, "outer_depth": null, "outer_width": null, "last_updated": "2018-06-09T07:41:25.050Z", "custom_fields": {}}	27	\N	1
237	2019-12-29 11:53:13.469345+00	admin	41c4df24-65f4-4cd1-86bf-286de192e61c	3	7	\N	exit02	{"name": "exit02", "role": null, "site": 1, "tags": [], "type": null, "group": 1, "width": 19, "serial": "", "status": 3, "tenant": null, "created": "2018-06-09", "comments": "", "u_height": 42, "asset_tag": null, "desc_units": false, "outer_unit": null, "facility_id": null, "outer_depth": null, "outer_width": null, "last_updated": "2018-06-09T07:44:02.190Z", "custom_fields": {}}	27	\N	1
238	2019-12-29 11:53:57.780421+00	admin	972eb46d-d215-4fb5-aef9-7aba217c224c	3	1	\N	Pod1	{"name": "Pod1", "site": 1, "slug": "pod1", "created": "2019-12-29", "last_updated": "2019-12-29T11:09:42.048Z"}	28	\N	1
239	2019-12-29 11:53:57.783254+00	admin	972eb46d-d215-4fb5-aef9-7aba217c224c	3	2	\N	Edge	{"name": "Edge", "site": 1, "slug": "edge", "created": "2019-12-29", "last_updated": "2019-12-29T11:09:42.048Z"}	28	\N	1
240	2019-12-29 11:53:57.785834+00	admin	972eb46d-d215-4fb5-aef9-7aba217c224c	3	3	\N	Superspine	{"name": "Superspine", "site": 1, "slug": "superspine", "created": "2019-12-29", "last_updated": "2019-12-29T11:09:42.048Z"}	28	\N	1
241	2019-12-29 11:54:39.769141+00	admin	42430b3e-ee09-4582-854f-a80422a4c605	1	4	\N	pod1	{"name": "pod1", "site": 2, "slug": "pod1", "created": "2019-12-29", "last_updated": "2019-12-29T11:54:39.763Z"}	28	\N	1
242	2019-12-29 11:55:25.049268+00	admin	84fef2de-4489-46bd-bfa7-1f07bc3986be	1	8	\N	pod2	{"name": "pod2", "role": null, "site": 2, "tags": [], "type": null, "group": null, "width": 19, "serial": "", "status": 3, "tenant": null, "created": "2019-12-29", "comments": "", "u_height": 42, "asset_tag": null, "desc_units": false, "outer_unit": null, "facility_id": null, "outer_depth": null, "outer_width": null, "last_updated": "2019-12-29T11:55:25.032Z", "custom_fields": {}}	27	\N	1
243	2019-12-29 11:55:41.416954+00	admin	14ddb5f3-6793-4a06-ae25-66d7cb3b4cbe	1	5	\N	pod2	{"name": "pod2", "site": 2, "slug": "pod2", "created": "2019-12-29", "last_updated": "2019-12-29T11:55:41.404Z"}	28	\N	1
244	2019-12-29 11:55:53.108386+00	admin	e856df35-f115-4ce2-b1bd-8e2fccc8c6c9	1	6	\N	3tier	{"name": "3tier", "site": 2, "slug": "3tier", "created": "2019-12-29", "last_updated": "2019-12-29T11:55:53.104Z"}	28	\N	1
245	2019-12-29 11:56:05.643794+00	admin	b5bf96fa-b0ef-4c57-a55f-7a50ea96de72	1	7	\N	edge	{"name": "edge", "site": 2, "slug": "edge", "created": "2019-12-29", "last_updated": "2019-12-29T11:56:05.640Z"}	28	\N	1
246	2019-12-29 11:56:31.721986+00	admin	5f62fa0f-ba5b-4b48-8045-63b9ea46cd36	3	8	\N	pod2	{"name": "pod2", "role": null, "site": 2, "tags": [], "type": null, "group": null, "width": 19, "serial": "", "status": 3, "tenant": null, "created": "2019-12-29", "comments": "", "u_height": 42, "asset_tag": null, "desc_units": false, "outer_unit": null, "facility_id": null, "outer_depth": null, "outer_width": null, "last_updated": "2019-12-29T11:55:25.032Z", "custom_fields": {}}	27	\N	1
247	2019-12-29 11:56:59.979457+00	admin	43d522d6-b8a1-4f2a-855b-5babc87f8984	2	6	\N	Edge	{"name": "Edge", "role": null, "site": 2, "tags": [], "type": null, "group": 7, "width": 19, "serial": "", "status": 3, "tenant": null, "created": "2018-06-09", "comments": "", "u_height": 42, "asset_tag": null, "desc_units": false, "outer_unit": null, "facility_id": null, "outer_depth": null, "outer_width": null, "last_updated": "2019-12-29T11:56:59.965Z", "custom_fields": {}}	27	\N	1
248	2019-12-29 12:00:45.187731+00	admin	a238b966-d036-4966-be5b-ddf461981172	2	1	\N	Rack1-pod1	{"name": "Rack1-pod1", "role": null, "site": 2, "tags": [], "type": null, "group": null, "width": 19, "serial": "", "status": 3, "tenant": null, "created": "2018-06-03", "comments": "", "u_height": 42, "asset_tag": null, "desc_units": false, "outer_unit": null, "facility_id": null, "outer_depth": null, "outer_width": null, "last_updated": "2019-12-29T12:00:45.136Z", "custom_fields": {}}	27	\N	1
249	2019-12-29 12:00:45.198123+00	admin	a238b966-d036-4966-be5b-ddf461981172	2	1	\N	leaf01	{"face": null, "name": "leaf01", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2018-06-03", "comments": "", "platform": 1, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:00:45.141Z", "custom_fields": {"ASN": "65111"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
250	2019-12-29 12:00:45.209189+00	admin	a238b966-d036-4966-be5b-ddf461981172	2	3	\N	Rack2-pod1	{"name": "Rack2-pod1", "role": null, "site": 2, "tags": [], "type": null, "group": null, "width": 19, "serial": "", "status": 3, "tenant": null, "created": "2018-06-09", "comments": "", "u_height": 42, "asset_tag": null, "desc_units": false, "outer_unit": null, "facility_id": null, "outer_depth": null, "outer_width": null, "last_updated": "2019-12-29T12:00:45.156Z", "custom_fields": {}}	27	\N	1
251	2019-12-29 12:00:45.217695+00	admin	a238b966-d036-4966-be5b-ddf461981172	2	4	\N	Rack3-pod1	{"name": "Rack3-pod1", "role": null, "site": 2, "tags": [], "type": null, "group": null, "width": 19, "serial": "", "status": 3, "tenant": null, "created": "2018-06-09", "comments": "", "u_height": 42, "asset_tag": null, "desc_units": false, "outer_unit": null, "facility_id": null, "outer_depth": null, "outer_width": null, "last_updated": "2019-12-29T12:00:45.164Z", "custom_fields": {}}	27	\N	1
252	2019-12-29 12:00:45.225943+00	admin	a238b966-d036-4966-be5b-ddf461981172	2	2	\N	Spine-pod1	{"name": "Spine-pod1", "role": null, "site": 2, "tags": [], "type": null, "group": null, "width": 19, "serial": "", "status": 3, "tenant": null, "created": "2018-06-08", "comments": "", "u_height": 42, "asset_tag": null, "desc_units": false, "outer_unit": null, "facility_id": null, "outer_depth": null, "outer_width": null, "last_updated": "2019-12-29T12:00:45.172Z", "custom_fields": {}}	27	\N	1
258	2019-12-29 12:01:18.558998+00	admin	d65118f3-3f3a-4ea9-b156-23c0eb2ade0b	2	6	\N	1005 (Vlan1005)	{"vid": 1005, "name": "Vlan1005", "role": null, "site": 2, "tags": [], "group": null, "status": 1, "tenant": null, "created": "2018-06-09", "description": "", "last_updated": "2019-12-29T12:01:18.452Z", "custom_fields": {}}	42	\N	1
259	2019-12-29 12:01:18.568374+00	admin	d65118f3-3f3a-4ea9-b156-23c0eb2ade0b	2	7	\N	2501 (Vlan2501)	{"vid": 2501, "name": "Vlan2501", "role": null, "site": 2, "tags": [], "group": null, "status": 1, "tenant": null, "created": "2018-06-09", "description": "", "last_updated": "2019-12-29T12:01:18.456Z", "custom_fields": {}}	42	\N	1
260	2019-12-29 12:01:18.578538+00	admin	d65118f3-3f3a-4ea9-b156-23c0eb2ade0b	2	8	\N	2502 (Vlan2502)	{"vid": 2502, "name": "Vlan2502", "role": null, "site": 2, "tags": [], "group": null, "status": 1, "tenant": null, "created": "2018-06-09", "description": "", "last_updated": "2019-12-29T12:01:18.459Z", "custom_fields": {}}	42	\N	1
261	2019-12-29 12:01:18.586899+00	admin	d65118f3-3f3a-4ea9-b156-23c0eb2ade0b	2	9	\N	2503 (Vlan2503)	{"vid": 2503, "name": "Vlan2503", "role": null, "site": 2, "tags": [], "group": null, "status": 1, "tenant": null, "created": "2018-06-09", "description": "", "last_updated": "2019-12-29T12:01:18.463Z", "custom_fields": {}}	42	\N	1
262	2019-12-29 12:01:18.595344+00	admin	d65118f3-3f3a-4ea9-b156-23c0eb2ade0b	2	10	\N	2504 (Vlan2504)	{"vid": 2504, "name": "Vlan2504", "role": null, "site": 2, "tags": [], "group": null, "status": 1, "tenant": null, "created": "2018-06-09", "description": "", "last_updated": "2019-12-29T12:01:18.466Z", "custom_fields": {}}	42	\N	1
263	2019-12-29 12:01:18.604264+00	admin	d65118f3-3f3a-4ea9-b156-23c0eb2ade0b	2	11	\N	2505 (Vlan2505)	{"vid": 2505, "name": "Vlan2505", "role": null, "site": 2, "tags": [], "group": null, "status": 1, "tenant": null, "created": "2018-06-09", "description": "", "last_updated": "2019-12-29T12:01:18.469Z", "custom_fields": {}}	42	\N	1
264	2019-12-29 12:01:18.612936+00	admin	d65118f3-3f3a-4ea9-b156-23c0eb2ade0b	2	12	\N	2506 (Vlan2506)	{"vid": 2506, "name": "Vlan2506", "role": null, "site": 2, "tags": [], "group": null, "status": 1, "tenant": null, "created": "2018-06-09", "description": "", "last_updated": "2019-12-29T12:01:18.472Z", "custom_fields": {}}	42	\N	1
265	2019-12-29 12:01:18.621286+00	admin	d65118f3-3f3a-4ea9-b156-23c0eb2ade0b	2	13	\N	2507 (Vlan2507)	{"vid": 2507, "name": "Vlan2507", "role": null, "site": 2, "tags": [], "group": null, "status": 1, "tenant": null, "created": "2018-06-09", "description": "", "last_updated": "2019-12-29T12:01:18.475Z", "custom_fields": {}}	42	\N	1
266	2019-12-29 12:01:18.629801+00	admin	d65118f3-3f3a-4ea9-b156-23c0eb2ade0b	2	14	\N	2508 (Vlan2508)	{"vid": 2508, "name": "Vlan2508", "role": null, "site": 2, "tags": [], "group": null, "status": 1, "tenant": null, "created": "2018-06-09", "description": "", "last_updated": "2019-12-29T12:01:18.477Z", "custom_fields": {}}	42	\N	1
267	2019-12-29 12:01:18.637934+00	admin	d65118f3-3f3a-4ea9-b156-23c0eb2ade0b	2	16	\N	2701 (Vlan2701)	{"vid": 2701, "name": "Vlan2701", "role": null, "site": 2, "tags": [], "group": null, "status": 1, "tenant": null, "created": "2018-06-09", "description": "", "last_updated": "2019-12-29T12:01:18.480Z", "custom_fields": {}}	42	\N	1
268	2019-12-29 12:01:18.649309+00	admin	d65118f3-3f3a-4ea9-b156-23c0eb2ade0b	2	17	\N	2702 (Vlan2702)	{"vid": 2702, "name": "Vlan2702", "role": null, "site": 2, "tags": [], "group": null, "status": 1, "tenant": null, "created": "2018-06-09", "description": "", "last_updated": "2019-12-29T12:01:18.483Z", "custom_fields": {}}	42	\N	1
269	2019-12-29 12:01:18.659531+00	admin	d65118f3-3f3a-4ea9-b156-23c0eb2ade0b	2	18	\N	2703 (Vlan2703)	{"vid": 2703, "name": "Vlan2703", "role": null, "site": 2, "tags": [], "group": null, "status": 1, "tenant": null, "created": "2018-06-09", "description": "", "last_updated": "2019-12-29T12:01:18.486Z", "custom_fields": {}}	42	\N	1
270	2019-12-29 12:01:18.66898+00	admin	d65118f3-3f3a-4ea9-b156-23c0eb2ade0b	2	19	\N	2704 (Vlan2704)	{"vid": 2704, "name": "Vlan2704", "role": null, "site": 2, "tags": [], "group": null, "status": 1, "tenant": null, "created": "2018-06-09", "description": "", "last_updated": "2019-12-29T12:01:18.488Z", "custom_fields": {}}	42	\N	1
271	2019-12-29 12:01:30.533434+00	admin	b97fa23f-347a-4a21-b2af-16f2f85d962c	3	1	\N	Virtual Topology	{"asn": null, "name": "Virtual Topology", "slug": "virtual-topology", "tags": [], "region": null, "status": 1, "tenant": null, "created": "2018-06-03", "comments": "", "facility": "", "latitude": null, "longitude": null, "time_zone": null, "description": "", "contact_name": "", "last_updated": "2018-06-03T16:38:35.013Z", "contact_email": "", "contact_phone": "", "custom_fields": {}, "physical_address": "", "shipping_address": ""}	29	\N	1
272	2019-12-29 12:02:33.3631+00	admin	9c813ca5-7cc5-4e4a-81a6-cb8f22a4ba2b	2	1	\N	Rack1-pod1	{"name": "Rack1-pod1", "role": null, "site": 2, "tags": [], "type": null, "group": 4, "width": 19, "serial": "", "status": 3, "tenant": null, "created": "2018-06-03", "comments": "", "u_height": 42, "asset_tag": null, "desc_units": false, "outer_unit": null, "facility_id": null, "outer_depth": null, "outer_width": null, "last_updated": "2019-12-29T12:02:33.315Z", "custom_fields": {}}	27	\N	1
273	2019-12-29 12:02:33.372782+00	admin	9c813ca5-7cc5-4e4a-81a6-cb8f22a4ba2b	2	3	\N	Rack2-pod1	{"name": "Rack2-pod1", "role": null, "site": 2, "tags": [], "type": null, "group": 4, "width": 19, "serial": "", "status": 3, "tenant": null, "created": "2018-06-09", "comments": "", "u_height": 42, "asset_tag": null, "desc_units": false, "outer_unit": null, "facility_id": null, "outer_depth": null, "outer_width": null, "last_updated": "2019-12-29T12:02:33.331Z", "custom_fields": {}}	27	\N	1
274	2019-12-29 12:02:33.3813+00	admin	9c813ca5-7cc5-4e4a-81a6-cb8f22a4ba2b	2	4	\N	Rack3-pod1	{"name": "Rack3-pod1", "role": null, "site": 2, "tags": [], "type": null, "group": 4, "width": 19, "serial": "", "status": 3, "tenant": null, "created": "2018-06-09", "comments": "", "u_height": 42, "asset_tag": null, "desc_units": false, "outer_unit": null, "facility_id": null, "outer_depth": null, "outer_width": null, "last_updated": "2019-12-29T12:02:33.341Z", "custom_fields": {}}	27	\N	1
275	2019-12-29 12:02:33.391009+00	admin	9c813ca5-7cc5-4e4a-81a6-cb8f22a4ba2b	2	2	\N	Spine-pod1	{"name": "Spine-pod1", "role": null, "site": 2, "tags": [], "type": null, "group": 4, "width": 19, "serial": "", "status": 3, "tenant": null, "created": "2018-06-08", "comments": "", "u_height": 42, "asset_tag": null, "desc_units": false, "outer_unit": null, "facility_id": null, "outer_depth": null, "outer_width": null, "last_updated": "2019-12-29T12:02:33.352Z", "custom_fields": {}}	27	\N	1
276	2019-12-29 12:03:27.421639+00	admin	aa8c39ea-a8b5-4178-9861-52d199b7c2e6	1	9	\N	Service-pod1	{"name": "Service-pod1", "role": null, "site": 2, "tags": [], "type": null, "group": 4, "width": 19, "serial": "", "status": 3, "tenant": null, "created": "2019-12-29", "comments": "", "u_height": 42, "asset_tag": null, "desc_units": false, "outer_unit": null, "facility_id": null, "outer_depth": null, "outer_width": null, "last_updated": "2019-12-29T12:03:27.404Z", "custom_fields": {}}	27	\N	1
394	2019-12-29 13:32:43.541927+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	14	1	swp13	{"name": "swp13", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
277	2019-12-29 12:03:38.047565+00	admin	65f7fa0e-d4f6-454a-a398-4b2fcf0e1f85	3	4	\N	Rack3-pod1	{"name": "Rack3-pod1", "role": null, "site": 2, "tags": [], "type": null, "group": 4, "width": 19, "serial": "", "status": 3, "tenant": null, "created": "2018-06-09", "comments": "", "u_height": 42, "asset_tag": null, "desc_units": false, "outer_unit": null, "facility_id": null, "outer_depth": null, "outer_width": null, "last_updated": "2019-12-29T12:02:33.341Z", "custom_fields": {}}	27	\N	1
278	2019-12-29 12:05:36.48187+00	admin	a0440fce-6edb-476d-9c33-6311ffb7cab7	1	10	\N	Rack1-pod2	{"name": "Rack1-pod2", "role": null, "site": 2, "tags": [], "type": null, "group": 4, "width": 19, "serial": "", "status": 3, "tenant": null, "created": "2019-12-29", "comments": "", "u_height": 42, "asset_tag": null, "desc_units": false, "outer_unit": null, "facility_id": null, "outer_depth": null, "outer_width": null, "last_updated": "2019-12-29T12:05:36.429Z", "custom_fields": {}}	27	\N	1
279	2019-12-29 12:05:36.495456+00	admin	a0440fce-6edb-476d-9c33-6311ffb7cab7	1	11	\N	Rack2-pod2	{"name": "Rack2-pod2", "role": null, "site": 2, "tags": [], "type": null, "group": 4, "width": 19, "serial": "", "status": 3, "tenant": null, "created": "2019-12-29", "comments": "", "u_height": 42, "asset_tag": null, "desc_units": false, "outer_unit": null, "facility_id": null, "outer_depth": null, "outer_width": null, "last_updated": "2019-12-29T12:05:36.436Z", "custom_fields": {}}	27	\N	1
280	2019-12-29 12:05:36.504267+00	admin	a0440fce-6edb-476d-9c33-6311ffb7cab7	1	12	\N	Service-pod2	{"name": "Service-pod2", "role": null, "site": 2, "tags": [], "type": null, "group": 4, "width": 19, "serial": "", "status": 3, "tenant": null, "created": "2019-12-29", "comments": "", "u_height": 42, "asset_tag": null, "desc_units": false, "outer_unit": null, "facility_id": null, "outer_depth": null, "outer_width": null, "last_updated": "2019-12-29T12:05:36.443Z", "custom_fields": {}}	27	\N	1
281	2019-12-29 12:05:36.515842+00	admin	a0440fce-6edb-476d-9c33-6311ffb7cab7	1	13	\N	Spine-pod2	{"name": "Spine-pod2", "role": null, "site": 2, "tags": [], "type": null, "group": 4, "width": 19, "serial": "", "status": 3, "tenant": null, "created": "2019-12-29", "comments": "", "u_height": 42, "asset_tag": null, "desc_units": false, "outer_unit": null, "facility_id": null, "outer_depth": null, "outer_width": null, "last_updated": "2019-12-29T12:05:36.449Z", "custom_fields": {}}	27	\N	1
282	2019-12-29 12:06:34.959769+00	admin	da7375d8-6e4e-4c2e-80b1-df85f6064654	1	14	\N	3tier	{"name": "3tier", "role": null, "site": 2, "tags": [], "type": null, "group": 6, "width": 19, "serial": "", "status": 3, "tenant": null, "created": "2019-12-29", "comments": "", "u_height": 42, "asset_tag": null, "desc_units": false, "outer_unit": null, "facility_id": null, "outer_depth": null, "outer_width": null, "last_updated": "2019-12-29T12:06:34.938Z", "custom_fields": {}}	27	\N	1
283	2019-12-29 12:08:19.678665+00	admin	11403a6e-e428-459c-8189-8ba45d0897fd	1	2	\N	Canonical	{"name": "Canonical", "slug": "canonical", "created": "2019-12-29", "last_updated": "2019-12-29T12:08:19.668Z"}	21	\N	1
284	2019-12-29 12:09:32.578367+00	admin	a799750b-f220-441c-b327-8dda5fcb6402	1	2	\N	Ubuntu 18.04 vm	{"slug": "ubuntu-18-04-vm", "tags": [], "model": "Ubuntu 18.04 vm", "created": "2019-12-29", "comments": "", "u_height": 1, "part_number": "", "last_updated": "2019-12-29T12:09:32.559Z", "manufacturer": 2, "custom_fields": {}, "is_full_depth": true, "subdevice_role": null}	17	\N	1
285	2019-12-29 12:10:08.488928+00	admin	e45f43a9-2bb1-4e24-bcb2-cdac1f78871b	1	15	\N	OOB	{"name": "OOB", "role": null, "site": 2, "tags": [], "type": null, "group": null, "width": 19, "serial": "", "status": 3, "tenant": null, "created": "2019-12-29", "comments": "", "u_height": 42, "asset_tag": null, "desc_units": false, "outer_unit": null, "facility_id": null, "outer_depth": null, "outer_width": null, "last_updated": "2019-12-29T12:10:08.472Z", "custom_fields": {}}	27	\N	1
286	2019-12-29 12:10:38.693706+00	admin	d9edf745-37bb-4474-89b3-7aa9f37b9e82	1	3	\N	NetQ Cloud VM appliance	{"slug": "netq-cloud-vm-appliance", "tags": [], "model": "NetQ Cloud VM appliance", "created": "2019-12-29", "comments": "", "u_height": 1, "part_number": "", "last_updated": "2019-12-29T12:10:38.678Z", "manufacturer": 1, "custom_fields": {}, "is_full_depth": true, "subdevice_role": null}	17	\N	1
287	2019-12-29 12:12:23.154655+00	admin	adf294c7-41c9-4bd1-849c-84bbd9f0bff0	1	3	\N	server	{"name": "server", "slug": "server", "color": "aa1409", "created": "2019-12-29", "vm_role": true, "last_updated": "2019-12-29T12:12:23.148Z"}	16	\N	1
288	2019-12-29 12:12:56.112863+00	admin	ca635fd6-bc61-4439-9727-9aadaaa9cca5	1	4	\N	oob-server	{"name": "oob-server", "slug": "oob-server", "color": "ff5722", "created": "2019-12-29", "vm_role": false, "last_updated": "2019-12-29T12:12:56.108Z"}	16	\N	1
289	2019-12-29 12:13:20.011272+00	admin	6c10cb5a-7d22-4e3d-a2a9-34cdca72ffc7	1	5	\N	superspine	{"name": "superspine", "slug": "superspine", "color": "2f6a31", "created": "2019-12-29", "vm_role": true, "last_updated": "2019-12-29T12:13:20.007Z"}	16	\N	1
290	2019-12-29 12:13:37.293527+00	admin	865329b4-8c69-4039-a723-093878eb490f	2	2	\N	Spine	{"name": "Spine", "slug": "spine", "color": "4caf50", "created": "2019-12-29", "vm_role": false, "last_updated": "2019-12-29T12:13:37.277Z"}	16	\N	1
291	2019-12-29 12:13:55.633776+00	admin	39cc4df7-8acd-489b-ae50-48e660b4a253	2	1	\N	Leaf	{"name": "Leaf", "slug": "leaf", "color": "8bc34a", "created": "2019-12-29", "vm_role": false, "last_updated": "2019-12-29T12:13:55.629Z"}	16	\N	1
292	2019-12-29 12:14:11.690876+00	admin	8fc83b04-d631-4410-b8e9-b752f5315d0c	2	4	\N	OOB Server	{"name": "OOB Server", "slug": "oob-server", "color": "ff5722", "created": "2019-12-29", "vm_role": false, "last_updated": "2019-12-29T12:14:11.687Z"}	16	\N	1
293	2019-12-29 12:14:19.871811+00	admin	e155c07c-38d3-4ef9-84f8-a1212c32aadb	2	3	\N	Server	{"name": "Server", "slug": "server", "color": "aa1409", "created": "2019-12-29", "vm_role": true, "last_updated": "2019-12-29T12:14:19.868Z"}	16	\N	1
294	2019-12-29 12:14:29.036002+00	admin	24260e4e-8cad-46ec-b3fd-9fb9fc8498e3	2	5	\N	Superspine	{"name": "Superspine", "slug": "superspine", "color": "2f6a31", "created": "2019-12-29", "vm_role": true, "last_updated": "2019-12-29T12:14:29.032Z"}	16	\N	1
295	2019-12-29 12:14:35.377337+00	admin	50ef4860-8df9-4925-993c-16102b359706	2	5	\N	Superspine	{"name": "Superspine", "slug": "superspine", "color": "2f6a31", "created": "2019-12-29", "vm_role": false, "last_updated": "2019-12-29T12:14:35.373Z"}	16	\N	1
296	2019-12-29 12:14:55.08803+00	admin	e7fe3c2b-b87d-4e1e-bda6-4f7afa8dc5c2	1	6	\N	Firewall	{"name": "Firewall", "slug": "firewall", "color": "f44336", "created": "2019-12-29", "vm_role": true, "last_updated": "2019-12-29T12:14:55.084Z"}	16	\N	1
297	2019-12-29 12:15:17.091996+00	admin	53f6b55f-c541-4d97-873b-c0bd54224421	2	3	\N	Server	{"name": "Server", "slug": "server", "color": "3f51b5", "created": "2019-12-29", "vm_role": true, "last_updated": "2019-12-29T12:15:17.081Z"}	16	\N	1
298	2019-12-29 12:15:40.666603+00	admin	feadb433-ffc2-42fd-a2be-36cada21187b	1	7	\N	Router	{"name": "Router", "slug": "router", "color": "cddc39", "created": "2019-12-29", "vm_role": true, "last_updated": "2019-12-29T12:15:40.660Z"}	16	\N	1
395	2019-12-29 13:32:43.54389+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	15	1	swp14	{"name": "swp14", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
396	2019-12-29 13:32:43.545722+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	16	1	swp15	{"name": "swp15", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
299	2019-12-29 12:16:33.420852+00	admin	5ff72846-d4dc-4ecf-b07c-c4a7c2279114	1	17	\N	leaf02	{"face": null, "name": "leaf02", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:16:33.363Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
300	2019-12-29 12:17:30.429545+00	admin	51588877-da11-4381-9080-6d3fa7473e28	1	18	\N	server01	{"face": null, "name": "server01", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:17:30.380Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
301	2019-12-29 12:20:21.014879+00	admin	f7c87cd2-aa84-409a-88eb-fe6f50963682	1	19	\N	server02	{"face": null, "name": "server02", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:20:20.976Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
302	2019-12-29 12:20:48.430202+00	admin	c39b5229-d4a1-41e3-9f00-2d8bbe5de61e	1	20	\N	server03	{"face": null, "name": "server03", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:20:48.397Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
303	2019-12-29 12:23:14.795396+00	admin	e32d455f-bc7d-4462-9fae-8165e4713297	1	21	\N	server04	{"face": null, "name": "server04", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:23:14.749Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
304	2019-12-29 12:27:42.796543+00	admin	d8264866-3c83-442f-bfea-8d3d17d1e8ed	1	22	\N	leaf03	{"face": null, "name": "leaf03", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": 1, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:27:42.398Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
305	2019-12-29 12:27:42.806031+00	admin	d8264866-3c83-442f-bfea-8d3d17d1e8ed	1	23	\N	leaf04	{"face": null, "name": "leaf04", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:27:42.437Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
306	2019-12-29 12:27:42.814145+00	admin	d8264866-3c83-442f-bfea-8d3d17d1e8ed	1	24	\N	server05	{"face": null, "name": "server05", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:27:42.469Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
307	2019-12-29 12:27:42.822667+00	admin	d8264866-3c83-442f-bfea-8d3d17d1e8ed	1	25	\N	server06	{"face": null, "name": "server06", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:27:42.507Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
308	2019-12-29 12:27:42.831488+00	admin	d8264866-3c83-442f-bfea-8d3d17d1e8ed	1	26	\N	server07	{"face": null, "name": "server07", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:27:42.541Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
309	2019-12-29 12:27:42.83975+00	admin	d8264866-3c83-442f-bfea-8d3d17d1e8ed	1	27	\N	server08	{"face": null, "name": "server08", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:27:42.577Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
310	2019-12-29 12:27:42.848003+00	admin	d8264866-3c83-442f-bfea-8d3d17d1e8ed	1	28	\N	service01	{"face": null, "name": "service01", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": 1, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:27:42.626Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
311	2019-12-29 12:27:42.856605+00	admin	d8264866-3c83-442f-bfea-8d3d17d1e8ed	1	29	\N	service02	{"face": null, "name": "service02", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:27:42.666Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
312	2019-12-29 12:27:42.864814+00	admin	d8264866-3c83-442f-bfea-8d3d17d1e8ed	1	30	\N	server09	{"face": null, "name": "server09", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:27:42.697Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
313	2019-12-29 12:27:42.873128+00	admin	d8264866-3c83-442f-bfea-8d3d17d1e8ed	1	31	\N	server10	{"face": null, "name": "server10", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:27:42.727Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
314	2019-12-29 12:29:40.759239+00	admin	fbbf34c1-582b-44c0-b364-cea0aba28202	1	32	\N	fw01	{"face": null, "name": "fw01", "rack": 9, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 6, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:29:40.720Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
315	2019-12-29 12:30:17.073703+00	admin	4249bfbb-1de3-47c8-aed8-857f5a554e0c	1	33	\N	fw02	{"face": null, "name": "fw02", "rack": 12, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 6, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:30:17.029Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
316	2019-12-29 12:31:34.218088+00	admin	87ba2d07-af00-42eb-b3cd-ff4712b0badc	1	34	\N	spine01	{"face": null, "name": "spine01", "rack": 2, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:31:34.166Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
317	2019-12-29 12:32:41.617857+00	admin	8b18f4be-013e-44c6-98be-f41a80401ebc	1	35	\N	spine02	{"face": null, "name": "spine02", "rack": 2, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:32:41.494Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
318	2019-12-29 12:32:41.627471+00	admin	8b18f4be-013e-44c6-98be-f41a80401ebc	1	36	\N	spine03	{"face": null, "name": "spine03", "rack": 2, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:32:41.530Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
319	2019-12-29 12:32:41.635646+00	admin	8b18f4be-013e-44c6-98be-f41a80401ebc	1	37	\N	spine04	{"face": null, "name": "spine04", "rack": 2, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:32:41.561Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
320	2019-12-29 12:33:53.212833+00	admin	a4c04bea-0e3f-48f0-a872-c6286ceb5ce2	1	38	\N	super01	{"face": null, "name": "super01", "rack": 14, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 5, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:33:53.175Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
321	2019-12-29 13:02:31.783031+00	admin	ac58df54-537f-4bd1-ab66-b14c15f0c907	2	24	\N	server05	{"face": null, "name": "server05", "rack": 3, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:02:31.764Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
322	2019-12-29 13:03:16.149981+00	admin	02f0a1cd-ff54-4dcb-a0a7-3e25d447ed26	2	25	\N	server06	{"face": null, "name": "server06", "rack": 3, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:03:16.131Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
323	2019-12-29 13:03:28.83077+00	admin	c9673656-dad4-4976-bc03-d87bdd2482bf	2	26	\N	server07	{"face": null, "name": "server07", "rack": 3, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:03:28.813Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
324	2019-12-29 13:03:42.751563+00	admin	7f4a8402-76ae-4df1-ba83-5a4b626f90a5	2	27	\N	server08	{"face": null, "name": "server08", "rack": 3, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:03:42.728Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
325	2019-12-29 13:03:54.756689+00	admin	95301c1c-61cb-4dc4-94e8-a85926b934ba	2	22	\N	leaf03	{"face": null, "name": "leaf03", "rack": 3, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": 1, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:03:54.736Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
326	2019-12-29 13:04:06.131498+00	admin	2b04c6cd-1f3a-4639-be38-eb3e5cec1ddf	2	23	\N	leaf04	{"face": null, "name": "leaf04", "rack": 3, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:04:06.113Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
327	2019-12-29 13:04:49.179993+00	admin	938b3577-d630-4b0d-ad37-1dceccb5f8c4	2	30	\N	server09	{"face": null, "name": "server09", "rack": 9, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:04:49.162Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
328	2019-12-29 13:05:04.847184+00	admin	584fb442-674f-493a-8066-882a9553822f	2	31	\N	server10	{"face": null, "name": "server10", "rack": 9, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:05:04.827Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
329	2019-12-29 13:05:59.41615+00	admin	a19d878c-2a5d-48c1-b344-8aa2148ba657	2	28	\N	service01	{"face": null, "name": "service01", "rack": 9, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": 1, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:05:59.397Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
330	2019-12-29 13:06:14.243996+00	admin	56814e61-96d6-4585-ad94-53d1cb9ed475	2	29	\N	service02	{"face": null, "name": "service02", "rack": 9, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:06:14.224Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
331	2019-12-29 13:08:17.967188+00	admin	18c01166-efaf-4e2a-84fe-10bbe35c1d5e	2	33	\N	fw02	{"face": null, "name": "fw02", "rack": 9, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 6, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:08:17.948Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
332	2019-12-29 13:10:30.984587+00	admin	f93b7d62-9f8f-41dd-9de1-0a38f3712586	2	32	\N	fw01	{"face": null, "name": "fw01", "rack": 9, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 6, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:10:30.758Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
333	2019-12-29 13:10:30.991665+00	admin	f93b7d62-9f8f-41dd-9de1-0a38f3712586	2	33	\N	fw02	{"face": null, "name": "fw02", "rack": 9, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 6, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:10:30.774Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
334	2019-12-29 13:10:30.999048+00	admin	f93b7d62-9f8f-41dd-9de1-0a38f3712586	2	1	\N	leaf01	{"face": null, "name": "leaf01", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2018-06-03", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:10:30.790Z", "custom_fields": {"ASN": "65111"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
335	2019-12-29 13:10:31.005423+00	admin	f93b7d62-9f8f-41dd-9de1-0a38f3712586	2	17	\N	leaf02	{"face": null, "name": "leaf02", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:10:30.805Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
336	2019-12-29 13:10:31.011777+00	admin	f93b7d62-9f8f-41dd-9de1-0a38f3712586	2	22	\N	leaf03	{"face": null, "name": "leaf03", "rack": 3, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:10:30.821Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
337	2019-12-29 13:10:31.017924+00	admin	f93b7d62-9f8f-41dd-9de1-0a38f3712586	2	23	\N	leaf04	{"face": null, "name": "leaf04", "rack": 3, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:10:30.837Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
338	2019-12-29 13:10:31.0242+00	admin	f93b7d62-9f8f-41dd-9de1-0a38f3712586	2	28	\N	service01	{"face": null, "name": "service01", "rack": 9, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:10:30.852Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
339	2019-12-29 13:10:31.03051+00	admin	f93b7d62-9f8f-41dd-9de1-0a38f3712586	2	29	\N	service02	{"face": null, "name": "service02", "rack": 9, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:10:30.868Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
340	2019-12-29 13:10:31.039317+00	admin	f93b7d62-9f8f-41dd-9de1-0a38f3712586	2	34	\N	spine01	{"face": null, "name": "spine01", "rack": 2, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:10:30.886Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
341	2019-12-29 13:10:31.047922+00	admin	f93b7d62-9f8f-41dd-9de1-0a38f3712586	2	35	\N	spine02	{"face": null, "name": "spine02", "rack": 2, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:10:30.902Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
342	2019-12-29 13:10:31.056815+00	admin	f93b7d62-9f8f-41dd-9de1-0a38f3712586	2	36	\N	spine03	{"face": null, "name": "spine03", "rack": 2, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:10:30.926Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
343	2019-12-29 13:10:31.065804+00	admin	f93b7d62-9f8f-41dd-9de1-0a38f3712586	2	37	\N	spine04	{"face": null, "name": "spine04", "rack": 2, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:10:30.942Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
344	2019-12-29 13:10:31.08296+00	admin	f93b7d62-9f8f-41dd-9de1-0a38f3712586	2	38	\N	super01	{"face": null, "name": "super01", "rack": 14, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 5, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:10:30.958Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
345	2019-12-29 13:12:55.891027+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	39	\N	super02	{"face": null, "name": "super02", "rack": 14, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 5, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:54.952Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
346	2019-12-29 13:12:55.904065+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	40	\N	super03	{"face": null, "name": "super03", "rack": 14, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 5, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:54.987Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
347	2019-12-29 13:12:55.913039+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	41	\N	super04	{"face": null, "name": "super04", "rack": 14, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 5, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.024Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
348	2019-12-29 13:12:55.929108+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	42	\N	fw03	{"face": null, "name": "fw03", "rack": 12, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 6, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.058Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
349	2019-12-29 13:12:55.937368+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	43	\N	fw04	{"face": null, "name": "fw04", "rack": 12, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 6, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.093Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
350	2019-12-29 13:12:55.94559+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	44	\N	leaf05	{"face": null, "name": "leaf05", "rack": 10, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.128Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
351	2019-12-29 13:12:55.953926+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	45	\N	leaf06	{"face": null, "name": "leaf06", "rack": 10, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.163Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
352	2019-12-29 13:12:55.96249+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	46	\N	leaf07	{"face": null, "name": "leaf07", "rack": 11, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.196Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
353	2019-12-29 13:12:55.971286+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	47	\N	leaf08	{"face": null, "name": "leaf08", "rack": 11, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.234Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
354	2019-12-29 13:12:55.980142+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	48	\N	server11	{"face": null, "name": "server11", "rack": 12, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.270Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
355	2019-12-29 13:12:55.994052+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	49	\N	server12	{"face": null, "name": "server12", "rack": 12, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.304Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
397	2019-12-29 13:32:43.547608+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	17	1	swp16	{"name": "swp16", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
356	2019-12-29 13:12:56.00264+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	50	\N	server13	{"face": null, "name": "server13", "rack": 10, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.336Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
357	2019-12-29 13:12:56.013466+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	51	\N	server14	{"face": null, "name": "server14", "rack": 10, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.368Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
358	2019-12-29 13:12:56.027917+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	52	\N	server15	{"face": null, "name": "server15", "rack": 11, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.399Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
359	2019-12-29 13:12:56.039382+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	53	\N	server16	{"face": null, "name": "server16", "rack": 11, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.430Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
360	2019-12-29 13:12:56.050282+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	54	\N	server17	{"face": null, "name": "server17", "rack": 11, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.460Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
361	2019-12-29 13:12:56.066373+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	55	\N	server18	{"face": null, "name": "server18", "rack": 11, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.495Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
362	2019-12-29 13:12:56.077414+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	56	\N	server19	{"face": null, "name": "server19", "rack": 11, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.525Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
363	2019-12-29 13:12:56.088312+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	57	\N	server20	{"face": null, "name": "server20", "rack": 11, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.556Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
364	2019-12-29 13:12:56.096659+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	58	\N	service03	{"face": null, "name": "service03", "rack": 12, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.587Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
365	2019-12-29 13:12:56.104922+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	59	\N	service04	{"face": null, "name": "service04", "rack": 12, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.628Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
366	2019-12-29 13:12:56.113166+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	60	\N	spine05	{"face": null, "name": "spine05", "rack": 13, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.660Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
367	2019-12-29 13:12:56.121302+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	61	\N	spine06	{"face": null, "name": "spine06", "rack": 13, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.701Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
368	2019-12-29 13:12:56.129648+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	62	\N	spine07	{"face": null, "name": "spine07", "rack": 13, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.739Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
369	2019-12-29 13:12:56.137823+00	admin	c1ce24a5-6624-4abd-8295-8b98cb6b678a	1	63	\N	spine08	{"face": null, "name": "spine08", "rack": 13, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.774Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
370	2019-12-29 13:14:56.380965+00	admin	8e99942d-cf22-4acb-8ad3-a5abb4c2bd9a	1	64	\N	exit01	{"face": null, "name": "exit01", "rack": 6, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:14:56.332Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
371	2019-12-29 13:15:40.822007+00	admin	7245572a-60ab-449e-a076-312f940c4f1a	1	65	\N	exit02	{"face": null, "name": "exit02", "rack": 6, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:15:40.785Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
372	2019-12-29 13:16:03.903488+00	admin	427139d0-da4d-4022-ac6c-2805bafee029	1	66	\N	rtr01	{"face": null, "name": "rtr01", "rack": 6, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 7, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:16:03.869Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
373	2019-12-29 13:16:24.286006+00	admin	f0bf5944-8ca0-4501-a328-133d70ada1a2	1	67	\N	rtr02	{"face": null, "name": "rtr02", "rack": 6, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 7, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:16:24.251Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
374	2019-12-29 13:19:29.26243+00	admin	f478cb1a-b13e-45ab-9340-c8a3b1dd30e9	1	68	\N	oob-mgmt-server	{"face": null, "name": "oob-mgmt-server", "rack": 15, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 4, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:19:29.209Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
375	2019-12-29 13:19:59.351117+00	admin	fde6f8db-690f-4c02-a1d0-354d85513c88	1	69	\N	netq-ts	{"face": null, "name": "netq-ts", "rack": null, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:19:59.301Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
376	2019-12-29 13:21:07.841119+00	admin	4198af69-be5b-4f61-9a58-9b3dc49839fa	1	8	\N	OOB Switch	{"name": "OOB Switch", "slug": "oob-switch", "color": "cddc39", "created": "2019-12-29", "vm_role": false, "last_updated": "2019-12-29T13:21:07.833Z"}	16	\N	1
377	2019-12-29 13:21:39.130903+00	admin	f71b10ea-cb45-4fd3-bcf5-cafd1e6644ae	1	70	\N	oob-mgmt-switch	{"face": null, "name": "oob-mgmt-switch", "rack": 15, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 8, "device_type": 3, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:21:39.083Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
378	2019-12-29 13:23:23.022884+00	admin	3f36a718-3102-46aa-8e0a-6c9c20826dd5	2	4	\N	OOB Server	{"name": "OOB Server", "slug": "oob-server", "color": "2196f3", "created": "2019-12-29", "vm_role": false, "last_updated": "2019-12-29T13:23:23.016Z"}	16	\N	1
379	2019-12-29 13:26:38.433767+00	admin	c5f91da9-f2c3-42fd-b260-269fa0ac58df	2	6	\N	Firewall	{"name": "Firewall", "slug": "firewall", "color": "f44336", "created": "2019-12-29", "vm_role": false, "last_updated": "2019-12-29T13:26:38.429Z"}	16	\N	1
380	2019-12-29 13:26:46.304459+00	admin	98ce661e-d878-42b0-9391-c195501b7a34	2	7	\N	Router	{"name": "Router", "slug": "router", "color": "cddc39", "created": "2019-12-29", "vm_role": false, "last_updated": "2019-12-29T13:26:46.300Z"}	16	\N	1
381	2019-12-29 13:31:32.59652+00	admin	89747a88-a09b-4403-9e71-4f33d0505b40	1	1	1	eth0	{"name": "eth0", "type": 1000, "mgmt_only": true, "device_type": 1}	20	17	1
382	2019-12-29 13:32:43.519917+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	2	1	swp1	{"name": "swp1", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
383	2019-12-29 13:32:43.52298+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	3	1	swp2	{"name": "swp2", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
384	2019-12-29 13:32:43.524793+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	4	1	swp3	{"name": "swp3", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
385	2019-12-29 13:32:43.526536+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	5	1	swp4	{"name": "swp4", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
386	2019-12-29 13:32:43.528197+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	6	1	swp5	{"name": "swp5", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
387	2019-12-29 13:32:43.529887+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	7	1	swp6	{"name": "swp6", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
388	2019-12-29 13:32:43.531675+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	8	1	swp7	{"name": "swp7", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
389	2019-12-29 13:32:43.533275+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	9	1	swp8	{"name": "swp8", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
390	2019-12-29 13:32:43.534932+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	10	1	swp9	{"name": "swp9", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
391	2019-12-29 13:32:43.536708+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	11	1	swp10	{"name": "swp10", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
392	2019-12-29 13:32:43.538433+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	12	1	swp11	{"name": "swp11", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
401	2019-12-29 13:32:43.554692+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	21	1	swp20	{"name": "swp20", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
402	2019-12-29 13:32:43.556966+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	22	1	swp21	{"name": "swp21", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
403	2019-12-29 13:32:43.558706+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	23	1	swp22	{"name": "swp22", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
404	2019-12-29 13:32:43.560347+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	24	1	swp23	{"name": "swp23", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
405	2019-12-29 13:32:43.56203+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	25	1	swp24	{"name": "swp24", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
406	2019-12-29 13:32:43.563622+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	26	1	swp25	{"name": "swp25", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
407	2019-12-29 13:32:43.565198+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	27	1	swp26	{"name": "swp26", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
408	2019-12-29 13:32:43.566947+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	28	1	swp27	{"name": "swp27", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
409	2019-12-29 13:32:43.56917+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	29	1	swp28	{"name": "swp28", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
410	2019-12-29 13:32:43.571248+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	30	1	swp29	{"name": "swp29", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
411	2019-12-29 13:32:43.572878+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	31	1	swp30	{"name": "swp30", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
412	2019-12-29 13:32:43.574642+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	32	1	swp31	{"name": "swp31", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
413	2019-12-29 13:32:43.576363+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	33	1	swp32	{"name": "swp32", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
414	2019-12-29 13:32:43.577923+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	34	1	swp33	{"name": "swp33", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
415	2019-12-29 13:32:43.579524+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	35	1	swp34	{"name": "swp34", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
416	2019-12-29 13:32:43.581268+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	36	1	swp35	{"name": "swp35", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
417	2019-12-29 13:32:43.583083+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	37	1	swp36	{"name": "swp36", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
418	2019-12-29 13:32:43.584796+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	38	1	swp37	{"name": "swp37", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
419	2019-12-29 13:32:43.586516+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	39	1	swp38	{"name": "swp38", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
420	2019-12-29 13:32:43.588254+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	40	1	swp39	{"name": "swp39", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
421	2019-12-29 13:32:43.589913+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	41	1	swp40	{"name": "swp40", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
422	2019-12-29 13:32:43.591629+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	42	1	swp41	{"name": "swp41", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
423	2019-12-29 13:32:43.59319+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	43	1	swp42	{"name": "swp42", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
424	2019-12-29 13:32:43.594855+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	44	1	swp43	{"name": "swp43", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
425	2019-12-29 13:32:43.59644+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	45	1	swp44	{"name": "swp44", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
426	2019-12-29 13:32:43.598037+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	46	1	swp45	{"name": "swp45", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
427	2019-12-29 13:32:43.599644+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	47	1	swp46	{"name": "swp46", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
428	2019-12-29 13:32:43.601313+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	48	1	swp47	{"name": "swp47", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
429	2019-12-29 13:32:43.602989+00	admin	69854d43-39cd-431c-9294-b0fd9da7a5c7	1	49	1	swp48	{"name": "swp48", "type": 1200, "mgmt_only": false, "device_type": 1}	20	17	1
430	2019-12-29 13:33:10.851606+00	admin	c156e5da-effa-4855-9ea3-938bf2b5e856	1	50	1	swp49	{"name": "swp49", "type": 1600, "mgmt_only": false, "device_type": 1}	20	17	1
431	2019-12-29 13:33:10.854491+00	admin	c156e5da-effa-4855-9ea3-938bf2b5e856	1	51	1	swp50	{"name": "swp50", "type": 1600, "mgmt_only": false, "device_type": 1}	20	17	1
432	2019-12-29 13:33:10.856306+00	admin	c156e5da-effa-4855-9ea3-938bf2b5e856	1	52	1	swp51	{"name": "swp51", "type": 1600, "mgmt_only": false, "device_type": 1}	20	17	1
433	2019-12-29 13:33:10.858099+00	admin	c156e5da-effa-4855-9ea3-938bf2b5e856	1	53	1	swp52	{"name": "swp52", "type": 1600, "mgmt_only": false, "device_type": 1}	20	17	1
434	2019-12-29 13:33:10.863869+00	admin	c156e5da-effa-4855-9ea3-938bf2b5e856	1	54	1	swp53	{"name": "swp53", "type": 1600, "mgmt_only": false, "device_type": 1}	20	17	1
435	2019-12-29 13:33:10.865664+00	admin	c156e5da-effa-4855-9ea3-938bf2b5e856	1	55	1	swp54	{"name": "swp54", "type": 1600, "mgmt_only": false, "device_type": 1}	20	17	1
436	2019-12-29 13:33:10.870567+00	admin	c156e5da-effa-4855-9ea3-938bf2b5e856	1	56	1	swp55	{"name": "swp55", "type": 1600, "mgmt_only": false, "device_type": 1}	20	17	1
437	2019-12-29 13:33:10.872413+00	admin	c156e5da-effa-4855-9ea3-938bf2b5e856	1	57	1	swp56	{"name": "swp56", "type": 1600, "mgmt_only": false, "device_type": 1}	20	17	1
438	2019-12-29 13:34:07.05369+00	admin	6891ad6f-f7bc-4d05-b58f-0b7604820a0e	2	1	\N	Cumulus VX Leaf	{"slug": "cumulus-vx-leaf", "tags": [], "model": "Cumulus VX Leaf", "created": "2019-12-29", "comments": "", "u_height": 0, "part_number": "", "last_updated": "2019-12-29T13:34:07.040Z", "manufacturer": 1, "custom_fields": {}, "is_full_depth": false, "subdevice_role": null}	17	\N	1
439	2019-12-29 13:34:53.043738+00	admin	09ecff1f-4e55-41af-a168-ae3285e60b48	1	4	\N	Cumulus VX Spine	{"slug": "cumulus-vx-spine", "tags": [], "model": "Cumulus VX Spine", "created": "2019-12-29", "comments": "", "u_height": 1, "part_number": "", "last_updated": "2019-12-29T13:34:53.025Z", "manufacturer": 1, "custom_fields": {}, "is_full_depth": true, "subdevice_role": null}	17	\N	1
440	2019-12-29 13:35:08.309461+00	admin	92330efc-7da7-49f7-945f-66e6b44eea94	1	58	4	eth0	{"name": "eth0", "type": 1000, "mgmt_only": true, "device_type": 4}	20	17	1
441	2019-12-29 13:35:30.746429+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	59	4	swp1	{"name": "swp1", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
442	2019-12-29 13:35:30.749519+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	60	4	swp2	{"name": "swp2", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
443	2019-12-29 13:35:30.751632+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	61	4	swp3	{"name": "swp3", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
444	2019-12-29 13:35:30.753365+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	62	4	swp4	{"name": "swp4", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
445	2019-12-29 13:35:30.755112+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	63	4	swp5	{"name": "swp5", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
446	2019-12-29 13:35:30.756885+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	64	4	swp6	{"name": "swp6", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
447	2019-12-29 13:35:30.758599+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	65	4	swp7	{"name": "swp7", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
448	2019-12-29 13:35:30.760212+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	66	4	swp8	{"name": "swp8", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
449	2019-12-29 13:35:30.7618+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	67	4	swp9	{"name": "swp9", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
450	2019-12-29 13:35:30.763703+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	68	4	swp10	{"name": "swp10", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
451	2019-12-29 13:35:30.765293+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	69	4	swp11	{"name": "swp11", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
452	2019-12-29 13:35:30.767065+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	70	4	swp12	{"name": "swp12", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
453	2019-12-29 13:35:30.768701+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	71	4	swp13	{"name": "swp13", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
454	2019-12-29 13:35:30.770375+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	72	4	swp14	{"name": "swp14", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
455	2019-12-29 13:35:30.772336+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	73	4	swp15	{"name": "swp15", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
456	2019-12-29 13:35:30.77401+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	74	4	swp16	{"name": "swp16", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
457	2019-12-29 13:35:30.775797+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	75	4	swp17	{"name": "swp17", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
458	2019-12-29 13:35:30.77748+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	76	4	swp18	{"name": "swp18", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
459	2019-12-29 13:35:30.779137+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	77	4	swp19	{"name": "swp19", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
460	2019-12-29 13:35:30.780756+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	78	4	swp20	{"name": "swp20", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
461	2019-12-29 13:35:30.782435+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	79	4	swp21	{"name": "swp21", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
462	2019-12-29 13:35:30.784094+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	80	4	swp22	{"name": "swp22", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
463	2019-12-29 13:35:30.786105+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	81	4	swp23	{"name": "swp23", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
464	2019-12-29 13:35:30.787959+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	82	4	swp24	{"name": "swp24", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
465	2019-12-29 13:35:30.789952+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	83	4	swp25	{"name": "swp25", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
466	2019-12-29 13:35:30.791618+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	84	4	swp26	{"name": "swp26", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
467	2019-12-29 13:35:30.793395+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	85	4	swp27	{"name": "swp27", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
468	2019-12-29 13:35:30.795168+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	86	4	swp28	{"name": "swp28", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
469	2019-12-29 13:35:30.796815+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	87	4	swp29	{"name": "swp29", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
470	2019-12-29 13:35:30.798507+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	88	4	swp30	{"name": "swp30", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
471	2019-12-29 13:35:30.800175+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	89	4	swp31	{"name": "swp31", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
472	2019-12-29 13:35:30.801833+00	admin	ee0eb946-7f67-4b87-86c4-764e367ac2c9	1	90	4	swp32	{"name": "swp32", "type": 1600, "mgmt_only": false, "device_type": 4}	20	17	1
473	2019-12-29 13:39:32.331786+00	admin	03db4499-6d53-4c88-acad-6f9e6d9e36d2	2	28	\N	service01	{"face": null, "name": "service01", "rack": 9, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:39:32.312Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
474	2019-12-29 13:39:41.40241+00	admin	d868e481-f20f-4474-a1cb-25d0f69b373d	2	29	\N	service02	{"face": null, "name": "service02", "rack": 9, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:39:41.384Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
475	2019-12-29 13:39:50.71994+00	admin	991a2bad-3f52-4443-abc6-9990d9058651	2	58	\N	service03	{"face": null, "name": "service03", "rack": 12, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:39:50.699Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
476	2019-12-29 13:39:59.950866+00	admin	644902dd-3b06-44fb-9981-6a386866aca8	2	59	\N	service04	{"face": null, "name": "service04", "rack": 12, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:39:59.932Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
480	2019-12-29 13:40:37.125172+00	admin	731785a4-6636-46a8-a92c-65cf91857ca6	2	37	\N	spine04	{"face": null, "name": "spine04", "rack": 2, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:40:37.106Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
484	2019-12-29 13:41:09.906556+00	admin	200b07f0-be83-4cd2-9d73-1b245999cf7b	2	63	\N	spine08	{"face": null, "name": "spine08", "rack": 13, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:41:09.888Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
477	2019-12-29 13:40:10.312404+00	admin	a22f705c-6b5f-45b7-99a5-6c7b1797736f	2	34	\N	spine01	{"face": null, "name": "spine01", "rack": 2, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:40:10.295Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
478	2019-12-29 13:40:21.312139+00	admin	b7a07024-6826-4aff-b5f3-f437a3edc1b8	2	36	\N	spine03	{"face": null, "name": "spine03", "rack": 2, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:40:21.293Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
479	2019-12-29 13:40:28.923233+00	admin	e61af962-097a-4fb4-892b-813041793c09	2	35	\N	spine02	{"face": null, "name": "spine02", "rack": 2, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:40:28.906Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
481	2019-12-29 13:40:44.958732+00	admin	3c8a8fed-53a8-4940-a589-b86d0d16bab6	2	60	\N	spine05	{"face": null, "name": "spine05", "rack": 13, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:40:44.941Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
482	2019-12-29 13:40:53.017331+00	admin	3a118a98-c443-425f-a409-f55dd7bc72d5	2	61	\N	spine06	{"face": null, "name": "spine06", "rack": 13, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:40:52.997Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
483	2019-12-29 13:41:00.84905+00	admin	72be9fd7-143e-43ba-b8df-c2e2334395a9	2	62	\N	spine07	{"face": null, "name": "spine07", "rack": 13, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:41:00.825Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
485	2019-12-29 13:41:19.243964+00	admin	2ed82bb6-ba76-4e3d-ba74-7df55e5f1dcd	2	38	\N	super01	{"face": null, "name": "super01", "rack": 14, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 5, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:41:19.226Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
486	2019-12-29 13:41:38.347662+00	admin	3e55aee2-dc15-4be7-a82e-bb7d31fd1119	2	39	\N	super02	{"face": null, "name": "super02", "rack": 14, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 5, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:41:38.328Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
487	2019-12-29 13:41:47.009899+00	admin	6bd927c5-63e5-4f24-930a-07bd3ee8324f	2	40	\N	super03	{"face": null, "name": "super03", "rack": 14, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 5, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:41:46.992Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
488	2019-12-29 13:42:11.389517+00	admin	3fc281db-0130-4ae8-b333-526f1197e156	2	41	\N	super04	{"face": null, "name": "super04", "rack": 14, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 5, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:42:11.371Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
489	2019-12-29 13:45:18.147412+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	17	\N	leaf02	{"face": null, "name": "leaf02", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:10:30.805Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
490	2019-12-29 13:45:18.153658+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	18	\N	server01	{"face": null, "name": "server01", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:17:30.380Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
491	2019-12-29 13:45:18.156826+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	19	\N	server02	{"face": null, "name": "server02", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:20:20.976Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
492	2019-12-29 13:45:18.159713+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	20	\N	server03	{"face": null, "name": "server03", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:20:48.397Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
493	2019-12-29 13:45:18.162664+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	21	\N	server04	{"face": null, "name": "server04", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T12:23:14.749Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
494	2019-12-29 13:45:18.165479+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	22	\N	leaf03	{"face": null, "name": "leaf03", "rack": 3, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:10:30.821Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
495	2019-12-29 13:45:18.168333+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	23	\N	leaf04	{"face": null, "name": "leaf04", "rack": 3, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:10:30.837Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
496	2019-12-29 13:45:18.171105+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	24	\N	server05	{"face": null, "name": "server05", "rack": 3, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:02:31.764Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
497	2019-12-29 13:45:18.173914+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	25	\N	server06	{"face": null, "name": "server06", "rack": 3, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:03:16.131Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
498	2019-12-29 13:45:18.176712+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	26	\N	server07	{"face": null, "name": "server07", "rack": 3, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:03:28.813Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
499	2019-12-29 13:45:18.179461+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	27	\N	server08	{"face": null, "name": "server08", "rack": 3, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:03:42.728Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
500	2019-12-29 13:45:18.182224+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	28	\N	service01	{"face": null, "name": "service01", "rack": 9, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:39:32.312Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
501	2019-12-29 13:45:18.185069+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	29	\N	service02	{"face": null, "name": "service02", "rack": 9, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:39:41.384Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
502	2019-12-29 13:45:18.188021+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	30	\N	server09	{"face": null, "name": "server09", "rack": 9, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:04:49.162Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
503	2019-12-29 13:45:18.190939+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	31	\N	server10	{"face": null, "name": "server10", "rack": 9, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:05:04.827Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
504	2019-12-29 13:45:18.193704+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	32	\N	fw01	{"face": null, "name": "fw01", "rack": 9, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 6, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:10:30.758Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
505	2019-12-29 13:45:18.196528+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	33	\N	fw02	{"face": null, "name": "fw02", "rack": 9, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 6, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:10:30.774Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
506	2019-12-29 13:45:18.199332+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	34	\N	spine01	{"face": null, "name": "spine01", "rack": 2, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:40:10.295Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
507	2019-12-29 13:45:18.202035+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	35	\N	spine02	{"face": null, "name": "spine02", "rack": 2, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:40:28.906Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
508	2019-12-29 13:45:18.204769+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	36	\N	spine03	{"face": null, "name": "spine03", "rack": 2, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:40:21.293Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
509	2019-12-29 13:45:18.207501+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	37	\N	spine04	{"face": null, "name": "spine04", "rack": 2, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:40:37.106Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
510	2019-12-29 13:45:18.21023+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	42	\N	fw03	{"face": null, "name": "fw03", "rack": 12, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 6, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.058Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
511	2019-12-29 13:45:18.212908+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	43	\N	fw04	{"face": null, "name": "fw04", "rack": 12, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 6, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.093Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
512	2019-12-29 13:45:18.215711+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	44	\N	leaf05	{"face": null, "name": "leaf05", "rack": 10, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.128Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
513	2019-12-29 13:45:18.218457+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	45	\N	leaf06	{"face": null, "name": "leaf06", "rack": 10, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.163Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
514	2019-12-29 13:45:18.221146+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	46	\N	leaf07	{"face": null, "name": "leaf07", "rack": 11, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.196Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
515	2019-12-29 13:45:18.223882+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	47	\N	leaf08	{"face": null, "name": "leaf08", "rack": 11, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.234Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
516	2019-12-29 13:45:18.226715+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	48	\N	server11	{"face": null, "name": "server11", "rack": 12, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.270Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
517	2019-12-29 13:45:18.229447+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	49	\N	server12	{"face": null, "name": "server12", "rack": 12, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.304Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
518	2019-12-29 13:45:18.233175+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	50	\N	server13	{"face": null, "name": "server13", "rack": 10, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.336Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
519	2019-12-29 13:45:18.236013+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	51	\N	server14	{"face": null, "name": "server14", "rack": 10, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.368Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
520	2019-12-29 13:45:18.238734+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	52	\N	server15	{"face": null, "name": "server15", "rack": 11, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.399Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
521	2019-12-29 13:45:18.241487+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	53	\N	server16	{"face": null, "name": "server16", "rack": 11, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.430Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
522	2019-12-29 13:45:18.244184+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	54	\N	server17	{"face": null, "name": "server17", "rack": 11, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.460Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
523	2019-12-29 13:45:18.247013+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	55	\N	server18	{"face": null, "name": "server18", "rack": 11, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.495Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
524	2019-12-29 13:45:18.249742+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	56	\N	server19	{"face": null, "name": "server19", "rack": 11, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.525Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
525	2019-12-29 13:45:18.252884+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	57	\N	server20	{"face": null, "name": "server20", "rack": 11, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:12:55.556Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
526	2019-12-29 13:45:18.256119+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	58	\N	service03	{"face": null, "name": "service03", "rack": 12, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:39:50.699Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
527	2019-12-29 13:45:18.260152+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	59	\N	service04	{"face": null, "name": "service04", "rack": 12, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:39:59.932Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
528	2019-12-29 13:45:18.264155+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	60	\N	spine05	{"face": null, "name": "spine05", "rack": 13, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:40:44.941Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
529	2019-12-29 13:45:18.268114+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	61	\N	spine06	{"face": null, "name": "spine06", "rack": 13, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:40:52.997Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
530	2019-12-29 13:45:18.27184+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	62	\N	spine07	{"face": null, "name": "spine07", "rack": 13, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:41:00.825Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
531	2019-12-29 13:45:18.275248+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	64	\N	exit01	{"face": null, "name": "exit01", "rack": 6, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:14:56.332Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
532	2019-12-29 13:45:18.278499+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	65	\N	exit02	{"face": null, "name": "exit02", "rack": 6, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:15:40.785Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
533	2019-12-29 13:45:18.281895+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	66	\N	rtr01	{"face": null, "name": "rtr01", "rack": 6, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 7, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:16:03.869Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
534	2019-12-29 13:45:18.285297+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	67	\N	rtr02	{"face": null, "name": "rtr02", "rack": 6, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 7, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:16:24.251Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
535	2019-12-29 13:45:18.288658+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	68	\N	oob-mgmt-server	{"face": null, "name": "oob-mgmt-server", "rack": 15, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 4, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:19:29.209Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
536	2019-12-29 13:45:18.291744+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	69	\N	netq-ts	{"face": null, "name": "netq-ts", "rack": null, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:19:59.301Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
537	2019-12-29 13:45:18.296748+00	admin	10a88121-beac-4a1b-af01-ca66723643ce	3	70	\N	oob-mgmt-switch	{"face": null, "name": "oob-mgmt-switch", "rack": 15, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 8, "device_type": 3, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:21:39.083Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
538	2019-12-29 13:45:30.567942+00	admin	bd1d511d-7406-4ec1-8f61-20dfc683784c	3	38	\N	super01	{"face": null, "name": "super01", "rack": 14, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 5, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:41:19.226Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
539	2019-12-29 13:45:30.57254+00	admin	bd1d511d-7406-4ec1-8f61-20dfc683784c	3	39	\N	super02	{"face": null, "name": "super02", "rack": 14, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 5, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:41:38.328Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
540	2019-12-29 13:45:30.575861+00	admin	bd1d511d-7406-4ec1-8f61-20dfc683784c	3	40	\N	super03	{"face": null, "name": "super03", "rack": 14, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 5, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:41:46.992Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
541	2019-12-29 13:45:30.578927+00	admin	bd1d511d-7406-4ec1-8f61-20dfc683784c	3	41	\N	super04	{"face": null, "name": "super04", "rack": 14, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 5, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:42:11.371Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
542	2019-12-29 13:45:30.581837+00	admin	bd1d511d-7406-4ec1-8f61-20dfc683784c	3	63	\N	spine08	{"face": null, "name": "spine08", "rack": 13, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:41:09.888Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
543	2019-12-29 13:45:48.742638+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	71	\N	exit01	{"face": null, "name": "exit01", "rack": 6, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:46.152Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
544	2019-12-29 13:45:48.759277+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	72	\N	exit02	{"face": null, "name": "exit02", "rack": 6, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:46.206Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
545	2019-12-29 13:45:48.768547+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	73	\N	fw01	{"face": null, "name": "fw01", "rack": 9, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 6, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:46.250Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
546	2019-12-29 13:45:48.777809+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	74	\N	fw02	{"face": null, "name": "fw02", "rack": 9, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 6, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:46.295Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
547	2019-12-29 13:45:48.786665+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	75	\N	fw03	{"face": null, "name": "fw03", "rack": 12, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 6, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:46.340Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
548	2019-12-29 13:45:48.795314+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	76	\N	fw04	{"face": null, "name": "fw04", "rack": 12, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 6, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:46.385Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
549	2019-12-29 13:45:48.804297+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	77	\N	leaf02	{"face": null, "name": "leaf02", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:46.431Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
550	2019-12-29 13:45:48.813588+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	78	\N	leaf03	{"face": null, "name": "leaf03", "rack": 3, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:46.477Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
551	2019-12-29 13:45:48.822364+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	79	\N	leaf04	{"face": null, "name": "leaf04", "rack": 3, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:46.528Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
552	2019-12-29 13:45:48.831441+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	80	\N	leaf05	{"face": null, "name": "leaf05", "rack": 10, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:46.574Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
553	2019-12-29 13:45:48.840181+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	81	\N	leaf06	{"face": null, "name": "leaf06", "rack": 10, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:46.621Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
554	2019-12-29 13:45:48.849101+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	82	\N	leaf07	{"face": null, "name": "leaf07", "rack": 11, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:46.666Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
555	2019-12-29 13:45:48.857896+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	83	\N	leaf08	{"face": null, "name": "leaf08", "rack": 11, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:46.718Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
556	2019-12-29 13:45:48.866787+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	84	\N	netq-ts	{"face": null, "name": "netq-ts", "rack": null, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 3, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:46.759Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
557	2019-12-29 13:45:48.875583+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	85	\N	oob-mgmt-server	{"face": null, "name": "oob-mgmt-server", "rack": 15, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 4, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:46.789Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
558	2019-12-29 13:45:48.884318+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	86	\N	oob-mgmt-switch	{"face": null, "name": "oob-mgmt-switch", "rack": 15, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 8, "device_type": 3, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:46.821Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
559	2019-12-29 13:45:48.89443+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	87	\N	rtr01	{"face": null, "name": "rtr01", "rack": 6, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 7, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:46.855Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
560	2019-12-29 13:45:48.903209+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	88	\N	rtr02	{"face": null, "name": "rtr02", "rack": 6, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 7, "device_type": 1, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:46.901Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
561	2019-12-29 13:45:48.91214+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	89	\N	server01	{"face": null, "name": "server01", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:46.952Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
562	2019-12-29 13:45:48.920981+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	90	\N	server02	{"face": null, "name": "server02", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:46.982Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
563	2019-12-29 13:45:48.930071+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	91	\N	server03	{"face": null, "name": "server03", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.013Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
564	2019-12-29 13:45:48.938939+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	92	\N	server04	{"face": null, "name": "server04", "rack": 1, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.043Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
565	2019-12-29 13:45:48.947753+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	93	\N	server05	{"face": null, "name": "server05", "rack": 3, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.072Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
566	2019-12-29 13:45:48.962113+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	94	\N	server06	{"face": null, "name": "server06", "rack": 3, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.102Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
567	2019-12-29 13:45:48.970717+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	95	\N	server07	{"face": null, "name": "server07", "rack": 3, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.138Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
568	2019-12-29 13:45:48.97972+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	96	\N	server08	{"face": null, "name": "server08", "rack": 3, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.169Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
569	2019-12-29 13:45:48.988506+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	97	\N	server09	{"face": null, "name": "server09", "rack": 9, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.200Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
570	2019-12-29 13:45:48.99732+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	98	\N	server10	{"face": null, "name": "server10", "rack": 9, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.233Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
571	2019-12-29 13:45:49.005983+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	99	\N	server11	{"face": null, "name": "server11", "rack": 12, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.272Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
572	2019-12-29 13:45:49.014352+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	100	\N	server12	{"face": null, "name": "server12", "rack": 12, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.307Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
573	2019-12-29 13:45:49.02266+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	101	\N	server13	{"face": null, "name": "server13", "rack": 10, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.340Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
574	2019-12-29 13:45:49.033003+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	102	\N	server14	{"face": null, "name": "server14", "rack": 10, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.373Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
575	2019-12-29 13:45:49.041365+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	103	\N	server15	{"face": null, "name": "server15", "rack": 11, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.406Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
576	2019-12-29 13:45:49.050016+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	104	\N	server16	{"face": null, "name": "server16", "rack": 11, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.439Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
577	2019-12-29 13:45:49.058401+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	105	\N	server17	{"face": null, "name": "server17", "rack": 11, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.473Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
578	2019-12-29 13:45:49.066516+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	106	\N	server18	{"face": null, "name": "server18", "rack": 11, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.505Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
579	2019-12-29 13:45:49.074714+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	107	\N	server19	{"face": null, "name": "server19", "rack": 11, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.537Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
580	2019-12-29 13:45:49.082861+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	108	\N	server20	{"face": null, "name": "server20", "rack": 11, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 3, "device_type": 2, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.577Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
581	2019-12-29 13:45:49.090906+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	109	\N	service01	{"face": null, "name": "service01", "rack": 9, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.611Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
582	2019-12-29 13:45:49.102311+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	110	\N	service02	{"face": null, "name": "service02", "rack": 9, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.656Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
583	2019-12-29 13:45:49.110419+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	111	\N	service03	{"face": null, "name": "service03", "rack": 12, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.704Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
584	2019-12-29 13:45:49.118471+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	112	\N	service04	{"face": null, "name": "service04", "rack": 12, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 1, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.751Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
585	2019-12-29 13:45:49.127758+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	113	\N	spine01	{"face": null, "name": "spine01", "rack": 2, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.800Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
586	2019-12-29 13:45:49.135784+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	114	\N	spine02	{"face": null, "name": "spine02", "rack": 2, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.844Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
587	2019-12-29 13:45:49.143817+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	115	\N	spine03	{"face": null, "name": "spine03", "rack": 2, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.892Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
588	2019-12-29 13:45:49.15232+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	116	\N	spine04	{"face": null, "name": "spine04", "rack": 2, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.932Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
589	2019-12-29 13:45:49.16053+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	117	\N	spine05	{"face": null, "name": "spine05", "rack": 13, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:47.972Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
590	2019-12-29 13:45:49.168505+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	118	\N	spine06	{"face": null, "name": "spine06", "rack": 13, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:48.018Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
591	2019-12-29 13:45:49.176624+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	119	\N	spine07	{"face": null, "name": "spine07", "rack": 13, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:48.056Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
592	2019-12-29 13:45:49.184909+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	120	\N	spine08	{"face": null, "name": "spine08", "rack": 13, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 2, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:48.103Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
593	2019-12-29 13:45:49.193848+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	121	\N	super01	{"face": null, "name": "super01", "rack": 14, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 5, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:48.147Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
594	2019-12-29 13:45:49.202327+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	122	\N	super02	{"face": null, "name": "super02", "rack": 14, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 5, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:48.187Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
595	2019-12-29 13:45:49.210931+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	123	\N	super03	{"face": null, "name": "super03", "rack": 14, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 5, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:48.226Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
596	2019-12-29 13:45:49.219536+00	admin	3fff273a-46a6-4ce0-96fc-77b52f0c03e3	1	124	\N	super04	{"face": null, "name": "super04", "rack": 14, "site": 2, "tags": [], "serial": "", "status": 1, "tenant": null, "cluster": null, "created": "2019-12-29", "comments": "", "platform": null, "position": null, "asset_tag": null, "device_role": 5, "device_type": 4, "primary_ip4": null, "primary_ip6": null, "vc_position": null, "vc_priority": null, "last_updated": "2019-12-29T13:45:48.272Z", "custom_fields": {"ASN": "None"}, "virtual_chassis": null, "local_context_data": null}	15	\N	1
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
7	2018-06-03	2018-06-08 16:53:47.050852+00	4	169.254.1.1/30		8	\N	\N	\N	1	\N	
10	2018-06-03	2018-06-08 21:24:46.126106+00	4	10.100.100.12		9	\N	\N	\N	1	30	
16	2018-06-08	2018-06-08 23:21:39.662181+00	4	192.168.10.1/24		3	\N	1	1	1	41	
13	2018-06-08	2018-06-08 23:21:56.237071+00	4	192.168.10.2/24		3	\N	1	1	1	\N	
5	2018-06-03	2018-06-08 23:22:27.540686+00	6	fc00:10::2/64		3	\N	1	1	1	\N	
17	2018-06-08	2018-06-09 00:04:25.854341+00	6	fc00:10::1/64		3	\N	1	1	1	41	
50	2018-06-09	2018-06-09 10:45:00.558226+00	4	192.168.11.2/24		136	\N	1	1	1	\N	
115	2018-06-09	2018-06-09 10:51:21.927845+00	6	fc00:11::1/64		136	\N	1	1	1	41	
116	2018-06-09	2018-06-09 10:51:53.153056+00	6	fc00:12::1/64		137	\N	2	2	1	41	
117	2018-06-09	2018-06-09 10:52:08.888119+00	6	fc00:13::1/64		138	\N	2	2	1	41	
118	2018-06-09	2018-06-09 10:52:31.369316+00	6	fc00:14::1/64		139	\N	3	3	1	41	
119	2018-06-09	2018-06-09 10:52:56.1531+00	6	fc00:15::1/64		140	\N	3	3	1	41	
80	2018-06-09	2018-06-09 10:53:26.858314+00	6	fc00:11::2/64		136	\N	1	1	1	\N	
104	2018-06-09	2018-06-09 10:54:58.958957+00	6	fc00:15::2/64		140	\N	3	3	1	\N	
110	2018-06-09	2018-06-09 10:45:52.595965+00	4	192.168.11.1/24		136	\N	1	1	1	41	
111	2018-06-09	2018-06-09 10:46:35.0743+00	4	192.168.12.1/24		137	\N	2	2	1	41	
112	2018-06-09	2018-06-09 10:46:52.321546+00	4	192.168.13.1/24		138	\N	2	2	1	41	
113	2018-06-09	2018-06-09 10:47:12.440114+00	4	192.168.14.1/24		139	\N	3	3	1	41	
114	2018-06-09	2018-06-09 10:47:34.379552+00	4	192.168.15.1/24		140	\N	3	3	1	41	
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
1	2018-06-03	2019-12-29 12:01:18.438305+00	1000	Vlan1000	1	\N	2	\N		\N
2	2018-06-03	2019-12-29 12:01:18.441722+00	1001	Vlan1001	1	\N	2	\N		\N
3	2018-06-09	2019-12-29 12:01:18.444529+00	1002	Vlan1002	1	\N	2	\N		\N
4	2018-06-09	2019-12-29 12:01:18.447312+00	1003	Vlan1003	1	\N	2	\N		\N
5	2018-06-09	2019-12-29 12:01:18.450057+00	1004	Vlan1004	1	\N	2	\N		\N
6	2018-06-09	2019-12-29 12:01:18.45288+00	1005	Vlan1005	1	\N	2	\N		\N
7	2018-06-09	2019-12-29 12:01:18.45631+00	2501	Vlan2501	1	\N	2	\N		\N
8	2018-06-09	2019-12-29 12:01:18.459692+00	2502	Vlan2502	1	\N	2	\N		\N
9	2018-06-09	2019-12-29 12:01:18.46335+00	2503	Vlan2503	1	\N	2	\N		\N
10	2018-06-09	2019-12-29 12:01:18.466573+00	2504	Vlan2504	1	\N	2	\N		\N
11	2018-06-09	2019-12-29 12:01:18.469349+00	2505	Vlan2505	1	\N	2	\N		\N
12	2018-06-09	2019-12-29 12:01:18.472279+00	2506	Vlan2506	1	\N	2	\N		\N
13	2018-06-09	2019-12-29 12:01:18.475187+00	2507	Vlan2507	1	\N	2	\N		\N
14	2018-06-09	2019-12-29 12:01:18.477952+00	2508	Vlan2508	1	\N	2	\N		\N
16	2018-06-09	2019-12-29 12:01:18.480729+00	2701	Vlan2701	1	\N	2	\N		\N
17	2018-06-09	2019-12-29 12:01:18.483512+00	2702	Vlan2702	1	\N	2	\N		\N
18	2018-06-09	2019-12-29 12:01:18.486225+00	2703	Vlan2703	1	\N	2	\N		\N
19	2018-06-09	2019-12-29 12:01:18.488849+00	2704	Vlan2704	1	\N	2	\N		\N
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

SELECT pg_catalog.setval('public.dcim_device_id_seq', 124, true);


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

SELECT pg_catalog.setval('public.dcim_devicerole_id_seq', 8, true);


--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicetype_id_seq', 4, true);


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

SELECT pg_catalog.setval('public.dcim_interface_id_seq', 1552, true);


--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interface_tagged_vlans_id_seq', 100, true);


--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interfacetemplate_id_seq', 90, true);


--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_manufacturer_id_seq', 2, true);


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

SELECT pg_catalog.setval('public.dcim_rack_id_seq', 15, true);


--
-- Name: dcim_rackgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rackgroup_id_seq', 7, true);


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

SELECT pg_catalog.setval('public.dcim_site_id_seq', 2, true);


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

SELECT pg_catalog.setval('public.extras_objectchange_id_seq', 596, true);


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

