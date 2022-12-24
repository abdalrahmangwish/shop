// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, non_constant_identifier_names, sized_box_for_whitespace

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop2/modules/welcome_screen/welcom_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => WelcomeScreen())));
  }

  final Ring = SpinKitRing(
    color: Colors.white70,
    size: 100.0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: 's',
                                style: GoogleFonts.portLligatSans(
                                    textStyle:
                                        Theme.of(context).textTheme.headline1,
                                    fontSize: 60,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                                children: const [
                                  TextSpan(
                                    text: 'ho',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 60),
                                  ),
                                  TextSpan(
                                    text: 'p',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 60),
                                  ),
                                ]),
                          ),
                        ),
                        const Icon(
                          Icons.shopping_bag_outlined,
                          color: Colors.white,
                          size: 60.0,
                        )
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Ring,
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      ' WELCOME ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
