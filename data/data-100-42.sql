PGDMP     7                    |        	   benchmark    13.0    14.11 (Homebrew) ,    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    275698 	   benchmark    DATABASE     ^   CREATE DATABASE benchmark WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE benchmark;
                nikolasburk    false            �            1259    277026    Address    TABLE     �   CREATE TABLE public."Address" (
    id integer NOT NULL,
    street text,
    city text,
    "postalCode" text,
    country text,
    "customerId" integer NOT NULL
);
    DROP TABLE public."Address";
       public         heap    nikolasburk    false            �            1259    277032    Address_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Address_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Address_id_seq";
       public          nikolasburk    false    200            �           0    0    Address_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Address_id_seq" OWNED BY public."Address".id;
          public          nikolasburk    false    201            �            1259    277034    Customer    TABLE     �   CREATE TABLE public."Customer" (
    id integer NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    name text,
    email text NOT NULL,
    "isActive" boolean DEFAULT false NOT NULL
);
    DROP TABLE public."Customer";
       public         heap    nikolasburk    false            �            1259    277042    Customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Customer_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public."Customer_id_seq";
       public          nikolasburk    false    202            �           0    0    Customer_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public."Customer_id_seq" OWNED BY public."Customer".id;
          public          nikolasburk    false    203            �            1259    277044    Order    TABLE     �   CREATE TABLE public."Order" (
    id integer NOT NULL,
    date timestamp(3) without time zone NOT NULL,
    "totalAmount" double precision NOT NULL,
    "customerId" integer NOT NULL
);
    DROP TABLE public."Order";
       public         heap    nikolasburk    false            �            1259    277047    Order_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Order_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public."Order_id_seq";
       public          nikolasburk    false    204            �           0    0    Order_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public."Order_id_seq" OWNED BY public."Order".id;
          public          nikolasburk    false    205            �            1259    277049    Product    TABLE     �   CREATE TABLE public."Product" (
    id integer NOT NULL,
    name text NOT NULL,
    price double precision NOT NULL,
    quantity integer NOT NULL,
    description text
);
    DROP TABLE public."Product";
       public         heap    nikolasburk    false            �            1259    277055    Product_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Product_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public."Product_id_seq";
       public          nikolasburk    false    206            �           0    0    Product_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public."Product_id_seq" OWNED BY public."Product".id;
          public          nikolasburk    false    207            �            1259    277057    _OrderProducts    TABLE     ]   CREATE TABLE public."_OrderProducts" (
    "A" integer NOT NULL,
    "B" integer NOT NULL
);
 $   DROP TABLE public."_OrderProducts";
       public         heap    nikolasburk    false            �            1259    277060    _prisma_migrations    TABLE     �  CREATE TABLE public._prisma_migrations (
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
       public         heap    nikolasburk    false            K           2604    277068 
   Address id    DEFAULT     l   ALTER TABLE ONLY public."Address" ALTER COLUMN id SET DEFAULT nextval('public."Address_id_seq"'::regclass);
 ;   ALTER TABLE public."Address" ALTER COLUMN id DROP DEFAULT;
       public          nikolasburk    false    201    200            N           2604    277069    Customer id    DEFAULT     n   ALTER TABLE ONLY public."Customer" ALTER COLUMN id SET DEFAULT nextval('public."Customer_id_seq"'::regclass);
 <   ALTER TABLE public."Customer" ALTER COLUMN id DROP DEFAULT;
       public          nikolasburk    false    203    202            O           2604    277070    Order id    DEFAULT     h   ALTER TABLE ONLY public."Order" ALTER COLUMN id SET DEFAULT nextval('public."Order_id_seq"'::regclass);
 9   ALTER TABLE public."Order" ALTER COLUMN id DROP DEFAULT;
       public          nikolasburk    false    205    204            P           2604    277071 
   Product id    DEFAULT     l   ALTER TABLE ONLY public."Product" ALTER COLUMN id SET DEFAULT nextval('public."Product_id_seq"'::regclass);
 ;   ALTER TABLE public."Product" ALTER COLUMN id DROP DEFAULT;
       public          nikolasburk    false    207    206            �          0    277026    Address 
   TABLE DATA           Z   COPY public."Address" (id, street, city, "postalCode", country, "customerId") FROM stdin;
    public          nikolasburk    false    200   �2       �          0    277034    Customer 
   TABLE DATA           N   COPY public."Customer" (id, "createdAt", name, email, "isActive") FROM stdin;
    public          nikolasburk    false    202   J@       �          0    277044    Order 
   TABLE DATA           H   COPY public."Order" (id, date, "totalAmount", "customerId") FROM stdin;
    public          nikolasburk    false    204   �J       �          0    277049    Product 
   TABLE DATA           K   COPY public."Product" (id, name, price, quantity, description) FROM stdin;
    public          nikolasburk    false    206   �~       �          0    277057    _OrderProducts 
   TABLE DATA           4   COPY public."_OrderProducts" ("A", "B") FROM stdin;
    public          nikolasburk    false    208   ��       �          0    277060    _prisma_migrations 
   TABLE DATA           �   COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
    public          nikolasburk    false    209   #�       �           0    0    Address_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Address_id_seq"', 100, true);
          public          nikolasburk    false    201            �           0    0    Customer_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Customer_id_seq"', 100, true);
          public          nikolasburk    false    203            �           0    0    Order_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public."Order_id_seq"', 1000, true);
          public          nikolasburk    false    205            �           0    0    Product_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public."Product_id_seq"', 100, true);
          public          nikolasburk    false    207            U           2606    277073    Address Address_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Address"
    ADD CONSTRAINT "Address_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Address" DROP CONSTRAINT "Address_pkey";
       public            nikolasburk    false    200            W           2606    277075    Customer Customer_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Customer"
    ADD CONSTRAINT "Customer_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."Customer" DROP CONSTRAINT "Customer_pkey";
       public            nikolasburk    false    202            Y           2606    277077    Order Order_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public."Order" DROP CONSTRAINT "Order_pkey";
       public            nikolasburk    false    204            [           2606    277079    Product Product_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (id);
 B   ALTER TABLE ONLY public."Product" DROP CONSTRAINT "Product_pkey";
       public            nikolasburk    false    206            _           2606    277081 *   _prisma_migrations _prisma_migrations_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public._prisma_migrations DROP CONSTRAINT _prisma_migrations_pkey;
       public            nikolasburk    false    209            S           1259    277082    Address_customerId_key    INDEX     ]   CREATE UNIQUE INDEX "Address_customerId_key" ON public."Address" USING btree ("customerId");
 ,   DROP INDEX public."Address_customerId_key";
       public            nikolasburk    false    200            \           1259    277083    _OrderProducts_AB_unique    INDEX     b   CREATE UNIQUE INDEX "_OrderProducts_AB_unique" ON public."_OrderProducts" USING btree ("A", "B");
 .   DROP INDEX public."_OrderProducts_AB_unique";
       public            nikolasburk    false    208    208            ]           1259    277084    _OrderProducts_B_index    INDEX     T   CREATE INDEX "_OrderProducts_B_index" ON public."_OrderProducts" USING btree ("B");
 ,   DROP INDEX public."_OrderProducts_B_index";
       public            nikolasburk    false    208            `           2606    277085    Address Address_customerId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Address"
    ADD CONSTRAINT "Address_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES public."Customer"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public."Address" DROP CONSTRAINT "Address_customerId_fkey";
       public          nikolasburk    false    3159    202    200            a           2606    277090    Order Order_customerId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Order"
    ADD CONSTRAINT "Order_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES public."Customer"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY public."Order" DROP CONSTRAINT "Order_customerId_fkey";
       public          nikolasburk    false    204    3159    202            b           2606    277095 $   _OrderProducts _OrderProducts_A_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."_OrderProducts"
    ADD CONSTRAINT "_OrderProducts_A_fkey" FOREIGN KEY ("A") REFERENCES public."Order"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public."_OrderProducts" DROP CONSTRAINT "_OrderProducts_A_fkey";
       public          nikolasburk    false    3161    204    208            c           2606    277100 $   _OrderProducts _OrderProducts_B_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."_OrderProducts"
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
�M6�?ILy�������W c�8C/̭7�*b�qųϛ&|�x��AMS8(��՝_.5���9��Pp�h      �   �
  x�m�Ko���̯��,XoiV�G:ǝ��$��F�-����x�_?�vzn�ᦁZl��S�*>	�A4���iD��o~�[�yi��h�e��tɋ�>M6�WZ�Y0#y�-�h�(��g��^�k��
���9Y�����yYu�i'+��;��Q���aޒ��nk&����*t��>�e�����t��&k�D�v�L5\���V��� �}�w�ш���S�$B��������F���0!k����
�J���l��?�2r]��?X�%Y�Z����^��o�ܳB���F(�F���ƙ��$'��A��t\�3��ޓ��E�����d>YF_�'�dh)�=�<������Ѵ�,$�$l�(*n���WH��|�-��Ԇ�u�ra����r���V�K�C*|7�9~� ���m��ww䁩�+o�~ ���ܜ�AH��)�诰��1�Vދ�ǚ��{� LnT�0B�?7t��Y��߸��9��>ˍh���7Z�'�ޢPų�����i��,�G7�/���[�p ���[��f6Ob��	[�I�2��kְ��'��ĸ���5�1Sj�@J�13��{��2�צ'�Mn�%HF[i��gݓg��{�j�q${2GY%Cd7�y���d�
�&OF�,��*�)\��t������ԱS%NոQ�vۢ�$�v����/�A��񯙢kV���L�� �].�@���VM��	����2�.�jz�Q�EEf������pa>|�d�|��Js��z/���X�����B� �>p{��Mk����Uj�mk@հ*�8*N���	�Z��
[/ɪbR�V?j�]���\p�$#�n�5t��(Y!�t���i|
]q�V�'J�6���l��8 �> �t]�����5���|�R]����5z*�y4R{N��8$%t��^_Dq6���h�mż�գz�����M!Z�1x:�A?�ߺ��#|k����޽ ��r޶Z�\��C��%t����Цs�ٹh�h!���� 9ݐ�	����BgT��jJ�vGo�{��yq�YT�i�d�M�G��Σ�@�y������B�f����ݟ's��1K��u��/4���(���n7��4�p�ַf�<sc�*x�.���JR쭰�W&���CYQhCf|�� �g[�u]�����M�-�������!�� �Yqh?m�n������Z=�E��+Z��+�ݍx�?�Mf�o�7�����OY��DB��*���>�_ ݳ��
~0���� ��&��*97��56O(�� �ϝ��m�;&y��'}��#���t��0S�p�P`�{V !���m���`P�%W��Q~ܘ�S܊���� ���>��;+(��nR�_K{@Co{���l�͆���xB�6]� ��lӜ]���~�Z0~���f������
�8w0%X����1/my�������;�����M)tl��B�O/Z�c%�EW����+t��ة��j��fe�4<vCf�'��ge-�d���f4�Cr�GЛN�P�ٛ�ծ1*>����h��GK�����x�u�n�a��7%DH��qn>#غ�]�P=%wd�a���l<�%nL#8��ƭ�0O���{l�4F�=����y�)� �~�h�|���M�K�7�J�L7n�� s,:�4jщ�!_H�S������)	��)�8nR#��s��%ZC6&ۖ�#D����\��p,Jܤ�1�0�`��&q^b 8zsT�3�p�6�.ZL����B�.��tx�R��U'nr�O֍;+JAg��7 ?��-4dcͰu'n�c��F4#�h	�6½g�dQ8����ʽ.���u���F���~{����!�+k����Ȭ���惡�џGt��oI�����8K��~���3w�È,o��7��]���km�q�b��=ߣ}��D�n�cPy]R����!?���	�����(u���Kfz�~����vB5�[��7Y0JO�8�7�����~�%A�������Mo�\r	��s91�`d��֤��)uӛLC2�򇔨��\�?;a�j���d�7��oͮ*zzY$Iܬ�7�񰃥n\��7,��d%��S��w�C'�� ���&h��a��~��:ckx|�5s��Z���jQ?��*�VḋenN��k���ζ��@���z�����q���jV������?4CX�'��y@]ƍkbw�g�Ho����H��˽��&5����S���+�ƃx��ec�f4�c�ڞ���z��ۚ�wAʇ�z��4����ٻ����]3��ڏ����nk�b������Y�!j�2썗�ndS4��j��nf��-���QM���[U�%]�F�Wʱs�������heWW_���Q�ݨ����F��e3���w����hj�h`
��l&vy�~u�~�`}9�ڜ0\���2��Z���;cݬ��յ�J��:����k�����,�6v����7;�!̿�x��7��У�z�}���^�ys5�-w��Y}�G�H�J�u=��~,�W�ݼf��{| 
v���g%a�k;"�Mg�5��Zؾ*�~��n?��na��I��By�7��>�^��_������I���yWWW���      �      x�e�i�+���ۣ8؆�f���?��/([���[@��i�D�2�R������J�����O��kz�w���_��R�/��R�Z��5^�.�{=�J�/�?���Ic�����<���Co��^#�s?���K��4�����S�|��?����_j�=�O-�ؽ���o��M?�X���Ug�����ۿ�x~.Z^{������x{�T�j�K�S�����s��c�o�����I��N �<!�K�~��濶?�����;��A�HZA��WP�+,{������/�O�ǳh�	�_�',� �B{�� ��"mi�����g���,����	��g[��_��iOnUk���&O�m�}(��?~���9���W�{��F�����/�O��j�BI��oٴ���h�໑ݞ�_��,�
[㴍|�w	��t����&�ێ� �wUm��v&�sv �'k��6q������w�66i*���f��+���n�Ĥu|��qe-`�-(�*&�����ɑ����e{����>��׬�>��Y��ll���B3@�8X���Mm��|�!)�m|�|uۅ���¤WL:�ѫ�o�z��Sl�NѮ�ڽ�q��}�vz�^� ����R?��C��`�ι4	J�[gº_�o���w��0�d�� �欗�W�ո�v��I�I��}��	;*�"�ˎa�d��~��m�����������`7Җ�F�O���� ������n�.��`�γ�ן��;��*�m�C613@�w~�gw�Lj���$\a����PW���z��	��5��Л�Om���8�N)q��$K�w(z�u�8�O��hK�',����{���gkD��sO��vd�۟�L���w��WT�:�1��ǻ����=����'�b������E���v���~os���3ô얛f���{]��u,�2Q.K+w���!�b6e��0��t�1�/tж� �>���LT>�D<����Z��]��ͼ�&�n�qE����LP�)59��ҵ�2�gVe����q���nk��l���}�v�~�&E�Z�ŭ۰�Lر:v�pM�iv�=�n7z��?�]�`�d']� �Fa.lC3Y�����+�Y���iS˻���b�`��g~mL�{��K$8t�]���؆4c�>��$�3��Ӟ�Y�֐�3q�+;�9��i�!q#M�dj��� w#9l���۴���L�Nם��t��� ��IU&��!�곷��}�+7�5�I��S��b�_��Hl2���ؿ%�r����v�2;�^�;K�o���v��y��;�$��ڛĚ�u����n43���H�5Ȕ�r���2��l���p���-.������D�m��m��r}��U�c/av6��K�0��e,@3i�%L�� ld���>���ˤ��i�f:�Ӽ����W"��q)*�a�����náʶ�ۮdN�]�[yuC����q}o�{[��E5a�)q�� �ݶr-|KG���?���7W�P��Σ_�b��?h8�p�d�[a�o������,�p÷�uA��g����HP׃�Q{��"��;$M�k����@�=��l�h�5o�
;�C����E�
_x�M$쫟�inԶ)��|�$�yrه	�$�r�����5��k���+f1Ê'�Pmg-���[1B���P����YBN���:�Uٿ�ol_I��Caq�u-��+rͣȦ���s�z��F(���w6�5[���k���;&*A ̺����-�us����I1��!՜P����H�ۍLu�ϲ]����E�τ{7$���*���K�rM<WL��]�i{�����ݥKL�l�?��+q2��Xs�]�m�]��x�%2g�l��$����c��� 4G��E�y��2i2=������Q��p�)%s��_��?��3��%�*��H�� !(/H��儋��9�u_X��̃S%��� 76?~�i���}C�z�,��a0Q�fA���A�V���["�,�6��*Z�_���d�:�H�OQ�#j��p�	A��<3�݌sGހ< �����ڶ��IS`����o����Zn�����&]�[d�7���8[m=�ԭ��=Ǥi��{H�f�L��1l��� �>>����#�Z�b7H�7��2eA�9��@�C�$.D
�C,�8h ��e��x�W����P��"O�kN&O0�A���U�,�9�o���r7��ؐ7�����z�BR�ɮ���u��4�e���B6�?�;��	��)r��y 9^V"i�=���a�C�X%e���&���[�@�Ӵ�0WH�!8��	�����Sz|e[
!���s�@B@*��B']E��m���0cg�.Ⱥ�EnBS�������v���Pa���d�������ª�e�U�sD�(�<�y��n��b|{!�����V�1C����2An���p{�*��ͩ��k��Pw׮�FE�[	�tRS��d��C�K��z���k��<�0�%wO�B�)�ڱ��0��#�W)����%O���Z�L�^m�;�R������wDH�D)�g��4vKFH� l\#� ��ʩ(e �'s�F�������w
�t�t�r���� !;�PsMy���P��+�
q;��̌�y aw@��D0ֲ��ƕ$��N�HW����S�'-[�����W�c� 
M�b��qˀ�D)r��Z3 ��Nv���*r̏N���	*Ou,,��;�"A ˳��n������Y;;�j�� �4��Pl������jȵ�xN�P0ȾamR�Kn�N��}=��S�׉4�ڝ:�\�@Df'�q��y����[��"}k?�M�r�0.����-���hr2*J�{[e��C�{���#	v?,����y7�![θ]�%�� 7έ����N�ϳ�+�f���Ƃ��k�.)�S��(�$�m�+�k�����������d��]�	H��%�b W�&DR]:�b�
	�鉢,����VT1� �K��,���|�2�C�́K���[Ky�b��$�Az9��<~o����z� ao��/'��O��\�	$���6���`�<���{f2ǫP[�
�R��d�&��.�G]f�l���H��Q��D�s|��2m���1&�ke-� �#���&��v�G9O	
WPU�"5�d�r�ʶ�!�v�7���p��iGre�A� �*Ȑe7k���p�B���ʕ��W(������2�r	*���"Ce����.d;;$8�]1H��0�W'�-�E���\��!�t��2�� ���:��q,PFHз��ƛ�XJ�rc���?9��
�⮾�דv2〳��w�dhA�≌�K��Q�)�m�vnt�<�P:U��\�M/9���'!��V�Gi �]�׋j;���w-��l�]�#��y�X��$�����e�v�*��4��nmW�0��mW�����9(#�����O��+%�p����:B������&��(+�<jXvJ`r��>��%x��y��A��:�အ�Qr�"7�wk����W�U{;?sw�9���K��w�6�P��'MC|�fj�w��Ū��d�qv��>E���o3�W�o:�]Y:e{
��~g�\�!7��J5��%�HȁI���CpA�>O�N�g)�v���~�/��e��D�#p�����Aɶ����F;��+t$����CfG��4��J{��o�g !��ueW�m;d�ra���T���	{[��,�"Ii�Qr;�e�lBg����h�*���ʓ�涨o� -^!��&���+g�ǫ��3M&?��\S����(k��w-n_��>0_�:otw7�����Ҕ �檞]e�	��oTv�̶tOl`�A�4�<�w;�BA�׎U��N����g&� �z�M�vW5al�.�!��������J�Pq����*(r��!��xH5[4�L��,wFy \Xy�@�֦�@��mg-�����]m�J�� �*�"�J֍ov�D�������Jf���lo�\�{E��+o:l����Uz/a(pl!��W��Y5�;V�O���"GQ���M$�n�j�Vʝ�\�    �}e�ļ2��n�sDjO���� n�k*w�O��}W��ۤrMa1�f�tn��yq��k)Ιx�]���83�A���	,�}(T����yJy�����u!�d !�(҅&��P�d��eT�oe�C�ㇾ��nʺ�h
T�Pb)��)�8O�:�Sn'�Lu3�R���i�j7:+�"�e�QRSv�����]Ӎ�c�S����r���e9G���"$�]�;Y7{r��\O��B�)�B�?;$P���,[Ņ$ļI���9۝WsH�܂�Uq.ȣ�^�>uU2rvϕ�5ȷZ�)�jE�D�����
�Jr~�P�b�P.���k�[�y����s*����8�eI�Bmd�hzg �fYd�q֤
�8���Qs�;��Y��F3�E�ln7k:�yȣ�C�Zp��y�G��^��(|��)�qWIkhS���o�ܭ����������CΧb`Q沷�8�*�_�}HE�sA��S0�>i�lO������� {=?�qd�t.���r�7*)��B�"�$ȍ̒JCNx�h�%�>n._e��, TR��.�2�9����":QUU�Ԍ�yGhX�����Y�n��<���+�c�Ff�7x=@���T����#�@z���>V�N� ����ȯ7g�0j� ���a��J[.���C�Y��*���e/H��df��d�YK�~r�&��^�$��YV=�ą��rE�ߵ�R�e�JE��l��o��OTKC���'i��'x�C.� !��F�����8�b3URq�*mu��p�l%��1��끬{�UGlM�8(�,�f��*�E�<�$�f�Lnu}�o��\����?��z8���w�!ǘ�BJ����e$�t��v�c�"�u�X����-G܄B��8�ܔ]hA	r,���� n���N���g�q��'H���{���(Us�߮
asNs'����f�P�#y�W��9�Xe\+e`�AB]Im(W0�Q�r-���z�T(d�X����J$y2����E�U�Q�� � #�s��%G�ʅ !��3ib3���q�A<�9��aZe��g��g����uh��!����7�X�!y��~Ai�������X��|<p"AnE'�z�兩jz?����UA{��90 �!��KI���� �&=�jb�XTv��u���pn;�����O���7l(��i�ͯ�*���΍v�RTZwD���ZU]I�Z{�~���$�GZ펚GJD ��/����"�D��]��e�~�r����.�3���@B��*�!y��b�C[�"�68�@B��b��*�7�
�@��K�xZ4��:E�zR��"�+�9�Zh�|i^]T�KKp*��G�ǛV$dĥ.J�6�h{��@ܞZx�K0Fw�-�$2� ���!�#H�%��wfoDN����XW�AR=�V"*�5aEW0�F,j�\����t��d�Պި����;�N-�~hL��hW��;h�Gl_����<�W!X��ȣv�< .J6�=�^,�Z����	�o�dz(0.�.A3TQ]R�x�ˬ~�r�'+��v��3oG�v������G�,e�k��n����K�ao՟D<6��U��"�"b ;�� P�~x`Ԯ��.���!���������=�	��~� h�pF$H(A~�;L�q��R	�z�t�$I؝7z��2=C�-<A�w���B�B|;��BS�G҄��f��/�87ߋ�nںU��P��td���X-����V��m���#UIG�AU'�PAn�Q��#��㾱�H�����Cn��/7dz������8|e{��GhmB߫();dO�ɖCj�Ʒ&�>����VC���8�<6���ޭ^��|���v�s�E�`��b�x�pa�Z 7C�鯬�'�(�A�֪����.�$�%$������+�-"A���3솒��Hy�v�a���N��$�&A�|��}H�b[\�6�nM#�TrC�h�\:���ӧu�9Ym�,�~�6Ă�4BU��j�y�$ 9 ז%�@v�;��ů*�K��^Tm�S�h��!Aݪ>�e?��s4���j�]�<���S�g��nxs[�b*	h	�f^8������+���r*M)��?ԯv�T��t�h�a��G����J�y[]���ƥ9���}�餄!&� ׳�~��Q�;$��J�d4��,�\E �Y��X���'|����.� O	yr}���%D���������87NB)��|[��
E��2����>�G�
�M�7��H��sU檫ԯ��yЂƇ*���ޙ㹡t 	m�"EU�λ�
������赇CB����W�T��I@���ԂL|T�rC�K�R�475	1o޶�j����7���#Rv��aW��w���Vq�3���pD`��oK6��r�	�VE�)��.�U
I=�Ey6�^����f�.,ՙ���"�<�Y�fp1恄��7�)�M���kdG��sk��;�H_LR�*�Tg�=x��#`��Zz�[��e6��������f���Fn������y�����B*��ܢ	�zs�#ndF@��������\�K�k��o����:���E:����tD�X�˘�L�
7H$061���U�:�Q��x[҆ݢ��_��/�!��CBfQ���^2�T�	��W��� H�-S�W[��-.�k3FsD�|�w�6qC�$��w­!��� Oj�P[kW��BAnU�� �[�u���r�oH�Q'K�x�E�6���/cZ󻧫o��\����	�O�ɑ��ț��u&��"-l-�P=�0;�����`�i�K���х �u�Ŧ����\%x!n3�vp'��m�'�γ]R�~ ~Q�7th���S���\S�DR�2�SyR�^��xݓ&`x��!���mI��JX���U'�c��:A��u�g�L���HG�d��٪�H�d���\�p���nQb|K�vz�K&�<^0�*�
Hh+s�|c��q=k)�w?�f�Gq�T�I]�y�eY�`/=��9�g˞�J�D�sQlf��'$i�.�(�Y �vE�(�42�rAFˤ�.��M��h��sIGU�L
$�[٘$���8���&�ߒ
B<0��CkY�έ�1+�|�RC��T��3?4�uΨ�{��U���`hB�"d�����o�A��^d�jAt��wkq6��h҃D�!�!O�T���IL��B>9!:�+%��P%���L�}���<hvN��'�!��P$;����ށ5�!�)��h4J��J'ų�fj[D���UK��#-�ء������Ӣ�1\�P�b����]=4��pw;O���o���:̇$h�y�&+	�{�Q�<���Q��An��,�,�SO� ���3���S�(/�쌐d�����u6����B2�?EL*I	:
�9���'��B��8�N�W��M����Ӕd��wB��)ږi{��a@���	ӄ&t���T�AO���������:T�>#�?��@r\n�h��]nY������%!�m��y���+@B���O1ŝ�CB��8�m₞����n���q����P��g�Jat��bzt�Oն8;�
��-s�j�ͮ/$h\g����	+�jgz��{[q��������=ĈjY_�B��E����r��ޓ��'�]�Nh -QQ�
.Zȭ�8/P�	�o�!At�0��	&��SnדG̲��i�Ay�Nrg�*�����Y8��}�mJ7$�H��s�G�q;B��	��RDզ2g���}�"o9��&�xh�+�T�KӟHL�̅u%M�*��+��	}�g�e�	��dUp����!���]�ߊf��~~(�u�� 7�t�W�AM�>+5du�	�>R>m�T��$����®&s��}_G�J+7q^�� ��9k����)�.j� �Y(ߦ�l
AB#I�y"�@�A�V�ioj\��%�C��&�����$��zï
���a�t����rR|0��eg*�@Z�:��CB�̉�b%Ӏ�i��H7���j%�,<4�H����k    Ms6D��y�$��?�#B	�)���į^���<cC(��uL��|(9P#�ğ��u�ܒ����v�8v�t5�MOH	]eE9!gu��X�5ԧV�}�W'[:�{Ă�xU� �T9�n��^�¬O��9$̨*ꈀB�{�d�U>
'+a��ԸA���r46��l�	>��OQ�95�HppաS%(Ԓ�.��꜖o�5�$�Ul�IG�D��{���⻢z2mi��G}�0���v�	ql\uH�ݮ/�~��k@��M��ԕ(�ʷM$�oի�%�� ��4�ٍ�:/��y4��#�C�8��Vd冷$�fͳ�ǜ���N�S���H}o�f`1l�O!����7�z��b�{���w�q��=l������o� �>�"�Yf�Y �Y��(�{2A$0o��q�3������nӐ�mh���z7��<��\�XVMȀt �Hh.s�vS�X��W�)�}�5�{�����c�-�/Ԕ�ú���f	u��p(K���7)H��*�oK\VY���<�%�h͠��<�ƽ�E������>O��T�<=�b����	H�(��L����7l��v&.2�j�π܄�� %������{��2����g9�	��u�Xef�������0�q"��"H�D�V@rH��t�X��T?� �M�鰹�L5�e:$�	��+I�aE�Ymк��bH�i�B���\
�YMRP	�z}ЃG
��g�0�R��u�P��� �*�9�&��I�Ԃ
�"H|��rHP���9�b`g���8�!���;�Ȍ�,9=���J� ��2A5ŞN�0���%�K#@Ģ�ڱ��;r
��ɏ��ɐ=x[�q��m�������C$���D���R$P ��	j��i7��r�'����^L�����Xh{
*�� �ܻ9 �(ٲ���+&���@Lo( 23��L���Q(@V���C�&��Ə�g��|�����e�=���P>4Y	��ق.'٤�J�F��oy��D�J� A�z�F��c�恄��V,S~���	=:��U�Yu9�Z3��Y���#���m� t���D�ٖ����H[��<�~���L!J�zM�/�U���KP�µY�'�<�4�\�)�
�ʭ�4u�]�@3}�K����,��4z���#GnyiA��V��gD�|���g�mè9J%XA��5�ء������3��<}��ZD�ej+�@]gZ4�FQ����{����djA�Ɲ_:iR�!$�E�# gY�����ɗ��U1�(CA��*(�UO7�]���i���{ꛇ�$H�I��]	)��A;�0�mȐ��Xe���1zK��d�hL���VE�L�\��By�0����BǞh~�A���Zъ�%C�d	qo���u�l��T��u�g�*g]^�D���C?^�)a쇪Hj��V��$$ü��D�'��q��E�"Z��6(C�g����D�)�<��D��_g}�P7󦻢j��I%��Y.M��3��q�	
�!ϡ�pc��f�h:O	�{"���F6An�#H|�D�[���g*�&0�Y�0�^�Svf6�#n_d����Sc��rH�*�;�'Pį!�,H�����.�'�������3IN���x!����ӳ�KEnAD�G�2z��� W)xS�U�Y�C1LDW��սd>�s:@Ja����v*
��T���������)(�Q�Fcn���N$�gn]R�m�������U�>�LCI98ۂ��C��c��*dH��0H�G�S(椠��.��/��i�"�j��̠���bd�Biк�ٲ��!��A9���5�値/#��^�6q�2Ξ�#�@/H�8��54B��N�{ƙ�J0u�6m·��ڶ�"�2D��!a�&K5�d��jX��?E�j�T@d�3̪�Q�\�1�}�;����+�>�GSX?ڵ��Al5MKr7��4�у�&���� u���L���O�����(�ҿ݁'�HoA�߮㑰��>p�#�kG6嵩��y�k\l��л툐�}S��A��T
�k�Բ����)�XEv��J,#�cX;ɀ���K�H��y��q��H(H�7A4%�h�8��=C���Đ��~�E�$4>x�]�p��kt�7�jj�>���ǻ�	cƐ��#� �e/��Hm[��s��vB�W�/C��5�ل���� ��}�`��^����R>]Ӓ�Xž�8�ù��j����(��\�����K�̧�g��;m��-e&A�H|�3n2C��9��b3�ڦW� ��a�;���S>˝������9A�9+�K��<%LNg"5>�)h]��V�*�ڔh}��x�����>LA����Gh\'�U��!���\B����^]�鐠q��MO�b��v~�).�2C�/!H�f�-��� |hR�z#�M	�(�j0Ct��uA�Ěu�
R�n�JV
I�}\z�R�r"LZj��$�4?d��
]f����	�2�$@�:����ڥ�&Hh�����d
��tF
Hw>\�Gfx�q�9F�;Re�ٽ:$��g�;���Ӂ<����)j����	�T��1��C���l�r��$��>7��S4v������V�'@�6>� ��^��m4�@�R�@��G�RU��@B���>IC��};d�՞�[v������!o���N��#���	�!�Y���\�(,R�u	�f�|z�,F(39]���3	���7X�8�^�����#ᮑ�l&VRS�զ;ߤQ�`���m���$�����=,CJ	�C:����5�B�V�h���U�$k2��W��q�C_��C`|A�gü��j{)���wY_��5�v�f�P�ͧ��<�� s튂L3d��h-�1X8k<���V)H���u 9+%G~\���������[ٛr	*�'��5�o� 	�)�~�Ŵ��iq����
ڞ*�"� i!����C���yv.�̪���;�ÁB��ծ%�ѝH6_���L� ��	�^(MI6��SߪkT�,��*H�����D�B���7a��Q�a�wqH�3��[G�Sڴ;$���"c�K:��uq�:��D�8B�y~����?�V|�X�GyT����(搨�{��2g�l�g|�vHP��Մ������W�F���&HP��d���(�s ���U4��R5QA�j�>����L�[[���Ø��x;�g�F�89;�Q�< a����>���B<�,Q����/k�W�2���'^�9$p��2b1</�H�׬ȏ�`���@z\�7�4FY�v}��V��īj��M	Z!�W;=?�!הy�����r��z���1�8d>H�A�+"G�DMU�Bޛ����v>� �c)gd }�*�	Y0���!&Р,�sd�V�;��~:$������W�p(ȃ���H�v~�O�QYU����� ?�B���ho=����~� ]�!�b&g��v?�0TE#�QZ�|}��|=Jf�+�E��yN���4j�{i�� �!]y��u�у�<%�ǿ��Yp\W�\�P5�(y�����I��f�Ӡ���\s�Oi��Z��y�̲8]�_�J ����0����&���(�IUMu��������d����F���L�!�+�]��4��\�ޥ/��N3�%����%D�;�!�@h
>� !|���6�`��S�0|Mf3�yL��b� ��ۏ�2%��IK/�ӳ��y���`	S}���c��4ʹyLT��F������L_@!�D�Y��l�T�Z��"�$H�>]'q���`2� aLE;-���R$/�!�+���}����u�1Y�$�A�1��y��=;N�C��N� �3T���� ��1͝�ϭ�]Ŭ�<�/��g����FU�|B���1��]��
(
����X�@BG��#�j�A�f�]N��^��F)��)Χ� #��0�=�I}fg���O��d�:S�������s��H��wQ�����
5�wm_�J5��R�}� �  �G���r6���}J����#L�y�	�to�m�m�I;O	-;�9�򷗺��;��|�x����!h�d�K���2�O�|
��+�Ŝ)�4�$�d�W�ٓ�Le���})N�L5������7T!�G%��t�m��(�<�.�3i�ꇨ�@B.L��.-Mu���3�з-��J�:	9\%N+��7�]/HH���]�ma0];	3p��p'�#&� ���}8����_�@�V��K�s�v7H}��E��6	��v.}�����d\����4!�'A.�ى��'��$V�a�J�^��Cn��UO����{���[N_����!���s�Ā@��$g>��?���2�J��� I���ѫ�-��oa�ǧ&͑NN�7 �+����#�yk �〒�����!7�X5ٿ�����@�ל֮�NH*̞�gu�G֠{}���%�
s��/1"��^g�L �r��:B� ~x��� V���ɿ��LF5S��A.q)y��x$.8^A¸�zZ4���*�ն�K�>d��������+����B9��":��yȃm�)����/�|e!	u��O�����5��R�|2#l�1#|M2�ٵP/�	��3�2�{�w�̼�H�1��S��=Xc��f���0�YŚ�6}'����KR���4��q �Og�i��?]����}�l�䓹�R#ȣ���a�s�鐽y�[)S��g�Y���O�-�S��3������������e�������X�K�����bM%3�r77�7:�S����v*��j��c�<f�Wϓ���~$4L��k|��ӂ�*oM��̠j�t�}�0lI!������:	�2�dK>��ʇ��<�N}8N��.d}�/,��<�Mf�a��܇0ϙ@>�6����r�<?���[w盒�BX��ˊ&a�����jji�`�S��Ǧ�ɜ�}�P�-��jҩ��ߚCOT9_���t��F�����D�7�|�=�������3<V      �   �	  x��[�v�8]C_���l�� _K�I����'J�7��(H�1E萔m��;���HH����G�ۖI�Pu�֭"�G]��i���ض���m���a2�Y$؏��3��m�ؖ����p��W�Mi�W�nk]��?�]閯t�u��S^�E���≞���8>�ͼ0Uۼ��
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