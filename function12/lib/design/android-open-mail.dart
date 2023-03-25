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
      child: TextButton(
        // androidopenmailr9N (1:19)
        onPressed: () {},
        style: TextButton.styleFrom (
          padding: EdgeInsets.zero,
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(10*fem, 42*fem, 11*fem, 47*fem),
          width: double.infinity,
          height: 812*fem,
          decoration: BoxDecoration (
            color: Color(0xffffffff),
          ),
          child: Container(
            // group6Smn (302:98)
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // openmailiconstopaNC (21:141)
                  margin: EdgeInsets.fromLTRB(2*fem, 0*fem, 4.54*fem, 26.5*fem),
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // vector5Jx (20:29)
                        margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 187*fem, 0*fem),
                        width: 17*fem,
                        height: 15*fem,
                        child: Image.asset(
                          'assets/design/images/vector-hw6.png',
                          width: 17*fem,
                          height: 15*fem,
                        ),
                      ),
                      Container(
                        // groupFck (20:30)
                        margin: EdgeInsets.fromLTRB(0*fem, 2*fem, 31*fem, 0*fem),
                        width: 17*fem,
                        height: 16*fem,
                        child: Image.asset(
                          'assets/design/images/group.png',
                          width: 17*fem,
                          height: 16*fem,
                        ),
                      ),
                      Container(
                        // vectormLC (20:26)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 30*fem, 0*fem),
                        width: 15*fem,
                        height: 18*fem,
                        child: Image.asset(
                          'assets/design/images/vector.png',
                          width: 15*fem,
                          height: 18*fem,
                        ),
                      ),
                      Container(
                        // groupJ5E (20:23)
                        margin: EdgeInsets.fromLTRB(0*fem, 1.6*fem, 30*fem, 0*fem),
                        width: 17*fem,
                        height: 13.6*fem,
                        child: Image.asset(
                          'assets/design/images/group-g32.png',
                          width: 17*fem,
                          height: 13.6*fem,
                        ),
                      ),
                      Container(
                        // grouppJU (20:21)
                        margin: EdgeInsets.fromLTRB(0*fem, 1*fem, 0*fem, 0*fem),
                        width: 3.46*fem,
                        height: 15*fem,
                        child: Image.asset(
                          'assets/design/images/group-3xC.png',
                          width: 3.46*fem,
                          height: 15*fem,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // titlemessageKm2 (21:142)
                  margin: EdgeInsets.fromLTRB(5*fem, 0*fem, 2.33*fem, 29.5*fem),
                  width: double.infinity,
                  height: 86*fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // autogroupb3eb2fS (LTRsdZmkTiPMRaAxiVB3EB)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 25*fem, 0*fem),
                        width: 305*fem,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            Positioned(
                              // group5MSp (20:12)
                              left: 130*fem,
                              top: 64.5*fem,
                              child: Container(
                                width: 45*fem,
                                height: 18*fem,
                                decoration: BoxDecoration (
                                  color: Color(0xffeeeeee),
                                  borderRadius: BorderRadius.circular(5*fem),
                                ),
                                child: Center(
                                  child: Text(
                                    'Inbox',
                                    style: SafeGoogleFont (
                                      'Roboto',
                                      fontSize: 12*ffem,
                                      fontWeight: FontWeight.w500,
                                      height: 1.1725*ffem/fem,
                                      color: Color(0xff1f2024),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // sendermFe (20:16)
                              left: 0*fem,
                              top: 0*fem,
                              child: Align(
                                child: SizedBox(
                                  width: 305*fem,
                                  height: 86*fem,
                                  child: Text(
                                    'It’s HERE! NEW Deals new you! Come check out the excitement!',
                                    style: SafeGoogleFont (
                                      'Open Sans',
                                      fontSize: 21*ffem,
                                      fontWeight: FontWeight.w600,
                                      height: 1.3625*ffem/fem,
                                      color: Color(0xff292829),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // vectorSMn (20:17)
                        margin: EdgeInsets.fromLTRB(0*fem, 2.85*fem, 0*fem, 0*fem),
                        width: 16.67*fem,
                        height: 15.85*fem,
                        child: Image.asset(
                          'assets/design/images/vector-ZBE.png',
                          width: 16.67*fem,
                          height: 15.85*fem,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // senderwZS (21:143)
                  margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 4.54*fem, 37*fem),
                  height: 44*fem,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // ellipse5rwJ (20:10)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 15*fem, 1*fem),
                        width: 37*fem,
                        height: 37*fem,
                        decoration: BoxDecoration (
                          borderRadius: BorderRadius.circular(18.5*fem),
                          color: Color(0xffffa827),
                          image: DecorationImage (
                            fit: BoxFit.cover,
                            image: AssetImage (
                              'assets/design/images/ellipse-5-bg.png',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        // autogroupaqssjVJ (LTRtcHeEiDMEUiueQ2aqSs)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 14*fem, 0*fem),
                        width: 168*fem,
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              // senderFTe (20:18)
                              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 5*fem),
                              child: Text(
                                'SecretKissShop.com...',
                                style: SafeGoogleFont (
                                  'Open Sans',
                                  fontSize: 16*ffem,
                                  fontWeight: FontWeight.w600,
                                  height: 1.3625*ffem/fem,
                                  color: Color(0xff292829),
                                ),
                              ),
                            ),
                            Container(
                              // autogroup7wkoZz8 (LTRtksEGwUiYbFGkV57wko)
                              margin: EdgeInsets.fromLTRB(2*fem, 0*fem, 116.63*fem, 0*fem),
                              width: double.infinity,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // tomeuHJ (20:15)
                                    margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 5*fem, 0*fem),
                                    child: Text(
                                      'to me',
                                      style: SafeGoogleFont (
                                        'Roboto',
                                        fontSize: 14*ffem,
                                        fontWeight: FontWeight.w500,
                                        height: 1.1725*ffem/fem,
                                        color: Color(0xff333333),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // ickeyboardarrowdown48pxRFe (26:2)
                                    margin: EdgeInsets.fromLTRB(0*fem, 2.17*fem, 0*fem, 0*fem),
                                    width: 8.37*fem,
                                    height: 5.17*fem,
                                    child: Image.asset(
                                      'assets/design/images/ickeyboardarrowdown48px.png',
                                      width: 8.37*fem,
                                      height: 5.17*fem,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // may6vTJ (20:11)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 33*fem, 17*fem),
                        child: Text(
                          'May 6',
                          style: SafeGoogleFont (
                            'Roboto',
                            fontSize: 12*ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.1725*ffem/fem,
                            color: Color(0xff333333),
                          ),
                        ),
                      ),
                      Container(
                        // group3H2 (20:27)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 30*fem, 1*fem),
                        width: 16*fem,
                        height: 13*fem,
                        child: Image.asset(
                          'assets/design/images/group-b4L.png',
                          width: 16*fem,
                          height: 13*fem,
                        ),
                      ),
                      Container(
                        // groupmTv (20:19)
                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                        width: 3.46*fem,
                        height: 15*fem,
                        child: Image.asset(
                          'assets/design/images/group-xnc.png',
                          width: 3.46*fem,
                          height: 15*fem,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // admockup4T2 (21:144)
                  margin: EdgeInsets.fromLTRB(1*fem, 0*fem, 0*fem, 0*fem),
                  padding: EdgeInsets.fromLTRB(130*fem, 186.5*fem, 129*fem, 209.5*fem),
                  width: 353*fem,
                  height: 482*fem,
                  decoration: BoxDecoration (
                    color: Color(0xfff2f2f2),
                  ),
                  child: Center(
                    // placeadmockupherexoJ (21:1)
                    child: Center(
                      child: SizedBox(
                        child: Container(
                          constraints: BoxConstraints (
                            maxWidth: 94*fem,
                          ),
                          child: Text(
                            'Place AD Mockup Here',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont (
                              'Open Sans',
                              fontSize: 21*ffem,
                              fontWeight: FontWeight.w800,
                              height: 1.3625*ffem/fem,
                              color: Color(0xffbdbdbd),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
          );
  }
}