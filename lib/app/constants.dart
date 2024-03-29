// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

class Constants {
  static const String baseUrl = "https://api.openai.com/v1";
  static const String endPointImage = "/images/generations";
  static const String endPointText = "/completions";
  static const int apiTimeOut = 60000;
  static const String OPEN_AI_KEY = "";
  static const String empty = "";
  static const int zero = 0;

  static final glowBoxShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(.4),
      blurRadius: 6.0,
      spreadRadius: 3.0,
      offset: const Offset(
        0.0,
        3.0,
      ),
    ),
  ];

  static const darkColor = Color.fromRGBO(48, 48, 48, 1);

  static const String CLEARANCE_TOKEN =
      "xrgcmwbb.IY0lm.b5.5X452r2XVHue0qDhtshx0VlG0-1676825896-0-1-a302aeb0.d0cc7e29.285548c4-250";
  static const String SESSION_TOKEN =
      "eyJhbGciOiJkaXIiLCJlbmMiOiJBMjU2R0NNIn0..P_jFu_R8jSeKjm7H.svP13FKHHyxYN1iKJlzMu6zqZSMrNZTOV_DTleeqKJFG-jJeiMziO79eDVtk36Ij4_yjtD1ArMczg_zrZiJoeUNATC_RnLQy8s16cENRncioGmhBuxKnrE9IvSnDX3_6udYrNujlxiDRpkJhv3lUu2_oo1pEAue8pR7hdT4Pr2TcAFki5iIib-vasqgrlF-n9Iv4F9XaTDGw6glmNLRqXoCIa4P6pvesVSgF0hrrofSRIsq7ffCS3UbphL6o1IIcVuUPoNAaRzaaJPvfYTwtOZE4OR1bGIFPKVgsMSrI09NBh77UXvnvpOjwT_a83XqOB5ctZcVG_H6NNCl6orTKwjGhEbCpxkI_nXP5Wf0THPIDAd-ZGoRaf_94KXGm9nkTBfbWSEVTXrY6cm6T74BWPp316F9CN-kBvxUSZ3Tige9vgcOKAR-8O3Dkb9yY6Ybb1hWgljomnG4JQlBTUWk2RTFvXjhpUKKiw7bNsfdK1Y7arIsIOXclhtxgLReBESb7kZmxHBL862zXxEWNr3ozbpGb-KO1PZ1TnG88TmTL0e6f6Zb8IKSnz65GYzQuGw4bq3oGWHwf-u_6GOq-TpR9No2yAGeQb0h_LkfoYKK54S10s2HXFxwZZg3IvBpBrzTtCoS6HNQGDU8KcnR5ulX-L_63sxaxHVRRWwZmkFwbL29_qVErW8Zo-G458IF1nq-LD9JBauT2v9a1i7a89OOOAFE33gJjm88vZ4zvTm-sHO5D4peIM-gGnGjGaLnbGWdpB02Bbcddzdk_BvatC-3vA9piEsJ45gmqpPnvP8EUSyfVRyAx2B0o5IOQaE2azSRxAwNl-YVjU39dnJDw-rGJMvRi2-ONsjOEdiZRketlUs7qKtM5yGYMkaJqFu02TDoqTXAaVe-gs4VhGlsgkfdEE0B1kLXqT9CoTKIdHqrqBB2i0JwMbIjIMeD85Oq2BBfcBs5rac2j6qHQsmdc4I4zgvCvWYGe0CCOFy8iVdZb9oPT6g9qahIPHlOh5BHMyNaEbcNFYt1KVWjnjdARsmn0J4NE6_ajhm6dNhGfU239zYbkNDrXPFAfSNpizfcc-jjPg-VzpWYtjPUJKez9OiCBC59AjD0IlsS-4z-gtEXZJx4suLHSzKZO916pOfejKB4bpEOAMjHzH2ZzYqsOeSWI0Gc34zOt1UehPtDzwkc9JAd2tppRwKnEx3AZVSkPrSevlwVQ0YGXzL-_YQDn0_F23scg5d5_ApkeF7k18UKhreyvJ2zvDc-bvimtU26zZtyYL7dn2ZXmv4ecSUatKOdSFtcEkdIFveGNmSL4QDazCgJzCY6e47OY_UsdrC0ugS7amMB729c1UwMKrn2ZW9oul3WO14gHcN2UvG0cXXmDcmyLyuGnerBIqpXImBoMVrKl8DdLQ6Onk08S6LCcJh-B2snem6wi7VUgkGw0cpRfjs_vtAdxxQc7KujUc6Yyvz32aQAcEfQN-9Xbn7GIMXVjkXrbCtRnozUfGBz1DbYtpuYMGR5yl3aIfE0nqA5iVjwFObqq33X5o-I-Ukyv2wxqKI5agyQ5ADTtMpQ445MLUSCDyc1sU5rbBDssw9YO8biJI_ZPv2P7YLjCeJ09oSnmjTrQJpgG3MhbBnTjLbBkCLSZf1T2iQFjcedTMHJQ1oYnkSrYXeUNDYwy3Zo5XI3emLYlfSUry4aDtclatmvPSPDHhFfg_BUFW5fIKZKwTebUNid1iF0UB7DqQ9rQ10KYXdNe8GiQWMDjS-9GY7azFYUB9gGGRTASh1bDM76LvNaeEQQtvZMeVf4WfAhVeM-dV5j19P_bgckE6LV5Pywv1kSGkCdhpx81L82SrJELMlhPzdwp28utTBT5VBne_K9zKBqtREekRMzn-6CZD9VtqcPceblhKQndAE2CfiP4gGIHgxFrf5vFmZqafXXJ8zqGJgWBNLPeRlFSkMoCtmJIIVbT76y9p-t7O4vnVQtOr0bi35_nh_So4BsM4kuQueuQ9Sg0QIfMM6Vw99Ia0MnOciPeSiH5vOJNwhrge1CJEup-0eUMiMzYXJ-ZEXYOp3ywEC3lCl0uylqlWOVDAMdlFUjTC7fvOIBRQsU4zSHZ1JMv1BEV6-CcOhk9s2rwX9gmn6mYZlgcALtN5k2sATI2LcY3neabK-TEjnlxjXMckdRXuiRYIjSPjSHf2TiDjJIyN7EscivUuYxSvLEfPjI3U6cVGlaJDu0gBRGQp9LUSwOLgede91KHaJt4IlzxXDEqHidKJ3L5TxVapz8ryckmC5vr3R08HOlJCTNWQmQZSyYAvLORpejoAeh3-MvPqoxfwOVkIx20-ld60n5SqueeOyG_H1uX2HUt0Dov_qL9yiQuOtTroeEL7z4dxFgpf4p67ce7Meoq_vZ3tdcFbxxYvlAwOLpj8OY76wd_JXR1rb73oe7-PdpyA2oLtfSlBTPtxhDTRpe6Bp63cU9Ie1SEEjeWAnF-wU76ijLuhUNLofnLS5Rdjpncm_-4_1P9XFmhKZv1fWbj.NijTUoHL-mqQboD4oLSbJA";
}
