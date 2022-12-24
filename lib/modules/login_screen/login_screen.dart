// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop2/layout/home_layout/cubit/cubit_screen.dart';
import 'package:shop2/layout/home_layout/cubit/state_screen.dart';
import 'package:shop2/modules/clips2/clips2.dart';
import 'package:shop2/modules/home_screen/home_screen.dart';
import 'package:shop2/modules/register_screen/register_screen.dart';
import 'package:shop2/shared/components/components.dart';

import '../../shared/Network/Remot/dio_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

// ignore: duplicate_ignore
class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();
  var EmailController = TextEditingController();
  var PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitScreen, StateScreen>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                ClipPath(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    color: Colors.orange,
                  ),
                  clipper: CustomClipPath(),
                ),
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
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
                                      textStyle:
                                          Theme.of(context).textTheme.headline1,
                                      fontSize: 60,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.orange,
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
                                            color: Colors.orange, fontSize: 60),
                                      ),
                                    ]),
                              ),
                              const Icon(
                                Icons.shopping_bag_outlined,
                                color: Colors.orange,
                                size: 60.0,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Mytextform(
                          typ: TextInputType.visiblePassword,
                          controllerr: EmailController,
                          valedat: (String value) {
                            if (value.isEmpty) {
                              return "Email Address must be not Embty";
                            }
                            return null;
                          },
                          prefixe: const Icon(Icons.email),
                          lable: 'EmailAdress',
                          obscur: false,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Mytextform(
                          controllerr: PasswordController,
                          typ: TextInputType.emailAddress,
                          valedat: (String value) {
                            if (value.isEmpty) {
                              return "Password must be not Embty";
                            }
                            return null;
                          },
                          prefixe: const Icon(Icons.lock),
                          sufix: const Icon(Icons.remove_red_eye_outlined),
                          lable: 'password',
                          obscur: true,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        newbutton(
                            colorRaduis: Colors.orange,
                            width: double.infinity,
                            height: 40.0,
                            function: () async {
                              if (formKey.currentState!.validate()) {
                                bool res = await HttpHelper.login(
                                    context: context,
                                    email: EmailController.text,
                                    password: PasswordController.text);
                                if (res) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()),
                                      (route) => false);
                                }
                              }
                            },
                            text: " LOGIN",
                            color: Colors.orange,
                            colortext: Colors.white),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              const Text(
                                'already have an accunt ?',
                                style: TextStyle(fontSize: 15.0),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => logoApp()));
                                  },
                                  child: const Text(
                                    'Register Now',
                                    style: TextStyle(
                                        fontSize: 15.0, color: Colors.orange),
                                  )),
                            ],
                          ),
                        ),
                      ],
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
