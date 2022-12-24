// ignore_for_file: avoid_unnecessary_containers, unused_import, prefer_const_constructors, avoid_print, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop2/layout/home_layout/cubit/cubit_screen.dart';
import 'package:shop2/layout/home_layout/cubit/state_screen.dart';
import 'package:shop2/modules/Myprofile/my_profile_screen.dart';
import 'package:shop2/modules/add_screen/add_screen.dart';
import 'package:shop2/modules/details_screen/details_screen.dart';
import 'package:shop2/modules/profile_screen/profile_screen.dart';
import 'package:shop2/modules/search_screen/search_screen.dart';
import 'package:shop2/modules/welcome_screen/welcom_screen.dart';
import 'package:shop2/provider.dart';
import 'package:shop2/shared/Network/Remot/dio_helper.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    print(CubitScreen.get(context).product);
    setState(() {
      loaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loaded
        ? BlocConsumer<CubitScreen, StateScreen>(
            listener: (context, state) {},
            builder: (context, state) => Scaffold(
              // drawer: Drawer(

              //   child: IconButton(
              //       onPressed: () {},
              //       icon: Icon(Icons.logout),
              //       color: Colors.black),
              // ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    const DrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.orange,
                      ),
                      child: Text(
                        'Drawer Header',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      hoverColor: Colors.black,
                      title: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfileScreen()),
                            );
                          },
                          child: const Text("PROFILE")),
                    ),
                    ListTile(
                      leading: Icon(Icons.logout),
                      hoverColor: Colors.black,
                      title: TextButton(
                          onPressed: () {
                            CubitScreen.get(context).token = '';
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WelcomeScreen()),
                                (route) => false);
                          },
                          child: Text("LOGOUT")),
                    ),
                    ListTile(
                      leading: Icon(Icons.production_quantity_limits),
                      hoverColor: Colors.black,
                      title: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyProfileScreen()),
                            );
                          },
                          child: Text("My product")),
                    ),
                  ],
                ),
              ),

              floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddScreen()));
                },
              ),
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          getData();
                        });
                      },
                      icon: const Icon(Icons.refresh)),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearhScreen()));
                      },
                      icon: const Icon(Icons.search))
                ],
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
            ),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  Widget build_progect(int index, context) {
    print(CubitScreen.get(context).product[index]['image']);
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
                // CachedNetworkImage(
                //   imageUrl: CubitScreen.get(context).product[index]['image'],
                //   placeholder: (context, url) =>
                //       Center(child: CircularProgressIndicator()),
                //   errorWidget: (context, url, error) => Icon(Icons.error),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 30),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          fit: BoxFit.cover, image: AssetImage('images/1.png')
                          // image: AssetImage(CubitScreen.get(context)
                          //     .product[widget.index]['image']),
                          )),
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
                            Container(
                              //alignment: Alignment.bottomLeft,
                              child: Text(
                                CubitScreen.get(context)
                                    .product[index]['expiry_date']
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  CubitScreen.get(context)
                                      .product[index]['views']
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.orange, fontSize: 22),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.remove_red_eye,
                                  size: 18,
                                ),
                              ],
                            )
                          ]),
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
