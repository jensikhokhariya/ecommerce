import 'dart:convert';
import 'package:ecommerce/screen/api/apiclass.dart';
import 'package:http/http.dart' as http;

class Apicall {
  String apilink = "https://fakestoreapi.com/products";

  Future<Store> getData() async {
    Uri uri = Uri.parse(apilink);
    var res = await http.get(uri);

    var jsonData = jsonDecode(res.body);
    return Store().storeFactory(jsonData);
  }
}
