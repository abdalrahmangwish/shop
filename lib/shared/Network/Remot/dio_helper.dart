// ignore_for_file: non_constant_identifier_names, duplicate_ignore, unused_local_variable, avoid_print, unused_import

import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shop2/layout/home_layout/cubit/cubit_screen.dart';
import 'package:shop2/provider.dart';

class HttpHelper {
  static Future<bool> register(
      {required String name,
      required String email,
      required String password,
      required BuildContext context}) async {
    var url = Uri.parse('http://10.0.2.2:8000/api/register');
    var response = await http.post(url, body: {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": password
    });

    print(response.statusCode);
    var decodedRespon = jsonDecode(response.body);
    CubitScreen.get(context).token = decodedRespon['token'];
    print(CubitScreen.get(context).token);
    CubitScreen.get(context).Myemail = email;
    CubitScreen.get(context).Myname = name;

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> login(
      {required String email,
      required String password,
      required context}) async {
    var urlLOGIN = Uri.parse('http://10.0.2.2:8000/api/login');
    var respons = await http
        .post(urlLOGIN, body: {"email": email, " password": password});
    var decodedRespon = jsonDecode(respons.body);
    CubitScreen.get(context).token = decodedRespon['token'];

    if (respons.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  // ignore: duplicate_ignore
  static Future<bool> Add(
      {required String name,
      // ignore: non_constant_identifier_names
      required String regular_price,
      required File? image,
      required String quantity,
      required String expiry_date,
      required String category_id,
      required String commun_info,
      required String sale_price,
      required context}) async {
    var urlAdd = Uri.parse('http://10.0.2.2:8000/api/products');

    var responsAdd = await http.post(urlAdd, body: {
      "name": name,
      "slug": "slug",
      "regular_price": regular_price,
      "image": 'http://10.0.2.2:8000/api/products',
      "quantity": quantity,
      "expiry_date": expiry_date,
      "category_id": category_id,
      "commun_info": commun_info,
      "sale_price": sale_price,
    }, headers: {
      "Authorization": "Bearer ${CubitScreen.get(context).token}"
    });
    print(responsAdd.statusCode);
    if (responsAdd.statusCode == 200) {
      print(responsAdd.statusCode);
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> getProduct(context) async {
    var url = Uri.parse('http://10.0.2.2:8000/api/products');
    var respons = await http.get(url, headers: {
      "Authorization": "Bearer ${CubitScreen.get(context).token}",
      "Connection": "keep-alive"
    });

    if (respons.statusCode == 200) {
      var decodedRespon = jsonDecode(respons.body);
      print(respons.body);
      CubitScreen.get(context).product = decodedRespon['data'];
      return true;
    }
    return false;
  }

  static Future<bool> search({
    required context,
    required String name,
  }) async {
    var url = Uri.parse('http://10.0.2.2:8000/api/search');
    var respons = await http.post(url,
        body: {"name": name, "search": "name"},
        headers: {"Authorization": "Bearer ${CubitScreen.get(context).token}"});
    print(respons.statusCode);
    if (respons.statusCode == 200) {
      var decodedRespon = jsonDecode(respons.body);
      CubitScreen.get(context).feltirsearch = decodedRespon['product'];
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> deletProduct(context, int id) async {
    print(CubitScreen.get(context).token);
    var url = Uri.parse('http://10.0.2.2:8000/api/products/$id');
    var respons = await http.delete(url,
        headers: {"Authorization": "Bearer ${CubitScreen.get(context).token}"});
    print(respons.statusCode);
    if (respons.statusCode == 200) {
      return true;
    }
    return false;
  }

  static Future<bool> show(context, int id) async {
    print(CubitScreen.get(context).token);
    var url = Uri.parse('http://10.0.2.2:8000/api/products/$id');
    var respons = await http.get(url,
        headers: {"Authorization": "Bearer ${CubitScreen.get(context).token}"});
    print(respons.statusCode);
    if (respons.statusCode == 200) {
      var decodedRespon = jsonDecode(respons.body);
      print(respons.body);
      return true;
    }
    return false;
  }

  static Future<bool> likes(context, int id) async {
    print(CubitScreen.get(context).token);
    var url = Uri.parse('http://10.0.2.2:8000/api/likes/$id');
    var respons = await http.get(url,
        headers: {"Authorization": "Bearer ${CubitScreen.get(context).token}"});
    if (respons.statusCode == 200) {
      print(respons.body);
      return true;
    }
    return false;
  }

  static Future<bool> deleteLike(context, int id) async {
    var url = Uri.parse('http://10.0.2.2:8000/api/likes/$id');
    var respons = await http.delete(url,
        headers: {"Authorization": "Bearer ${CubitScreen.get(context).token}"});
    if (respons.statusCode == 200) {
      return false;
    }
    return true;
  }

  static Future<bool> showlikes(context, int id) async {
    var url = Uri.parse('http://10.0.2.2:8000/api/showLike/$id');
    var respons = await http.get(url,
        headers: {"Authorization": "Bearer ${CubitScreen.get(context).token}"});

    if (respons.statusCode == 200) {
      if (respons.body == '1') {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  static Future<bool> comments(context, int id) async {
    print(CubitScreen.get(context).token);
    var url = Uri.parse('http://10.0.2.2:8000/api/products/$id');
    var respons = await http.post(url,
        headers: {"Authorization": "Bearer ${CubitScreen.get(context).token}"});
    print(respons.statusCode);
    if (respons.statusCode == 200) {
      var decodedRespon = jsonDecode(respons.body);
      print(respons.body);
      return true;
    }
    return false;
  }

  static Future<int> submitSubscription({
    required String token,
    required File file,
    required String fileName,
    required String name,
    required String price,
    required String qu,
    required String catName,
    required String date,
    required String details,
  }) async {
    ///MultiPart request
    print(token);
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://10.0.2.2:8000/api/products"),
    );
    Map<String, String> headers = {
      "Authorization": "Bearer $token",
    };
    request.files.add(
      http.MultipartFile(
        'image',
        file.readAsBytes().asStream(),
        file.lengthSync(),
        filename: fileName,
      ),
    );
    request.headers.addAll(headers);
    request.fields.addAll({
      "name": name,
      "slug": name,
      "regular_price": price,
      "quantity": qu,
      "expiry_date": date.substring(0, 10),
      "commun_info": "http://127.0.0.1:8000/api/products",
      "category_id": catName
    });
    print("request: " + request.toString());
    var res = await request.send();
    print(res.statusCode);
    return res.statusCode;
    // var url = Uri.parse('http://10.0.2.2:8000/api/products');
    // var response = await http.post(url, body: {
    // "name": name,
    // "slug": name,
    // "regular_price": price,
    // "quantity": qu,
    // "image": "http://127.0.0.1:8000/api/products",
    // "expiry_date": date.substring(0, 10),
    // "commun_info": "http://127.0.0.1:8000/api/products",
    // "category_id": getCatId(catName)
  }
}
