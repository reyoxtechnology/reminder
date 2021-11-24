import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper{
  Future<void> saveUserdata(dynamic response) async {
    final SharedPreferences signUpUserData = await SharedPreferences.getInstance();
    signUpUserData.setString("userName", response.user.firstname);
    signUpUserData.setString("userPassword", response.user.lastname);
    signUpUserData.setString("userEmail", response.user.email);
    signUpUserData.setString("userPhoneNumber", response.user.tel);
    signUpUserData.setString("token", response.token);
    signUpUserData.setBool('isLoggedIn', true);
  }
}