// ignore_for_file: non_constant_identifier_names, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, avoid_init_to_null, unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shop2/layout/home_layout/cubit/cubit_screen.dart';
import 'package:shop2/shared/Network/Remot/dio_helper.dart';
import 'package:shop2/shared/components/components.dart';
import 'dart:convert';

class AddScreen extends StatefulWidget {
  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final name = TextEditingController();

  final regular_price = TextEditingController();

  final quantity = TextEditingController();

  final expiry_date = TextEditingController();

  final category_id = TextEditingController();

  final commun_info = TextEditingController();

  final sale_price = TextEditingController();

  XFile? imageFile = null;
  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: Colors.orange),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.orange,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.orange,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.orange,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  // late File file;

  // Future pickercamera() async {
  //   // ignore: deprecated_member_use
  //   final myfile = await ImagePicker().getImage(source: ImageSource.camera);
  //   setState(() {
  //     file = File(myfile!.path);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          File file = File(imageFile!.path);

          await HttpHelper.submitSubscription(
            name: name.text,
            catName: category_id.text,
            date: expiry_date.text,
            price: regular_price.text,
            details: commun_info.text,
            file: file,
            fileName: file.path.split('/').last,
            qu: quantity.text,
            token: CubitScreen.get(context).token,
          );
          // await HttpHelper.Add(
          //   sale_price: sale_price.text,
          //   context: context,
          //   name: name.text,
          //   regular_price: regular_price.text,
          //   quantity: quantity.text,
          //   expiry_date: expiry_date.text,
          //   category_id: category_id.text,
          //   commun_info: commun_info.text,
          //   image: 'http://fbsajhfbassd',
          //   image_upload: 'http://fbsajhfbassd',
          // );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              children: [
                textAdd(
                  controller: name,
                  valedat1: () {},
                  label1: 'nameproduct',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                textAdd(
                  controller: regular_price,
                  valedat1: () {},
                  label1: 'regular_price',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                textAdd(
                  controller: quantity,
                  valedat1: () {},
                  label1: 'quantity',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.datetime,
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.parse("2030-01-01"),
                        ).then((value) {
                          expiry_date.text =
                              DateFormat("yyyy-MM-dd").format(value!);
                        });
                      },
                      controller: expiry_date,
                      decoration: const InputDecoration(
                        labelText: 'expiry_date',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                textAdd(
                  controller: category_id,
                  valedat1: () {},
                  label1: 'category_id',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                textAdd(
                  controller: commun_info,
                  valedat1: () {},
                  label1: 'Email Facebook',
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Row(
                  children: [
                    Container(
                      child: Card(
                        child: (imageFile == null)
                            ? Text("")
                            : Image.file(
                                File(imageFile!.path),
                                width: 50.0,
                                height: 50.0,
                              ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    MaterialButton(
                      textColor: Colors.white,
                      color: Colors.orange,
                      onPressed: () {
                        _showChoiceDialog(context);
                      },
                      child: const Text("Select Image"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openGallery(BuildContext context) async {
    // ignore: deprecated_member_use
    final ImagePicker pickedFile = ImagePicker();
    imageFile = await pickedFile.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {});

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    // ignore: deprecated_member_use
    final ImagePicker pickedFile = ImagePicker();
    imageFile = await pickedFile.pickImage(
      source: ImageSource.camera,
    );
    setState(() {});
    Navigator.pop(context);
  }
}
