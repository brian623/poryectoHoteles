PGDMP                          {            crud_hotels    15.2    15.2 5    ;           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            <           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            =           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            >           1262    16394    crud_hotels    DATABASE     �   CREATE DATABASE crud_hotels WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE crud_hotels;
                postgres    false            �            1259    16419    failed_jobs    TABLE     &  CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(191) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
    DROP TABLE public.failed_jobs;
       public         heap    postgres    false            �            1259    16418    failed_jobs_id_seq    SEQUENCE     {   CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.failed_jobs_id_seq;
       public          postgres    false    220            ?           0    0    failed_jobs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;
          public          postgres    false    219            �            1259    16452 	   info_habs    TABLE     6  CREATE TABLE public.info_habs (
    id bigint NOT NULL,
    id_hotel integer NOT NULL,
    cantidad integer NOT NULL,
    "tipoHab" character varying(191) NOT NULL,
    acomodacion character varying(191) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.info_habs;
       public         heap    postgres    false            �            1259    16451    info_habs_id_seq    SEQUENCE     y   CREATE SEQUENCE public.info_habs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.info_habs_id_seq;
       public          postgres    false    226            @           0    0    info_habs_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.info_habs_id_seq OWNED BY public.info_habs.id;
          public          postgres    false    225            �            1259    16443    info_hotels    TABLE     r  CREATE TABLE public.info_hotels (
    id bigint NOT NULL,
    nombre character varying(191) NOT NULL,
    cuidad character varying(191) NOT NULL,
    direccion character varying(191) NOT NULL,
    nit character varying(191) NOT NULL,
    "numHabitaciones" integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.info_hotels;
       public         heap    postgres    false            �            1259    16442    info_hotels_id_seq    SEQUENCE     {   CREATE SEQUENCE public.info_hotels_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.info_hotels_id_seq;
       public          postgres    false    224            A           0    0    info_hotels_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.info_hotels_id_seq OWNED BY public.info_hotels.id;
          public          postgres    false    223            �            1259    16396 
   migrations    TABLE     �   CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(191) NOT NULL,
    batch integer NOT NULL
);
    DROP TABLE public.migrations;
       public         heap    postgres    false            �            1259    16395    migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.migrations_id_seq;
       public          postgres    false    215            B           0    0    migrations_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;
          public          postgres    false    214            �            1259    16413    password_resets    TABLE     �   CREATE TABLE public.password_resets (
    email character varying(191) NOT NULL,
    token character varying(191) NOT NULL,
    created_at timestamp(0) without time zone
);
 #   DROP TABLE public.password_resets;
       public         heap    postgres    false            �            1259    16431    personal_access_tokens    TABLE     �  CREATE TABLE public.personal_access_tokens (
    id bigint NOT NULL,
    tokenable_type character varying(191) NOT NULL,
    tokenable_id bigint NOT NULL,
    name character varying(191) NOT NULL,
    token character varying(64) NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    expires_at timestamp(0) without time zone,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
 *   DROP TABLE public.personal_access_tokens;
       public         heap    postgres    false            �            1259    16430    personal_access_tokens_id_seq    SEQUENCE     �   CREATE SEQUENCE public.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.personal_access_tokens_id_seq;
       public          postgres    false    222            C           0    0    personal_access_tokens_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.personal_access_tokens_id_seq OWNED BY public.personal_access_tokens.id;
          public          postgres    false    221            �            1259    16403    users    TABLE     x  CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(191) NOT NULL,
    email character varying(191) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(191) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16402    users_id_seq    SEQUENCE     u   CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    217            D           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    216            �           2604    16422    failed_jobs id    DEFAULT     p   ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);
 =   ALTER TABLE public.failed_jobs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    16455    info_habs id    DEFAULT     l   ALTER TABLE ONLY public.info_habs ALTER COLUMN id SET DEFAULT nextval('public.info_habs_id_seq'::regclass);
 ;   ALTER TABLE public.info_habs ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    16446    info_hotels id    DEFAULT     p   ALTER TABLE ONLY public.info_hotels ALTER COLUMN id SET DEFAULT nextval('public.info_hotels_id_seq'::regclass);
 =   ALTER TABLE public.info_hotels ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    16399    migrations id    DEFAULT     n   ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);
 <   ALTER TABLE public.migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    16434    personal_access_tokens id    DEFAULT     �   ALTER TABLE ONLY public.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('public.personal_access_tokens_id_seq'::regclass);
 H   ALTER TABLE public.personal_access_tokens ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    16406    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            2          0    16419    failed_jobs 
   TABLE DATA           a   COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
    public          postgres    false    220   Z?       8          0    16452 	   info_habs 
   TABLE DATA           k   COPY public.info_habs (id, id_hotel, cantidad, "tipoHab", acomodacion, created_at, updated_at) FROM stdin;
    public          postgres    false    226   w?       6          0    16443    info_hotels 
   TABLE DATA           t   COPY public.info_hotels (id, nombre, cuidad, direccion, nit, "numHabitaciones", created_at, updated_at) FROM stdin;
    public          postgres    false    224   �@       -          0    16396 
   migrations 
   TABLE DATA           :   COPY public.migrations (id, migration, batch) FROM stdin;
    public          postgres    false    215   B       0          0    16413    password_resets 
   TABLE DATA           C   COPY public.password_resets (email, token, created_at) FROM stdin;
    public          postgres    false    218   �B       4          0    16431    personal_access_tokens 
   TABLE DATA           �   COPY public.personal_access_tokens (id, tokenable_type, tokenable_id, name, token, abilities, last_used_at, expires_at, created_at, updated_at) FROM stdin;
    public          postgres    false    222   �B       /          0    16403    users 
   TABLE DATA           u   COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at) FROM stdin;
    public          postgres    false    217   �B       E           0    0    failed_jobs_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);
          public          postgres    false    219            F           0    0    info_habs_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.info_habs_id_seq', 21, true);
          public          postgres    false    225            G           0    0    info_hotels_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.info_hotels_id_seq', 26, true);
          public          postgres    false    223            H           0    0    migrations_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.migrations_id_seq', 6, true);
          public          postgres    false    214            I           0    0    personal_access_tokens_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.personal_access_tokens_id_seq', 1, false);
          public          postgres    false    221            J           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 1, false);
          public          postgres    false    216            �           2606    16427    failed_jobs failed_jobs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_pkey;
       public            postgres    false    220            �           2606    16429 #   failed_jobs failed_jobs_uuid_unique 
   CONSTRAINT     ^   ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);
 M   ALTER TABLE ONLY public.failed_jobs DROP CONSTRAINT failed_jobs_uuid_unique;
       public            postgres    false    220            �           2606    16457    info_habs info_habs_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.info_habs
    ADD CONSTRAINT info_habs_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.info_habs DROP CONSTRAINT info_habs_pkey;
       public            postgres    false    226            �           2606    16450    info_hotels info_hotels_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.info_hotels
    ADD CONSTRAINT info_hotels_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.info_hotels DROP CONSTRAINT info_hotels_pkey;
       public            postgres    false    224            �           2606    16401    migrations migrations_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.migrations DROP CONSTRAINT migrations_pkey;
       public            postgres    false    215            �           2606    16417 $   password_resets password_resets_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.password_resets
    ADD CONSTRAINT password_resets_pkey PRIMARY KEY (email);
 N   ALTER TABLE ONLY public.password_resets DROP CONSTRAINT password_resets_pkey;
       public            postgres    false    218            �           2606    16438 2   personal_access_tokens personal_access_tokens_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_pkey;
       public            postgres    false    222            �           2606    16441 :   personal_access_tokens personal_access_tokens_token_unique 
   CONSTRAINT     v   ALTER TABLE ONLY public.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);
 d   ALTER TABLE ONLY public.personal_access_tokens DROP CONSTRAINT personal_access_tokens_token_unique;
       public            postgres    false    222            �           2606    16412    users users_email_unique 
   CONSTRAINT     T   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_unique;
       public            postgres    false    217            �           2606    16410    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    217            �           1259    16439 8   personal_access_tokens_tokenable_type_tokenable_id_index    INDEX     �   CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON public.personal_access_tokens USING btree (tokenable_type, tokenable_id);
 L   DROP INDEX public.personal_access_tokens_tokenable_type_tokenable_id_index;
       public            postgres    false    222    222            2      x������ � �      8     x���1R�0Ek�\`K��D-��.%M`Sd&��	�q.�mB�lh��}�V� 3<�c��e�/Cl��=puG��lJ�@�<}\���Np���~ڬ�H�J�� �����%�0Aǹ�v[rvjm�a��~7?��:�$j�~� t3.�W*���ﮰQ���%�$�Œ�a��<Ms���\
,�bqc���5%����V�%�T-{S�U��H)���X�/1���rx<��	�D)_cb�$ʷ�)UrA�A��_-��=|�|�����'m۹      6   o  x�m�Aj�0EףS�v�F�-kkJ�h P(�QQ�*�[�qr��"�(q1�>֛7_<��G~pم)����aȚ�8��PЙVi�"`���e�-��ªf+cX/�޽�	z!1��ZR+�{^[w[C�0��:��|��?�^ӧ��g��N`�����VFeQ�d���*�h�傟������;s"��Bk:��!E���Ƣ��M\�~���rHp ���������Z�
���������&��y �	^B��;~hX�jLh�(i)�Hc�z�K�h�eL����h��g���%�k�������ka����KA)�1�e>7�\Ա<E��ZB�K=D�tKeoe��1�����      -   �   x�U�A� ���0m�]L^h;�UR`����Ef�����k� b��`����$&d�{9��H|���!���$��l����V��f/#�/��|���%aqn$�Ix�R�f-�@pfm����2�B_x[qC��jX]�J��LZ�      0      x������ � �      4      x������ � �      /      x������ � �     