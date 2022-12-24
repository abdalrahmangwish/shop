// ignore_for_file: must_be_immutable, camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class newbutton extends StatelessWidget {
  double width;
  double height;
  Function function;
  String text;
  Color color;
  Color colortext;
  Color colorRaduis;

  newbutton(
      {required this.function,
      required this.height,
      required this.text,
      required this.width,
      required this.color,
      required this.colortext,
      required this.colorRaduis});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40.0,
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: colorRaduis, width: 2),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: const Color(0xffdf8e33).withAlpha(100),
                  offset: const Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: color),
        child: MaterialButton(
          onPressed: () {
            function();
          },
          child: Text(
            text,
            style: TextStyle(color: colortext),
          ),
        ),
      ),
    );
  }
} //final Widget? suffixIcon;

class Mytextform extends StatelessWidget {
  Icon prefixe;
  final Icon? sufix;
  String lable;
  bool obscur;
  Function valedat;
  TextEditingController controllerr;
  TextInputType typ;
  Function? onchandges;

  Mytextform({
    required this.lable,
    required this.obscur,
    required this.prefixe,
    required this.valedat,
    required this.controllerr,
    required this.typ,
    this.sufix,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: TextFormField(
          keyboardType: typ,
          controller: controllerr,
          validator: (value) {
            return valedat(value);
          },
          onChanged: (value) {},
          decoration: InputDecoration(
              border: const UnderlineInputBorder(),
              prefixIcon: prefixe,
              labelText: lable,
              suffixIcon: sufix != null
                  ? const Icon(Icons.remove_red_eye_outlined)
                  : Container(
                      width: 0,
                    )),
          obscureText: obscur,
        ),
      ),
    );
  }
}

class MyLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
                color: Colors.orange,
              ),
              children: const [
                TextSpan(
                  text: 'ho',
                  style: TextStyle(color: Colors.black, fontSize: 60),
                ),
                TextSpan(
                  text: 'p',
                  style: TextStyle(color: Colors.orange, fontSize: 60),
                ),
              ]),
        ),
        const Icon(
          Icons.shopping_bag_outlined,
          color: Colors.orange,
          size: 60.0,
        )
      ],
    );
  }
}

class textAdd extends StatelessWidget {
  Function valedat1;
  TextEditingController controller;
  String label1;
  textAdd(
      {required this.valedat1, required this.controller, required this.label1});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: TextFormField(
          controller: controller,
          validator: (value) {
            return valedat1(value);
          },
          decoration: InputDecoration(
            labelText: label1,
          ),
        ),
      ),
    );
  }
}
