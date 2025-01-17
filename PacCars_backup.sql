PGDMP     -                    |            PacCars    15.0    15.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                        1262    33104    PacCars    DATABASE     �   CREATE DATABASE "PacCars" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
    DROP DATABASE "PacCars";
                postgres    false            !           0    0    DATABASE "PacCars"    COMMENT     H   COMMENT ON DATABASE "PacCars" IS 'Final Project SQL Pacmann JPP Basic';
                   postgres    false    3360            �            1259    33614    detail_iklan    TABLE     �   CREATE TABLE public.detail_iklan (
    id_detail integer NOT NULL,
    deskripsi character varying(200) NOT NULL,
    alamat character varying(200) NOT NULL,
    domisili character varying(200) NOT NULL
);
     DROP TABLE public.detail_iklan;
       public         heap    postgres    false            �            1259    33655    iklan    TABLE     �  CREATE TABLE public.iklan (
    id_iklan integer NOT NULL,
    id_detail integer NOT NULL,
    id_mobil integer NOT NULL,
    id_pengguna integer NOT NULL,
    judul character varying(200) NOT NULL,
    is_bid boolean NOT NULL,
    id_penawaran integer,
    harga numeric(20,0) NOT NULL,
    tanggal_dibuat date NOT NULL,
    CONSTRAINT iklan_harga_check CHECK ((harga >= (0)::numeric))
);
    DROP TABLE public.iklan;
       public         heap    postgres    false            �            1259    33594    mobil    TABLE     W  CREATE TABLE public.mobil (
    id_mobil integer NOT NULL,
    merek character varying(20) NOT NULL,
    model character varying(50) NOT NULL,
    jenis character varying(15) NOT NULL,
    transmisi character varying(15) NOT NULL,
    tahun integer NOT NULL,
    odometer_km numeric(20,0) NOT NULL,
    warna character varying(20) NOT NULL
);
    DROP TABLE public.mobil;
       public         heap    postgres    false            �            1259    33642 	   penawaran    TABLE       CREATE TABLE public.penawaran (
    id_penawaran integer NOT NULL,
    id_pengguna integer NOT NULL,
    harga_penawaran numeric(20,0) NOT NULL,
    status_penawaran character varying(40) NOT NULL,
    tanggal_penawaran date NOT NULL,
    CONSTRAINT penawaran_harga_penawaran_check CHECK ((harga_penawaran >= (0)::numeric)),
    CONSTRAINT penawaran_status_penawaran_check CHECK (((status_penawaran)::text = ANY ((ARRAY['Pending'::character varying, 'Diterima'::character varying, 'Ditolak'::character varying])::text[])))
);
    DROP TABLE public.penawaran;
       public         heap    postgres    false            �            1259    33599    pengguna    TABLE     B  CREATE TABLE public.pengguna (
    id_pengguna integer NOT NULL,
    nama character varying(200) NOT NULL,
    notelp character varying(20) NOT NULL,
    email character varying(200) NOT NULL,
    alamat character varying(200) NOT NULL,
    domisili character varying(200) NOT NULL,
    tanggal_bergabung date NOT NULL
);
    DROP TABLE public.pengguna;
       public         heap    postgres    false                      0    33614    detail_iklan 
   TABLE DATA           N   COPY public.detail_iklan (id_detail, deskripsi, alamat, domisili) FROM stdin;
    public          postgres    false    216   Q!                 0    33655    iklan 
   TABLE DATA              COPY public.iklan (id_iklan, id_detail, id_mobil, id_pengguna, judul, is_bid, id_penawaran, harga, tanggal_dibuat) FROM stdin;
    public          postgres    false    218   �.                 0    33594    mobil 
   TABLE DATA           d   COPY public.mobil (id_mobil, merek, model, jenis, transmisi, tahun, odometer_km, warna) FROM stdin;
    public          postgres    false    214   �6                 0    33642 	   penawaran 
   TABLE DATA           t   COPY public.penawaran (id_penawaran, id_pengguna, harga_penawaran, status_penawaran, tanggal_penawaran) FROM stdin;
    public          postgres    false    217   �<                 0    33599    pengguna 
   TABLE DATA           i   COPY public.pengguna (id_pengguna, nama, notelp, email, alamat, domisili, tanggal_bergabung) FROM stdin;
    public          postgres    false    215   n?       ~           2606    33620    detail_iklan detail_iklan_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.detail_iklan
    ADD CONSTRAINT detail_iklan_pkey PRIMARY KEY (id_detail);
 H   ALTER TABLE ONLY public.detail_iklan DROP CONSTRAINT detail_iklan_pkey;
       public            postgres    false    216            �           2606    33660    iklan iklan_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.iklan
    ADD CONSTRAINT iklan_pkey PRIMARY KEY (id_iklan);
 :   ALTER TABLE ONLY public.iklan DROP CONSTRAINT iklan_pkey;
       public            postgres    false    218            x           2606    33598    mobil mobil_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.mobil
    ADD CONSTRAINT mobil_pkey PRIMARY KEY (id_mobil);
 :   ALTER TABLE ONLY public.mobil DROP CONSTRAINT mobil_pkey;
       public            postgres    false    214            �           2606    33648    penawaran penawaran_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.penawaran
    ADD CONSTRAINT penawaran_pkey PRIMARY KEY (id_penawaran);
 B   ALTER TABLE ONLY public.penawaran DROP CONSTRAINT penawaran_pkey;
       public            postgres    false    217            z           2606    33607    pengguna pengguna_email_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.pengguna
    ADD CONSTRAINT pengguna_email_key UNIQUE (email);
 E   ALTER TABLE ONLY public.pengguna DROP CONSTRAINT pengguna_email_key;
       public            postgres    false    215            |           2606    33605    pengguna pengguna_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.pengguna
    ADD CONSTRAINT pengguna_pkey PRIMARY KEY (id_pengguna);
 @   ALTER TABLE ONLY public.pengguna DROP CONSTRAINT pengguna_pkey;
       public            postgres    false    215            �           2606    33661    iklan fk_detail    FK CONSTRAINT     ~   ALTER TABLE ONLY public.iklan
    ADD CONSTRAINT fk_detail FOREIGN KEY (id_detail) REFERENCES public.detail_iklan(id_detail);
 9   ALTER TABLE ONLY public.iklan DROP CONSTRAINT fk_detail;
       public          postgres    false    218    216    3198            �           2606    33666    iklan fk_mobil    FK CONSTRAINT     t   ALTER TABLE ONLY public.iklan
    ADD CONSTRAINT fk_mobil FOREIGN KEY (id_mobil) REFERENCES public.mobil(id_mobil);
 8   ALTER TABLE ONLY public.iklan DROP CONSTRAINT fk_mobil;
       public          postgres    false    218    214    3192            �           2606    33676    iklan fk_penawaran    FK CONSTRAINT     �   ALTER TABLE ONLY public.iklan
    ADD CONSTRAINT fk_penawaran FOREIGN KEY (id_penawaran) REFERENCES public.penawaran(id_penawaran);
 <   ALTER TABLE ONLY public.iklan DROP CONSTRAINT fk_penawaran;
       public          postgres    false    218    217    3200            �           2606    33649    penawaran fk_pengguna    FK CONSTRAINT     �   ALTER TABLE ONLY public.penawaran
    ADD CONSTRAINT fk_pengguna FOREIGN KEY (id_pengguna) REFERENCES public.pengguna(id_pengguna);
 ?   ALTER TABLE ONLY public.penawaran DROP CONSTRAINT fk_pengguna;
       public          postgres    false    217    215    3196            �           2606    33671    iklan fk_pengguna    FK CONSTRAINT     �   ALTER TABLE ONLY public.iklan
    ADD CONSTRAINT fk_pengguna FOREIGN KEY (id_pengguna) REFERENCES public.pengguna(id_pengguna);
 ;   ALTER TABLE ONLY public.iklan DROP CONSTRAINT fk_pengguna;
       public          postgres    false    215    218    3196               c  x��Z]S�J}�~ż��ҌF�'�	
