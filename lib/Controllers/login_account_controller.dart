import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Models/login_model.dart';
import 'package:leadership_nuggets/Services/http_client.dart';
import 'package:leadership_nuggets/Utils/flush_bar_helper.dart';
import 'package:leadership_nuggets/Utils/progress_dialog_helper.dart';
import 'package:leadership_nuggets/Views/nugget_setting.dart';
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
    Map<String, dynamic> body = {"email": email!, "password": password!,};
    SharedPreferences signUpUserData = await SharedPreferences.getInstance();
    CustomProgressDialog().showDialog(Get.context!, "Loading...");
    await HttpClient().postMethod(headers, body, url).then((value){
      final result = jsonDecode(value.body);
      if(value.statusCode == 200 || value.statusCode == 201) {
        final response = loginModelResponseFromJson(value.body);
        signUpUserData.setString("token", response.token);
        signUpUserData.setString("userEmail", response.user.email);
        signUpUserData.setString("userName", response.user.name);
        signUpUserData.setString("userPassword", password!);
        signUpUserData.setBool('isLoggedIn', true);
        CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
        Get.off(()=>NuggetsSettings());
      } else {
        final errorMessage = result["message"];
       alertBar(Get.context!, errorMessage, AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
        CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
      }
    }).onError((error, stackTrace) {
      CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
      print("This is the error here!!!$error");
    }).timeout(Duration(seconds: 20), onTimeout: (){
      CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
      alertBar(Get.context!, "Network TimeOut! Please try again",  AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
    });
  }
}