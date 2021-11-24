import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Models/login_model.dart';
import 'package:leadership_nuggets/Services/http_client.dart';
import 'package:leadership_nuggets/Utils/flush_bar_helper.dart';
import 'package:leadership_nuggets/Views/nugget_setting.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{
  String? email;
  String? password;

  var url = Uri.parse("https://reminder.tbmholdingltd.com/api/login");

  Map<String, String> headers = {
    "Content-Type": "application/json", "Accept": "application/json"
  };
  void checkLoginConnectivity() async{
    FocusScope.of(Get.context!).unfocus();
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (!(connectivityResult == ConnectivityResult.none)) {
      userLogin();
    } else {
      alertBar(Get.context!, "No Internet Connection", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
    }
  }

  userLogin() async{
    Map<String, dynamic> body = {
      "email": email!, "password": password!,
    };
    SharedPreferences signUpUserData = await SharedPreferences.getInstance();
    Get.context!.loaderOverlay.show();
    await HttpClient().postMethod(headers, body, url).then((value){
      final result = jsonDecode(value.body);
      if(value.statusCode==201 || value.statusCode == 201) {
        final response = userLoginModelResponseFromJson(jsonDecode(value.body));
        signUpUserData.setString("token", response.token);
        signUpUserData.setString("userEmail", response.data.email);
        signUpUserData.setString("userName", response.data.name);
        signUpUserData.setBool('isLoggedIn', true);
        Get.context!.loaderOverlay.hide();
        Get.off(()=>NuggetsSettings());
      } else {
        Get.context!.loaderOverlay.hide();
        final errorMessage = result["message"];
        alertBar(Get.context!, errorMessage, AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));}
    }).onError((error, stackTrace) {
      Get.context!.loaderOverlay.hide();
      alertBar(Get.context!, error.toString(), AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
    }).timeout(Duration(seconds: 20), onTimeout: (){
      Get.context!.loaderOverlay.hide();
      alertBar(Get.context!, "Network TimeOut! Please try again",  AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
    });
  }
}