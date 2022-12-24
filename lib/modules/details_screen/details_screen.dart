// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, no_logic_in_create_state, unnecessary_this, annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop2/layout/home_layout/cubit/cubit_screen.dart';
import 'package:shop2/layout/home_layout/cubit/state_screen.dart';
import 'package:shop2/shared/Network/Remot/dio_helper.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatefulWidget {
  final index;

  const DetailsScreen({Key? key, this.index}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool loaded = true;
  bool like = false;
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await HttpHelper.show(
        context, CubitScreen.get(context).product[this.widget.index]['id']);
    like = await HttpHelper.showlikes(
        context, CubitScreen.get(context).product[this.widget.index]['id']);
    setState(() {
      loaded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return loaded == false
        ? BlocConsumer<CubitScreen, StateScreen>(
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(),
                backgroundColor: Colors.orange,
                body: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 30),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('images/1.png')
                                // image: AssetImage(CubitScreen.get(context)
                                //     .product[widget.index]['image']),
                                )),
                      ),
                      Row(
                        children: [
                          const Text(
                            "nameprodact:",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(CubitScreen.get(context)
                              .product[this.widget.index]['name'])
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "regular_price :",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(CubitScreen.get(context)
                              .product[this.widget.index]['regular_price']
                              .toString()),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "sale_price :",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(CubitScreen.get(context)
                              .product[this.widget.index]['sale_price']
                              .toString()),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            " quantity :",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(CubitScreen.get(context)
                              .product[this.widget.index]['quantity']
                              .toString())
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "expiry_date :",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(CubitScreen.get(context)
                              .product[this.widget.index]['expiry_date']
                              .toString())
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "category_id:",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Text(CubitScreen.get(context)
                              .product[this.widget.index]['category_id']
                              .toString())
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "commun_info :",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          IconButton(
                            onPressed: () {
                              launch(
                                  "http:<${CubitScreen.get(context).product[this.widget.index]['commun_info'].toString()}>");
                            },
                            icon: const Icon(Icons.facebook),
                            color: Colors.black,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          MaterialButton(
                            onPressed: () async {
                              if (!like) {
                                like = await HttpHelper.likes(
                                    context,
                                    CubitScreen.get(context)
                                        .product[this.widget.index]['id']);
                              } else {
                                like = await HttpHelper.deleteLike(
                                    context,
                                    CubitScreen.get(context)
                                        .product[this.widget.index]['id']);
                              }
                              setState(() {});
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              width: MediaQuery.of(context).size.width * 0.3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(
                                    Icons.favorite,
                                    color: like ? Colors.orange : Colors.black,
                                  ),
                                  Text(
                                    'like',
                                    style: TextStyle(
                                        color: like == false
                                            ? Colors.black
                                            : Colors.orange),
                                  ),
                                  Text(
                                    (CubitScreen.get(context)
                                                    .product[this.widget.index]
                                                ['sum_like'] +
                                            (like ? 1 : 0))
                                        .toString(),
                                    style: TextStyle(
                                        color: like
                                            ? Colors.orange
                                            : Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {},
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Row(
                                children: const [
                                  Icon(Icons.messenger),
                                  Text(' Comment'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                    ],
                  ),
                ),
              );
            },
            listener: (context, index) {})
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
