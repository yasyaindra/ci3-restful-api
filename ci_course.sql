PGDMP              
            w         	   ci_course    11.3    11.3 *    6           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            7           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            8           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            9           1262    16749 	   ci_course    DATABASE     �   CREATE DATABASE ci_course WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_Indonesia.1252' LC_CTYPE = 'English_Indonesia.1252';
    DROP DATABASE ci_course;
             postgres    false            �            1259    16750    agents    TABLE     �   CREATE TABLE public.agents (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL
);
    DROP TABLE public.agents;
       public         postgres    false            �            1259    16806    agents_id_seq    SEQUENCE     u   CREATE SEQUENCE public.agents_id_seq
    START WITH 4
    INCREMENT BY 1
    MINVALUE 4
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.agents_id_seq;
       public       postgres    false    196            :           0    0    agents_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.agents_id_seq OWNED BY public.agents.id;
            public       postgres    false    201            �            1259    16799    coba    TABLE     V   CREATE TABLE public.coba (
    id integer NOT NULL,
    name character varying(10)
);
    DROP TABLE public.coba;
       public         postgres    false            �            1259    16797    coba_id_seq    SEQUENCE     �   CREATE SEQUENCE public.coba_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.coba_id_seq;
       public       postgres    false    200            ;           0    0    coba_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.coba_id_seq OWNED BY public.coba.id;
            public       postgres    false    199            �            1259    24578    telepon    TABLE     �   CREATE TABLE public.telepon (
    id integer NOT NULL,
    nama character varying(50) NOT NULL,
    nomor character varying(13) NOT NULL
);
    DROP TABLE public.telepon;
       public         postgres    false            �            1259    24576    kontak_id_seq    SEQUENCE     �   CREATE SEQUENCE public.kontak_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.kontak_id_seq;
       public       postgres    false    205            <           0    0    kontak_id_seq    SEQUENCE OWNED BY     @   ALTER SEQUENCE public.kontak_id_seq OWNED BY public.telepon.id;
            public       postgres    false    204            �            1259    16758 
   properties    TABLE     �  CREATE TABLE public.properties (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    street text NOT NULL,
    city character varying(30) NOT NULL,
    state character varying(30) NOT NULL,
    zip_code character varying(10) NOT NULL,
    agents_id integer NOT NULL,
    status_id integer NOT NULL,
    latitude character varying(100) NOT NULL,
    longitude character varying(100) NOT NULL,
    image character varying(100) NOT NULL
);
    DROP TABLE public.properties;
       public         postgres    false            �            1259    16809    properties_id_seq    SEQUENCE     y   CREATE SEQUENCE public.properties_id_seq
    START WITH 4
    INCREMENT BY 1
    MINVALUE 4
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.properties_id_seq;
       public       postgres    false    197            =           0    0    properties_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.properties_id_seq OWNED BY public.properties.id;
            public       postgres    false    202            �            1259    16773    status    TABLE     �   CREATE TABLE public.status (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text NOT NULL
);
    DROP TABLE public.status;
       public         postgres    false            �            1259    16812    status_id_seq    SEQUENCE     u   CREATE SEQUENCE public.status_id_seq
    START WITH 4
    INCREMENT BY 1
    MINVALUE 4
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.status_id_seq;
       public       postgres    false    198            >           0    0    status_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.status_id_seq OWNED BY public.status.id;
            public       postgres    false    203            �            1259    24608    users    TABLE       CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(250) NOT NULL,
    password character varying(250) NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.users;
       public         postgres    false            �
           2604    16808 	   agents id    DEFAULT     f   ALTER TABLE ONLY public.agents ALTER COLUMN id SET DEFAULT nextval('public.agents_id_seq'::regclass);
 8   ALTER TABLE public.agents ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    196            �
           2604    16802    coba id    DEFAULT     b   ALTER TABLE ONLY public.coba ALTER COLUMN id SET DEFAULT nextval('public.coba_id_seq'::regclass);
 6   ALTER TABLE public.coba ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    200    199    200            �
           2604    16811    properties id    DEFAULT     n   ALTER TABLE ONLY public.properties ALTER COLUMN id SET DEFAULT nextval('public.properties_id_seq'::regclass);
 <   ALTER TABLE public.properties ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    202    197            �
           2604    16814 	   status id    DEFAULT     f   ALTER TABLE ONLY public.status ALTER COLUMN id SET DEFAULT nextval('public.status_id_seq'::regclass);
 8   ALTER TABLE public.status ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    198            �
           2604    24581 
   telepon id    DEFAULT     g   ALTER TABLE ONLY public.telepon ALTER COLUMN id SET DEFAULT nextval('public.kontak_id_seq'::regclass);
 9   ALTER TABLE public.telepon ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    205    205            )          0    16750    agents 
   TABLE DATA               7   COPY public.agents (id, name, description) FROM stdin;
    public       postgres    false    196   5+       -          0    16799    coba 
   TABLE DATA               (   COPY public.coba (id, name) FROM stdin;
    public       postgres    false    200   �+       *          0    16758 
   properties 
   TABLE DATA               �   COPY public.properties (id, name, description, street, city, state, zip_code, agents_id, status_id, latitude, longitude, image) FROM stdin;
    public       postgres    false    197   �+       +          0    16773    status 
   TABLE DATA               7   COPY public.status (id, name, description) FROM stdin;
    public       postgres    false    198   �3       2          0    24578    telepon 
   TABLE DATA               2   COPY public.telepon (id, nama, nomor) FROM stdin;
    public       postgres    false    205   4       3          0    24608    users 
   TABLE DATA               L   COPY public.users (id, email, password, created_at, updated_at) FROM stdin;
    public       postgres    false    206   a4       ?           0    0    agents_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.agents_id_seq', 4, true);
            public       postgres    false    201            @           0    0    coba_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.coba_id_seq', 4, true);
            public       postgres    false    199            A           0    0    kontak_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.kontak_id_seq', 1, false);
            public       postgres    false    204            B           0    0    properties_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.properties_id_seq', 4, false);
            public       postgres    false    202            C           0    0    status_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.status_id_seq', 4, false);
            public       postgres    false    203            �
           2606    16757    agents agents_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.agents
    ADD CONSTRAINT agents_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.agents DROP CONSTRAINT agents_pkey;
       public         postgres    false    196            �
           2606    16804    coba coba_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.coba
    ADD CONSTRAINT coba_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.coba DROP CONSTRAINT coba_pkey;
       public         postgres    false    200            �
           2606    24583    telepon kontak_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.telepon
    ADD CONSTRAINT kontak_pkey PRIMARY KEY (id);

ALTER TABLE public.telepon CLUSTER ON kontak_pkey;
 =   ALTER TABLE ONLY public.telepon DROP CONSTRAINT kontak_pkey;
       public         postgres    false    205            �
           2606    16765    properties properties_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.properties DROP CONSTRAINT properties_pkey;
       public         postgres    false    197            �
           2606    16780    status status_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.status DROP CONSTRAINT status_pkey;
       public         postgres    false    198            �
           2606    24617    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public         postgres    false    206            )   T   x�3�t+J��V���K-��2��J�˫T��,���2�t�/Jr�3R�8�L8s�2��R3�J��3����9�b���� �RD      -      x�3�L�I�L������ >[      *     x�mW�r�6>s�9�Ef����bO2�U����s�"!1Dp@��w�Ӿ^�d�HI��\e�t��Ӎ4��^�֘#�أ3vf�2�(�{)&���fy�$l���1n�8ۅ���	�m��L/���UƲ�%3=,��3�X�4�����a'�d���P��L�-ۋ��3;`C��Ƙ}d�^�k:��wD��h��i�J�|�'�:v�bYk���c��Nsaha�6/lN��Ư�m�:k�Cg&��A4
E`G1"F6N��p�`իp��nL?�m:5��G��~a�g�6�tc��1^y0�u�+��s��)�&e�F���q�UyVEwi���E���:տ������83ޥ�H
^�Y��px�E�X(� �����fK���>|�NV�"��ȓ���rT4�;��������:�Y�z�1�h 
�P􁙽�H�;��B�|U�4���
�zlB�;���H�`k�8��� 
(��Õ~��L;⽮l���z-�,���a�J��>u��`�IiG���,9g��̝��,�����(�[���hղ�^e}D(Ĳ u�WQ�@]�N��L���4-�,@�G�Y�����˱�j �������J�g
&0��?vfV��Mg�F�OT뜄kQ��������C7�RkP�@�[H֊��j�
��Q{E�DO<38�jL_7�����+�A6��F*�̕0�~�>��o�����]G�F��[$�?J\�!;���j����@��9��-�(z}�(�|��"�"=#_�P0!_�I��y~���ʪL�y�֫�����v^%��g�NJ:�Ku�v�㖝��(����ȼ��Nઃ���=��g��6��Г�y���8�����J���k����P��jPi ����^�(�&AL�\VMolߘ>mH1�$x"��գ೹��h[��}��G�����> ���,H0IR�H�:�)�
KxR��"�2z��@�̰{\��&m�*��Jȕ��m�L��F�����bT�.���l�_�G����gw"M��p]/�~����u�d��`��j6h�g�� |<�~w�8�N j��x�AI*�g�n0�PB��k�0S�PB�b���Q���� _��Gu�a��9 �a����}�E� I��(�@��<h���<���$u��%�2z��U�ǃcf�2Ǡz�#i�]Y�����1�ov����=p�F�ZlT��HϮU�d0��l=�H���~�5hx����û2�����77�����@Pxۧ�]p���I��l�����
�Iv}���[d�Qnq�$�b�I�d۪J��y��7�!���4 SE���d��5n���J�-n�qv"_y�YP}��;��	�.:=��y~�h��/�Z+���ch-~ ���6�-���8|9_�f�q�O�'��̩��Gjc���j����]�"v`0h�by��w�Aw�|"�[-�wa�5���l������X�Tpr�C6(U���W�@�?DyQ�,%{O�]�ABF#�qB2�[��-�<r+�%Oӿ��K���e�F��G��/꛴w,�.x�%g��5��Yb�:4��s뽌(WB�(�˹��i��0a8d�{�����y�h͝rw(\M�'̓�hQ�􎠶����]�����r���WS���|�% ?�%v��.�b�p�*a�-�0<ux�"��ۜSQB@^LY�yVߨ�6�*����ㅩE��ן��vI� }��у���6�a��� �v�z�����/F��+rpj��Z|_�ڣ��J����\4����Cy�2�ɏHQ?��$��gK.���׉`�YC^��A> ���J��q(|�R�a����᳢��p�"��mQ�m*|�D揙�H٣pþ�D�/p�ۍ��ِ6<`|Q6����\���j��I�YZqp��!?j��2{��#����۰���Yx�6�����)����5+��(����~�@�d��0�
qX�ʶJRvoQ��V̄l�#GW���8�J�\x�eU��<���{<��w���s�P      +   -   x�3�t,K��IL�I��2���I��2�t����,)Irb���� ێ
L      2   5   x�3��/����4�057s3#.#N�Ģb�����cNAF"�2S�=... �5�      3      x������ � �     