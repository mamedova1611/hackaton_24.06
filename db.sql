PGDMP         5                z            db    12.11    12.11 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    17808    db    DATABASE     �   CREATE DATABASE db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Kazakhstan.1251' LC_CTYPE = 'Russian_Kazakhstan.1251';
    DROP DATABASE db;
                user    false            �            1259    17840 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    user    false            �            1259    17838    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          user    false    209            �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          user    false    208            �            1259    17850    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    user    false            �            1259    17848    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          user    false    211            �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          user    false    210            �            1259    17832    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    user    false            �            1259    17830    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          user    false    207            �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          user    false    206            �            1259    17858 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         heap    user    false            �            1259    17868    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         heap    user    false            �            1259    17866    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public          user    false    215            �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
          public          user    false    214            �            1259    17856    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public          user    false    213            �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
          public          user    false    212            �            1259    17876    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         heap    user    false            �            1259    17874 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public          user    false    217            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
          public          user    false    216            �            1259    17936    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
 $   DROP TABLE public.django_admin_log;
       public         heap    user    false            �            1259    17934    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          user    false    219            �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          user    false    218            �            1259    17822    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    user    false            �            1259    17820    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          user    false    205            �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          user    false    204            �            1259    17811    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    user    false            �            1259    17809    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          user    false    203            �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          user    false    202            �            1259    17967    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    user    false            �            1259    17979    hack_business    TABLE     h   CREATE TABLE public.hack_business (
    id bigint NOT NULL,
    name character varying(100) NOT NULL
);
 !   DROP TABLE public.hack_business;
       public         heap    user    false            �            1259    17977    hack_business_id_seq    SEQUENCE     }   CREATE SEQUENCE public.hack_business_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.hack_business_id_seq;
       public          user    false    222            �           0    0    hack_business_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.hack_business_id_seq OWNED BY public.hack_business.id;
          public          user    false    221            �            1259    17987    hack_category    TABLE     h   CREATE TABLE public.hack_category (
    id bigint NOT NULL,
    name character varying(100) NOT NULL
);
 !   DROP TABLE public.hack_category;
       public         heap    user    false            �            1259    17985    hack_category_id_seq    SEQUENCE     }   CREATE SEQUENCE public.hack_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.hack_category_id_seq;
       public          user    false    224            �           0    0    hack_category_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.hack_category_id_seq OWNED BY public.hack_category.id;
          public          user    false    223            �            1259    18021    hack_expense    TABLE     �   CREATE TABLE public.hack_expense (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    price numeric(10,2) NOT NULL,
    date date NOT NULL,
    business_id bigint NOT NULL
);
     DROP TABLE public.hack_expense;
       public         heap    user    false            �            1259    18019    hack_expense_id_seq    SEQUENCE     |   CREATE SEQUENCE public.hack_expense_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.hack_expense_id_seq;
       public          user    false    232            �           0    0    hack_expense_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.hack_expense_id_seq OWNED BY public.hack_expense.id;
          public          user    false    231            �            1259    18013 	   hack_plan    TABLE     �   CREATE TABLE public.hack_plan (
    id bigint NOT NULL,
    event character varying(100) NOT NULL,
    datetime timestamp with time zone NOT NULL,
    business_id bigint NOT NULL,
    service_id bigint NOT NULL
);
    DROP TABLE public.hack_plan;
       public         heap    user    false            �            1259    18011    hack_plan_id_seq    SEQUENCE     y   CREATE SEQUENCE public.hack_plan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.hack_plan_id_seq;
       public          user    false    230            �           0    0    hack_plan_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.hack_plan_id_seq OWNED BY public.hack_plan.id;
          public          user    false    229            �            1259    18003    hack_profile    TABLE     �   CREATE TABLE public.hack_profile (
    id bigint NOT NULL,
    phone character varying(11),
    city character varying(30),
    email character varying(254),
    business_id bigint,
    user_id integer NOT NULL
);
     DROP TABLE public.hack_profile;
       public         heap    user    false            �            1259    18001    hack_profile_id_seq    SEQUENCE     |   CREATE SEQUENCE public.hack_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.hack_profile_id_seq;
       public          user    false    228            �           0    0    hack_profile_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.hack_profile_id_seq OWNED BY public.hack_profile.id;
          public          user    false    227            �            1259    17995    hack_service    TABLE     �   CREATE TABLE public.hack_service (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    price numeric(10,2) NOT NULL,
    business_id bigint NOT NULL
);
     DROP TABLE public.hack_service;
       public         heap    user    false            �            1259    17993    hack_service_id_seq    SEQUENCE     |   CREATE SEQUENCE public.hack_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.hack_service_id_seq;
       public          user    false    226            �           0    0    hack_service_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.hack_service_id_seq OWNED BY public.hack_service.id;
          public          user    false    225            �
           2604    17843    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          user    false    208    209    209            �
           2604    17853    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          user    false    211    210    211            �
           2604    17835    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          user    false    206    207    207            �
           2604    17861    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public          user    false    212    213    213            �
           2604    17871    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public          user    false    214    215    215            �
           2604    17879    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          user    false    216    217    217            �
           2604    17939    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          user    false    218    219    219            �
           2604    17825    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          user    false    205    204    205            �
           2604    17814    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          user    false    203    202    203            �
           2604    17982    hack_business id    DEFAULT     t   ALTER TABLE ONLY public.hack_business ALTER COLUMN id SET DEFAULT nextval('public.hack_business_id_seq'::regclass);
 ?   ALTER TABLE public.hack_business ALTER COLUMN id DROP DEFAULT;
       public          user    false    221    222    222            �
           2604    17990    hack_category id    DEFAULT     t   ALTER TABLE ONLY public.hack_category ALTER COLUMN id SET DEFAULT nextval('public.hack_category_id_seq'::regclass);
 ?   ALTER TABLE public.hack_category ALTER COLUMN id DROP DEFAULT;
       public          user    false    223    224    224            �
           2604    18024    hack_expense id    DEFAULT     r   ALTER TABLE ONLY public.hack_expense ALTER COLUMN id SET DEFAULT nextval('public.hack_expense_id_seq'::regclass);
 >   ALTER TABLE public.hack_expense ALTER COLUMN id DROP DEFAULT;
       public          user    false    231    232    232            �
           2604    18016    hack_plan id    DEFAULT     l   ALTER TABLE ONLY public.hack_plan ALTER COLUMN id SET DEFAULT nextval('public.hack_plan_id_seq'::regclass);
 ;   ALTER TABLE public.hack_plan ALTER COLUMN id DROP DEFAULT;
       public          user    false    230    229    230            �
           2604    18006    hack_profile id    DEFAULT     r   ALTER TABLE ONLY public.hack_profile ALTER COLUMN id SET DEFAULT nextval('public.hack_profile_id_seq'::regclass);
 >   ALTER TABLE public.hack_profile ALTER COLUMN id DROP DEFAULT;
       public          user    false    228    227    228            �
           2604    17998    hack_service id    DEFAULT     r   ALTER TABLE ONLY public.hack_service ALTER COLUMN id SET DEFAULT nextval('public.hack_service_id_seq'::regclass);
 >   ALTER TABLE public.hack_service ALTER COLUMN id DROP DEFAULT;
       public          user    false    225    226    226            �          0    17840 
   auth_group 
   TABLE DATA                 public          user    false    209   V�       �          0    17850    auth_group_permissions 
   TABLE DATA                 public          user    false    211   p�       �          0    17832    auth_permission 
   TABLE DATA                 public          user    false    207   ��       �          0    17858 	   auth_user 
   TABLE DATA                 public          user    false    213   �       �          0    17868    auth_user_groups 
   TABLE DATA                 public          user    false    215   ��       �          0    17876    auth_user_user_permissions 
   TABLE DATA                 public          user    false    217   ��       �          0    17936    django_admin_log 
   TABLE DATA                 public          user    false    219   ��       �          0    17822    django_content_type 
   TABLE DATA                 public          user    false    205   ��       �          0    17811    django_migrations 
   TABLE DATA                 public          user    false    203   ��       �          0    17967    django_session 
   TABLE DATA                 public          user    false    220   �       �          0    17979    hack_business 
   TABLE DATA                 public          user    false    222   �       �          0    17987    hack_category 
   TABLE DATA                 public          user    false    224   6�       �          0    18021    hack_expense 
   TABLE DATA                 public          user    false    232   P�       �          0    18013 	   hack_plan 
   TABLE DATA                 public          user    false    230   j�       �          0    18003    hack_profile 
   TABLE DATA                 public          user    false    228   ��       �          0    17995    hack_service 
   TABLE DATA                 public          user    false    226   )�       �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
          public          user    false    208            �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
          public          user    false    210            �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);
          public          user    false    206            �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
          public          user    false    214            �           0    0    auth_user_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);
          public          user    false    212            �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
          public          user    false    216            �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
          public          user    false    218            �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);
          public          user    false    204                        0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 20, true);
          public          user    false    202                       0    0    hack_business_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.hack_business_id_seq', 1, false);
          public          user    false    221                       0    0    hack_category_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.hack_category_id_seq', 1, false);
          public          user    false    223                       0    0    hack_expense_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.hack_expense_id_seq', 1, false);
          public          user    false    231                       0    0    hack_plan_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.hack_plan_id_seq', 1, false);
          public          user    false    229                       0    0    hack_profile_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.hack_profile_id_seq', 1, false);
          public          user    false    227                       0    0    hack_service_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.hack_service_id_seq', 1, false);
          public          user    false    225            �
           2606    17965    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            user    false    209            �
           2606    17892 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            user    false    211    211                        2606    17855 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            user    false    211            �
           2606    17845    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            user    false    209            �
           2606    17883 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            user    false    207    207            �
           2606    17837 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            user    false    207                       2606    17873 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public            user    false    215                       2606    17907 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public            user    false    215    215                       2606    17863    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public            user    false    213                       2606    17881 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public            user    false    217                       2606    17921 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public            user    false    217    217                       2606    17959     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public            user    false    213                       2606    17945 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            user    false    219            �
           2606    17829 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            user    false    205    205            �
           2606    17827 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            user    false    205            �
           2606    17819 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            user    false    203                       2606    17974 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            user    false    220                       2606    17984     hack_business hack_business_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.hack_business
    ADD CONSTRAINT hack_business_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.hack_business DROP CONSTRAINT hack_business_pkey;
       public            user    false    222            !           2606    17992     hack_category hack_category_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.hack_category
    ADD CONSTRAINT hack_category_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.hack_category DROP CONSTRAINT hack_category_pkey;
       public            user    false    224            6           2606    18026    hack_expense hack_expense_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.hack_expense
    ADD CONSTRAINT hack_expense_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.hack_expense DROP CONSTRAINT hack_expense_pkey;
       public            user    false    232            0           2606    18018    hack_plan hack_plan_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.hack_plan
    ADD CONSTRAINT hack_plan_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.hack_plan DROP CONSTRAINT hack_plan_pkey;
       public            user    false    230            )           2606    18008    hack_profile hack_profile_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.hack_profile
    ADD CONSTRAINT hack_profile_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.hack_profile DROP CONSTRAINT hack_profile_pkey;
       public            user    false    228            +           2606    18010 %   hack_profile hack_profile_user_id_key 
   CONSTRAINT     c   ALTER TABLE ONLY public.hack_profile
    ADD CONSTRAINT hack_profile_user_id_key UNIQUE (user_id);
 O   ALTER TABLE ONLY public.hack_profile DROP CONSTRAINT hack_profile_user_id_key;
       public            user    false    228            &           2606    18000    hack_service hack_service_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.hack_service
    ADD CONSTRAINT hack_service_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.hack_service DROP CONSTRAINT hack_service_pkey;
       public            user    false    226            �
           1259    17966    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            user    false    209            �
           1259    17903 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            user    false    211            �
           1259    17904 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            user    false    211            �
           1259    17889 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            user    false    207                       1259    17919 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public            user    false    215            	           1259    17918 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public            user    false    215                       1259    17933 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public            user    false    217                       1259    17932 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public            user    false    217                       1259    17960     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public            user    false    213                       1259    17956 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            user    false    219                       1259    17957 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            user    false    219                       1259    17976 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            user    false    220                       1259    17975 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            user    false    220                       1259    18027    hack_business_name_1b1fc34d    INDEX     U   CREATE INDEX hack_business_name_1b1fc34d ON public.hack_business USING btree (name);
 /   DROP INDEX public.hack_business_name_1b1fc34d;
       public            user    false    222                       1259    18028     hack_business_name_1b1fc34d_like    INDEX     n   CREATE INDEX hack_business_name_1b1fc34d_like ON public.hack_business USING btree (name varchar_pattern_ops);
 4   DROP INDEX public.hack_business_name_1b1fc34d_like;
       public            user    false    222                       1259    18029    hack_category_name_c9fa2cf7    INDEX     U   CREATE INDEX hack_category_name_c9fa2cf7 ON public.hack_category USING btree (name);
 /   DROP INDEX public.hack_category_name_c9fa2cf7;
       public            user    false    224                       1259    18030     hack_category_name_c9fa2cf7_like    INDEX     n   CREATE INDEX hack_category_name_c9fa2cf7_like ON public.hack_category USING btree (name varchar_pattern_ops);
 4   DROP INDEX public.hack_category_name_c9fa2cf7_like;
       public            user    false    224            2           1259    18071 !   hack_expense_business_id_f484607d    INDEX     a   CREATE INDEX hack_expense_business_id_f484607d ON public.hack_expense USING btree (business_id);
 5   DROP INDEX public.hack_expense_business_id_f484607d;
       public            user    false    232            3           1259    18069    hack_expense_name_7114d6f7    INDEX     S   CREATE INDEX hack_expense_name_7114d6f7 ON public.hack_expense USING btree (name);
 .   DROP INDEX public.hack_expense_name_7114d6f7;
       public            user    false    232            4           1259    18070    hack_expense_name_7114d6f7_like    INDEX     l   CREATE INDEX hack_expense_name_7114d6f7_like ON public.hack_expense USING btree (name varchar_pattern_ops);
 3   DROP INDEX public.hack_expense_name_7114d6f7_like;
       public            user    false    232            ,           1259    18062    hack_plan_business_id_eec4ec82    INDEX     [   CREATE INDEX hack_plan_business_id_eec4ec82 ON public.hack_plan USING btree (business_id);
 2   DROP INDEX public.hack_plan_business_id_eec4ec82;
       public            user    false    230            -           1259    18060    hack_plan_event_2351054f    INDEX     O   CREATE INDEX hack_plan_event_2351054f ON public.hack_plan USING btree (event);
 ,   DROP INDEX public.hack_plan_event_2351054f;
       public            user    false    230            .           1259    18061    hack_plan_event_2351054f_like    INDEX     h   CREATE INDEX hack_plan_event_2351054f_like ON public.hack_plan USING btree (event varchar_pattern_ops);
 1   DROP INDEX public.hack_plan_event_2351054f_like;
       public            user    false    230            1           1259    18063    hack_plan_service_id_b64e7ab4    INDEX     Y   CREATE INDEX hack_plan_service_id_b64e7ab4 ON public.hack_plan USING btree (service_id);
 1   DROP INDEX public.hack_plan_service_id_b64e7ab4;
       public            user    false    230            '           1259    18049 !   hack_profile_business_id_da000890    INDEX     a   CREATE INDEX hack_profile_business_id_da000890 ON public.hack_profile USING btree (business_id);
 5   DROP INDEX public.hack_profile_business_id_da000890;
       public            user    false    228            "           1259    18038 !   hack_service_business_id_6765535e    INDEX     a   CREATE INDEX hack_service_business_id_6765535e ON public.hack_service USING btree (business_id);
 5   DROP INDEX public.hack_service_business_id_6765535e;
       public            user    false    226            #           1259    18036    hack_service_name_4404764c    INDEX     S   CREATE INDEX hack_service_name_4404764c ON public.hack_service USING btree (name);
 .   DROP INDEX public.hack_service_name_4404764c;
       public            user    false    226            $           1259    18037    hack_service_name_4404764c_like    INDEX     l   CREATE INDEX hack_service_name_4404764c_like ON public.hack_service USING btree (name varchar_pattern_ops);
 3   DROP INDEX public.hack_service_name_4404764c_like;
       public            user    false    226            9           2606    17898 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          user    false    211    2805    207            8           2606    17893 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          user    false    209    211    2810            7           2606    17884 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          user    false    205    207    2800            ;           2606    17913 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public          user    false    209    2810    215            :           2606    17908 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public          user    false    213    215    2818            =           2606    17927 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public          user    false    2805    207    217            <           2606    17922 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public          user    false    213    2818    217            >           2606    17946 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          user    false    205    2800    219            ?           2606    17951 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public          user    false    2818    219    213            E           2606    18064 B   hack_expense hack_expense_business_id_f484607d_fk_hack_business_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.hack_expense
    ADD CONSTRAINT hack_expense_business_id_f484607d_fk_hack_business_id FOREIGN KEY (business_id) REFERENCES public.hack_business(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.hack_expense DROP CONSTRAINT hack_expense_business_id_f484607d_fk_hack_business_id;
       public          user    false    222    232    2845            C           2606    18050 <   hack_plan hack_plan_business_id_eec4ec82_fk_hack_business_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.hack_plan
    ADD CONSTRAINT hack_plan_business_id_eec4ec82_fk_hack_business_id FOREIGN KEY (business_id) REFERENCES public.hack_business(id) DEFERRABLE INITIALLY DEFERRED;
 f   ALTER TABLE ONLY public.hack_plan DROP CONSTRAINT hack_plan_business_id_eec4ec82_fk_hack_business_id;
       public          user    false    230    222    2845            D           2606    18055 :   hack_plan hack_plan_service_id_b64e7ab4_fk_hack_service_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.hack_plan
    ADD CONSTRAINT hack_plan_service_id_b64e7ab4_fk_hack_service_id FOREIGN KEY (service_id) REFERENCES public.hack_service(id) DEFERRABLE INITIALLY DEFERRED;
 d   ALTER TABLE ONLY public.hack_plan DROP CONSTRAINT hack_plan_service_id_b64e7ab4_fk_hack_service_id;
       public          user    false    226    230    2854            B           2606    18073 B   hack_profile hack_profile_business_id_da000890_fk_hack_business_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.hack_profile
    ADD CONSTRAINT hack_profile_business_id_da000890_fk_hack_business_id FOREIGN KEY (business_id) REFERENCES public.hack_business(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.hack_profile DROP CONSTRAINT hack_profile_business_id_da000890_fk_hack_business_id;
       public          user    false    2845    222    228            A           2606    18044 :   hack_profile hack_profile_user_id_3d314ab5_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.hack_profile
    ADD CONSTRAINT hack_profile_user_id_3d314ab5_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 d   ALTER TABLE ONLY public.hack_profile DROP CONSTRAINT hack_profile_user_id_3d314ab5_fk_auth_user_id;
       public          user    false    213    228    2818            @           2606    18031 B   hack_service hack_service_business_id_6765535e_fk_hack_business_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.hack_service
    ADD CONSTRAINT hack_service_business_id_6765535e_fk_hack_business_id FOREIGN KEY (business_id) REFERENCES public.hack_business(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.hack_service DROP CONSTRAINT hack_service_business_id_6765535e_fk_hack_business_id;
       public          user    false    226    222    2845            �   
   x���          �   
   x���          �   u  x����j�@E����C���B�b 8`;���dI���ouw���4Kߥ����-���p�x��d�O�L�?y�-��cm���m�4�y65e�f�&��Ζݱ���э�*��O7��������|j�~$�I�����7WS����8����vr�j����kR���X�%)d���X!��
+Rx��ߑ�b�k���ɀ_�
�!���K0R�- [l��,h�;�
#�`�=ۆSS���^�"�ku>�K�ɔ?>��s8��/x�����,龵̀]Q��]ɜ�bơ�2e���q�Ϙ�}�8�%L�w�@_S�4�S��N~A�����e�Lh�&�_�~-����6�3Z�8��U�t���j}R�� * :�����p��Ҥ�����m|'����ǗTAu=��PQ��@x��x���ږ�{��h�򽥚��S�P��� ��O�}�P8o}uS��c��M h��$=~�!T��) z�ćo;$|+���=O�y�?� �>��|�����#g���#_����y۫�ĕ�y���_C���qp|�al��8;>�0��w�s�7���ˡF:t�)�<��U���8�Au;�@�cD��~82���R      �   c  x���[o�@���
.Ll��� �l����E�(7f� ( r��/�f���W�����;��Ɍ���ɔ��鈉���,�Rw�%v�<zV��h�����|��+���:�%�$�����3�oH��8^\���{�Z���묔:�{E��;�cM��v���_�YWg�:S��;ˁ�ĥ��A�T�s1��-�=���tfc3��V�Z�hB�@�P1zs}}pv�B��Zkɞ�^�?�uF�)J�I�\�J������:�� �g�?C�@�D�l,�j��>�x��T�R\O<u��N�d`.Ca7[��_���.,M�K�Q=��3H�O����<���[,�sE7�*:�O.J�����H9�� ���l�5�A�O�KZ\Ҋ,��\ݒmcL��/@Dt#�r7�mZImhiq�c�(���;���F~a��:"�A/�Ɔ/h_�rߥ�P`	r�߲�F|���"'/G�8�r���^�Wh�m�C�L:I5�5��|����~w��";���ۯ_����
M��r �w��mا��o����	Ng(�:GB+�8iJ��o�h��D?ג@pGgG�~�������aM����~��eG�e/���GD?�~���      �   
   x���          �   
   x���          �   
   x���          �   �   x���;�0 ཿ"[+������ 
�֒�g��I�C�ߛ���v��w������x&��| ʕ�U��AE#�J
����$�N	U����V����]�'�d)�i�2�����ӟx��r~����;]�n�1L
<���N��Ӏv4�<��/�K7���������E~1^��G�z�P��\�e��[�0��Y����8"����΋U�z��S���]:Ä_����/\p�      �   ,  x���Oo�0�{>��Z���1�i�"M��v�Znp�7�������ӴYP��
"��^?<������C��{��4��ћe�K֥�.�촭��J�D6�"�e��V�u�������Z$�;UwݾQ�ܟ �֝�&�c����	�!+ȗ`�	����l����d���0�@YT	����d���=3`al���S�}R��
Y�(J �QQ����<D�M���Y�����K�.�R�4�Ư�:^���1G�e�Pc!M��h��tۆ���J>����m�m�C9���T%����)��Yˇ,z�
���lӍG,���F�����l��>h����<��А�|���ڽe��>��1��q`y\�Y�g�a=I��Y�JC9g��T��r�/�o��>2��	�8���f�!-�'gSmE�����t�o&��weq]l�B�o|̔h�}ޟT�x�(�,rƆŏ��Bn����Lp��U�C���!�UC��������0_f,Oy�]'o���n�Q�ou�Gu��W�� a��4��Vo�      �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   
   x���          �   �   x���
�0Ew��m*��h�K;8HC
U�J���F#���&�9�˭X]>�X�u���ŧ[7�VZB��d�@��@�\i�n�"���`�rs��F۲�� �&��SFB�w��/��e�?��i��u��0�묥�/A��."      �   
   x���         