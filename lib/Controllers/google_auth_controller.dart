import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Models/create_account_model.dart';
import 'package:leadership_nuggets/Services/http_client.dart';
import 'package:leadership_nuggets/Utils/flush_bar_helper.dart';
import 'package:leadership_nuggets/Utils/progress_dialog_helper.dart';
import 'package:leadership_nuggets/Views/nugget_setting.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GoogleAuthController extends GetxController{

  void checkGoogleSignInConnectivity() async{
    FocusScope.of(Get.context!).unfocus();
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (!(connectivityResult == ConnectivityResult.none)) {
      signWithGoogle();
    } else {
      alertBar(Get.context!, "No Internet Connection", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
    }
  }


  Future<UserCredential?> signWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: <String>["email"]).signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


  var url = Uri.parse("https://reminder.bitcash.ng/api/register");


  Map<String, String> headers = {
    "Content-Type": "application/json", "Accept": "application/json"
  };

  signInWithGoogle() async{
    SharedPreferences signUpUserData = await SharedPreferences.getInstance();
    CustomProgressDialog().showDialog(Get.context!, "Loading...");
    await signWithGoogle().then((UserCredential? value) async{
      if (value != null){
        Map<String, dynamic> body = {"name": value.user!.displayName, "email": value.user!.email, "phone_number": "", "password": ""};
        await HttpClient().postMethod(headers, body, url).then( (value) {
          final result = jsonDecode(value.body);
          if(value.statusCode == 200 || value.statusCode == 201){
            final response = getUserDetailsModelResponseFromJson(jsonDecode(value.body));
            signUpUserData.setString("token", response.token);
            signUpUserData.setString("userEmail", response.data.email);
            signUpUserData.setString("userName", response.data.name);
            signUpUserData.setBool('isLoggedIn', true);
            CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
            Get.off(()=>NuggetsSettings());
          } else {
            CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
            final errorMessage = result["error"][0];
            alertBar(Get.context!, errorMessage, AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));}
        }).onError((error, stackTrace) {
          CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
          alertBar(Get.context!, error.toString(), AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
        }).timeout(Duration(seconds: 20), onTimeout: (){
          CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
          alertBar(Get.context!, "Network TimeOut! Please try again",  AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
        });} else {
        alertBar(Get.context!, "Invalid Credentials", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
      }
    });
  }
}