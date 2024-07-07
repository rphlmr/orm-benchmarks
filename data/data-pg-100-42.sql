PGDMP     3    0                |        	   benchmark    13.0    14.11 (Homebrew) ,    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    275698 	   benchmark    DATABASE     ^   CREATE DATABASE benchmark WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE benchmark;
                nikolasburk    false            �            1259    281809    Address    TABLE     �   CREATE TABLE public."Address" (
    id integer NOT NULL,
    street text,
    city text,
    "postalCode" text,
    country text,
    "customerId" integer NOT NULL
);
    DROP TABLE public."Address";
       public         heap    nikolasburk    false            �            1259    281815    Address_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Address_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Address_id_seq";
       public          nikolasburk    false    200            �           0    0    Address_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Address_id_seq" OWNED BY public."Address".id;
          public          nikolasburk    false    201            �            1259    281817    Customer    TABLE     �   CREATE TABLE public."Customer" (
    id integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    name text,
    email text NOT NULL,
    "isActive" boolean DEFAULT false NOT NULL
);
    DROP TABLE public."Customer";
       public         heap    nikolasburk    false            �            1259    281825    Customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Customer_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Customer_id_seq";
       public          nikolasburk    false    202            �           0    0    Customer_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Customer_id_seq" OWNED BY public."Customer".id;
          public          nikolasburk    false    203            �            1259    281827    Order    TABLE     �   CREATE TABLE public."Order" (
    id integer NOT NULL,
    date timestamp(3) without time zone NOT NULL,
    "totalAmount" double precision NOT NULL,
    "customerId" integer NOT NULL
);
    DROP TABLE public."Order";
       public         heap    nikolasburk    false            �            1259    281830    Order_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Order_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Order_id_seq";
       public          nikolasburk    false    204            �           0    0    Order_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Order_id_seq" OWNED BY public."Order".id;
          public          nikolasburk    false    205            �            1259    281832    Product    TABLE     �   CREATE TABLE public."Product" (
    id integer NOT NULL,
    name text NOT NULL,
    price double precision NOT NULL,
    quantity integer NOT NULL,
    description text
);
    DROP TABLE public."Product";
       public         heap    nikolasburk    false            �            1259    281838    Product_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Product_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Product_id_seq";
       public          nikolasburk    false    206            �           0    0    Product_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Product_id_seq" OWNED BY public."Product".id;
          public          nikolasburk    false    207            �            1259    281840    _OrderProducts    TABLE     ]   CREATE TABLE public."_OrderProducts" (
    "A" integer NOT NULL,
    "B" integer NOT NULL
);
 $   DROP TABLE public."_OrderProducts";
       public         heap    nikolasburk    false            �            1259    281843    _prisma_migrations    TABLE     �  CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public._prisma_migrations;
       public         heap    nikolasburk    false            K           2604    281851 
   Address id    DEFAULT     l   ALTER TABLE ONLY public."Address" ALTER COLUMN id SET DEFAULT nextval('public."Address_id_seq"'::regclass);
 ;   ALTER TABLE public."Address" ALTER COLUMN id DROP DEFAULT;
       public          nikolasburk    false    201    200            N           2604    281852    Customer id    DEFAULT     n   ALTER TABLE ONLY public."Customer" ALTER COLUMN id SET DEFAULT nextval('public."Customer_id_seq"'::regclass);
 <   ALTER TABLE public."Customer" ALTER COLUMN id DROP DEFAULT;
       public          nikolasburk    false    203    202            O           2604    281853    Order id    DEFAULT     h   ALTER TABLE ONLY public."Order" ALTER COLUMN id SET DEFAULT nextval('public."Order_id_seq"'::regclass);
 9   ALTER TABLE public."Order" ALTER COLUMN id DROP DEFAULT;
       public          nikolasburk    false    205    204            P           2604    281854 
   Product id    DEFAULT     l   ALTER TABLE ONLY public."Product" ALTER COLUMN id SET DEFAULT nextval('public."Product_id_seq"'::regclass);
 ;   ALTER TABLE public."Product" ALTER COLUMN id DROP DEFAULT;
       public          nikolasburk    false    207    206            �          0    281809    Address 
   TABLE DATA           Z   COPY public."Address" (id, street, city, "postalCode", country, "customerId") FROM stdin;
    public          nikolasburk    false    200   �2       �          0    281817    Customer 
   TABLE DATA           N   COPY public."Customer" (id, "createdAt", name, email, "isActive") FROM stdin;
    public          nikolasburk    false    202   J@       �          0    281827    Order 
   TABLE DATA           H   COPY public."Order" (id, date, "totalAmount", "customerId") FROM stdin;
    public          nikolasburk    false    204   �J       �          0    281832    Product 
   TABLE DATA           K   COPY public."Product" (id, name, price, quantity, description) FROM stdin;
    public          nikolasburk    false    206   �~       �          0    281840    _OrderProducts 
   TABLE DATA           4   COPY public."_OrderProducts" ("A", "B") FROM stdin;
    public          nikolasburk    false    208   u�       �          0    281843    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public          nikolasburk    false    209   ��       �           0    0    Address_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Address_id_seq"', 100, true);
          public          nikolasburk    false    201            �           0    0    Customer_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Customer_id_seq"', 100, true);
          public          nikolasburk    false    203            �           0    0    Order_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Order_id_seq"', 1000, true);
          public          nikolasburk    false    205            �           0    0    Product_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Product_id_seq"', 100, true);
          public          nikolasburk    false    207            U           2606    281856    Address Address_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Address"
    ADD CONSTRAINT "Address_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Address" DROP CONSTRAINT "Address_pkey";
       public            nikolasburk    false    200            W           2606    281858    Customer Customer_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Customer"
    ADD CONSTRAINT "Customer_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Customer" DROP CONSTRAINT "Customer_pkey";
       public            nikolasburk    false    202            Y           2606    281860    Order Order_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Order" DROP CONSTRAINT "Order_pkey";
       public            nikolasburk    false    204            [           2606    281862    Product Product_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Product" DROP CONSTRAINT "Product_pkey";
       public            nikolasburk    false    206            _           2606    281864 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public            nikolasburk    false    209            S           1259    281865    Address_customerId_key    INDEX     ]   CREATE UNIQUE INDEX "Address_customerId_key" ON public."Address" USING btree ("customerId");
 ,   DROP INDEX public."Address_customerId_key";
       public            nikolasburk    false    200            \           1259    281866    _OrderProducts_AB_unique    INDEX     b   CREATE UNIQUE INDEX "_OrderProducts_AB_unique" ON public."_OrderProducts" USING btree ("A", "B");
 .   DROP INDEX public."_OrderProducts_AB_unique";
       public            nikolasburk    false    208    208            ]           1259    281867    _OrderProducts_B_index    INDEX     T   CREATE INDEX "_OrderProducts_B_index" ON public."_OrderProducts" USING btree ("B");
 ,   DROP INDEX public."_OrderProducts_B_index";
       public            nikolasburk    false    208            `           2606    281868    Address Address_customerId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Address"
    ADD CONSTRAINT "Address_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES public."Customer"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public."Address" DROP CONSTRAINT "Address_customerId_fkey";
       public          nikolasburk    false    3159    202    200            a           2606    281873    Order Order_customerId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES public."Customer"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public."Order" DROP CONSTRAINT "Order_customerId_fkey";
       public          nikolasburk    false    204    3159    202            b           2606    281878 $   _OrderProducts _OrderProducts_A_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."_OrderProducts"
    ADD CONSTRAINT "_OrderProducts_A_fkey" FOREIGN KEY ("A") REFERENCES public."Order"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public."_OrderProducts" DROP CONSTRAINT "_OrderProducts_A_fkey";
       public          nikolasburk    false    3161    204    208            c           2606    281883 $   _OrderProducts _OrderProducts_B_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."_OrderProducts"
    ADD CONSTRAINT "_OrderProducts_B_fkey" FOREIGN KEY ("B") REFERENCES public."Product"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public."_OrderProducts" DROP CONSTRAINT "_OrderProducts_B_fkey";
       public          nikolasburk    false    3163    206    208            �   C  x��XMs�<��Ǥ*L �u�5{������T�r�%�bD
H�+���%�n�r��ScY �G��~�k��!<Ǿ�Տ�oG���q7]��^���0����y��o�_�բOcd�S�6��o�gF�F���v�ݿ�I��WN��6�:�b9��K���i����N3����8������o�2����!�W_S����a�a��ndJx��2t�T݇<uk�FF��!��������-�K�k��E��}8�]`�fl������>L�K�r�&fZ�����1�-�F��2�]��,wݴy����������1�uu�=�i��v�_�K�ix}�)m��ޙZ(��C��g^
[}	���K+��*�S�=��:�v�0�"�\4�����a���\���j��ګV�_�?�L4\f�^�t��
�T�~�rxN91�A�F7�.>��
'8��j��������Ql�v����m\#j�jþ������Fr����TW��䏮�v��K����غm�f�9a�X-�����[|��&�Ł�R����-߻�#����̈́Q�ZV�\N9Ɖ� x��0n���|ȯ�
c�6�ё	�v��c�M~P�����4G���{��]u�-�4\X�T�j׀���!#=*��kZ��g|�r��JT��ag�-�
շ0���Y�˱��k̀�p\x4��j[���C���֭�#��엏��F��	�eäo�G	�Uꇹg��E���'��;W�P�iK	eå(�]!��\�G�qƹ��� I�xȬV�I��$��j�	�����ŰE���y�1B�d�^0���c �T��1T�u��"��qx����h ��>ۚ�˫Mu���q��S�M#Jo5[l�!0�r L	����-&�2w�W��.�㌫Fi ���'�u�Iͥ�T6��c��.U7��s�����u�\�.2�Z.-S����8�7�c�s��2N�Ւ����-�:ȡ<0�zvS�]��\�HZA)H��+�hF��[�p�yJ�����Li\}����2`�	l4����&�|�{P��\5L;K�=�y�>P.�D4
��9��(][��\�� n8(���:�e�yĄ��\Q3�5��a�a�A�hW��]C�WE� ���0��jUkk�j	M!��n =�RXM�m<�ʋ�	=/��C��/�i80��T<�ܜS<W��#*�-�E����0���aS]a�&���>��m�M�6]������jK���V($Q����C�ھ D �����B)��%h&�:��b����="= k��	eK�Z����VY�g�p��\9�U�I9f��q����J�C�b2���<��?�4���O�~����k�[3��m�k��,���C0���L�j`j���au��61�`"Ё8�B�x���[Cנ\-��yBo��3��;�i�/�Z⯟l�J�*f=L��
��2S�-(���1��0_����4�c71�5�S^����KB�lD�yK@rշ�Ӻz�{�-��oC��N�����i94X!��1>�U@]1����>�Ȧ6������rZs^X]��W<p�� �K�'��qX���.`s��$ᆣ�z�%�U)R�����RM���4�HN��U��Ӷh�ΩZ�3�6����o�ӹ�p-4z��@!Z�[Ϭ��� �o?Ǭ�_�2B
$zyȰ p\aD���n���fa$w��o��~��D�i���E��)�����@D.v�<�A7\��#��]�_l���i�Z��/2l\��F�o�����vH}?�N�G !�����D쟖PK�!]�hR�#�حT�G@��E�	�Y�8f�X��2����Y�6){��sZ�R���a���V��[e�<��3�|�uէn�3��$���E�3��Sv�������1���r���aV�Fy�� ����pm�X�R�]&M~y[�y�A@�i��E8��!іk�{�c�;h����:�
v�I$,�j�eK����dr @>�Zn�4#�M��I��U|Z�1e�*�����k�d�g¼�C>�s	ɇ�G�3��L�1/«2�[��"�#�x$|�ۤmd��Vi��r#���~&k7d��%��.�㶫Ȣ�R���+�
�,.�%I�`q�䰠։���]J�S_N��`;��m�8t~�UO�X��`��?�o�js�_hZn@H����X?��@&$��k�JXW�@�#��%��	�����X�����?×	�@�����qS�bH#~^��9V��{EU/`ްO����7�*��,u+n8���p1(ߪ�y8 $<FrQ��R;��jy\!��.�1��bt�rE�r��q�`�R�z�����!�L(r}� 8۰����=����s{\�62�Ժ+7�(���d?���m����T�|��  �m�4���Q��F��V���r��Ԣ��K�_@��Fy��,�|ϭB�4��&�����iZ��rFb�3 m������1a�`&�35��h����u�*,�ס8$�rK�6.�����B+V��U�F�e.C��`������1�1�9Z�zegs\��WToJ��<w�b��dí�~tú��ix���pw���r�\��JP�c��B�c�a��y���m�����X�-�M7�!���//݊:�I�=�����+��[������	���}
�P=��Кoi<����7B(�a�a�]Ý�u�daV�9��U���',��<���ʒ��hƈ2hz$� ;H
���%O;���)�U���1`T!~�@a-�Ѓ�;�z=37����d?����`�F�7������J'�������-�˳��#%͢��n�	.��R��8 GP���[@���aٚW"싑]�ϨԬ�-����H�ʜ�0Z���zb!9�P��ַ�?�r(��
���>���Wﴀ�!�hj�����v�qT���>�����C(;:��	GT�{�!
*�<s�W=�BɊ�h ��]��[�N2��{蝂˹ϙ���8;�Kl���Yo���ߚ��kس�k��^No�~t�3�O`�Ԁ�HQ
�{EÀCW�-�ɗ�x�a�Ld�& �+۬WܓKªT,�H#6_����/Y�R���Ge�/�|���d�y�09�� �� P���dx�=���"�6�?Y�ex�pF)	�xQ�s�wW���m����z*�<�'�v:�O7��"y	��[�$�_h���,�*o��C��F;�u!�(���-���~fp8P��zAƂ�ƃ�
�M6�?ILy�������W c�8C/̭7�*b�qųϛ&|�x��AMS8(��՝_.5���9��Pp�h      �   ~
  x�u�[o�8���_��}�`�y_�N�ؙ,`0m��%ţ��=��;��4�F�)V}u�;�p�ף��8�-��� Gdƌ�R�M�e��7�T��3o��#�fW�~����Nפ��B�YaL�0Sj���p��J��Ӟ���$ٷC�W�x� �s�MC7�����O�k�+-�Ɔ*y̌h�8��g��_��b�yYAV�i%�+^V�i��V����(�Wڰ`�p�J�����+br����m�#��eEVZ���2�p5.��b�1�(Ï>��N��ш����d~ �e���Q!Y����V8S�0tҜ�����<0C��K2׵P�n����!�g;�F�l�/Y����'!y��H���,���/��إ����L:&s����d-`{�'�\b<���{��i�'�InAXs���i����<���ԆNu�jav]����S�gZ).e�P����E���m��ww䁩��`��BF����#\N04��V2�9��*x��X3~o��Oj��߳���kRۦ^�7.�S�*��k�	-�1y���B��$�]�x�q��]M��Z�ֹ	�Z��;qz� ��"7?�E<&+��a����RϺf�Zz��%�n�؞���v�Z���Q���톩�6�8~r��h+�z��{�QB9�/Z�;�Z_O�U�KL臸�H�`�t	��OF�8�wM+T�;�9T�҉:v��!@�l��U���:%
����?f���n�ps=�Ѡ��|�Ƶ3X6'T6����ױ�b�H�4��ty�2��z�x�{G�I0���XK��;��`��b�;��Ї1	�Z�=y8i��p�_�AM�i�r"�ጓ��Lލ���E�h�՜,+&Ei��Fҵro��G�	Yw���k�i�%G�>��i��򢭐�Ot�_����8>�q@��{d��v���P�&:/��ԇ/N�p��ט��R��H@3��ԩI�w/c���;
[��w̿�b���A+F~�2F�l	1�����������o����C^��ӻ���ߌTQ8���r��`өā��2s��φw�~���Q��F�Za$�R~M#n�b0׽�ê��c2�*��/7���6��|��<·���9�3�	��w��ώ������60��9.";�z�4\�A�ǜ�n�`�����o\l�1L�x��T��!3)�V��+�ME�m�� 
�3<�'4͎���F���ۛn�/\�=b?�!�{ɡw0J�x���!x6��~>ä 7R���K�H�}W�ۅx�	���e��K���@��F��"�~�<%OB~��@�H���a���b��o���v��H�ؕ�؏b�d�Ǌ�;�%y�f�O�$�	6��z��� �/�(4Ԟ�PxWk��vf���9W��A���F�U?�8v#jg>Yh�ɤ�Z9qJ��Fp$s{BCo{�0�����$~>�4��h��m����0���/1\@��F���ʎ,z�+��<`Y:�p�G5*.�2?�C�R0Vrr۝�F�~Of�G5AɱBm�7�V�X�`��v�i���#�&=�T��q4rRլLrG�?�1f���Ų���C����nA�<��$�7�]c+T�̈́��8���1�d��R^6]�]wX��M	-�=�Oi�Y�!^`��a'�#S��8�b���}-���9���@�
^�y��p��Ԧ~Z�4�0X��O��>��ϷK���?9���`Ξ	G�AXc1�����N��ߙd=��x0X]!BءQ�`���&*��7��
�q�i�9BNX��]��;Q�5AW��W�>�E�.c��y��L�R�S���l��[J��	�>�|E,:\F��;�S?�	Lê	�hE)���#�~[��LC��ո�;��䗈v�5lHآ%��H��ɒ��0�~t�ʽ.�;��Y���xw�~{��yMGYZ��OWf���N ����<b|}�K�G&��)�}i��!?��L�n<t#����y�L�-�]e偝 ߎ+�&�������WV�^�ȿ?`M 
� �����aI����mYE�;4��N�$�5��h(��!N`����V����	�?�S�G
�@~L�<��T��^^m$"�1�u�N��OG��w��R�:����t
��vsb]Vz��!?�s����i��L:c�O2�ܯj0X�W��Qj�:����V�pd�~Qx�ӟv��*;�;'7h^h��G��N>r?���B}jjG�����B�A�.���v%��P��]r3��4�=���A�.�M �l�g��h�]z0a��;�]C\��s��4�ǹ����9��-D�慽�Å���R���u?�s��eH1��v%�yC��Lupٮ�Ϧ~^s�������ڲ;�~N���d�D�t��[(b�K����Ok��f~^H����뭿�Z�A�a�n�82��e����w�����g�=��xSA-���>�b6�c6<X̃�6'��~E� S���1��u������#@��#�E~^sx0�T��n�4^/�7�(!Ϳ���I�o�^�A�ί!���uɰ�U���
?�y~ޜ?���������H�����Ď]֒�YH������}U,���l_�G��`���vf���2��v�� �Ϭ��ԗ�~�È�������?����֐�S      �      x�e�i�+;�lۣ8���f���8WP�����@�8vfJI�2�R����2�����_O�R���������4�K�_J������Z]�{=�����������'��*��۹~���s���^#����/��������r��ǽ~������ɞko�}������������j?�����\���ך/�W�~߿˧�/׿����Լ^sq����������I�?� �B�/- ��S�z�j�{�rW�ف�G��oe �,a��m�����O���=��"�!�����>��A�	@�=�=C�v}ۧϲ?�����a����l��~��-���5դ+$��${6����}�Y��m�>�W��w'�mY���3�i�P�}Q�Ufm�/��]򽀽I[A�+�3m_�]�f���"�'���lԻԟ �IH�_����k�0�]I�Wm+`����� ��T
���J��a��������R>����z��{Oe��.?{�#�້�M,�G�4{O�5k��&��JE�{���&U[D3@�h�����85{ڦ�w��`wh��&l}�W{�r�Q�F�����{�z����Λ�ޮ8Dɞ�\N&�>������Siy���Z0~/�,IJ���������w�PCº>��t�Z�=Ԝɪ39?��g~��@u}�H���6Z2@K�;d{QEGr}ֶ'(\��{^2k����MD����n�A�fG&�O���L����-�VP�m���4���}Ȍb�7�,d;3��hGҶ��?�Pu��h{H[����|�0��N�Ŷ�^e�+��U����_)�[�g�����۰0����u���{O��f�U�)Ӯ����;��+�v�&r0^�ݯ4&��Z��^��)/���<�h�z���� �S�#�Z�O�3��+��� ����'��1�@�k��S�~m{��w�e�L��:��6� �0����G�+�K����Wut�j6c�iw�+�荆��f��^ډ��xH;1��>�_�P���zI^�I��(�����8�f��Ec�M��+�['�r"L�۶�1q1��FV�P��Q�Lm �P�%K���	{6k�k��ġ9�=ںŕFlu� �-R�V w#kf�K���6�0�3�V�d�LC۩�ve��z�H��a�Fh��{��:��Ɏ�`�� �X��r*M�l;t&/�;i/Ӕ��\3v��t�k���!���X�b���C���a��*'�yOݖ�-�>5�,X��Vi�dvh��b(�s���5��L�ȁ8,Sq����)cj*���L{Wګ�ʿW�e�
�է���v*�{]��s%�#�O7C��d (H����|P�hQ7�NW���a�d�W�����֍ϴ�ַn1�oh��Va�6��[�+q�u�VVa/�l��NN,�mTj�aZg'-3줔��`[�4��i����|����ٺ��a#3nQ��U�6r�ߥ�.w]���&��˴�냛z�
^���� �wxQr�m+��ٺq���U�&��7](\=Y�\��ȟ��R�9��v�¬r5�hǎ��HW7!f�����v��p�*�7@N�W�/	�"���@�}'���2:�d�8�W_Z�co�KY�Iޭ aS�b0�h�״	J{��鰓�m���ȵ>��f�^���Q��ͻ�����Wm�Q��*<m���W<>;g�\��΂)-s=�zص��{?E�ť��|�����M<`�(�Ik�5��#I�Z�'��;�y���%E+��t��F���X�%�؂r0�*�7nL��W��ڿW�R ���
'�i�����ݳ�Sp��\�5�6=�X�d�@����"2�b�c��<���;�veɥQ������E�f.6����6�ib9� ��v��5��6�9���)�̓I��~t�\�^-4R?���v�K%|.G<��"�����J�	q�\l{��~�L��4��΃(1%�w_��5�d�$ߴ�/"J���W�>���$��t[��mY��޹^K�k2]�MvGeT���Ux;�D�Z��`��0�Df���#m@���2�!6�����
d�s*O�,���f�V>�r�u�I[���iˁ�߂��ݟ3��4��g�A�J֊,��s�vcvN�Be�����W��&��%.^b7HH�T��S�m��&)$ !x�.�S<�H�ϢWd���g$g]�~�E�"[��E�ϼ�C�B�,AK#��9wsQ�Y��J+���(
���^M�l�:�}U����e_s�xϊ�8!����Q�R_v#�:�0��Aգ�̍*[��m�	r�-iB9��e��� AZ��1�!�惑��n.!1wa����	���=䱙�"������
��Σ�߂�IPB�C�n�8�ܰǏ��=�Ϛ�ӒU��"���}��۬���T�qn��O�|����|})�} !�����@sB�};d˨n�E��	W�o�����aL������J�e�n�+��f�@��[��y����(vO�YP�8%@n
�$ݞ	�;f� 3��ɢ��I��r���'�֙m����A�#nv���fvd��E�(r��M��f�*WQg'����W�2���9�|�0ۂp���ʈ��$8i�O5��l���;ey���x���h�nD��pM���ʕ6w)@M��!VH��r��;Fbɏ�:���K3�b"��;��J��j;f	�N��$J�:�9b��i�T�mgh�[7�.HH�z�hbC\P�C��z����׳8��� A+h㚬|3Uws�#S�;e|�z}�d���q�'T>� ��t��g�eC��g�v�7���n% �=O��������L�5�� 5�V�g^��J��ܮ�?�3	nu�ոI񅲈֙ݔ�7H�o�
��b뭊�1A�Q�tR	��~J�l�Ҥ���,WpS?�66Ģ!=II!��|':w���/�\C�+r�<���X�y�A��z��v
�<��U������5����t��T:.�
*�HȬfE�2��tl�^%���2��>��$Wj�4�Ee��읐'�j���{>}�&!H�X%û���~����qIBi'�`rR���t�+�7H@�Y
Օ��8��P�Kl���-�e*��_x�B��z�12jLs����z��S^�"��j�r��QvӀX;��x����?�^���x�@B-Ey6r}&�f�@�bJR"�e6�mRB�U�l^Uzy�Z�\������-��J�*SAje��Lô�!��նIǪMj;�r]0P�V���( ��CՂP_[%�? W�f%{U���e?���wj�I�b�4� �;9q1ef%�	.X9|�5WH��֫aY	�f��~�z�g����R� x��\'��y7!�BX�3fOC���D��t�[v{)�f���jk�w���$2���W[p���{Ė�$�x���GY�M��J��f���>jĭ�9A�)���h!pP:���O2��/�W��IQ��nBx����/*S��;)`�B%Q !E�)�.���CA���+T幐I6��G�/�B-�,�V`�@ܭ���*�mVI&����M��x�2&H������1$"���9��ҺD
��<��t����c.B���7����$�I`����ʩǷ���I��	�X��Q1��up9I�ɡ1����������0�*�wn����G���hH �w��hs�>7�s�C��t��6�3��k��2��|��r`C~FR=���$�S�r��v�������5��n?�@Bl��z�������>�؎�6���b��xPY�|�d��	;[d����l�v��=�0x��B23u�,(l�����{W� ��vy�@��Es��nVDF8EZ� ��7�FPl9v��.�z���E
�;>8��!�n۔+�2°_h{ ����G�|��	AB�AN����Z8 .A�)5��xX�O9O;#$K�(�=��i��~�'T���v�Vop�<���� +�Þ�%WE�ĺ��u^�TS�_[�6HPYI�駽�6�H�ZgE$Jn��"� 7'��{�^���s�@�XԞ�`N�$���*g4M*��$�I9 |H2�\ז@�����Q    ȁ%� f�K���mU�AH���m_QȈ�<ڢ�g�B��]B@F��U�5g��2K �ݝ�iW�ئ����U.S�|��3�41��鐐k
�{��� 㾀$RF����8��mȋ\������l+����VJ�\���Ny�Uɩb�a��`��n��	�<�b1mN�E�������t���U�7e��Qb��\0y�M�Q2���r�.I~\s���| �Op�\�[$�F
_��R$�t��娷�,!�WO�T;�T@��v	���R�A�Vꩨ��#OFV� �Z+�/���u6'�~!�XdC�%�7u�b�[��ii�%'��b�]��u�o*����ԗ�ܸ,�S�V��^|�@�����b;���[�L�h:��(tHAB�qH����1��\%"�>g���x�,�j�,����(%Y�F��LT;�����
r7��S"�P&9������%��Ra�	U�ob�gC�`Ҕ�Ћ���M�5 z|�8���m;������A�'y����ӆ,�RH%&.ʅ�� �!�Ґ��ȣ�tnt]�<���6�F5WH�n�qJ�	��R�_�W2���FZ���ް��&x1/���3�lgA��V�c���E��Ƀ �w��D;��uH.�~�_L�&�%��F�Pxо4���A,�r3�4ui���0˹э͒*�U���"�rHp�$�U����<˷f�������FU�B��;iy���vەa�r�J �=�C7�tA<*�EԔZ�]�	�z��&Yu�鐫n,i�A&ǹQ������ڮ9@\/�|�RjɌ����$�"+�k�A��y�[�L
�0�K��9� 18���(3�ߧ�����%�B~DL��x���Uy�陖�L� ����(��8��7�EX ��j�(.G��
�
[T%��@����l�O��X$�kT�'C�>�R_�!��[1F&���ri�^�,Nm�辠_p����evP��	�q�9��ef��Jf�LY�%�4�A�=�c��Lr�u�5V̜�6q�P���K�Et${A�܄ւ����&��>uw���M")���*ӈ� ϢN��g9��<�'e��r���,�A),�2��0��wn�z�V��ߤ�^S]	����.�x��,� !�(���hFĎ�L�*7��2Q�K}`D���hϜ��)���!7��v^��Ϣ�xAr˗���ݠ~"Dh[��l����!�x5D���r�ur�&�F�,s�Y9^����d۩ց���Up�t�Y%>����KV�t��tD�<��A��(u4Ӂ��Ngc!=n�	x 7����*B��>m�(���^�WC/� ��<p[�� � ��-7קJ����C�Q�P�
t��Q������� 41v`(4�h�pn� ��PuT�"�ݞE���U�"��BuR�@nY�m&<��&����B)�S��eRK�E��fyj$~�g�}�8$3?�*7���� �Q`_�#̢d�����r����[������e�_:A�3H~�gt�	@;��#�B!5����j1��ꈐg��e~�شy�K�i&PL�B}	�:
�jw�~KU��&������êK� �v-�M�Xi��,הe�j�d}�Yr��mQa�N��W��b���ԗ�!|@ʻ�[�F%�ޢA��t��*} �[��
�"�搐�Ս�q�� ��	��o�����h��Un�{ SN�A���m�6Um��� �����D*�s
Qn�����%Oh�mfN���)��%>!���V���'��܄i��y0��#"_��ጀhq���A�v(�yAn9��|�l.�SL�1���@��IKU�� �$��D��y�P|؇�lWٶ8n��VC5'@`3���_��K�[�h���9|��NjN)��d6[{��ab*bg��6� טe7��!.L��*\��kj��&(�	�+�^V�]��b�Y��sz�j�r��@��	�W�+���YQ����Xg��L��z�R���0���	҂�:��⃠9_��Z�=�!hW�	���M�)r��ƲrƂ�d�2���}���+	���g?�����+`�]��x��p�4�d?в��\ �7�n\C�F�}��V���n8�߫���Δ��H�/��ء%���i��7��	;�*E�g��6x����i�afwģ��	eb&S�$�:�C��7� �$$���(H�����*���(*���u��*o]m���9���.�rKe�%�+��SŰ}�^_ϗ�x:���-%He�we� HQI�5�w�a�2�&O�!`v1�@j|AD�*�c��	"�?�[���'��\0Q��ZLn����E�p�8$:'�CB�w�.X��l��� W#�,P>�L��� �+�t��g�S�y�ş��8���,H�$QWLS���8k;��m�Fvή"�E�	���ۜM���
�>��I�GW�`�qt��H�ᤁx$�H���x�$�#�!��<�6��� �]��֓Cv�?��,4b ��(�4�A�� 7r8dz�?ݞ�#���~Q���Zp�vL7��m��Jj���L� W#��M�9�t�r�	e}S�n�դ�n!*��4���Q� �)�նY�����m��ˁ�&�.΅�v^�t��%����S�!$$���D�LAߔ^ފb��={�-��ƥ,eRc��br	��d�D��br� ��y=l�����7�j�
�I���UFsH��
���P���>�;��@o9A��)޸݈�ﻢ��H��1Mv��t}��O�i�E�-9"D��At���󻧫m�S^�	���h���k��~d���^�����a��9�QH������Γ\��^���tBA�b+vN3� 71?����Vvȓ�Q���'%@ ��,��.5k V�s���;[���T�B�AJ<�"a��*��r�ۢ������{ �ڜN2ǔO�q�rȭ�#�	n)M�+�P�T}#���՟/��"qa�Քϣ��t8��j`	�5��h�5�:�^�̜)�ܓ�����?Jɿ�9mX�Q7q�� �ֽ"���x�B��{]�*Y��� A��P�us;E�(��뽢I�B
�N����@pH��
H j��bFi�:�t�ոne��� ���TF�*C�	5���1�r����r�~�"%��Fd*yR��w��7D�O��@���uAB5r��^�Ux�:���ճ�O�\���ZL��!W���J`��#,0
�lw��
N��F�=a]�Cn��I��DR�S*ȃ��d�c@�e��~�-���!�+2�""�p
0�����zn6ć�3^AB�8�p��
�e��
���@�$�����X$��j�F�6�%ѧ��~����,jl'ʧWD����\�"�,fqȣy�%�ްg�9҃؊��5b��
��������� �g��	��N��E���T���}�iM;� �Q�P��01�UB�N�?�(ߎ� ���Ӝ���k��(����}�jV������+ڕ�s�T��	~�0��ʕ�1�
�-�J]8�qQ�������#!�	}�6�8"�����/�ag�m����GL]a�=%���mn%��3gŢ2\c����#��x�g5�O�V�2��k}A�:Ǉ����&���X���~�~ ���h�H�6�{�ˊSu#x�t����ـ�9p��C���ֱ��ݞ� t�*�&�n�8JX�w��M�bCCd�B>W�%�P���t��B��a�;m��q.t�h*P@� �r��9�,���i;�\�����D֦�����}�\���'ouk��A܈���8����R�
n���K	�$��ށ�X��� �W��\7�JB��\R�H�i&���}B5G�R�W�i��	Ԅuڬr�l�m3��9.��][�B	������.�M�%լ����~R�@j<d��.g��J��$�C|��ܼ*!�5d��oR��QӘ$p���ۏ�*	��K|��VAc�~���7����u
VVg�-�@?�G�-;��h�4���[*�N�<N��E��)$nU�Q���_���A�AX4g�>��<5�����	n��&o    ���w�g,��.&��#�PB��4���\��<AB'IQ��8�a�gX������Е���s��"���-�<����dpGHU�Qx�P*�"���g�!%�9^],w�P� !s+6�⏏c�E��J�'�L��e��A���D��uWG� a�NPW���Sr}[���4Ɂ�|�~��L8��̭DVR����W�&���Q5�t&U�����G	*��yɜ�����έ��J�Ԩ(Ř5 ��죐�r��7w��K�]J���Qγ<Ʃ�GbU��$���+u��߱�yܐb�ĕ��$�k�g���� �FD�|���ׄ<�����_6O��"��	��G-�x������%���;�uc&���� ��.�7W���[�Y��@�>�g1A$pE+p�*��	>XHwjj;+
�l�A3��5��\�j|���Gg�d$��9� ��9Z�,HH���.�GǙ2z�v��(�����R"^~�i*��
�'�HhR$<�	�[_�T�d��#�P��'d�Q��HH���2�H<k���ܩ*9�NObQ&�k��x���:�����o��5i���b���ޣ�\M9q��S��7�9�A�9��E��Y4	%Wߣ�*o�j������<���x6L�2�W��㪙M�>NpH	J��Uv�U=�ʙ\���)	��<�����$4=�È��E�K�qa�Փe�N,(~�q���P��@�v0��1��qf�2m:$Hn;�nO��$�9%U,Rj�Y٥�x�f'��C0 a�v����G�n#�@P�n\�.h;��"HH��34"{���	fٍ��T����'��|ֱ<&P�$?."
&.�9�c��d�z�Bf�j�C�F>�������� �s���Ra�@B
��ƞbkr%7�3�{�BvI�����	0+�~;"Ľ"ay�˦�� �C�0����s��B:4��d5�%��@��:S}���L�����.Σ�;�{�و.��	�p�L�����I0#s����oš�&K��
��R�P�)�]�Ъ��ߤ�L�+Pr@�lU���F��0"���a��/ߕt���:i����9�CC���2Z�B�o�,�V<��Aq�܆i�=e#���S�+�N���	�ڳ��	�����"�Ci�Y�� ڥO%GlY� Al�r�)1>��<��Ĩ�unvׇv�����ƾ��L�֛Oo0������z�J[�N�듁��=S��������x$��җHj�'y9^��!)G ���,�tnh��q�$�r�s�0�FT������	�?D�A�7b<� ��*�g	-J~;�ǔ��3,�W��C~#��T�L/*�	Ӂ��`�i�	Cy�8�#�vY�+��A/W}E����� !��ֺ����ո�_�
�"u �yǏ�e�괂�j�
H]���Z̀��������Y�Bڒ��ũऎ&Dy�l�aP���V����1�Lۭ�Jf�'��P�fi�@B���y��ᴧ�$�p��U��¬RAK�5ww�<��&��
E�}�݌Է	r[�Hp�(�v aڥ�(�q��Y�G��=5��/��P�T�LU�#i�C/H�Ŭ��3�_���7�{�ϰz���T%�Y��u~a3Yy����C4n瞜� A'�3�T��'��DF�F\�߁G�2�|��yG�a�%	��|�F�4�| ���u7��`x�s	4�<ϗċ��ɂ����L�jLg1�j��\1RsE��,I�0�Q+V��35��:�
>������ wkR*�X�!W��tQ�~�>OK�P�5���0�7-;$���%�� ��pp 7���rM[�l��݂����t���BxA���l�<y؝Q���2zz�h�7D�� T W�틏ˠ�V��&�#�C70�|QDHU���O5|�g����`��}��0Q�@��GZ����ѕ[��25+�� ��5
���x��2�7x�>��G��!=��|8�ZyT0/c��DFw+�G<4*�@�,ڡ�&Q��!�?�� �cB�	�5��-1i���r/�WO�7zE�C����S��2h��r
r����״�,!0�g��nhQ5ȼy���o��5�d��H�7�&%��Y���h�c����R� ���C��� Q�$(�nkto��	9�o���ioQ/	�Vi��@CY�� ���' x�	�Dv�z2O�k�g��N��4�^1Rp���[�,ju+�<ԩ�O��;QT�`�'d��s��'��ol�<��eSD� #�͑��jbA" �OPl��4���
r���D�Wy	�y�մ2�*J��X	
�}�*�g��s�0b�����n�f7Hd3�g��.1\��'ȓ�<�WG��{��?:�:���'F�@��z�M$s����A�z���Dg�rp}_��*��@B��N�R�A5�	a�"5����@	��}P�|&H(��3Y����sѣ�LY=�-�@�Y�0�f]�]�|��^��l�3��|wH�ә��'M}[�L� ��w�)u����HAt��0�J;�Y�@~�o���0��@f�N��ŌB��=�>ĲL�$|�E���!/U��C���k�Ҹ�� ����੏�@m��V�+R=��'�g�*�8_���9�)���^a��W�p��8��ABש��>M�Ig� W��rT:*�H��<m��u������DJ�u�&�<�Y�|&b1څ��P7+�||�}A%D��L�#%�Fh��^%�� ��*a�+�(�%�����y8�����5e� at`9C�]M��$��z2Gx���!Y#����Kv��� �52���i<� \A�w��<Q��-��a���0�1�3g�~��9���U�b9]�$4F���BW� ����6��04�}�	J�A� �M�jrH��$cG���q	��>���ުd	�	ꓪ>�@�-�!7����)��U��:��@'�!��o�B��S�| ��s��[��B� O��!��W�L5{�ײ1�l� �����K���BUT�����6�w�CC	<�|>��} 
K$ȭ����kt��	�&i߯U}�=&H(�J��Z��>$ӿ��K֜I=�1��cr��
�<��ҫYÃI)��^��,g�i�!�Y�e�+��3FiS
�ȓ<�䲤����	���$W��,� �3�Ǫh�#�y����|��$�p�a���C�@������w�6 q���~���N���Ӹ]�W�O�W$3�0J͒��T�!���}�1�T�A{\ڟ1�[�bt^���,��^O�%�����s�y����	��ޗ&V�G�(t��=�4|�����[�i�OT�I������G_�]�7R߰Z^(̵�H�+%��s�Rvȣ���)>�A/"��@Br\z;k*�ԧ˦CB9�;���d˴CA��������U���4j}���,�B��C���	0y8$4G���)K\jfY�Y���~ ��<�?��i�#�����&]���B�XyN�u���w���ѕ9�/����U}ܽ9&���� ģ_��k�,#��/�1�MÎ[m���+^^р5�8p�yT͊l7_3A@v�3��<&�X�v ���+�*k�������SPI�8 �"A�R�\���o}U�@�����.X$�!a`�� j���w:$ЗԎ�H�Uq�������К�A�Z	X
n7�S���恄j�>ƪl��in�{�gY��^נ��P�7w*2�E�+	��T������B�gp������g�>�I�̮J@	�rRw�=ƃ	&T���iʟ*-mE���bc�Q|�<���}YD=ӎx2ȕ g@��"��q���|���9����r�E�vy��5�����WG܄B���%M�y!EAF�?BCY�fjA���)�����AB��S���zBWv�c��7�&2��<"�Ǘ_|\d����!���8����B��i�@¼|o.��豤{��?TXHj1��FrW�<����$�NbT��傽��,�߫�m烄�? �  �A�U��t��یW�V�s�ۮ�oݿj��S}u������n-���00߿���M�x
�$�{�|�G��2H�ʨl�9Q�L]�5�(��%e	T3H��x臭H��tģ�N�1�Ո�"�s�R>����s�0�B��~�$�s�g� wDB��_"D�ު����'��N� ����`e����s��Sz��9������މ���a�N� �	�>�Ws����1��FQ�|é�IS�0?As�>��]��H��|ȃ��)%�N�\��'��Kb�a:���R������}���ҝ\��nO׶�f�M��:����-P���	$����Q�W��xA�G_$I-�V�v��{�K�O���SQl��@�Fc����� ���ݻ��-��K�h�|F�U�CF|�I#H�"��Al��pLQ6PL B��9��4�:"�>�� H�J�Y�#j��;Lɘ�ɦC�:t��N%��|�q)K��.�F���d	�.�iЀ�K ���z�=%K�z�/A�>� M>"�&]A7����fo��<��uz�ha^X�"�a�Ls1 � �jN�p�݄�;��4��������R��rh�n���;��CDVD�J�oU�����*����4�\�0���R�VAd)�c(���
<�#HuE:�|)����� wk�t�K\���Jh'�g(6�Bf�ُ�O֛�����[}#�N^�,(T��?�*�C��o�<����]��P_,�f�e��JM&�r�6��:͝`J

D����8V)SCݰs@�S?���i���Hh���;�������ֽ}���Չ(@�Z�&ORߴ`2�A�(FEU���n	�yF��a�N��<�y�� 'n2G�/d
����2=��<�ٔ_���OJ
>E�O����}����O4�I3�H�k̪c���B-X�u�B�8��������P2��RX�����_�̇��O������� ]�<�      �   �	  x��[�v�8]C_���l�� _K�I����'J�7��(H�1E萔m��;���HH����G�ۖI�Pu�֭"�G]��i���ض���m���a2�Y$؏��3��m�ؖ����p��W�Mi�W�nk]��?�]閯t�u��S^�E���≞���8>�ͼ0Uۼ��
o~k��2MCO� ��_��qx|�/vn��[�C�JÄ,�F�3[��fƗV���lL͗�}00�6��K[�u����i�ee漵|Y<�Ϻ��E�N�G�v��;�
g�x$�P�[M?���A�VEݲ(�,��ȫ�-Kۚ|ů�
x�lы����7�XԦ�/Z�mC�� |R�?涪L�E���"�CU�j�L���w�,���H��I�>o��u��C�]���$d�X|��&��%ߙ8ե��X�,�W�x��Zう|�!h�ٵ�[�yo �8�4���G�~���k}o�MK荮�I�>ᗼ֋�:�M��03ʔ}ߺ�X�_ ؏m��c�(vm��?��������r؞����r��蚓ɕ-�r�5����6p>�O��A8���cV��/�S2��O5��}(�����\�4C.Jk=7�}���Y�,��`۵���Qn��MѴ��/j8��Tˢ�@��b�q�~*�e�ۘ��u�v�bZ2 "�xM;�z�s�oa�5\S�y�'`�?h��@0m�/��q";?�EH��[����'�R���=(_���J5U��8:�X}�W��	0�-\U�k�I\Q�|h���9'��;s������ͅ��%�7�f��n���n�%L��]M	��:�M��Ȅ�NM4e��W�5y닦���5��O��Y]�)�k��<��]K<�Ʒ�hk�n�=�Y�b�\"+K[�������Z���e�\9o޼Y�|��r�uM����M�B����qVjI�ǯ�4 ����_�/�ҭ�RLEK��1{!��X�Y6�4_Ooa��>K��A�����M� �w��֛-^b"=3�K������0����D��Wzݱ�y0��� &�)����E�f���O4q	��3E�*~u}����)�x�Rr�i=%�n;c�����`})=T��ֶ3����!��G������r|u[~��7���U�G��~�q�X�ni����zZ�+~��,N�+_�,)�EQyV�Ä́�@9+ �}���EЎr4m�>����a� *D�-{�0;��^�~DGؘ:k&��9�ك~?p�2��ȩS� �g2	�h���{kh P���2���O���W_.x��q:}�7�~���=}�fU�`�oSD�����P�R��a �	p�/$��bG����>;�ߤ�$薇ھd��^����z��KD#I��գi���Zr�#!���4�x�V�t)��X|	�k4W���{S�H	-<@��74�w�y$�Q�����y��Vnb$�c�Ք�E��xF�L(�T��LX'�嶛Ϊ�	5��E�������AERw��!���,�����ϻ,�,}�B�D>�=c�V�ԠR�� -���g�u�U1(}�.5%c�o��iFv*[�Ųl��J���&��o-*�;��^/���!�(���-�S�Y�(&��d����8�#�6d�WC�A�"CP.h� M�d�%9M�v��ez�u0	x ~��P6�ĶWQ�ݿn�F��>v���!R=���\��-(>��o7�I��m7��p��r�g-���|�ꡰ�1��%��� �F�`��:!�~p�(����Q|�T|աs!J�8@�F��q����O�2�������l�$)1�ײ#��"A#�H(0+>hَ��L&2����i��(_�]U#�D0�ԌÓ�[1H���$j�� �G�Y �e#<��Z�Ӯ8kc�*�8��P��̐b�o��Ŀ\ts ɠs�>�?�-gwS��!����DzY�[;HR�&,J^%v�߱�+��J}�<|2'��
��"l�l٧F��C�!��]-IP��@�$�j=\:m.@΀��y�l,��h|ܔ��9�Q�py��V��?�E���R�a�2^��Cv���\�$	S�KR�45��(���2}���~3f�23":���g|{z4e��񐄛>/���5�#b�x<�����ɴ������ۏ�k�n���g��ʗW����$�4>Ϙ���=�!��p�Ԡ���}�v��L��q��V��c��w�!nN/%R�ɘn���~d�Ȥ�@ѥ�!Qr�h��,��#�8hWvt�z?P�A���!�z]�}Mq%b�FPN������8�?�:�A���|�3�Ac��C�q���ߎ ��������1��SEύI����kZ�,�����K�v�˨��?]s5ݥW(��f�җW��{�z�e�ʎ�{xVvÝ8��'C\�GJ�:qL�B�������M&���t`      �      x�5�I�-���7�˩a.��H���!��!�i�n�k��+1W�=K������7���D�%�}�����.Q�����o���ĸ%�俿�o#fC�u��w���������ǧ߿��x�_���d���������[%��kY�.Y	FncJ���a�ƿ���.���Q	,Y�j��SVn��{%rԣ����ėϘz��w>�Pn����d���_��������Œc _���߹ȮY)�o��Y%֭�^r�U-���+ֿ������Mm������%%W��Q%�r���w*�%�fK����d�3�w��*l�ncx� !c����UcyuQ	%��6Ґ}(��Uq�Ƈ\�OY�j<?�(�Yؐ} ����V�+Q��6�Y��oVCx�zuɷ�f�����M���*�����d��&�\�nLUˬ��!�2KV唬f�����ݩ䨎ѩ��k#�)�|_%u�OY�,Y�Lߚ���Wy�_eY�%+�%���&���2JĖ��	���eZ����HT�jl%�-3�v�lKv�����Օ�;�ʵdU�tђ�ؒ�.JVv���<�\��_Y/Y�h/�q���������o$)٦��)b�ZH.ޟ|Ryt*�R�h���Q�j�|��4�z�Z�_#R��KV��ߘD�-��Y��M>W��Q���U�t�q6���U$��TCBTE�K�.�͖~����?�\����lJ.e�G���w����A
K֘x'�v�KT���d�E/Y͢�iHEe�n�mɪ������ը����U�ױ�>_��Ȓ$�� ��J�g�1��xKV;N�-Y��9��̿��9(#'r��P�k']�d��#�%Z][LAo��JVe>[I�*�w�pɫ��Y%���c�+Qͺ�9��B{	Q�5�U]���>ޘB�N���f��I�$S�7��P��:�^���9�o��bb)��À �+���d߼���@b����s���}�*�֜t 3bM��"Au�V�g�iʘ4����\j��f�jf�W0�|H�j|��	������@Ԙ�����݁T�2�D_-�>Н���"���L��&.�^`Jk5����)
	,n��x%��,��HQDj��Kp����������ХF�R3�Q���⨬�Lh�s����w�Zs����A�$��zS�ǚ���+G�A��D�@M��Z_�l��H�ϑk���*I�q�M��VsgM�`���EI,���I5 [���R�J'3=�'po�4UOl:|����t�o5�����A�[=�]g ik$4}s,ϥ3�~�R`�m�Fh����Ryi5�R�+Sh?�E������2���������Vd�����W��h۩��&T]��U8	��NT���˚i�je��S�׾�U�8��s���hRS-j��Z���2@5�tlP���z��3r˰�N˓j8)�N)��x�r�q�j�IY��v3�x�u=��:�� ԇj^e*0\u3���k�e�c�|�*7�d��YM(qf�)�`BG���g�=������k&��"j򥣀ZZ|��K�y��� -k�LaOu�(��jo�ʛy�tb�	������(��	H�K��5%7O_[ ��M���s��5mޠ�'zB����� �H�K����R;�,��QkI�<�p8����%��v��/u�S%��H/=ڷ��X�vQCx	���k&��ސ' ]`	�gM��3��ך�Fܠ2�T��U?���S	h/H�cc,E��k��O��陖A낂��{������\M��� �>��`0�Jw���k��f^fY{4=���"WUxK�YSqu��B��a��PS1%=R��T{���gM
�=ЂD>�T�F.sˌ��ۅ�p�{&2��f*@37�I"rS�l��d?AM��&���Ni`$����TR�$0]���`�:���Hȧ�z��4&�%^B��CB��V3�ǄN*o�~m����G\�"��új�K5���隂eM����/'��� �	�|,[���ܹ���ɥV�Y0w����v��T< g^_����=v�%}cz�L��9.0t�(V�vYW���������|�����������z�H�
L�q0c&ob*o�~!^⒮(�)�[���K��P8	*𮚲)��:̎����t���y�u'�����v��c����r���/�|�س�o���`\������5 !W���������a��~���0W����|�5y��ݫv�kj������aXk��c+��_�۝�	?tmoYx�'h�/c��Tڙ���שȗ�0��^S;-�e8d�_���k�g�c�}u���0�	���K�Pj��u^`Tǧ�U�`'r`st��Y����� b����Mk����`�eR��}	-qx�J:|�Z�
��c�~J�X)��k'o9MY���
Gs*%�T��Q�*��_q���u��Gi퉪y��.`.mZ��SI�6�݈�[𒃎�GS�X�yZ�`�6;��@7]C���h9`o����vD0��@�
T3TRj�������P%��~6�%wnI&��D�5�5'3r���ٹ��7�fJ�0}/�US�E�N��dg�|gh��U� IN�c�Ҏu�_�hm��BI�D] ���_�.�/�D��c��V����j4q�0����*��2+�% �2��wj�]���h��if�O�a�o	�z���gϲ}�$se�a�lYď��S��PˡP:���(=���5��i����(u��W����R��At�V�g���GA$��M��TQiT�JSZ7���\K|�V���C>{�Nn�[Z���j=#ZXJ���l7���)-�b�:����������Z+��(���P5?�b���;8�zv��]
�&f"i�'Ͳ�r��"ROM��;�Ub��\��1! �}DɈ~�,���r9�V@���o�l ���y��B�CI���/�j�� c*J�	2���CI�Q�d�f�:o���ኖ�,{��f2n���K��|}'M��x5��� �v-����Q�+�/ۃ�q������ā�2/�b�#�@�r|zd��m���9�0���������u�D���,�^>���= $}�K��~0#����ix�@Lшt�u��\�_��=��m�D����N���k�PT3�`��S���+���7/�y�#�`L�>QJ�ln4�l���vPv��i��ZOh	�J���cb�X�����
Z$�y�%%ϼ�C�E�A=ݳ��f�@�Q/Jj&�]P`�]S�Fo��LՃ�U�g�p��.4�&����3��9���Ev̈́��na�CPDÎ*J�Q���g�1$�V	��lB�'�E.%�:���b{�:Ho���QZ�%�ι�F04�O�]��to�(�X�J�bCQPR� x�Lm=�*��R %�a��8���gjb�N��|�;��h��Z@aD��ytN~`)k��˙p'{�,A�-����PR���ކ�ܸlj+���"� �E�ӥ�|KҺ���D�_�$<Kmk3	̀�nm!`$�� عF�� ';��)P6�eЗg��=�)0�C?w��N��.p���VB_B%5��ƍ�v�o��Y�֓y4gMf�%xs��y2��!��3����fz\��c7��D��t�U�v@	0�+H�;'/��")��.��'5�tP�9(��d�@�� "]�&���J��_I����ȫ��Ee�]Q��Bnj׀*���PgWc�5]m��$��qU��L�&Pc�؂1��d(��ts�/�{M���n��v���.��;	����+����а��K\�j�������f@�)A7���hS��͇~�>�I*������U,�ڰ��"_ �O$0	t��N�J�z�{��u�����X��
p����y��� g���KWG9�2��#]�DU���3��D 9���R/Hes�GQM�����p-.P��-�[Tӡ��vnq_��xD���i_��5�+J�ꩢls ����̞J�cu-ҫk\�� �	J�������~|��,f@Qw�&@N� p  Y�-%9�]��C*���d@K:�,��4��Dhl�c��䲆�犡���&��P��w^���w�<��
�Mib�-z���Hݾx���L���;ٵH$�v�$^ӭ1�?���J�LPC�MI�O�Jk��߭Z�y��TA-��O�z �5]��&�Ҝ�\�Ex�5��iXqU_p�H$e�2z�?�4�; M��W�tX�.�JF��_�t�c�����l[�+�2f,��k�Df�X���cV����s<̦	�'-}���Mg[Ộ�ߪ�/�%[��Ꞁ��5��� �8)�i
�{����j�����2�dh%Wn�7�em��= l�H��:_�������_� ���? �븦Y���o	�	�c륤&�u�Z��Aa�� P\�$�#�eqv.�ϲ�W���F�^r~��ך;?�>WPVQ��y����c��ʹ�U�	*�@��
��3����3D���,A������)��vC�$-2�j��t4�Lq�1��#��	k]�� ��*��>��x�s��9�.�멽�����),���o���s��70 m(�YJ��e����k�Ǎi�i�s�ԧ��z?G�G�{�n�g�C�����'�D:T��nB�8�����
���/Nş��`^��VBD�����6�����x�.*;N� G�O��FR�6��$Ƚ���L]+5��\�8C7���u�ݘl������)��v�9�� ;�
�/��c���`s-~����N;[3;�	vW��YmvU��-���xX�RR(�>sg|����;���+���}�ڡa�����4�݁�+p��)S�[�k��@���=�A���de��RW�ðl�c�x�,`[!R=�0�Q�ߺ�?;g ��d�@I���-hv9v ha<�ӭ�_�
�Z�=��jy�8�w�mjZ��_v�'`��M#!�����b␱';E�L�����u��P��^.H��<��/�J�rK��xQ(��c�M=�^��G/��T%�\b%��Z�ǀ�.���a�r�����$DEkhA���M�w���v��<Нw��<�XT
�ۯ��k's�RzBJ��yZ�ю}�H�������#j_%���;ǎY0���Df��%x	���R;'�I�?x���4�=�`�	�zd�dcc)��@$�;��\|���]n/0���-ס�hT �����m�k
���g��:�x�@Ƽ����:���DIzPbT�3���8MH�U�����'���\	V�xr��"��9*�������S����/�n^:ZvL ��e�`�h�������I�e�|�+%�v"��"�'��ɚ�-����_��@p�˃�P�u���s��P�>�.q��	��N�F�����_�j���r~>-��6�FIp��	�Y��a�8[��'��M���'N�'n�G-��[�д���u��^N@rp�1�����}'��z�9T }�P}�A���;q�u( �t ��i- �~�ۢ��d��<�~�-��N6]��|�|��E�)U����'�Ovi�&���T{˵nm��I+7oA��'�O�(`T6�O�=7q%׵L �B=���~;=M�	!�� %����	^�
���S�]�|(��H3�^�F�3�[:#9eƖ�4����I������g�Jy�;̀�0�T?�T��#8	yc*iz���4䙺� >7�1F��^߀��)�C@�� �S��3u�>��@�7�;b��|y٣A��pJny�
�Dr\o��<�E�īP�E�Y��t�#��@���L$�w9˜����"<��	���r��i@��:�(�̈́��	Ɠl� �+���v �%�/N:M~k�=[+< �ۥ��Cx�0�"{yW�b�ܡ��9.P��� ��w\�\s���N
"���&��Qk7�
��X����?g��(@�`f�
墤~��9'�q�v���s^җ!ۃ���g�8l�\A��%�����	̀;\�gP�v���s�qoN���W[��
��sA�|�J��G��?���ӂ8������б�x~!���*���>R�ܿ�ç��� *C@3�W�y�?P�O�c@�<O #��q�%  +����K���� z��S����"+�Jj���J�u+yo��y��u��9��xSx�[P-
p<;��g�߼�����z�5AIB�3�m�|7�������Iۦ��_���f�Ә<,��ƭ�Ƭp�G�~¯��:8�������� �0i�F���	>A1�{S��f�5xX8o��^�t%g��?N"+a]�y�ܹ!��z����VB�S���u�q� T9Ν��O2�s�Z��;ts��PO��s*��pONT���n�< e8���C�#���гP�e;<�@LP�[\;�?�p�˷)nT���Nw@m�	�9���J�S�ܝ�� %��I �˝j]7gE ݘM��+��=1����C�#���t��S�w`�<vq�{��H����t2����k+�El����]*67Ρ`q��x7��	<:��a�ؼ�`'��o�]'�����E��F��Z �o9��A�f��n*�[2�m���f�3���9�V�R��A���nON�3��p�Md
~�|V��=� �9����?�P�(-�=!���'f�s��n�/oNxޓ���h�;=E���;=�nB��u��	"��m��c`'Djq�TR�9
h]7c�u�����-�Q2��~�n��]��t ��Y��W�/@ܝk�jn���D҅��
���*��6�9-r�^����2<��Cݘ�@R��ۍ	�f;B�+=Y%���:����hE�*n���|�e�}n{^�����(�����+y94^B����}-�@��������?	�<����w�:{_~e��@�r��#�Պ�%���8���X���A;bΠ^���zM����^���rV�EYx�q���4�[\�>��. {M�'p�;�'4��c�� r�n���'�+��kw��e����=� JJ��K��L�����ux�Ff]�PY�1�I��]P(][20%ڽ^�I��5��;�J��ʼ����_~��DR��ߐyC��Zt�����6�x��&�_��՝D#h<����͇���2\��~���:��B[I�d���*���2��ԇ��@�������1X=��L�j/��.45.�h���so����$�;�� e��3�ǷZB�'��/�W/wU�}�^�p�[Y���"�/��T�J�,���MOY7��N��;mhg���&���E��vҫ{� �	�������������q������/;/�D������i芓/q��5�o�$���,��o�v��n��h�%D��Ƌ��EQ ��H����N*��-����N�zch�e皎�/^��VMЕ;q��(}\� ��y�-�����|�/�?%�(��L���UK~W7b� �����ܴ����jk{��%�Lt�߾��K���e� Й�ڕ뇒���c��e�z.:_�'��G����O�Ǽ�o"��8�	R�2=�n��ȝ�{/����GT~��_؟0b���������?K��      �   �   x�m�9
�0k���߿�C���ܤ����:0�cxS�f���9EaH1��ȄЛM�z�	���4�6���,��+pM,���ȽL-I��0�2.$<?�7��lU"|�+8��t����]���?O2���a���yU-     