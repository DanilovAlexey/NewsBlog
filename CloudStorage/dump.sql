PGDMP     "                    x            storage    11.5    11.5                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false                       1262    16402    storage    DATABASE     �   CREATE DATABASE storage WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1251' LC_CTYPE = 'English_United States.1251';
    DROP DATABASE storage;
             postgres    false                       0    0    DATABASE storage    ACL     )   GRANT ALL ON DATABASE storage TO nordic;
                  postgres    false    2839            �            1259    16410    tariff    TABLE     �   CREATE TABLE public.tariff (
    tarriff_id integer NOT NULL,
    tariff_name character(50) NOT NULL,
    tariff_limit_mb integer NOT NULL
);
    DROP TABLE public.tariff;
       public         postgres    false                       0    0    TABLE tariff    ACL     /   GRANT SELECT ON TABLE public.tariff TO nordic;
            public       postgres    false    198            �            1259    16415    Tariffes_tarriff_id_seq    SEQUENCE     �   ALTER TABLE public.tariff ALTER COLUMN tarriff_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Tariffes_tarriff_id_seq"
    START WITH 100
    INCREMENT BY 1
    MINVALUE 100
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    198            �            1259    16419    user_tariff    TABLE     {   CREATE TABLE public.user_tariff (
    id integer NOT NULL,
    tariff_id integer NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public.user_tariff;
       public         postgres    false                       0    0    TABLE user_tariff    ACL     4   GRANT SELECT ON TABLE public.user_tariff TO nordic;
            public       postgres    false    201            �            1259    16417    User_Tariff_id_seq    SEQUENCE     �   ALTER TABLE public.user_tariff ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."User_Tariff_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    201            �            1259    16403    user    TABLE     �   CREATE TABLE public."user" (
    user_id integer NOT NULL,
    user_email character(50) NOT NULL,
    user_name character(50) NOT NULL,
    user_password character(255) NOT NULL,
    user_role character(50)
);
    DROP TABLE public."user";
       public         postgres    false                       0    0    TABLE "user"    ACL     /   GRANT SELECT ON TABLE public."user" TO nordic;
            public       postgres    false    196            �            1259    16408    Users_user_id_seq    SEQUENCE     �   ALTER TABLE public."user" ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Users_user_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    196                      0    16410    tariff 
   TABLE DATA               J   COPY public.tariff (tarriff_id, tariff_name, tariff_limit_mb) FROM stdin;
    public       postgres    false    198   $                 0    16403    user 
   TABLE DATA               Z   COPY public."user" (user_id, user_email, user_name, user_password, user_role) FROM stdin;
    public       postgres    false    196   d                 0    16419    user_tariff 
   TABLE DATA               =   COPY public.user_tariff (id, tariff_id, user_id) FROM stdin;
    public       postgres    false    201   �                  0    0    Tariffes_tarriff_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Tariffes_tarriff_id_seq"', 100, true);
            public       postgres    false    199                       0    0    User_Tariff_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public."User_Tariff_id_seq"', 1, false);
            public       postgres    false    200                       0    0    Users_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Users_user_id_seq"', 1, true);
            public       postgres    false    197            �
           2606    16414    tariff Tariffes_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.tariff
    ADD CONSTRAINT "Tariffes_pkey" PRIMARY KEY (tarriff_id);
 @   ALTER TABLE ONLY public.tariff DROP CONSTRAINT "Tariffes_pkey";
       public         postgres    false    198            �
           2606    16423    user_tariff User_Tariff_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.user_tariff
    ADD CONSTRAINT "User_Tariff_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.user_tariff DROP CONSTRAINT "User_Tariff_pkey";
       public         postgres    false    201            �
           2606    16407    user Users_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (user_id);
 =   ALTER TABLE ONLY public."user" DROP CONSTRAINT "Users_pkey";
       public         postgres    false    196            �
           1259    16440    fki_FK_tariff    INDEX     L   CREATE INDEX "fki_FK_tariff" ON public.user_tariff USING btree (tariff_id);
 #   DROP INDEX public."fki_FK_tariff";
       public         postgres    false    201            �
           1259    16434    fki_FK_user    INDEX     H   CREATE INDEX "fki_FK_user" ON public.user_tariff USING btree (user_id);
 !   DROP INDEX public."fki_FK_user";
       public         postgres    false    201            �
           2606    16435    user_tariff FK_tariff    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_tariff
    ADD CONSTRAINT "FK_tariff" FOREIGN KEY (tariff_id) REFERENCES public.tariff(tarriff_id);
 A   ALTER TABLE ONLY public.user_tariff DROP CONSTRAINT "FK_tariff";
       public       postgres    false    201    2700    198            �
           2606    16429    user_tariff FK_user    FK CONSTRAINT     z   ALTER TABLE ONLY public.user_tariff
    ADD CONSTRAINT "FK_user" FOREIGN KEY (user_id) REFERENCES public."user"(user_id);
 ?   ALTER TABLE ONLY public.user_tariff DROP CONSTRAINT "FK_user";
       public       postgres    false    201    2698    196               0   x�340�0��/컰�b���
��\ب@�*����� �c�         l   x�3�LL���s �z���
��#H1
���%���8�U�[y�:FTx%y�e�g�e��DG�U�'��yzGy�z��d���P&IW� �)E�            x������ � �     