��JU^�Xk�%�l-ſ��3�-��&$���_�Ow�&Y�?󐱺٘���f�<�
Vg�9c�֛�쟬���+�.��N?�']vo�M;W�,P��rT����ص^�<�\(�b9�J_x7��l����Mu���yE���MLa� ���K��W�.fKS����kît�k�Ҟ�M��$)�)��j>7~����j37�.����1�� ��񈭳u��wU���7v����o%�Q
�&z�kS����E�7�'��,T\�ޭƻ�+]>�/_z�,�k����U�<c3�9[eu����Z��S\����9���h���H��)�\Or��'2������+'��k�X^�3�m���X�f�T�36�
��9HRA���V��j+�D���
~�}��\�2�Wgl��a�u�Лw{ژiU�aѫ&��w��K]�g�+�ƾ�h�un��?X��z�v64?|����BXV%ԛ��1bv��m�FQ*9H/(V�809A4��:�8wb��.�Ȃ)4�[n~2)dz�ղZ !Ro�{S^-W�X�f	i�n#9�9��9���l��9B��K�GS�'�u,����+����~���2~)_��,�MEO��̹/H~��ʹ��0�$}A��Hy�0�Z����.N��ͫ']�ͦr�"Ȝ����H"��V�y]�\x���f<�ž�}�L؏�˯��/��7.)�%%	d̪Fu����:��]�9�I���H�y���Uu���
o��7��i�i]^,�ŻWvd����NB����Jzш�l���B+��<LȔ�`��Q��G��&�+U$�������,<4��)���WuF$"M��T6��j����l���K���׭��7n�a	�,��s�6S={-��7��(�\�8���vo��d�Cxn���U�3V"s�־�s휧�v�H�4�ɸ��j�~�j� ���yrP�̔P>A�|�ۈ�2Jb@��^M����4�Jʗ��<�}�B|�A)�QǱ�_�*�$ߠ���q[	{!��@�ۏl_���g���j�d���2i���Қ:�R��%Rv��>�`�<{ `�Z���t�k�~ڦ�����q�0�L<dfj���uw�_P�A�PtK��C�`�T���f9m��m�i!�]yn�zt҄$��(ܖ�p�Fz�����cD�@��8������5�{	�"~7}��"�q< T�������Dq�Z�=E��І䁆�e�$�����Z[�&J�Fe"p,�x׈��..�`O�g����Z#����C����~��a�%j*�(F�^#�����ǑNc[����.,�q���&�vW�r���0�.KĽ�F\�NO��Q}M
���<v�,d��f�E��'j"x�E�)�4��1 ��b��3�K�N�0����l㇩H�xPMB�Ͷ��/�'6�2�FM���Y�o��gv�ģ$�=�Aٜ�|)J3�Ĝ-̬Y�콥�}yI��2�,t6�kkܖ��ɽ�"��z�i�]x
�دj��iC%��x��Ԅǁ
���zX���jѪ2T�g���'	U�qF��i|Z�v�،a��G��\X�Z����]�#r*V1����K?T'Q��GV�R]V�޴�BRp��kB#Nr��*��g�D�ɇ��o�W�ٲ����)K-ѰE��� a���'� w�ck{%�Q6�΢�'bHydp<	9@/9��!��r������vW�l���9@ ,uѨ�DWqhy,%��,|)�˞�z�J��LB�P��.`d��6�u�]/�|���=eÀ��Z�ƗG6Z�9��	܍BH��f��i-��=n b�	���$S쩸���d���xc�X77�ϗl�,��z��XV��س�S�ų��gH�����X]L�H��m�
A��U|�zǳU[�������k))$��*�ܗ�@��XQ�F������J���I���H�O:�/�b@Ԗ'D|��'�s��h;���.��!<��rf�k(�߂�'M����n6���J&R���eǏ�챜���4����[�-�V���U�H�=wM��Z�G��3'FJ��6�} ��u;�B�,���=�h�[��=�R���Q�5i�ҏ�n<bm QKH6�f��,���9�U~EE��W� � �#���?���c$g��V����+���e�H-z�17�<�M����ڒ5;:bȉ<�j�=tf��77%��O;��-ۍ� ��%�𲅩�c�ȥ,5�E֘M�����g2wF7@`��~������4������E��Ԗ�`?N���+���ߴikjHK�����@"��䍤���<=�l+�^ۡ��Q�!x�g����k�G_j��;��5\�"<}�s��C��s�7\�[+�ztsV2�� �m��������~,�EJ�/ �2}rѡ�G �Xu&�Nd��Z�J_N���I����,���U����>�~��)\�u�ᢪ��0��;&`E��m��Cϣ7n��ns��I�[���L��=�=&��S��ۅ0�v�� Qk1�#	�c�ᕕ���fQ�bDrj���L��mi��~o�% Y��jn��y�����)���^�@��x�I��8a�h�g'.�m܏�0II��ݎ����/�;$��v���4M�=P_���*|�ݩӜ`�4D�Z�N���y[�'��@�٢V����RD*%�r�W�>��@�svq��3*���Q�1���J}X�X�ȃ7��ߣ��@���H��o:>�����BoB��fՍ�D�G}Tzd�B3h
��{?(�}C�0:%xD��"[Z�L�4�/L�bw�w^tFJ����	�*^�ވw�!���sV�q�V�_)[��L�ƨP�L��5#�̓��n��E�(�gBqr[�z\�O��L9C�����A�� ,�4�]�J�?8;0�໽8$����K�7Eunʇ�u�w�a/��Վ6�	��=P{�$Q�F2�)�6�Z��cҀ˽�t���ÿ�p��޺���/�O���d��=����`���������7 ��g���nο�{�͵�	8���[����E����m�]��S��+��@�����k��UAF7�޻)Z$���4?8�����\�}m�[�� �u%�ۗ���^�|��!X�s�����il/�Q�rZ#��U��8TnGL*e�`����=������夝�ƂQGG��~���1�m#8!��
"S�h�Sw���&�N׬����4�S7��^W�m$�84��2��m�E�\�)���<�-#yp�l})�tߵ_�+Q���'�iZ-�����L�           x�}X�r$�<W}`�W��*� �^Y�Q�V��GKq7�a����~qfz�X1��$�)�%�D���^���O�����/?&�Z��/.�"���k��N�Ǘ�����?O/O�����y~畝��xG�RO���������o�/O?M��s�$mɝ
I��<���ɓ!^M���z~~������t��p3�]���T�Ğ-Qb|���w������"͗����Vw!/<WEU��<qM?�����c$fI�צR=>��v<ȞzILg������>qF!���'~b�-��祮8�_�/OsJ���jkKJ�Ě{j��l)� �T�U�R:�X2��(I"���X��W�{dE���KZ���h�%E�ڬp-���Ж����5�6WM�h�PFB�F|���Qj�xlh  i���	D��������փ�B��v9����4�4�iܝ��D������P��T� ���2 J�`'�}|v���Vo���-=�LmK麳�,�j�T|	�'Bg{N+��o��ާ���<|?=��-8(��+�0q���@|=���RL;�eQP�����Kdy��75.���*�d���'W��۫��&e�dUԆ���Ä�:�2������x����+^���/��k��ТI�}Ela&4����x�@5UN-p�!������y|_H:W�DjZ=ڽSn��1�?���Ff�i`�)��v�"�����S¼0�My0} �p��h����

�+���(��Z�$�X(4�4c-��x��� @z\o�L��oe� �IFj�1��#l3j/�QY&����7�ᖣ( ��@�v���ٍy��� �Յj(G�a���A�w�3&���m�
����t�2�Զnd���N��<��Bb��0=O/���7��$�6�D��;�.A�HY���A���  �;	�d����-�y�	nB	��ʨv��
�C94+Ŝ���{�-�Z����αE����m��&��
�LM4*J�]�͈A���i����x��^OgAx�Rlsk<���H\�GC�Vk�l���Zvb���Vc��ӎ�e�x��W.����e�Q�m�8�IG�5�<�l�>�}A��{X
a��c8���h6L�ټ��%�ߌٌ �`zh��6D�*�/�p[�l�a
(Z��u31�0�;��7�&�\f�>Rw���s��l���3�^��]�mXB׀m���@�����V���o$�1�6+F�Xd ׁi4�A=����7Z����f��M�CR4v�}�p�����5�k�n��RޭbA��F������(l�6`䵀���P�:�����C�v#ĳ�9��{Q�m�,��!T�:�Bx5�X�0E*�.��<��q�-5,4w+kKcX3J�Q��x/�	"Z�����U��+��2M�'O��D�H�����א]�|˵��b��~��U]�q#�{g��*0��"
]��������	��U���Mp)`�bRc���m�+X�x3�`���\84���`��Z��p��G>�u�t�{L���c�Y�o��Ya��޼�y1�aU��"�}��
7Mu5�3Rt̥��:���[�X�X%�xk�E�U��W�
s�4�3���<�l���%���1��N;:���{c��SNCnqi".��Zր7��e�'%��� ���2�J5����q!�
-İ�kt%�a���$Ƹ�{����,� ��us\Rm�c��٭X��p�b��$&�&�ߙd��g�6�C?�L-�D�Tܪڽ�P����A���L�X�WZ�tƶ��%=f%���)yp?�����/!x ֗k��s�������o��e�]ؕ��5"H:�7k��[�.~� ���ㆶ�Q<w��FMr숨�H����~�]��l�4�ahX�_����T��z�k�;ꇋ`�n,D(�����#�:�~{hu�����/���2���m�%��fD�G~*��@�����0;rg��8�!���K��ϯ/!�-��Q)�F����YP�`�}�5�����L}�         �  x��X�R�H}n}�~�S�/�����\Oj^[!
��ђ�~�V��8LQnJ��.�{�6�K�6�*��G�6���$�?��$FG6B�ǚ���ba
��������؜�h�0�����$>�z����-����#*��h]��7������Iy��M	��/6̋�he_�j�ow��m���`�O}#�%��:��ѓ����6�����6�l�6�['.¹��*H�7����S�}�֫�f����&8X7���ˢvs����9ZQ����8���3�e�~d�܃?��������h3<�P��!��A����_-��Ͳ����	�1F��)����#m��)�e���������m %#��q��$o�ҽO�<���$��G�������1����6�;�҈�5��.yN�����m�0;�U�7MN<�_��nafJ	�Lj��R���)H=�g�ȡg�2���V����&H� C����֎p�c�7ЗH�LKU7�GIg�:��t��8��R���E��7I�2T�)I+��G�Y_4 vZv�� @����8�>��>�v�%p�� 7�e#d.�ɦZ5G{t���I
l d5fC�9}�ǲP�ϗSk����T(�"�7]�4
X�
�����0QX�>���F7��"�W�~7��n�%�1#�ɻݙQ&��ib6�Ju�pʉ0FH���>y�%��a~�T
��j�9����/�R]���	t�\�Qa���}9}Z��
�LB�lZ4����0:���e�j�J��T�H0�X�a��1}f�n���O45F6����c.dV���.��D�V-��J�|Jo(����n!]�r�hSf~R;�ϜE$f�x&����g��R���WrͽSEM���.f�͛0ۗ_��G)�$o	�jg.ǈ�&��T�����I�,s;I��B;����J�}�$7���U�0�K���j��u��1�]�[*H%�U�%^*��%%2�i�-m�?���*�	�nEa���q��T�YK�U�w,�6�с˥9��cƹ� ��4ƴ���+�M�s�K8�j�N�>�q�M����l=����J�`k�X�ea������F��L+�I/��$�ћ� �`:F=���ͯ�k�xI^�(���_o�5UX���c���`���xRL��)Qh�����������3��V�oXʃ�O��rNS��6R-T��ԌS3��o����l��*2�΍Ƥ!�{$ ՘�� >��b��j!1hv}9d9l9�������}��:]��V
���՘��6
3{�G1�+W���^&iE��ᘑ(ȽN݀+S��	�+J���˯���b�&�S�r�ڝ~�:���1͂ .8�Ƒ���)OKLjW��4���y�W�         �  x�eUK�\A[W���]�� 9@6�ܟ�5	���w�-K��G!�b�^~y��_�.�Kb�PLT�>>��y����K�K���!�9Jkuɯ�/ߺ�.��d�`�KD��s��eH�V<��%6c�b��F�X��fb�d�z� ���&`��dD��\"��bsf��$/��4
X���ܡ��9��V�r��
�^̕�P҉�'&�+F���=R+�F0ʺ�D�+�H�!L�M*�y�'�6�&�� 9Εr_�eO�&O�k��Mg�:�j�9��M�%�Xj9U���,@��n�$�tJ�-йu� ��
n�EZ�r��X�9������,��a���s�b)]8?�XۡIij�X5�n�w��� ��<������� v�����	H`\ \z`���n�;��C"�ѩ�B�y�0��0�kߍ�����T6Z�2�4�8eD���\Ý��G�j7�u��8Ú�'��"��0t8f$P�"!�w��H�9��)�D�͚�"��`A����c��jz����<e�Bh�pj�ZO��n�Ѡ(�a�2\�	�d��U�N�씱>x�q��z�Yl4`�1��w�v�����$M�#�=z��7�p'���p�I��d?&Ix'R�SM,ҮP�ػm����<��"u�"���R�,�S��`FP?�Z ��Ü�/֖|G         �	  x��X�nۺ}����-N�7I|k�KڦI�8EЃ�еj)�Ő�md�YCʎcgw�(�.�Y�fƂ}v��5}�/��m\�9I�6��$�b�_��'W��鯶f�S~���[�|�W�w�nO�~h���ѕ'�r�E"�b�e혌e<��I�#�>6��q\߻��[nr"2�YN�"��m_���~un�ʻy�t�6��\���g�l�u߹uɿ�%}������q�M�i��]3��_yA`�L�4R�S�w%��[厽����r|bb���!�υk���U��[W�G�Cs3t�v�w}{�o�jp\	m��m`�G #�Ep_6 �, A۷<�c��8l��^!ӡs+p�oO��e�������9��у
�H�26m; ���$���u�0l�32�&N@�7I��l��m�%	P�tX�G7�zh��=9��*d�!y��xy��6ɨJ�
0��XE	�u�ំǒ0dile�i�:�������W������_!��ȿ�)������,N����\*#c�&�.�%!Q���E)�ʫ��r�
 �d�ּ�*\�,au�w!�_$���#���?!J(��*�k�!-��ܲo�lX�-n�dD�2 t�͋��
