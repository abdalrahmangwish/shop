// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop2/layout/home_layout/cubit/cubit_screen.dart';
import 'package:shop2/layout/home_layout/cubit/state_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitScreen, StateScreen>(
      builder: (BuildContext context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text(
              "My Profile",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: Container(
            color: Colors.orange,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200.0,
                      child: const Image(image: AssetImage('images/2.png'))),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.person, color: Colors.black),
                      const SizedBox(
                        width: 50.0,
                      ),
                      Text(
                        CubitScreen.get(context).Myname,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.email, color: Colors.black),
                      const SizedBox(
                        width: 50.0,
                      ),
                      Text(
                        CubitScreen.get(context).Myemail,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
