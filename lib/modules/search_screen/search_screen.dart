// ignore_for_file: unused_import, unused_local_variable, prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop2/layout/home_layout/cubit/cubit1_screen.dart';
import 'package:shop2/layout/home_layout/cubit/cubit_screen.dart';
import 'package:shop2/layout/home_layout/cubit/state1_screen.dart';
import 'package:shop2/modules/details_screen/details_screen.dart';
import 'package:shop2/shared/Network/Remot/dio_helper.dart';
import 'package:shop2/shared/components/components.dart';

// ignore: must_be_immutable
class SearhScreen extends StatefulWidget {
  SearhScreen({Key? key}) : super(key: key);

  @override
  State<SearhScreen> createState() => _SearhScreenState();
}

class _SearhScreenState extends State<SearhScreen> {
  var searchController = TextEditingController();
  bool exite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: TextFormField(
              onFieldSubmitted: (val) async {
                bool res = await HttpHelper.search(context: context, name: val);
                setState(() {});
              },
              keyboardType: TextInputType.text,
              controller: searchController,
              decoration: const InputDecoration(
                labelText: 'search',
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                            index: index,
                          )));
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
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
                          children: [
                            Text(
                              CubitScreen.get(context).feltirsearch[index]
                                  ['name'],
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Row(children: [
                              Container(
                                //alignment: Alignment.bottomLeft,
                                child: Text(
                                  CubitScreen.get(context).feltirsearch[index]
                                      ['name'],
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              const SizedBox(
                                width: 200.0,
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          );
        },
        itemCount: CubitScreen.get(context).feltirsearch.length,
      ),
    );
  }
}


  // Image(
  //                     image: AssetImage('images/1.png'),
  //                     height: 200.0,
  //                     width: 50.0,
  //                     fit: BoxFit.cover,
  //                   ),
  //  Text(
  //                           CubitScreen.get(context).feltirsearch[index]
  //                               ['name'],
  //                           style: const TextStyle(
  //                             fontSize: 20.0,
  //                             fontWeight: FontWeight.bold,
  //                             color: Colors.white,
  //                           ),