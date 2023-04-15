import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  Future storeGetStarted() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('GetStartPage', isViewed);
  }

  Future saveBoolConnexion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("loggedIn", true);
  }
}
