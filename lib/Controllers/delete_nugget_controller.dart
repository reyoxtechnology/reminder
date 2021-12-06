
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Services/http_client.dart';
import 'package:leadership_nuggets/Utils/flush_bar_helper.dart';
import 'package:leadership_nuggets/Utils/progress_dialog_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeleteNuggetController extends GetxController{


  deleteNugget(String id) async{
    SharedPreferences getToken = await SharedPreferences.getInstance();
    final token = getToken.getString("token");
    var url = Uri.parse("https://reminder.bitcash.ng/api/nugget/$id");
    Map<String, String> headers = {"Content-Type": "application/json", "Accept": "application/json",  "Authorization" : "Bearer $token"};
    CustomProgressDialog().showDialog(Get.context!, "Deleting Nugget...");
    await HttpClient().deleteMethod(headers, url).then((value) {
      final result = jsonDecode(value.body);
      if (value.statusCode == 200 || value.statusCode == 201){
        print("Success ${value.statusCode}");
        CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
        Navigator.of(Get.context!).pop(true);
        alertBar(Get.context!, result["message"], AppTheme.secondary, false, Icon(Icons.error_outline, color: AppTheme.white,));
      }else{
        CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
        print(value.statusCode);
        alertBar(Get.context!, result["message"], AppTheme.secondary, false, Icon(Icons.error_outline, color: AppTheme.white,));}
    }).onError((error, stackTrace) {
      print(error);
    }).timeout(Duration(seconds: 20), onTimeout: (){
      CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
      alertBar(Get.context!, "Network Timeout! Please try again", AppTheme.secondary, false, Icon(Icons.error_outline, color: AppTheme.white,));
      return null;
    });
  }

}