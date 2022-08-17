
import 'package:shared_preferences/shared_preferences.dart';
class Shr{
  void setTheme(bool value)async{
    var shrp = await SharedPreferences.getInstance();
    shrp.setBool("theme", value);
  }
  Future<bool?> getTheme(bool value)async{
    var shrp = await SharedPreferences.getInstance();
    return  shrp.getBool("theme");
  }
}