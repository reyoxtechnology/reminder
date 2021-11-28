import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Services/http_client.dart';
import 'package:leadership_nuggets/Utils/flush_bar_helper.dart';
import 'package:leadership_nuggets/Utils/progress_dialog_helper.dart';
import 'package:leadership_nuggets/Views/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactAdminController extends GetxController{
  String? message;
  var url = Uri.parse("https://reminder.tbmholdingltd.com/api/user/contact-admin");

  contactUs() async {
    Map<String, dynamic> body = {
      "message": message!};
    SharedPreferences getToken = await SharedPreferences.getInstance();
    final token = getToken.getString("token");
    Map<String, String> headers = {"Content-Type": "application/json", "Accept": "application/json",  "Authorization" : "Bearer $token"};
    FocusScope.of(Get.context!).unfocus();
    CustomProgressDialog().showDialog(Get.context!, "Loading...");
    await HttpClient().postMethod(headers, body, url).then((value){
      if(value.statusCode == 200 || value.statusCode == 201){
        CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
        Get.to(()=>DashBoard());
        alertBar(Get.context!, "Mail Sent", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.done));
      }else{
        CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
        print(value.statusCode);
        alertBar(Get.context!, "An error occurred, please try again!", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline));}
    }).onError((error, stackTrace){
      print(error);
    }).timeout(Duration(seconds: 20), onTimeout: (){
      CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
      alertBar(Get.context!, "Network timeout, please try again!", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline));
    });
  }
}