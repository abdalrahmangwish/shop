// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop2/layout/home_layout/cubit/state_screen.dart';

// ignore: duplicate_ignore
class CubitScreen extends Cubit<StateScreen> {
  CubitScreen() : super(InetialState());
  static CubitScreen get(context) => BlocProvider.of(context);
  int currentindex = 0;
  late String token;
  late List product;
  late String Myname;
  late String Myemail;
  List feltirsearch = [];

  // ignore: non_constant_identifier_names
  List<BottomNavigationBarItem> BottomNav = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home_rounded), label: 'Home'),
    const BottomNavigationBarItem(
        label: "Detils", icon: Icon(Icons.details_rounded)),
  ];
  void curreuntNav(int index) {
    currentindex = index;
    emit(BottomNavState());
  }
}
