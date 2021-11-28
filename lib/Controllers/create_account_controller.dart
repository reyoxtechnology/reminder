import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Models/create_account_model.dart';
import 'package:leadership_nuggets/Services/http_client.dart';
import 'package:leadership_nuggets/Utils/flush_bar_helper.dart';
import 'package:leadership_nuggets/Utils/progress_dialog_helper.dart';
import 'package:leadership_nuggets/Views/nugget_setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CreateAccountController extends GetxController{

  String? name;
  String? email;
  String? password;
  String? phoneNumber;

  var url = Uri.parse("https://reminder.tbmholdingltd.com/api/register");

  Map<String, String> headers = {
    "Content-Type": "application/json", "Accept": "application/json"
  };


  void checkSignUpConnectivity() async{
    FocusScope.of(Get.context!).unfocus();
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (!(connectivityResult == ConnectivityResult.none)) {
      userSignIn();
    } else {
      alertBar(Get.context!, "No Internet Connection", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
    }
  }


  userSignIn() async{
    Map<String, dynamic> body = {
      "name": name!, "email": email!, "phone_number": phoneNumber!, "password": password!,
    };
    SharedPreferences signUpUserData = await SharedPreferences.getInstance();
    CustomProgressDialog().showDialog(Get.context!, "Loading...");
    await HttpClient().postMethod(headers, body, url).then((value){
      final result = jsonDecode(value.body);
      if(value.statusCode == 200 || value.statusCode == 201){
        final response = getUserDetailsModelResponseFromJson(value.body);
        signUpUserData.setString("token", response.token);
        signUpUserData.setString("userEmail", response.data.email);
        signUpUserData.setString("userName", response.data.name);
        signUpUserData.setString("userPhoneNumber", phoneNumber!);
        signUpUserData.setString("userPassword", password!);
        signUpUserData.setString("interest", "");
        signUpUserData.setString("gender", "");
        signUpUserData.setBool('isLoggedIn', true);
        CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
        Get.off(()=>NuggetsSettings());
      }else {
        CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
        final errorMessage = result["error"][0];
        alertBar(Get.context!, errorMessage, AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
      }}).timeout(Duration(seconds: 20), onTimeout: (){
      CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
      alertBar(Get.context!, "Network TimeOut! Please try again",  AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
    });
  }


}