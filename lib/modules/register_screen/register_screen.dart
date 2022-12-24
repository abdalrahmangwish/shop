// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop2/layout/home_layout/cubit/cubit_screen.dart';
import 'package:shop2/layout/home_layout/cubit/state_screen.dart';
import 'package:shop2/modules/clips2/clips2.dart';
import 'package:shop2/modules/home_screen/home_screen.dart';
import 'package:shop2/shared/Network/Remot/dio_helper.dart';
import 'package:shop2/shared/components/components.dart';

class logoApp extends StatefulWidget {
  logoApp({Key? key}) : super(key: key);

  @override
  State<logoApp> createState() => _logoAppState();
}

class _logoAppState extends State<logoApp> {
  var fromkey2 = GlobalKey<FormState>();
  TextEditingController controllername = TextEditingController();
  TextEditingController controllerpassword = TextEditingController();
  TextEditingController controllerEmailId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitScreen, StateScreen>(
      bloc: CubitScreen(),
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: fromkey2,
            child: Column(
              children: [
                Stack(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.backspace),
                      color: Colors.white,
                    ),
                    ClipPath(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        color: Colors.orange,
                      ),
                      clipper: CustomClipPath(),
                    ),
                  ],
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
                          typ: TextInputType.emailAddress,
                          controllerr: controllername,
                          valedat: (value) {
                            if (value.isEmpty) {
                              return 'User name  must not be Empty';
                            }
                            return null;
                          },
                          prefixe: const Icon(Icons.lock),
                          lable: 'User name',
                          obscur: false,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Mytextform(
                          typ: TextInputType.emailAddress,
                          controllerr: controllerEmailId,
                          valedat: (value) {
                            if (value.isEmpty) {
                              return 'Email Id  must not be Empty';
                            }
                            return null;
                          },
                          prefixe: const Icon(Icons.email),
                          lable: 'Email Id',
                          obscur: false,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        Mytextform(
                          typ: TextInputType.visiblePassword,
                          controllerr: controllerpassword,
                          valedat: (value) {
                            if (value.isEmpty) {
                              return 'Password  must not be Empty';
                            }
                            return null;
                          },
                          prefixe: const Icon(Icons.email),
                          lable: 'PassWord',
                          sufix: const Icon(Icons.remove_red_eye_outlined),
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
                              if (fromkey2.currentState!.validate()) {
                                bool res = await HttpHelper.register(
                                    context: context,
                                    name: controllername.text,
                                    email: controllerEmailId.text,
                                    password: controllerpassword.text);
                                if (res) {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomeScreen()),
                                      (route) => false);
                                }
                              }
                            },
                            text: "REGISTER",
                            color: Colors.orange,
                            colortext: Colors.white),
                        const SizedBox(
                          height: 20.0,
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
