import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // androidgmailinboxh2Y (0:10)
        width: double.infinity,
        height: 812*fem,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              // rectangle8k9E (0:11)
              left: 0*fem,
              top: 708*fem,
              child: Align(
                child: SizedBox(
                  width: 375*fem,
                  height: 104*fem,
                  child: Container(
                    decoration: BoxDecoration (
                      color: Color(0xfff7f8fc),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // usernormalmailDoW (0:12)
              left: 12*fem,
              top: 349*fem,
              child: Container(
                width: 352*fem,
                height: 60*fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // ellipse3vxp (0:16)
                      margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 17*fem, 0*fem),
                      width: 37*fem,
                      height: 37*fem,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(18.5*fem),
                        image: DecorationImage (
                          fit: BoxFit.cover,
                          image: AssetImage (
                            'assets/page-1/images/ellipse-3-bg.png',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // autogroupttdsRPn (EHTRr1YitQudkbuSNmTTDS)
                      width: 298*fem,
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // autogroupyxfzMHS (EHTRzfxxQ8tdTYDNPMYxfz)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3*fem),
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // sendervE4 (0:13)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 108*fem, 0*fem),
                                  child: Text(
                                    'Stephanie Everhill',
                                    style: SafeGoogleFont (
                                      'Open Sans',
                                      fontSize: 16*ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.3625*ffem/fem,
                                      color: Color(0xff606267),
                                    ),
                                  ),
                                ),
                                Container(
                                  // amPtL (0:17)
                                  margin: EdgeInsets.fromLTRB(0*fem, 3*fem, 0*fem, 0*fem),
                                  child: Text(
                                    '11:27 pm',
                                    style: SafeGoogleFont (
                                      'Roboto',
                                      fontSize: 12*ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.1725*ffem/fem,
                                      color: Color(0xff5d5c5d),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // autogroupdje4HD2 (EHTS6axmYia6arL2vzDJE4)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 0*fem),
                            width: double.infinity,
                            height: 35*fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // autogroupnrfabzQ (EHTSB5qGsVnxd9NenNNrFa)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 29.33*fem, 0*fem),
                                  height: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // subjectXNG (0:14)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                                        child: Text(
                                          'When do we meet again?',
                                          style: SafeGoogleFont (
                                            'Roboto',
                                            fontSize: 14*ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.1725*ffem/fem,
                                            color: Color(0xff606267),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        // messageRyS (0:15)
                                        'I would meet at the Western Mall if you..',
                                        style: SafeGoogleFont (
                                          'Roboto',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.1725*ffem/fem,
                                          color: Color(0xff5d5c5d),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // vectormGc (0:18)
                                  margin: EdgeInsets.fromLTRB(0*fem, 6.85*fem, 0*fem, 0*fem),
                                  width: 16.67*fem,
                                  height: 15.85*fem,
                                  child: Image.asset(
                                    'assets/page-1/images/vector-yoe.png',
                                    width: 16.67*fem,
                                    height: 15.85*fem,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // usernormalmailGUG (0:19)
              left: 12*fem,
              top: 437*fem,
              child: Container(
                width: 353*fem,
                height: 60*fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // group2yda (0:25)
                      margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 17*fem, 0*fem),
                      width: 37*fem,
                      height: 37*fem,
                      decoration: BoxDecoration (
                        color: Color(0xffa0887e),
                        borderRadius: BorderRadius.circular(18.5*fem),
                      ),
                      child: Center(
                        child: Text(
                          'R',
                          style: SafeGoogleFont (
                            'Roboto',
                            fontSize: 24*ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.1725*ffem/fem,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // autogroup4xfeqQt (EHTShuHFsHRY9u8NMh4XFE)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 0*fem),
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // senderyGC (0:20)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3*fem),
                            child: Text(
                              'Random Bank Online',
                              style: SafeGoogleFont (
                                'Open Sans',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.3625*ffem/fem,
                                color: Color(0xff292829),
                              ),
                            ),
                          ),
                          Container(
                            // subjectHng (0:21)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                            child: Text(
                              'Random Bank Account Balance Update',
                              style: SafeGoogleFont (
                                'Roboto',
                                fontSize: 14*ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.1725*ffem/fem,
                                color: Color(0xff292829),
                              ),
                            ),
                          ),
                          Text(
                            // messageQcQ (0:22)
                            'Time to check your bank information an..',
                            style: SafeGoogleFont (
                              'Roboto',
                              fontSize: 14*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.1725*ffem/fem,
                              color: Color(0xff5d5c5d),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupn2xgwsE (EHTSr9YWxiL7tmiAkZN2xg)
                      margin: EdgeInsets.fromLTRB(0*fem, 5*fem, 0*fem, 6.15*fem),
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // june19gZv (0:23)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 18*fem),
                            child: Text(
                              'June 19',
                              style: SafeGoogleFont (
                                'Roboto',
                                fontSize: 12*ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.1725*ffem/fem,
                                color: Color(0xff292929),
                              ),
                            ),
                          ),
                          Container(
                            // vectoryov (0:24)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                            width: 16.67*fem,
                            height: 15.85*fem,
                            child: Image.asset(
                              'assets/page-1/images/vector-RRz.png',
                              width: 16.67*fem,
                              height: 15.85*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // usernormalmail6de (0:28)
              left: 12*fem,
              top: 525*fem,
              child: Container(
                width: 352*fem,
                height: 60*fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // ellipse4DiG (0:34)
                      margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 17*fem, 0*fem),
                      width: 37*fem,
                      height: 37*fem,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(18.5*fem),
                        color: Color(0xffffa827),
                        image: DecorationImage (
                          fit: BoxFit.cover,
                          image: AssetImage (
                            'assets/page-1/images/ellipse-4-bg.png',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // autogroupk2lqvMn (EHTTByJpVvkb72gpU4K2LQ)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // senderf4U (0:29)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3*fem),
                            child: Text(
                              'Taylor Grey',
                              style: SafeGoogleFont (
                                'Open Sans',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.3625*ffem/fem,
                                color: Color(0xff292829),
                              ),
                            ),
                          ),
                          Container(
                            // subjectNDn (0:30)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                            child: Text(
                              'Timesheet nextweek?',
                              style: SafeGoogleFont (
                                'Roboto',
                                fontSize: 14*ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.1725*ffem/fem,
                                color: Color(0xff292829),
                              ),
                            ),
                          ),
                          Text(
                            // messageVJQ (0:31)
                            'Hey what was our timesheet that was for..',
                            style: SafeGoogleFont (
                              'Roboto',
                              fontSize: 14*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.1725*ffem/fem,
                              color: Color(0xff5d5c5d),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupjmhzq7N (EHTTHYyrWfyKrh2BKWjmHz)
                      margin: EdgeInsets.fromLTRB(0*fem, 5*fem, 0*fem, 6.15*fem),
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // may6xSt (0:32)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 18*fem),
                            child: Text(
                              'May 6',
                              style: SafeGoogleFont (
                                'Roboto',
                                fontSize: 12*ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.1725*ffem/fem,
                                color: Color(0xff292929),
                              ),
                            ),
                          ),
                          Container(
                            // vectorHEG (0:33)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 0*fem),
                            width: 16.67*fem,
                            height: 15.85*fem,
                            child: Image.asset(
                              'assets/page-1/images/vector-6Nc.png',
                              width: 16.67*fem,
                              height: 15.85*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // usernormalmailCs2 (0:35)
              left: 12*fem,
              top: 613*fem,
              child: Container(
                width: 352*fem,
                height: 60*fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // ellipse5w3v (0:41)
                      margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 17*fem, 0*fem),
                      width: 37*fem,
                      height: 37*fem,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(18.5*fem),
                        color: Color(0xffffa827),
                        image: DecorationImage (
                          fit: BoxFit.cover,
                          image: AssetImage (
                            'assets/page-1/images/ellipse-5-bg.png',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // autogroupucpqSmN (EHTTXJ5xLPUxkozWeHucpQ)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 0*fem),
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // senderymJ (0:36)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3*fem),
                            child: Text(
                              'UniqueYou by SecretKissShop',
                              style: SafeGoogleFont (
                                'Open Sans',
                                fontSize: 16*ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.3625*ffem/fem,
                                color: Color(0xff292829),
                              ),
                            ),
                          ),
                          Container(
                            // subject6b2 (0:37)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                            child: Text(
                              'Learn new Tricks',
                              style: SafeGoogleFont (
                                'Roboto',
                                fontSize: 14*ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.1725*ffem/fem,
                                color: Color(0xff292829),
                              ),
                            ),
                          ),
                          Text(
                            // messageDfe (0:38)
                            'Now is great time to shop great new fash..',
                            style: SafeGoogleFont (
                              'Roboto',
                              fontSize: 14*ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.1725*ffem/fem,
                              color: Color(0xff5d5c5d),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupmxdnMG4 (EHTTcnvo4g61v4P3aCmxdN)
                      margin: EdgeInsets.fromLTRB(0*fem, 5*fem, 0*fem, 6.15*fem),
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // may6tFz (0:39)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 18*fem),
                            child: Text(
                              'May 6',
                              style: SafeGoogleFont (
                                'Roboto',
                                fontSize: 12*ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.1725*ffem/fem,
                                color: Color(0xff292929),
                              ),
                            ),
                          ),
                          Container(
                            // vector15i (0:40)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 0*fem),
                            width: 16.67*fem,
                            height: 15.85*fem,
                            child: Image.asset(
                              'assets/page-1/images/vector.png',
                              width: 16.67*fem,
                              height: 15.85*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // gmailothermailKcC (0:42)
              left: 21*fem,
              top: 126*fem,
              child: Container(
                width: 342*fem,
                height: 78*fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      // autogroupazkaEz4 (EHTTtsJLqEpmRjpWkDazKA)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 24*fem, 0.5*fem),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // socialiconP6G (0:50)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 31.21*fem),
                            width: 20*fem,
                            height: 15.29*fem,
                            child: Image.asset(
                              'assets/page-1/images/social-icon.png',
                              width: 20*fem,
                              height: 15.29*fem,
                            ),
                          ),
                          Container(
                            // promotionicontagJU8 (0:53)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 0*fem),
                            width: 18*fem,
                            height: 18*fem,
                            child: Image.asset(
                              'assets/page-1/images/promotion-icon-tag.png',
                              width: 18*fem,
                              height: 18*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupbikxcUp (EHTU1HHKgaCL7Xc8q7bikx)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 132*fem, 0*fem),
                      width: 105*fem,
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // autogroupfdsvwX6 (EHTU9CDoeAeBUkQdXofdsv)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 14.5*fem),
                            width: double.infinity,
                            height: 41.5*fem,
                            child: Stack(
                              children: [
                                Positioned(
                                  // senderHL4 (0:43)
                                  left: 0*fem,
                                  top: 0*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 47*fem,
                                      height: 22*fem,
                                      child: Text(
                                        'Social',
                                        style: SafeGoogleFont (
                                          'Open Sans',
                                          fontSize: 16*ffem,
                                          fontWeight: FontWeight.w700,
                                          height: 1.3625*ffem/fem,
                                          color: Color(0xff292829),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // senderPP6 (0:45)
                                  left: 0*fem,
                                  top: 21.5*fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 105*fem,
                                      height: 20*fem,
                                      child: Text(
                                        'Twitter, Twitter',
                                        style: SafeGoogleFont (
                                          'Open Sans',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w600,
                                          height: 1.3625*ffem/fem,
                                          color: Color(0xff606267),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            // sender5Wp (0:44)
                            'Promotions',
                            style: SafeGoogleFont (
                              'Open Sans',
                              fontSize: 16*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.3625*ffem/fem,
                              color: Color(0xff292829),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogroupsmje1vG (EHTUFGt1MfZ1ntQwvXSmjE)
                      width: 61*fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // numberAoA (0:46)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 25*fem),
                            width: 50*fem,
                            height: 22*fem,
                            decoration: BoxDecoration (
                              color: Color(0xff1a73e9),
                              borderRadius: BorderRadius.circular(50*fem),
                            ),
                            child: Center(
                              child: Text(
                                '2 new',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Roboto',
                                  fontSize: 13*ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.1725*ffem/fem,
                                  letterSpacing: 0.39*fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // numberdwe (0:48)
                            width: double.infinity,
                            height: 22*fem,
                            decoration: BoxDecoration (
                              color: Color(0xff198039),
                              borderRadius: BorderRadius.circular(50*fem),
                            ),
                            child: Center(
                              child: Text(
                                '99+ new',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont (
                                  'Roboto',
                                  fontSize: 13*ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.1725*ffem/fem,
                                  letterSpacing: 0.39*fem,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // messagewithfileXn8 (0:55)
              left: 12*fem,
              top: 230*fem,
              child: Container(
                width: 353*fem,
                height: 91*fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // ellipse2Fi8 (0:59)
                      margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 17*fem, 0*fem),
                      width: 37*fem,
                      height: 37*fem,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(18.5*fem),
                        image: DecorationImage (
                          fit: BoxFit.cover,
                          image: AssetImage (
                            'assets/page-1/images/ellipse-2-bg.png',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // autogrouptydwxsS (EHTUcWmcigS66ATeLGtYdW)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 40*fem, 0*fem),
                      width: 207*fem,
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // autogroup25ny5BN (EHTUj6Qz8w31xn8vGG25NY)
                            padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 7*fem),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // senderzp8 (0:56)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                                  child: Text(
                                    'Fortune Company co.',
                                    style: SafeGoogleFont (
                                      'Open Sans',
                                      fontSize: 16*ffem,
                                      fontWeight: FontWeight.w700,
                                      height: 1.3625*ffem/fem,
                                      color: Color(0xff292829),
                                    ),
                                  ),
                                ),
                                Container(
                                  // subjectX3N (0:57)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3*fem),
                                  child: Text(
                                    'Important Files!',
                                    style: SafeGoogleFont (
                                      'Roboto',
                                      fontSize: 14*ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.1725*ffem/fem,
                                      color: Color(0xff292829),
                                    ),
                                  ),
                                ),
                                Text(
                                  // messager5e (0:58)
                                  'Make sure you receive these.',
                                  style: SafeGoogleFont (
                                    'Roboto',
                                    fontSize: 14*ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.1725*ffem/fem,
                                    color: Color(0xff5d5c5d),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // fileszSk (0:63)
                            width: double.infinity,
                            height: 24*fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // frame1LWc (0:64)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 11*fem, 0*fem),
                                  padding: EdgeInsets.fromLTRB(15.33*fem, 4*fem, 14*fem, 3*fem),
                                  height: double.infinity,
                                  decoration: BoxDecoration (
                                    border: Border.all(color: Color(0xffb2b2b2)),
                                    borderRadius: BorderRadius.circular(30*fem),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // file2uE (0:65)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5.33*fem, 1*fem),
                                        width: 9.33*fem,
                                        height: 11.67*fem,
                                        child: Image.asset(
                                          'assets/page-1/images/file.png',
                                          width: 9.33*fem,
                                          height: 11.67*fem,
                                        ),
                                      ),
                                      Text(
                                        // message9U4 (0:68)
                                        'filename',
                                        style: SafeGoogleFont (
                                          'Roboto',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.1725*ffem/fem,
                                          color: Color(0xff5d5c5d),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // frame1git (0:69)
                                  padding: EdgeInsets.fromLTRB(15.33*fem, 4*fem, 14*fem, 3*fem),
                                  height: double.infinity,
                                  decoration: BoxDecoration (
                                    border: Border.all(color: Color(0xffb2b2b2)),
                                    borderRadius: BorderRadius.circular(30*fem),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        // filecMe (0:70)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5.33*fem, 1*fem),
                                        width: 9.33*fem,
                                        height: 11.67*fem,
                                        child: Image.asset(
                                          'assets/page-1/images/file-tzt.png',
                                          width: 9.33*fem,
                                          height: 11.67*fem,
                                        ),
                                      ),
                                      Text(
                                        // messagejSG (0:73)
                                        'filename',
                                        style: SafeGoogleFont (
                                          'Roboto',
                                          fontSize: 14*ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.1725*ffem/fem,
                                          color: Color(0xff5d5c5d),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // rightUPr (0:60)
                      margin: EdgeInsets.fromLTRB(0*fem, 5*fem, 0*fem, 0*fem),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // pmC4x (0:61)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 18*fem),
                            child: Text(
                              '11:27 pm',
                              style: SafeGoogleFont (
                                'Roboto',
                                fontSize: 12*ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.1725*ffem/fem,
                                color: Color(0xff292929),
                              ),
                            ),
                          ),
                          Container(
                            // vectorWrL (0:62)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                            width: 16.67*fem,
                            height: 15.85*fem,
                            child: Image.asset(
                              'assets/page-1/images/vector-448.png',
                              width: 16.67*fem,
                              height: 15.85*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // primarySV6 (0:74)
              left: 12*fem,
              top: 95*fem,
              child: Align(
                child: SizedBox(
                  width: 49*fem,
                  height: 17*fem,
                  child: Text(
                    'PRIMARY',
                    style: SafeGoogleFont (
                      'Roboto',
                      fontSize: 14*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.1725*ffem/fem,
                      color: Color(0xff4f4f4f),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // searchvv4 (0:75)
              left: 12*fem,
              top: 33*fem,
              child: Container(
                padding: EdgeInsets.fromLTRB(12*fem, 8*fem, 12*fem, 8*fem),
                width: 351*fem,
                height: 44*fem,
                decoration: BoxDecoration (
                  color: Color(0xfff7f8fc),
                  borderRadius: BorderRadius.circular(2000*fem),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // mdimenu2CQ (0:76)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                      width: 24*fem,
                      height: 24*fem,
                      child: Image.asset(
                        'assets/page-1/images/mdimenu.png',
                        width: 24*fem,
                        height: 24*fem,
                      ),
                    ),
                    Container(
                      // searchinmail7zY (0:79)
                      margin: EdgeInsets.fromLTRB(0*fem, 3*fem, 170*fem, 0*fem),
                      child: Text(
                        'Search in mail',
                        style: SafeGoogleFont (
                          'Product Sans',
                          fontSize: 16*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.2575*ffem/fem,
                          color: Color(0xff333333),
                        ),
                      ),
                    ),
                    Container(
                      // ellipse1dCC (0:80)
                      width: 28*fem,
                      height: 28*fem,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(14*fem),
                        image: DecorationImage (
                          fit: BoxFit.cover,
                          image: AssetImage (
                            'assets/page-1/images/ellipse-1-bg.png',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // mailkGp (0:81)
              left: 84*fem,
              top: 728*fem,
              child: Align(
                child: SizedBox(
                  width: 20*fem,
                  height: 16*fem,
                  child: Image.asset(
                    'assets/page-1/images/mail.png',
                    width: 20*fem,
                    height: 16*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // videoesz (0:84)
              left: 270*fem,
              top: 729*fem,
              child: Align(
                child: SizedBox(
                  width: 22*fem,
                  height: 14*fem,
                  child: Image.asset(
                    'assets/page-1/images/video.png',
                    width: 22*fem,
                    height: 14*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // frame3NZ6 (0:87)
              left: 97*fem,
              top: 720*fem,
              child: Container(
                width: 28*fem,
                height: 16*fem,
                decoration: BoxDecoration (
                  color: Color(0xffea4335),
                  borderRadius: BorderRadius.circular(50*fem),
                ),
                child: Center(
                  child: Text(
                    '99+',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont (
                      'Roboto',
                      fontSize: 10*ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.1725*ffem/fem,
                      letterSpacing: 0.3*fem,
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
          );
  }
}