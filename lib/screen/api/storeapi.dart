import 'dart:convert';
import 'package:http/http.dart' as http;

class Apicall{
  String apilink = "https://fakestoreapi.com/products";

  Future<List> getData()async{
    Uri uri= Uri.parse(apilink);
    var res = await http.get(uri);

    var jsonData= jsonDecode(res.body);
    //return jsonData;
  }
}