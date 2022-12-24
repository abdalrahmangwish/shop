// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shop2/layout/home_layout/cubit/cubit_screen.dart';
import 'package:shop2/provider.dart';
import 'layout/home_layout/cubit/cubit1_screen.dart';
import 'layout/home_layout/cubit/state1_screen.dart';
import 'modules/splash_screen/splash_screen.dart';

void main() async {
  // // بيتاكد ان كل شغلة بالميثود خلصت بعدين بيفتح الابليكشن
  // WidgetsFlutterBinding.ensureInitialized();
  // bool? isdark = CashPHelper.getData(key: 'isdark');
  runApp(ChangeNotifierProvider<MyProvider>(
    child: MyApp(),
    create: (context) => MyProvider(),
  ));
  // await CashHelper.init();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => CubitScreen(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                iconTheme: const IconThemeData(color: Colors.white),
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                    splashColor: Colors.white),
                primarySwatch: Colors.orange,
                appBarTheme: const AppBarTheme(
                    backgroundColor: Colors.orange,
                    // ignore: deprecated_member_use
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.orange,
                        statusBarIconBrightness: Brightness.light),
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    )),
                textTheme: const TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black))),
            darkTheme: ThemeData(
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                    splashColor: Colors.black),
                primarySwatch: Colors.orange,
                scaffoldBackgroundColor: const Color(0XFF333739),
                iconTheme: const IconThemeData(color: Colors.white),
                appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.orange,
                  // ignore: deprecated_member_use
                  backwardsCompatibility: false,
                  // top Par
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Color(0XFF333739),
                      statusBarIconBrightness: Brightness.dark),
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  iconTheme: IconThemeData(color: Colors.white),
                ),
                // style Bottom nav
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Color(0XFF333739),
                    type: BottomNavigationBarType.fixed,
                    unselectedItemColor: Colors.grey,
                    selectedItemColor: Colors.orange),

                // style Text //
                textTheme: const TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white))),
            home: SplashScreen()));
  }
}
