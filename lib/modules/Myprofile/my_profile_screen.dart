// ignore_for_file: avoid_unnecessary_containers, unused_import, non_constant_identifier_names, prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop2/layout/home_layout/cubit/cubit_screen.dart';
import 'package:shop2/layout/home_layout/cubit/state_screen.dart';
import 'package:shop2/modules/add_screen/add_screen.dart';
import 'package:shop2/modules/details_screen/details_screen.dart';
import 'package:shop2/modules/profile_screen/profile_screen.dart';
import 'package:shop2/modules/search_screen/search_screen.dart';
import 'package:shop2/modules/welcome_screen/welcom_screen.dart';
import 'package:shop2/provider.dart';
import 'package:shop2/shared/Network/Remot/dio_helper.dart';

// ignore: must_be_immutable
class MyProfileScreen extends StatefulWidget {
  MyProfileScreen({Key? key}) : super(key: key);

  @override
  State<MyProfileScreen> createState() => _MyProfileScreen();
}

class _MyProfileScreen extends State<MyProfileScreen> {
  bool loaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    setState(() {
      loaded = false;
    });
    await HttpHelper.getProduct(context);
    setState(() {
      loaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loaded
        ? BlocConsumer<CubitScreen, StateScreen>(
            listener: (context, state) {},
            builder: (context, state) {
              print(CubitScreen.get(context).token);
              return Scaffold(
                appBar: AppBar(
                  title: const Text("My products"),
                ),
                body: Container(
                  // width: double.infinity,
                  //height: 1000.0,
                  child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return build_progect(index, context);
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 5.0,
                    ),
                    itemCount: CubitScreen.get(context).product.length,
                  ),
                ),
              );
            })
        : const Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget build_progect(int index, context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(
                      index: index,
                    )));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(alignment: Alignment.bottomCenter, children: [
                const Image(
                  image: AssetImage('images/1.png'),
                  height: 200.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      //right lift
                      vertical: 10.0,
                      horizontal: 10.0),
                  width: double.infinity,
                  color: Colors.black45.withOpacity(.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        CubitScreen.get(context).product[index]['name'],
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            CubitScreen.get(context).product[index]
                                ['expiry_date'],
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          PopupMenuButton(
                              itemBuilder: (context) => [
                                    PopupMenuItem(
                                      child: TextButton(
                                        child: const Text("Deleat"),
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      'Are you sure !! '),
                                                  actions: [
                                                    TextButton(
                                                        child: const Text("no"),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        }),
                                                    TextButton(
                                                        child:
                                                            const Text("yes"),
                                                        onPressed: () {
                                                          HttpHelper.deletProduct(
                                                              context,
                                                              CubitScreen.get(
                                                                          context)
                                                                      .product[
                                                                  index]['id']);
                                                          Navigator.pop(
                                                              context);
                                                        }),
                                                  ],
                                                );
                                              });
                                        },
                                      ),
                                      value: 1,
                                    ),
                                    PopupMenuItem(
                                      child: TextButton(
                                        child: const Text("Edit"),
                                        onPressed: () {
                                          // showDialog(
                                          //     context: context,
                                          //     builder: (BuildContext context) {
                                          //       return AlertDialog(
                                          //         title: Column(
                                          //           children: [
                                          //             TextFormField(),
                                          //             const SizedBox(
                                          //               height: 10.0,
                                          //             ),
                                          //             TextFormField(),
                                          //           ],
                                          //         ),
                                          //         actions: [
                                          //           TextButton(
                                          //               child: Text("no"),
                                          //               onPressed: () {
                                          //                 Navigator.pop(
                                          //                     context);
                                          //               }),
                                          //           TextButton(
                                          //               child: Text("yes"),
                                          //               onPressed: () {
                                          //                 HttpHelper.deletProduct(
                                          //                     context,
                                          //                     CubitScreen.get(
                                          //                                 context)
                                          //                             .product[
                                          //                         index]['id']);
                                          //                 Navigator.pop(
                                          //                     context);
                                          //               }),
                                          //         ],
                                          //       );
                                          //     });
                                        },
                                      ),
                                      value: 2,
                                    )
                                  ])
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
