PGDMP         '                x            storage    11.5    11.5     #           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            $           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            %           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            &           1262    16402    storage    DATABASE     �   CREATE DATABASE storage WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1251' LC_CTYPE = 'English_United States.1251';
    DROP DATABASE storage;
             postgres    false            '           0    0    DATABASE storage    ACL     )   GRANT ALL ON DATABASE storage TO nordic;
                  postgres    false    2854                        3079    24623 	   uuid-ossp 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;
    DROP EXTENSION "uuid-ossp";
                  false            (           0    0    EXTENSION "uuid-ossp"    COMMENT     W   COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';
                       false    2            �            1259    16410    tariff    TABLE     �   CREATE TABLE public.tariff (
    tariff_id integer NOT NULL,
    tariff_name character(50) NOT NULL,
    tariff_limit_mb integer NOT NULL
);
    DROP TABLE public.tariff;
       public         postgres    false            )           0    0    TABLE tariff    ACL     /   GRANT SELECT ON TABLE public.tariff TO nordic;
            public       postgres    false    199            �            1259    16415    Tariffes_tarriff_id_seq    SEQUENCE     �   ALTER TABLE public.tariff ALTER COLUMN tariff_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Tariffes_tarriff_id_seq"
    START WITH 100
    INCREMENT BY 1
    MINVALUE 100
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    199            �            1259    16403    user    TABLE     �   CREATE TABLE public."user" (
    user_id integer NOT NULL,
    user_email character(50) NOT NULL,
    user_name character(50) NOT NULL,
    user_password character(255) NOT NULL,
    user_role character(50),
    user_tariff integer
);
    DROP TABLE public."user";
       public         postgres    false            *           0    0    TABLE "user"    ACL     ,   GRANT ALL ON TABLE public."user" TO nordic;
            public       postgres    false    197            �            1259    16408    Users_user_id_seq    SEQUENCE     �   ALTER TABLE public."user" ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Users_user_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    197            �            1259    24602    file    TABLE     �   CREATE TABLE public.file (
    file_id integer NOT NULL,
    path character(255) NOT NULL,
    file_name character(255) NOT NULL,
    size integer,
    user_id integer NOT NULL,
    file_uuid uuid DEFAULT public.uuid_generate_v1() NOT NULL
);
    DROP TABLE public.file;
       public         postgres    false    2            +           0    0 
   TABLE file    ACL     *   GRANT ALL ON TABLE public.file TO nordic;
            public       postgres    false    201            �            1259    24610    file_file_id_seq    SEQUENCE     �   ALTER TABLE public.file ALTER COLUMN file_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.file_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public       postgres    false    201                      0    24602    file 
   TABLE DATA               R   COPY public.file (file_id, path, file_name, size, user_id, file_uuid) FROM stdin;
    public       postgres    false    201   9                 0    16410    tariff 
   TABLE DATA               I   COPY public.tariff (tariff_id, tariff_name, tariff_limit_mb) FROM stdin;
    public       postgres    false    199                    0    16403    user 
   TABLE DATA               g   COPY public."user" (user_id, user_email, user_name, user_password, user_role, user_tariff) FROM stdin;
    public       postgres    false    197   �       ,           0    0    Tariffes_tarriff_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Tariffes_tarriff_id_seq"', 102, true);
            public       postgres    false    200            -           0    0    Users_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Users_user_id_seq"', 5, true);
            public       postgres    false    198            .           0    0    file_file_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.file_file_id_seq', 8, true);
            public       postgres    false    202            �
           2606    16414    tariff Tariffes_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.tariff
    ADD CONSTRAINT "Tariffes_pkey" PRIMARY KEY (tariff_id);
 @   ALTER TABLE ONLY public.tariff DROP CONSTRAINT "Tariffes_pkey";
       public         postgres    false    199            �
           2606    16407    user Users_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (user_id);
 =   ALTER TABLE ONLY public."user" DROP CONSTRAINT "Users_pkey";
       public         postgres    false    197            �
           2606    24609    file file_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.file
    ADD CONSTRAINT file_pkey PRIMARY KEY (file_id);
 8   ALTER TABLE ONLY public.file DROP CONSTRAINT file_pkey;
       public         postgres    false    201            �
           2606    24644    file file_uuid_constr 
   CONSTRAINT     U   ALTER TABLE ONLY public.file
    ADD CONSTRAINT file_uuid_constr UNIQUE (file_uuid);
 ?   ALTER TABLE ONLY public.file DROP CONSTRAINT file_uuid_constr;
       public         postgres    false    201            �
           1259    24617    fki_FK_user_file    INDEX     F   CREATE INDEX "fki_FK_user_file" ON public.file USING btree (user_id);
 &   DROP INDEX public."fki_FK_user_file";
       public         postgres    false    201            �
           1259    24601    fki_user_tariff    INDEX     I   CREATE INDEX fki_user_tariff ON public."user" USING btree (user_tariff);
 #   DROP INDEX public.fki_user_tariff;
       public         postgres    false    197            �
           2606    24612    file FK_user_file    FK CONSTRAINT     x   ALTER TABLE ONLY public.file
    ADD CONSTRAINT "FK_user_file" FOREIGN KEY (user_id) REFERENCES public."user"(user_id);
 =   ALTER TABLE ONLY public.file DROP CONSTRAINT "FK_user_file";
       public       postgres    false    2711    197    201            �
           2606    24596    user user_tariff    FK CONSTRAINT     }   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_tariff FOREIGN KEY (user_tariff) REFERENCES public.tariff(tariff_id);
 <   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_tariff;
       public       postgres    false    197    2714    199               �   x��;n1Dk�� �D����� C��Al/��6\�
�&�
�������l����c>��!&b�A��ѕ��]�g���J�5{���ה��駥�?��۾�B���yU��V�ݹ��s{������Ծc�:��G��3P$���;ũH�b��������Y5 ѭ��Z������N�Xn��yR�@(؁���<��Һ2E�k��y��         c   x����	�@�I�@������^�`D?-���h;�1UB��7���SňYr �����'bjqa�KP�:�Sj�`M����׻�U��/"(5h         �   x�3�,�Nt zE�
D��µ�%���U�xW&z�����Y8e��y��GXT��d�[DZ���y�fՠ��ũE$j140�2�LL���s �z����ht)&�.h��8�U�[y�:FTx%y�e�g�e��DG�U�'��yzGy�z���A	 �L�C#�=... �?�&     