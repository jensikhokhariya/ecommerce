import 'dart:convert';
import 'package:ecommerce/screen/api/apiclass.dart';
import 'package:http/http.dart' as http;

class Apicall {
  String apilink = "https://fakestoreapi.com/products";

  Future<List<dynamic>> getData() async {
    Uri uri = Uri.parse(apilink);
    var res = await http.get(uri);

    var s2 = jsonDecode(res.body);
    return s2.map((e)=>Store().storeFactory(e)).toList();
  }
}
