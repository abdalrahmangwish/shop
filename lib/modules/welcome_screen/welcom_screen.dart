import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop2/modules/login_screen/login_screen.dart';
import 'package:shop2/modules/register_screen/register_screen.dart';
import 'package:shop2/shared/components/components.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.orange,
              Colors.deepOrange,
            ],
          )),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            text: 's',
                            style: GoogleFonts.portLligatSans(
                              textStyle: Theme.of(context).textTheme.headline1,
                              fontSize: 60,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
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
                      const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                        size: 60.0,
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                newbutton(
                    colorRaduis: Colors.orange,
                    width: double.infinity,
                    height: 40.0,
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              // ignore: prefer_const_constructors
                              builder: (context) => LoginScreen()));
                    },
                    text: " LOGIN",
                    color: Colors.white,
                    colortext: Colors.orange),
                const SizedBox(
                  height: 20.0,
                ),
                newbutton(
                    colorRaduis: Colors.white,
                    width: double.infinity,
                    height: 40.0,
                    function: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => logoApp()));
                    },
                    text: " REGISTER",
                    color: Colors.orange,
                    colortext: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
