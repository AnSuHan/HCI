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
        // androidgmailinboxZC4 (1:26)
        width: double.infinity,
        height: 812*fem,
        decoration: BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              // rectangle85gC (302:7)
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
              // usernormalmailPwn (10:102)
              left: 12*fem,
              top: 349*fem,
              child: Container(
                width: 352*fem,
                height: 60*fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // ellipse3vB2 (10:8)
                      margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 17*fem, 0*fem),
                      width: 37*fem,
                      height: 37*fem,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(18.5*fem),
                        image: DecorationImage (
                          fit: BoxFit.cover,
                          image: AssetImage (
                            'assets/design/images/ellipse-3-bg.png',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // autogroup7ruhRda (LTRuYLvVt2dGYfPtYA7ruh)
                      width: 298*fem,
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // autogrouptzp7mSY (LTRuhFqKF8TK2qYJKNtZp7)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 3*fem),
                            width: double.infinity,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // senderJBa (10:5)
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
                                  // amCnk (10:10)
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
                            // autogroupnvssux4 (LTRupLTrN8kLTvtXndNVSs)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 0*fem),
                            width: double.infinity,
                            height: 35*fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // autogroupgrbrdt4 (LTRuvanSeYtXxtnW2SGRbR)
                                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 29.33*fem, 0*fem),
                                  height: double.infinity,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        // subjectyBE (10:6)
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
                                        // message5zx (10:7)
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
                                  // vectorE7A (10:11)
                                  margin: EdgeInsets.fromLTRB(0*fem, 6.85*fem, 0*fem, 0*fem),
                                  width: 16.67*fem,
                                  height: 15.85*fem,
                                  child: Image.asset(
                                    'assets/design/images/vector-tBJ.png',
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
              // usernormalmailwGU (10:103)
              left: 12*fem,
              top: 437*fem,
              child: Container(
                width: 353*fem,
                height: 60*fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // group2sA8 (10:20)
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
                      // autogroup64h1wfn (LTRvX9dBQzCqCE5Q9F64H1)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 1*fem, 0*fem),
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // senderGTA (10:12)
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
                            // subjectz8G (10:13)
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
                            // messageWMW (10:14)
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
                      // autogrouppzztSkx (LTRvfPtSWR7Qw6fCY7PZzT)
                      margin: EdgeInsets.fromLTRB(0*fem, 5*fem, 0*fem, 6.15*fem),
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // june19BCk (10:17)
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
                            // vectorWF2 (10:18)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                            width: 16.67*fem,
                            height: 15.85*fem,
                            child: Image.asset(
                              'assets/design/images/vector-yXv.png',
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
              // usernormalmailRsn (10:104)
              left: 12*fem,
              top: 525*fem,
              child: Container(
                width: 352*fem,
                height: 60*fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // ellipse4x72 (10:28)
                      margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 17*fem, 0*fem),
                      width: 37*fem,
                      height: 37*fem,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(18.5*fem),
                        color: Color(0xffffa827),
                        image: DecorationImage (
                          fit: BoxFit.cover,
                          image: AssetImage (
                            'assets/design/images/ellipse-4-bg.png',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // autogroup6xpo4vk (LTRw3iaaZPzMwjzdww6Xpo)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // senderD2x (10:21)
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
                            // subjectJaC (10:22)
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
                            // message1Di (10:23)
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
                      // autogroupir6pwdA (LTRwBiMFoT3tuNjxaAir6P)
                      margin: EdgeInsets.fromLTRB(0*fem, 5*fem, 0*fem, 6.15*fem),
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // may6sWp (10:25)
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
                            // vectoraw2 (10:26)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 0*fem),
                            width: 16.67*fem,
                            height: 15.85*fem,
                            child: Image.asset(
                              'assets/design/images/vector-FrG.png',
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
              // usernormalmailuCc (10:105)
              left: 12*fem,
              top: 613*fem,
              child: Container(
                width: 352*fem,
                height: 60*fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // ellipse52Y8 (10:35)
                      margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 17*fem, 0*fem),
                      width: 37*fem,
                      height: 37*fem,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(18.5*fem),
                        color: Color(0xffffa827),
                        image: DecorationImage (
                          fit: BoxFit.cover,
                          image: AssetImage (
                            'assets/design/images/ellipse-5-bg-A5n.png',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // autogroupj29hw9J (LTRwZ354SvYeo4jUuTj29H)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 2*fem, 0*fem),
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // sender5FW (10:30)
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
                            // subjectCL8 (10:31)
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
                            // messageX7W (21:158)
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
                      // autogroup2xrjTmr (LTRwhHLKYMTEXwKHJL2Xrj)
                      margin: EdgeInsets.fromLTRB(0*fem, 5*fem, 0*fem, 6.15*fem),
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // may6QSC (10:33)
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
                            // vectorXmi (10:34)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 3*fem, 0*fem),
                            width: 16.67*fem,
                            height: 15.85*fem,
                            child: Image.asset(
                              'assets/design/images/vector-24G.png',
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
              // gmailothermailSdn (10:101)
              left: 21*fem,
              top: 126*fem,
              child: Container(
                width: 342*fem,
                height: 78*fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      // autogroupxvp5xc8 (LTRx3BvpN2VPLcEkwNXvP5)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 24*fem, 0.5*fem),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // socialiconJR6 (10:52)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 31.21*fem),
                            width: 20*fem,
                            height: 15.29*fem,
                            child: Image.asset(
                              'assets/design/images/social-icon.png',
                              width: 20*fem,
                              height: 15.29*fem,
                            ),
                          ),
                          Container(
                            // promotionicontagPSY (10:64)
                            width: 18*fem,
                            height: 18*fem,
                            child: Image.asset(
                              'assets/design/images/promotion-icon-tag.png',
                              width: 18*fem,
                              height: 18*fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // autogrouplezyKLC (LTRxA24mdewMzTkWdzLeZy)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 132*fem, 0*fem),
                      width: 105*fem,
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // autogroupgbzuSvc (LTRxGBZAdcTsu1hexFgBZu)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 14.5*fem),
                            width: double.infinity,
                            height: 41.5*fem,
                            child: Stack(
                              children: [
                                Positioned(
                                  // senderyvY (10:53)
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
                                  // sender6EU (10:54)
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
                            // senderC2c (10:60)
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
                      // autogroupww6pjoE (LTRxPmAsTNSztaiqxmWW6P)
                      width: 61*fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // numberHpk (10:55)
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
                            // numberNbJ (10:61)
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
              // messagewithfileTMr (10:100)
              left: 12*fem,
              top: 230*fem,
              child: Container(
                width: 353*fem,
                height: 91*fem,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // ellipse2Mi8 (10:1)
                      margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 17*fem, 0*fem),
                      width: 37*fem,
                      height: 37*fem,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(18.5*fem),
                        image: DecorationImage (
                          fit: BoxFit.cover,
                          image: AssetImage (
                            'assets/design/images/ellipse-2-bg.png',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // autogroupr3ej4sS (LTRxpVxejfAk7CUF9NR3Ej)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 40*fem, 0*fem),
                      width: 207*fem,
                      height: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // autogroupsw5doa8 (LTRxzVfznizfJjuPvfSw5D)
                            padding: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 7*fem),
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // senderwRS (6:44)
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
                                  // subjectf6Y (6:48)
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
                                  // messagengx (6:49)
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
                            // files8Vv (6:53)
                            width: double.infinity,
                            height: 24*fem,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  // frame1tV6 (6:54)
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
                                        // fileb8c (6:55)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5.33*fem, 1*fem),
                                        width: 9.33*fem,
                                        height: 11.67*fem,
                                        child: Image.asset(
                                          'assets/design/images/file-7Fe.png',
                                          width: 9.33*fem,
                                          height: 11.67*fem,
                                        ),
                                      ),
                                      Text(
                                        // messageK4c (6:58)
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
                                  // frame14nt (6:59)
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
                                        // fileoEg (6:60)
                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5.33*fem, 1*fem),
                                        width: 9.33*fem,
                                        height: 11.67*fem,
                                        child: Image.asset(
                                          'assets/design/images/file.png',
                                          width: 9.33*fem,
                                          height: 11.67*fem,
                                        ),
                                      ),
                                      Text(
                                        // messageKyi (6:63)
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
                      // right5CC (6:50)
                      margin: EdgeInsets.fromLTRB(0*fem, 5*fem, 0*fem, 0*fem),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            // pmRG4 (6:51)
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
                            // vectorwEQ (6:52)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4*fem, 0*fem),
                            width: 16.67*fem,
                            height: 15.85*fem,
                            child: Image.asset(
                              'assets/design/images/vector-G2C.png',
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
              // primaryrcG (1:64)
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
              // searchAN4 (1:93)
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
                      // mdimenusGU (1:94)
                      margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 10*fem, 0*fem),
                      width: 24*fem,
                      height: 24*fem,
                      child: Image.asset(
                        'assets/design/images/mdimenu.png',
                        width: 24*fem,
                        height: 24*fem,
                      ),
                    ),
                    Container(
                      // searchinmailC3r (1:97)
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
                      // ellipse1iH6 (1:98)
                      width: 28*fem,
                      height: 28*fem,
                      decoration: BoxDecoration (
                        borderRadius: BorderRadius.circular(14*fem),
                        image: DecorationImage (
                          fit: BoxFit.cover,
                          image: AssetImage (
                            'assets/design/images/ellipse-1-bg.png',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // maileAk (1:102)
              left: 84*fem,
              top: 728*fem,
              child: Align(
                child: SizedBox(
                  width: 20*fem,
                  height: 16*fem,
                  child: Image.asset(
                    'assets/design/images/mail.png',
                    width: 20*fem,
                    height: 16*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // videoA96 (1:105)
              left: 270*fem,
              top: 729*fem,
              child: Align(
                child: SizedBox(
                  width: 22*fem,
                  height: 14*fem,
                  child: Image.asset(
                    'assets/design/images/video.png',
                    width: 22*fem,
                    height: 14*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // frame3UQg (1:109)
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