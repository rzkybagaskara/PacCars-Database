PGDMP     9    6    	            |            PacCars    15.0    15.0                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                        1262    33104    PacCars    DATABASE     �   CREATE DATABASE "PacCars" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';
    DROP DATABASE "PacCars";
                postgres    false            !           0    0    DATABASE "PacCars"    COMMENT     H   COMMENT ON DATABASE "PacCars" IS 'Final Project SQL Pacmann JPP Basic';
                   postgres    false    3360            �            1259    33614    detail_iklan    TABLE       CREATE TABLE public.detail_iklan (
    id_detail integer NOT NULL,
    deskripsi character varying(200) NOT NULL,
    alamat character varying(200) NOT NULL,
    domisili character varying(200) NOT NULL,
    latitude double precision,
    longitude double precision
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
       public         heap    postgres    false            �            1259    33599    pengguna    TABLE     �  CREATE TABLE public.pengguna (
    id_pengguna integer NOT NULL,
    nama character varying(200) NOT NULL,
    notelp character varying(20) NOT NULL,
    email character varying(200) NOT NULL,
    alamat character varying(200) NOT NULL,
    domisili character varying(200) NOT NULL,
    tanggal_bergabung date NOT NULL,
    latitude double precision,
    longitude double precision
);
    DROP TABLE public.pengguna;
       public         heap    postgres    false                      0    33614    detail_iklan 
   TABLE DATA           c   COPY public.detail_iklan (id_detail, deskripsi, alamat, domisili, latitude, longitude) FROM stdin;
    public          postgres    false    216   �!                 0    33655    iklan 
   TABLE DATA              COPY public.iklan (id_iklan, id_detail, id_mobil, id_pengguna, judul, is_bid, id_penawaran, harga, tanggal_dibuat) FROM stdin;
    public          postgres    false    218   �4                 0    33594    mobil 
   TABLE DATA           d   COPY public.mobil (id_mobil, merek, model, jenis, transmisi, tahun, odometer_km, warna) FROM stdin;
    public          postgres    false    214   �<                 0    33642 	   penawaran 
   TABLE DATA           t   COPY public.penawaran (id_penawaran, id_pengguna, harga_penawaran, status_penawaran, tanggal_penawaran) FROM stdin;
    public          postgres    false    217   wB                 0    33599    pengguna 
   TABLE DATA           ~   COPY public.pengguna (id_pengguna, nama, notelp, email, alamat, domisili, tanggal_bergabung, latitude, longitude) FROM stdin;
    public          postgres    false    215   =E       ~           2606    33620    detail_iklan detail_iklan_pkey 
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
       public          postgres    false    215    218    3196                  x��[Yo�H�~&_��&j_�tO���r�Fy�"�L�"J���~���ew,O1�-��[NUxr�N�l����"��˪�feW5Ӌl�w��2|�겙ΊE򥨋&��m��Ͼ�y����h�e�/٨��U�\d��.��qٟ��+2��gɨ��Y"Y.�PN&ܘ�Yi�HE��Y��E9/fEE�Y�x�����
�	�fC\�}3]TMA�����fU�mƴ&�)�	~#�"��k�u�yΕ�:��u9+�ق��&��DD�jR�b�YS��b�Z8�?}ʳ�~�j�S����~�����L9e4J0m��R�\Z#��	�:�{mR�|�Ϫ�g��KĬ<�`���q�g������Ux��?��j^PU��
�Z�)�
�0.����`ZH#�R�������~��q���}��}4������󷫯�8�i]6�j�'�R̫Y|w�~4��ϥ��)j�P�P�6�'ߋI�jR�}�$.���K!Q#�KM2*��V?ˬ�W�:xLo_�YW.��E����Sv5�(�e������|�R�~���#��b����C�}���'R��q�yjC��?k狺Z�2���3�T����ͤB�S���U���j�O���G`|n�U�^d����\3<��c�&�\�FS&���z�D�BW��T�Ag�BgR�����χ<�+�u��o�E䣻�h�er�"CW��Z��/����a��K��0��Emx��sΧ>�Tt�"k�i�7ïMʨ��~ە��M�$���Hg�dL)L�W�cY$�4��An|.�Z��!��9�}��E�_�t梫�����H]��Q�}hg]��m�U�!$i�����(��)�"��A/�%�0-ʥ �imx�yr^~\LiTgŬ��/5���8�&�����_Rz1l�*�FKu�BJc���"�D��u)�D��9�5�Ш��N��پ�o�!'�'�H\�h'82��i�Z"�f��t}�f=�V����n�ͨ���u�\:�+f<�RjeR���W���9*wxϫ�%��k?�g5xhZ��n��X� Hd"K�Ι��s�bis��E�m~B
�W��U�!�<�)��5��S���mxS)0p�Ţ�ks�=c1�[˙U)7�9
O��wT�Įj;@m���g �����Z7.g戆�>����}_�	$ ��	�f�re�Waφ�!w]�U���DI�DK`��"�~�9<_�4$�B@�x( �K̊G?�w$"��b_b.6$�]����g��[�SDAgr��������:�'���@� ���et���M�����i�Ū'0���1%��.A(�	�h�B!$�BUد(�_�B�a���ǁ�O��!���x��z�Y�y�H�Vz���`J�L�b��C,�Otɽ��3B�U��]4q,$��n�DPJz'}ƙ ���r�hF�aB<��W^��}�/�x�v��phO�Ā&�Z��VΤB���#f>�zr������y�2&5�;��!Ȥ���c~�XURo�Rtͪ]eW5z9P
WGs�H[�<1	�\qvI��X����Hh^�3��?����C6F�8B�H��iŀ�j6Gh���G$5"G�GLr���X!������f�ƈL�4 8c�$H-����(���T�7z��ʧ�?�ȿ�Ȭǳq��\e��\hذ�g)P ����Û>�Q{�n����Jp���;�w,�]�5� �@݇��T���" %r;m�
����;"�=���{�\7ŤM<�҂�C��TɆ&���z�Eˆ�,�՚��F�|N�6�����_�@�9v��ݢ)WEg�M��l�0j��5hs���u9�2��Y#��԰gҧ�����ZR�!��{���6��2P%��Z�)XT	'�dA�ȇ</�(Yg�v���gx�R&к�e@��My��/��|�c���O�������MA��%�j���hڹ�o@Ҫ�H�(�\�uk�� çN�� a����ߪE��Z����#}��+�)��m�k�kQ�Bk�r4�8�fbV6?�$�������QMco��,c�_>gNq�OcF�<��p�Pd��O�C/>�+y��8�:��kN���S�H�zm��{��lN..3�K��h$B��2��L��[&-!J���G{��&��8.���v i�P��.�;n!\�9X����;�$���J���.��u;�x�V���H��7aag��\(R	^�T�Ϭ#77%0c��N�WD����jr`�����(�����C�;L͸�7�<`��]�R0���(�,�ȦT���4(G^��UMڮD�舞��C�C�^Q�a� \1�Ok4q"Ȇ0�W0U��]t2��˯+�̂T�W$)���EvW}&,\�+Q��ga9-��C
�$�P�}�]��#@���CՕA�� w����ȁ,w�9�Jr�dx���K�:MJf�+�s4� AH����&��+���,�y1���H���.��:7]�T�/���&����VP���Z"�k@�C�%V�N�m�ˆ�c9)��r�G�_\���B����BDIN�-�M�{{kGX���OE��6�/!L�eLhp�i�~]���,�|�ACNA6J��_��6����x�����v�h�K���m���W('�hCZW�X�j���ޤc�Ͳ�j�/֑n2��+���Z�w��ǃ��@�aE�`���ČC�Ғ�r�ƥ��{w�5c�Y���#Ԍ��ް��d#�ȥĘ�Z�{�|ے	^VCY��2O7���.�>}K"3�8�B�#���l#5����[��V�'�<���\By'A��R4��Ñ�bA�~PY]=l�t:\�ɾV|[��H�u��z8R�"���=z���Sn��){"2�l�HXS(O�7��bB�T��X?�s��{�}^|f�����P3���t�C���K�<�.�Z�Sx�w��K�܎�g=]��x(ޟ0��б�v�����N�h�^�)8���fZг�L��.��]+��,�����h�>Fe��i�=:C+M�����u�Њ+�~���P��;�Bp�I[�l.-wxu��9<��L�b
G1�Ǜ��$T�sE���t�	�D
k���|��L�#����� 
�4-��y���%F�j�2!�5ph�	g�f�,��a{��0�4l$�2<=]�}��� �$�%a����'��aN��o��I)�
 ��aDlj�=�:�B�T�-���8P=�M��]k��h�gmr�A���~a���n����.�SV������t��'�$��'��*х(?�B�P(�	�U
k������ƫ�b�s��|��҈p��l�a�0h��|8^�CD̧ƾ�'nr��������s5V\l�L9��F�$�-hB2#���BXQ���8W�b�=�@���]5:��^���&�f&1$?��.5���΁$#���c������Xoy$:�1�֐�7Dj�y��x4wl��y�;�.&`���-�+c�d��E�3}�LV�@����q��\�fՃ�+Z�y�[(aS+�ވ��/�Y���O�@�^	T�2�I�<�w�^��5�n&(
�k�<M�`�4d�Th�3��R�ų�dz����ϨD@��A���+G��[�s�L���o�R��;P."y��e�b��3_�3Na�5]��tVCk�0�F{�����u������KAk���S�Gx撿���F���y�I���j	��Z���VSM�;b8���$uG�à40���HY����������~��O�w��y/���Xg;$ ���%ݐ$a7��s��\�R�㇪���\�&�.3ܒB�q��J�6OW,���y,��kC�%�l�6�ض�5e\��@�����7��P�𸰑��𙎿Ǒ�p���瘟�͙��YG�u����A�8��5 :u��������5���e�8�#�ϪՊ�#����;]��R��ɳN��)`��U&�cg4FQe�ˆ4�a!��p�@���J��ِ�Vl�So]����h� ��ѓV�$��%�� �  �8���̌ァ!���;�5���^���	�r�T�23���~�FĀ� �R(n�~s�!O�^";�O;Gh~�a�>͠,(���1�p�T	���q�sxq.\�������a��<�d�������I/y����pق&lE����d)��n���m��E�-L��O�Ine>g\p�St��4ZF��灣���1��0�U��n� i`\�>�g�M�zv��;�	�@��"����%{M��Hmi2H �I8ÿ�X�������8�v*����أLH<� �g笡 F�.� ��O���~���p����"P�;]j��ذ���x��Ѽ��e&����+b�хW^��[ȷ���׭��^K'��u�8������67�4 �I�d{� �d��^G�!�D]�ۮ��<�3a����q˽P`$Sl���ܦ޼�CB�v�E؄�,�.��ϙ����u�o}]�w29d��z�9PTC�=��,:��찄�˝�2��F���ڙ�	���0�n�K�{{ӢT��	���>o7��:������=��(Rcds�j�tV�޿����g4�[���>���bgC
��������nי����]O-=q=M�I�B���i��A"���^�?����4��,�q           x�}X�r$�<W}`�W��*� �^Y�Q�V��GKq7�a����~qfz�X1��$�)�%�D���^���O�����/?&�Z��/.�"���k��N�Ǘ�����?O/O�����y~畝��xG�RO���������o�/O?M��s�$mɝ
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
n�EZ�r��X�9������,��a���s�b)]8?�XۡIij�X5�n�w��� ��<������� v�����	H`\ \z`���n�;��C"�ѩ�B�y�0��0�kߍ�����T6Z�2�4�8eD���\Ý��G�j7�u��8Ú�'��"��0t8f$P�"!�w��H�9��)�D�͚�"��`A����c��jz����<e�Bh�pj�ZO��n�Ѡ(�a�2\�	�d��U�N�씱>x�q��z�Yl4`�1��w�v�����$M�#�=z��7�p'���p�I��d?&Ix'R�SM,ҮP�ػm����<��"u�"���R�,�S��`FP?�Z ��Ü�/֖|G         �  x��X[S�H}��yL�C��_��n��R��*/Vla[r��R��Ӓl�����š�V���9�G��6=����S���'\��3>�!h6�O<�~�5�e��}�d�?�Ve�L���_��+�~�'����N�UWO���c.�S�ݤE�T�ĔP"&��^ڨ`^[i�V�b�S=�����Q��To��mz6��/��-�s?w�~{J���S<_����_�v�&U�6i�S��?T�r��G���{��aWi�Z$��e.U.%2��VFhäW�vJX�iv�^�#�U����)m�3(�5y�"��Y�'^i�������g��A���!UG�"-�%�P��	��pk����W8�,��Zo��>dNߎ��ؐ�TZ]H�u�,���12�>��բ����nQ�C��=�R��f�で1���}�׀�P��jٵC�m?햔��_���h6|��׶�����A+Ŭ)�V^�̲��Y�_��W���'r�b�w�B�نx�mR�g�Ŀ��_W�C�����s)rX�@є����Qk�9v��5�n�@@4�qk�e8��Mw)��5?m1*]���%�����%�
/����Mtnz�wVCj��R3e
-J¢*�rF�̳sj�w���}�P�\K�[e{���~�X�ˏ夼KӒߔ�15��ݥ�{�Q�!P�E��çP��et͠f���;�ԑP��Y`��g�^Z��c���16\G|��?P���� �t�S���=�C���&ѣ��UZu�[�g��4-�lLN(��7
ii_D#5�%�?�MKX�_�i��&��GDn�������A/o�9&`2`��<r�	ؔmˤ��N�w%���NY���R�3��+�%�Dh�TC�|¢B�|���!�r*1�S[��jh���m�rD�
��K��z��S!�ա�P�I)����d_����k�v"�V9/9�	���j����u�C�@��BGQ�4j�;)�Ɩd�"xWب�@�|(P�@I(v�M	v�6ec9c�(�����8���������[/���qU��l��QQ�*<t,Z��)<x7d@�EZV�DpG�NK�q\�伏���+�"_��G�j�����e���y���%p�X��q��p��d	5�x	2z�j�3i�u������R��lx�h.U����dduP%#��d��=����]S�8Rh&1JV��Ta\P�x�. �TS���@�N�<B�����p�`��n6?[�{�B�1�}�����f\�"��DO��sP�TEP�g��B� �ɤu�1�i٬��O�8�|=	�g�>�¯�֧�v;e����;� 8�o*��(!������H�s����N�O�f���r�)2�LN��m����f8#^��]6��hv�)�Ժ�-��¡�;��	�'`�{��.�|dh�j���ٽJ�)��
����Xz�^�Ǘ"�4�h5:+c�U`��>w���X�[q	
F,X�� ,[Љ�p`�^�8��y����t_n��⥟��"F7���B��?[�f2%��f���}�a�w/�Ńm@��E�ݞ���|ħ�JP�+�X�[�_��;.#1���Ч�T!��p#����:�)���7���=٤9���U�Go,����9�W�O�9Ƣ\� �vӂ$ݚ�$8a"F����Ϣ�{���x�|�������`���-@ ΄�:�E��P���t�U;�Ik(,$���GXԅ���$�2ہ304�GF4[���)��/x }�6ثhT@���zwbO�/`��}�s� `�/�ݼ#~�+����|Y���ɍU`X4��<�t����Ϋ4Y��J�U+Mn-l��������E�[�M˶S��n�M��H���r��GP�o�a�SJbuc҂[�!3��9@��K\K>��$]{N�݁���Ck��xp��ē�	T0cG�9���;��;kt�VH8,�l'C��͔cg����e�p*`�*
�����%��nAӾ@_c6�`|��c�I�%�C(}���`+����S�W�a/�$�1�N��gz9j=��#���a΢z��(�u�џӍ��r���`.`���u
�Z���4�.�˥�x���lRZ��G���pM
d����.+&`mg7���0������hi�cyۈ~F<��ǀ#���*��C I	lڇVc���\�X��/Q�����=�8���hZ#�8	���Z�ZaӃ��Vkxn��e�wU��O�y䔆
:G��=F+(6�O͞�*���)�+i���$m�6t��>pb�a��h7�����LKv<��4�8��k0ֈU�O�۠di8��9L��ZA���ڑ��K���u��,Vrv� u�#c�L6N�4Q҈� 5˴b��?1���ԯ4GIke�#���Ի#KhM���	���܋+Mw0���Q���K�<�]BgZU GZ	u����mPX	A��{���Jm�V�c?��X��n;��ngN0���B
��Xϣ��|�}H������k�G�{�Ds���#k��������� ��c�-�z0�[H�.���2�%'�*�:~��mp5�Iȍ���7cEx6D�Y���K��7Y�v��;h����[>_ei�bSXki�"��t)�iǮ�5����5��;&9�@���<��=�9��;��e�Y5������!|W�D��MZU����%@ZR�z0NÕcÿ=%ad��P��59��V��(�l�g�V(̸b;���fC�����,8��^��
�D3�)���GH>2�w�����Z���?�Z�X!�X9����`{���7���Va��WY�ޝn6�������0� �'�]nÍz��u8�������]��&�n~��t�z�^To��E@<<��[ᵢ[ZAn�"������ �GI���H~�,��L�,��1WtBZ5-�g���ka��2|�d~Y��(�,�$��i     