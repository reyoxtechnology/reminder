import 'dart:convert';

import 'package:leadership_nuggets/Models/update_profile.dart';
import 'package:leadership_nuggets/Utils/progress_dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Services/http_client.dart';
import 'package:leadership_nuggets/Utils/flush_bar_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfileController extends GetxController{
  late SharedPreferences userdata;
  String? name;
  String? email;
  String? phoneNumber;
  String? password;
  String? token;
  String? interest;
  String? gender;
  RxBool fetchData = false.obs;

  Future<void> initUserData() async {
     userdata = await SharedPreferences.getInstance();
     fetchData.toggle();
     interest = userdata.getString("interest");
    name = userdata.getString("userName");
    email = userdata.getString("userEmail");
    phoneNumber = userdata.getString("userPhoneNumber");
    password = userdata.getString("userPassword");
    token = userdata.getString("token");
  }

  @override
  void onInit() {
    initUserData().whenComplete(() {
      fetchData.toggle();
    });
    super.onInit();
  }



  var url = Uri.parse("https://reminder.tbmholdingltd.com/api/profile/update");

  updateUserProfile() async{
    if(name!.isEmpty && email!.isEmpty && phoneNumber!.isEmpty && password!.isEmpty && interest!.isEmpty && gender!.isEmpty){
      alertBar(Get.context!, "Please Update all Fields", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
    } else if (name!.isEmpty){
      alertBar(Get.context!, "Please Update the name Field", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
    } else if (email!.isEmpty){
      alertBar(Get.context!, "Please Update the email Field", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
    }else if(phoneNumber!.isEmpty){
      alertBar(Get.context!, "Please Update the phoneNumber Field", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
    }else if (password!.isEmpty){
      alertBar(Get.context!, "Please Update the password Field", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
    }else if (interest!.isEmpty){
      alertBar(Get.context!, "Please Update the interest Field", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
    }else if (gender!.isEmpty){
      alertBar(Get.context!, "Please Update the gender Field", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
    } else{
      Map<String, dynamic> body = {"name": name!, "email": email!, "phone_number": phoneNumber!, "password": password!, "interest": interest!, "gender": gender!};
      Map<String, String> headers = {"Content-Type": "application/json", "Accept": "application/json", "Authorization" : "Bearer $token"};
      CustomProgressDialog().showDialog(Get.context!, "Loading...");
      FocusScope.of(Get.context!).unfocus();
      SharedPreferences updatedData = await SharedPreferences.getInstance();
      await HttpClient().putMethod(headers, body, url).then((value){
        final result = jsonDecode(value.body);
        if(value.statusCode == 200 || value.statusCode == 201) {
          final response = UpdateProfileModelResponse.fromJson(jsonDecode(value.body));
          print(value.body);
          updatedData.setString("interest", interest!);
          updatedData.setString("gender", gender!);
          updatedData.setString("userEmail", response.data?.email ?? email!);
          updatedData.setString("userName", response.data?.name ?? name!);
          updatedData.setString("userPhoneNumber", phoneNumber!);
          updatedData.setString("userPassword", password!);
          CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
        } else{
          CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
          alertBar(Get.context!, result["message"], AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
        }
      }).onError((error, stackTrace){
        CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
        alertBar(Get.context!, "Oops!, Something went wrong. Try again.", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
        print("This is the error $error");
      }).timeout(Duration(seconds: 20), onTimeout: (){
        CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
        alertBar(Get.context!, "Network Timeout! please try again", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
      });
    }

  }
}