D����D+cX�h��[�LE����ۦ]vm�z�T��hZ�s��H �<I�V�2���*Յ������+���'��Ԛ���$K�������o�G�(Hp�N�'����g�!��'҉����=��O�<@��[�t"�I��y��ū�k'0��P3h��p3�-� TiT��PUY�
�'RGB�/(��@��"gFO�D����H=�[Tb��nY��*��U�w\I���c�� �,B�]���-9�������X�ɖ!^��#1�_���a�?4w9��Ϗ�A�O�c�D�H(��-����CUA�>dI��Tǖ����#�ޣ�|Y/}Y��S�d��g#3Є�����ξm�te�� ̘h�]	@�"�T�T�u0��P�f$���v'�����!�^䋼��˪�`��So����x%G�\U�H��{,)ws����{���(Tr�,�����GQ�m��ֺ\���uk�i*��U�r��Ќj�i"�������b
��	i%�
=҅#�p��[.ݪ�A_k��n��7�yfmf�Fծ�QE�h#��ll]5ܝ�v��� ہ�c_�$����l�v�3�J*�[=+w�N���}�n�c�v���Rx��C����&t5���Q;���� �����9��[����닶AB@U��ޚ�4MUIn���x�g�����c���YU��:�Zf�4yW���.E�t���>���Ά�E�_��-Z�ݠH�3�)3��M�������/�AhnHx�vO�	�	��W��:z�.Q(P��.��k��@�I O	��)����e�M�5y
j{U^��ݜ㑐	�Y���r���^UÒ_#ɳ0
�D2c'�P)�}�	�^�l4�2tI��??�B��'m$zC/X�۞܈+!�B�?���.�X��@JJ�)UN�ě1�r\Fݜ���h�E56�̠	�Q��&��Z@�ht�P�y`� �h���L�rH=ѓ��I[Na�
�c��U>o�~�4���%uY ���[�DƮ!�G��h��œ������~�Dc���D(�ʽϻ��x���J��y�z��P#1����� ��T�aݖ�/��j�	��XQ��#0��q;�Ŵ�\o<�+]�.��"����L`W&��6�)��&�ϡ�V[B0�����bŁ:ď���Ҏ��=�~��w��j��I����z�ۭ��H���EZV�K?��37b;���P�����[��I���jx��mE��7ddB�Tƚ�t�)�_�"/������>�_�Jc7����*�`x�P.����݌�d~�Ŀ��h6'6��є�����eh:ʒY��7U��c��GJ0�J��5-{oP&�[��VI�P�@��v�`?]Sn!�����zE��˟g�Q���u{��S(V(aP�����@_~��黶����[��E���E��!7a~��'�]Ƶ[?�����%͸M3	Q�CM8sT����6p���A�s���Vy�Fɱf����k"���o��&,��J�J�ߗ������W����lob�����W�؆f,�%vMc\>^�� ?�P	�����+�b�w�l�/M*�X^�����>	K�璤���@2�a��ڊ>�^�^�J�Z�S����=�z��"{��z1��ݐK���-zUN�?���ߧ��=���m $�9�`�=��q��cr�H�/��X����P������7�n��$�O�4�K6�6�C���Qx���i���u2J�e�H�p�q�����`W�w`��,�q7�g��W% W9��Z���w<��?�e�l2����L���
J��2E�D,���?�Iƍ�8Z��I�@/{� j��4���<]g�     