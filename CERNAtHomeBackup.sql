PGDMP         &                z            domaci    15.1    15.1 L    ]           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ^           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            _           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            `           1262    24818    domaci    DATABASE     |   CREATE DATABASE domaci WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Croatian_Croatia.1252';
    DROP DATABASE domaci;
                postgres    false            X           1247    24830    fields    TYPE     v   CREATE TYPE public.fields AS ENUM (
    'programer',
    'fizičar',
    'inženjer',
    'znanstvenik materijala'
);
    DROP TYPE public.fields;
       public          postgres    false            U           1247    24820    genders    TYPE     c   CREATE TYPE public.genders AS ENUM (
    'MUŠKI',
    'ŽENSKI',
    'NEPOZNATO',
    'OSTALO'
);
    DROP TYPE public.genders;
       public          postgres    false            ?            1259    24840    accelerators    TABLE     }   CREATE TABLE public.accelerators (
    acceleratorid integer NOT NULL,
    acceleratorname character varying(60) NOT NULL
);
     DROP TABLE public.accelerators;
       public         heap    postgres    false            ?            1259    24839    accelerators_acceleratorid_seq    SEQUENCE     ?   CREATE SEQUENCE public.accelerators_acceleratorid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.accelerators_acceleratorid_seq;
       public          postgres    false    215            a           0    0    accelerators_acceleratorid_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.accelerators_acceleratorid_seq OWNED BY public.accelerators.acceleratorid;
          public          postgres    false    214            ?            1259    24856    acceleratorsprojects    TABLE     ?   CREATE TABLE public.acceleratorsprojects (
    apid integer NOT NULL,
    acceleratorid integer,
    projectid integer NOT NULL
);
 (   DROP TABLE public.acceleratorsprojects;
       public         heap    postgres    false            ?            1259    24855    acceleratorsprojects_apid_seq    SEQUENCE     ?   CREATE SEQUENCE public.acceleratorsprojects_apid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.acceleratorsprojects_apid_seq;
       public          postgres    false    219            b           0    0    acceleratorsprojects_apid_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.acceleratorsprojects_apid_seq OWNED BY public.acceleratorsprojects.apid;
          public          postgres    false    218            ?            1259    24898    cities    TABLE     ?   CREATE TABLE public.cities (
    cityid integer NOT NULL,
    cityname character varying(20) NOT NULL,
    countryid integer NOT NULL
);
    DROP TABLE public.cities;
       public         heap    postgres    false            ?            1259    24897    cities_cityid_seq    SEQUENCE     ?   CREATE SEQUENCE public.cities_cityid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.cities_cityid_seq;
       public          postgres    false    225            c           0    0    cities_cityid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.cities_cityid_seq OWNED BY public.cities.cityid;
          public          postgres    false    224            ?            1259    24887 	   countries    TABLE     ?   CREATE TABLE public.countries (
    countryid integer NOT NULL,
    countryname character varying(30) NOT NULL,
    countrypopulation integer NOT NULL,
    countryppp numeric NOT NULL
);
    DROP TABLE public.countries;
       public         heap    postgres    false            ?            1259    24886    countries_countryid_seq    SEQUENCE     ?   CREATE SEQUENCE public.countries_countryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.countries_countryid_seq;
       public          postgres    false    223            d           0    0    countries_countryid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.countries_countryid_seq OWNED BY public.countries.countryid;
          public          postgres    false    222            ?            1259    24910    hotels    TABLE     ?   CREATE TABLE public.hotels (
    hotelid integer NOT NULL,
    hotelname character varying(30) NOT NULL,
    cityid integer NOT NULL,
    capacity integer NOT NULL,
    CONSTRAINT hotels_capacity_check CHECK ((capacity > 0))
);
    DROP TABLE public.hotels;
       public         heap    postgres    false            ?            1259    24909    hotels_hotelid_seq    SEQUENCE     ?   CREATE SEQUENCE public.hotels_hotelid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.hotels_hotelid_seq;
       public          postgres    false    227            e           0    0    hotels_hotelid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.hotels_hotelid_seq OWNED BY public.hotels.hotelid;
          public          postgres    false    226            ?            1259    24873    papers    TABLE     ?   CREATE TABLE public.papers (
    paperid integer NOT NULL,
    projectid integer NOT NULL,
    papername character varying(20) NOT NULL,
    numofquotes integer DEFAULT 0,
    publishdate timestamp without time zone DEFAULT now()
);
    DROP TABLE public.papers;
       public         heap    postgres    false            ?            1259    24872    papers_paperid_seq    SEQUENCE     ?   CREATE SEQUENCE public.papers_paperid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.papers_paperid_seq;
       public          postgres    false    221            f           0    0    papers_paperid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.papers_paperid_seq OWNED BY public.papers.paperid;
          public          postgres    false    220            ?            1259    24939    papersscientists    TABLE     i   CREATE TABLE public.papersscientists (
    paperid integer NOT NULL,
    scientistid integer NOT NULL
);
 $   DROP TABLE public.papersscientists;
       public         heap    postgres    false            ?            1259    24847    projects    TABLE     m   CREATE TABLE public.projects (
    projectid integer NOT NULL,
    projectname character varying NOT NULL
);
    DROP TABLE public.projects;
       public         heap    postgres    false            ?            1259    24846    projects_projectid_seq    SEQUENCE     ?   CREATE SEQUENCE public.projects_projectid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.projects_projectid_seq;
       public          postgres    false    217            g           0    0    projects_projectid_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.projects_projectid_seq OWNED BY public.projects.projectid;
          public          postgres    false    216            ?            1259    24923 
   scientists    TABLE     A  CREATE TABLE public.scientists (
    scientistid integer NOT NULL,
    firstname character varying(30) NOT NULL,
    lastname character varying(30) NOT NULL,
    birthdate date NOT NULL,
    countryid integer NOT NULL,
    gender public.genders NOT NULL,
    field public.fields NOT NULL,
    hotelid integer NOT NULL
);
    DROP TABLE public.scientists;
       public         heap    postgres    false    853    856            ?            1259    24922    scientists_scientistid_seq    SEQUENCE     ?   CREATE SEQUENCE public.scientists_scientistid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.scientists_scientistid_seq;
       public          postgres    false    229            h           0    0    scientists_scientistid_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.scientists_scientistid_seq OWNED BY public.scientists.scientistid;
          public          postgres    false    228            ?           2604    24843    accelerators acceleratorid    DEFAULT     ?   ALTER TABLE ONLY public.accelerators ALTER COLUMN acceleratorid SET DEFAULT nextval('public.accelerators_acceleratorid_seq'::regclass);
 I   ALTER TABLE public.accelerators ALTER COLUMN acceleratorid DROP DEFAULT;
       public          postgres    false    215    214    215            ?           2604    24859    acceleratorsprojects apid    DEFAULT     ?   ALTER TABLE ONLY public.acceleratorsprojects ALTER COLUMN apid SET DEFAULT nextval('public.acceleratorsprojects_apid_seq'::regclass);
 H   ALTER TABLE public.acceleratorsprojects ALTER COLUMN apid DROP DEFAULT;
       public          postgres    false    218    219    219            ?           2604    24901    cities cityid    DEFAULT     n   ALTER TABLE ONLY public.cities ALTER COLUMN cityid SET DEFAULT nextval('public.cities_cityid_seq'::regclass);
 <   ALTER TABLE public.cities ALTER COLUMN cityid DROP DEFAULT;
       public          postgres    false    224    225    225            ?           2604    24890    countries countryid    DEFAULT     z   ALTER TABLE ONLY public.countries ALTER COLUMN countryid SET DEFAULT nextval('public.countries_countryid_seq'::regclass);
 B   ALTER TABLE public.countries ALTER COLUMN countryid DROP DEFAULT;
       public          postgres    false    223    222    223            ?           2604    24913    hotels hotelid    DEFAULT     p   ALTER TABLE ONLY public.hotels ALTER COLUMN hotelid SET DEFAULT nextval('public.hotels_hotelid_seq'::regclass);
 =   ALTER TABLE public.hotels ALTER COLUMN hotelid DROP DEFAULT;
       public          postgres    false    227    226    227            ?           2604    24876    papers paperid    DEFAULT     p   ALTER TABLE ONLY public.papers ALTER COLUMN paperid SET DEFAULT nextval('public.papers_paperid_seq'::regclass);
 =   ALTER TABLE public.papers ALTER COLUMN paperid DROP DEFAULT;
       public          postgres    false    221    220    221            ?           2604    24850    projects projectid    DEFAULT     x   ALTER TABLE ONLY public.projects ALTER COLUMN projectid SET DEFAULT nextval('public.projects_projectid_seq'::regclass);
 A   ALTER TABLE public.projects ALTER COLUMN projectid DROP DEFAULT;
       public          postgres    false    216    217    217            ?           2604    24926    scientists scientistid    DEFAULT     ?   ALTER TABLE ONLY public.scientists ALTER COLUMN scientistid SET DEFAULT nextval('public.scientists_scientistid_seq'::regclass);
 E   ALTER TABLE public.scientists ALTER COLUMN scientistid DROP DEFAULT;
       public          postgres    false    228    229    229            K          0    24840    accelerators 
   TABLE DATA           F   COPY public.accelerators (acceleratorid, acceleratorname) FROM stdin;
    public          postgres    false    215   M[       O          0    24856    acceleratorsprojects 
   TABLE DATA           N   COPY public.acceleratorsprojects (apid, acceleratorid, projectid) FROM stdin;
    public          postgres    false    219   ?[       U          0    24898    cities 
   TABLE DATA           =   COPY public.cities (cityid, cityname, countryid) FROM stdin;
    public          postgres    false    225   ?[       S          0    24887 	   countries 
   TABLE DATA           Z   COPY public.countries (countryid, countryname, countrypopulation, countryppp) FROM stdin;
    public          postgres    false    223   \       W          0    24910    hotels 
   TABLE DATA           F   COPY public.hotels (hotelid, hotelname, cityid, capacity) FROM stdin;
    public          postgres    false    227   ?\       Q          0    24873    papers 
   TABLE DATA           Y   COPY public.papers (paperid, projectid, papername, numofquotes, publishdate) FROM stdin;
    public          postgres    false    221   ?\       Z          0    24939    papersscientists 
   TABLE DATA           @   COPY public.papersscientists (paperid, scientistid) FROM stdin;
    public          postgres    false    230   m]       M          0    24847    projects 
   TABLE DATA           :   COPY public.projects (projectid, projectname) FROM stdin;
    public          postgres    false    217   ?]       Y          0    24923 
   scientists 
   TABLE DATA           t   COPY public.scientists (scientistid, firstname, lastname, birthdate, countryid, gender, field, hotelid) FROM stdin;
    public          postgres    false    229   ?]       i           0    0    accelerators_acceleratorid_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.accelerators_acceleratorid_seq', 5, true);
          public          postgres    false    214            j           0    0    acceleratorsprojects_apid_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.acceleratorsprojects_apid_seq', 7, true);
          public          postgres    false    218            k           0    0    cities_cityid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.cities_cityid_seq', 6, true);
          public          postgres    false    224            l           0    0    countries_countryid_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.countries_countryid_seq', 5, true);
          public          postgres    false    222            m           0    0    hotels_hotelid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.hotels_hotelid_seq', 5, true);
          public          postgres    false    226            n           0    0    papers_paperid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.papers_paperid_seq', 7, true);
          public          postgres    false    220            o           0    0    projects_projectid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.projects_projectid_seq', 5, true);
          public          postgres    false    216            p           0    0    scientists_scientistid_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.scientists_scientistid_seq', 4, true);
          public          postgres    false    228            ?           2606    24845    accelerators accelerators_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.accelerators
    ADD CONSTRAINT accelerators_pkey PRIMARY KEY (acceleratorid);
 H   ALTER TABLE ONLY public.accelerators DROP CONSTRAINT accelerators_pkey;
       public            postgres    false    215            ?           2606    24861 .   acceleratorsprojects acceleratorsprojects_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.acceleratorsprojects
    ADD CONSTRAINT acceleratorsprojects_pkey PRIMARY KEY (apid);
 X   ALTER TABLE ONLY public.acceleratorsprojects DROP CONSTRAINT acceleratorsprojects_pkey;
       public            postgres    false    219            ?           2606    24903    cities cities_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (cityid);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
       public            postgres    false    225            ?           2606    24896 #   countries countries_countryname_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_countryname_key UNIQUE (countryname);
 M   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_countryname_key;
       public            postgres    false    223            ?           2606    24894    countries countries_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (countryid);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    223            ?           2606    24916    hotels hotels_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (hotelid);
 <   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_pkey;
       public            postgres    false    227            ?           2606    24880    papers papers_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.papers
    ADD CONSTRAINT papers_pkey PRIMARY KEY (paperid);
 <   ALTER TABLE ONLY public.papers DROP CONSTRAINT papers_pkey;
       public            postgres    false    221            ?           2606    24943 &   papersscientists papersscientists_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY public.papersscientists
    ADD CONSTRAINT papersscientists_pkey PRIMARY KEY (paperid, scientistid);
 P   ALTER TABLE ONLY public.papersscientists DROP CONSTRAINT papersscientists_pkey;
       public            postgres    false    230    230            ?           2606    24854    projects projects_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (projectid);
 @   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_pkey;
       public            postgres    false    217            ?           2606    24928    scientists scientists_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_pkey PRIMARY KEY (scientistid);
 D   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_pkey;
       public            postgres    false    229            ?           2606    24955 -   acceleratorsprojects uniqueacceleratorproject 
   CONSTRAINT     |   ALTER TABLE ONLY public.acceleratorsprojects
    ADD CONSTRAINT uniqueacceleratorproject UNIQUE (acceleratorid, projectid);
 W   ALTER TABLE ONLY public.acceleratorsprojects DROP CONSTRAINT uniqueacceleratorproject;
       public            postgres    false    219    219            ?           2606    24862 <   acceleratorsprojects acceleratorsprojects_acceleratorid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.acceleratorsprojects
    ADD CONSTRAINT acceleratorsprojects_acceleratorid_fkey FOREIGN KEY (acceleratorid) REFERENCES public.accelerators(acceleratorid) ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.acceleratorsprojects DROP CONSTRAINT acceleratorsprojects_acceleratorid_fkey;
       public          postgres    false    215    3230    219            ?           2606    24867 8   acceleratorsprojects acceleratorsprojects_projectid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.acceleratorsprojects
    ADD CONSTRAINT acceleratorsprojects_projectid_fkey FOREIGN KEY (projectid) REFERENCES public.projects(projectid) ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.acceleratorsprojects DROP CONSTRAINT acceleratorsprojects_projectid_fkey;
       public          postgres    false    217    219    3232            ?           2606    24904    cities cities_countryid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_countryid_fkey FOREIGN KEY (countryid) REFERENCES public.countries(countryid) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_countryid_fkey;
       public          postgres    false    3242    225    223            ?           2606    24917    hotels hotels_cityid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_cityid_fkey FOREIGN KEY (cityid) REFERENCES public.cities(cityid) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_cityid_fkey;
       public          postgres    false    225    227    3244            ?           2606    24881    papers papers_projectid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.papers
    ADD CONSTRAINT papers_projectid_fkey FOREIGN KEY (projectid) REFERENCES public.projects(projectid) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.papers DROP CONSTRAINT papers_projectid_fkey;
       public          postgres    false    221    3232    217            ?           2606    24944 .   papersscientists papersscientists_paperid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.papersscientists
    ADD CONSTRAINT papersscientists_paperid_fkey FOREIGN KEY (paperid) REFERENCES public.papers(paperid) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.papersscientists DROP CONSTRAINT papersscientists_paperid_fkey;
       public          postgres    false    230    221    3238            ?           2606    24949 2   papersscientists papersscientists_scientistid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.papersscientists
    ADD CONSTRAINT papersscientists_scientistid_fkey FOREIGN KEY (scientistid) REFERENCES public.scientists(scientistid) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.papersscientists DROP CONSTRAINT papersscientists_scientistid_fkey;
       public          postgres    false    229    3248    230            ?           2606    24929 $   scientists scientists_countryid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_countryid_fkey FOREIGN KEY (countryid) REFERENCES public.countries(countryid) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_countryid_fkey;
       public          postgres    false    3242    223    229            ?           2606    24934 "   scientists scientists_hotelid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_hotelid_fkey FOREIGN KEY (hotelid) REFERENCES public.hotels(hotelid);
 L   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_hotelid_fkey;
       public          postgres    false    3246    229    227            K   /   x?3?tLNN?I-J,?/r?2B?:q#s??L??.\??\W?=... #O      O   (   x?3?4?4?2?F\&?Ɯ?\??&??\f?@?+F??? L5      U   F   x?3????KW???\Ɯ~??
??Eٜ?\&?NE?ř9???&\??!?ٕ???\f??ŉى@V? A??      S   k   x?ɫ1P}?cȼ???5?r-?	??4??ñG??5 n?Ԫ?͕?????Xcf?(?$?q?`&̚!?޵???????Ft??D?Q?6?cA4??S??Yt?????      W   P   x?3???/I?Qp???K?4?4?2??J,H?S??E8???QČ8?8??L8???3s ??&?&\??~??P?1?9W? ?{?      Q   h   x?]?+?0?a==?t?-/??s O??`K?&??eb??뙈?Ej?????@???K??$??E,D?EoE?X?J]*Z+:???FY$+??9?W?)?      Z      x?3?4?2?4b#.s 6?4?????? (      M   +   x?3?(??JM.q?2?1???aLg.Ӆ??t?????? -C?      Y   ?   x?-?1?0F篧?5?B?12????q?PMQ????????	?emH?????!#???	?zb??Y?Y?f??????	??v????zc?߮??^/i?UW???xA=?E?l???T?yH"??u;g;?1??!KsqȒR?7??ۇ2?2?e????U???????=o     