import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Services/http_client.dart';
import 'package:leadership_nuggets/Utils/flush_bar_helper.dart';
import 'package:leadership_nuggets/Utils/progress_dialog_helper.dart';
import 'package:leadership_nuggets/Widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AddNuggetToFavouriteController extends GetxController{
  RxBool isLoading = false.obs;

  _buildDialog(BuildContext context) => showDialog(context: context, barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return Dialog(backgroundColor: Colors.transparent, elevation: 0.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
          child: Container(height: MediaQuery.of(context).size.height / 2, color: Colors.transparent,
            child: Stack(
              children: [
                Align(alignment: Alignment.bottomCenter,
                  child: Container(height: MediaQuery.of(context).size.height / 4, color: AppTheme.white,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Quote added as favourite",
                          textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: "Nunito"),),
                        SizedBox(height: 20,),
                        Row( mainAxisAlignment: MainAxisAlignment.center, children: [
                          CustomButton( buttonText: "Back", textColor: AppTheme.grey,
                              decorationColor: AppTheme.secondary, buttonRadius: 5, borderColor: AppTheme.hash,
                              buttonWidth: MediaQuery.of(context).size.width / 3, onPressed: ()=>Get.back()),],),
                      ],
                    ),
                  ),
                ),
                Align(alignment: Alignment.center,
                  child: Container(
                    height: 80, width: 80,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: AppTheme.white),
                    child: Center(child: Container(height: 60, width: 60,
                      decoration: BoxDecoration(color: AppTheme.green, shape: BoxShape.circle),
                      child: Icon(Icons.check, size: 30, color: AppTheme.white,),),),
                  ),
                ),
              ],
            ),
          ),
        );
      });

  addNuggetAsFavourite(String id) async{
    Map<String, dynamic> body = {"nugget_id": id};
    var url = Uri.parse("https://reminder.bitcash.ng/api/user/favourite");
    showLoading();
    SharedPreferences getToken = await SharedPreferences.getInstance();
    final token = getToken.getString("token");
    Map<String, String> headers = {"Content-Type": "application/json", "Accept": "application/json",  "Authorization" : "Bearer $token"};
    CustomProgressDialog().showDialog(Get.context!, "Adding as favorite...");
    await HttpClient().postMethod(headers, body, url).then((value){
      final result = jsonDecode(value.body);
      if (value.statusCode == 200 || value.statusCode == 201){
        CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
        if (result["message"] == "Nugget is already in Favourites"){
          alertBar(Get.context!, result["message"], AppTheme.secondary, false, Icon(Icons.error_outline, color: AppTheme.white,));
        }else {
          _buildDialog(Get.context!);
        }
        print(id.toString());
        hideLoading();
      } else{
        CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
        print("Failed");
        alertBar(Get.context!, result["message"], AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
      }
    }).catchError((error){
      alertBar(Get.context!, "Oops! An error occurred.", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
    });
  }

showLoading(){
  isLoading.toggle();
}

hideLoading(){
  isLoading.toggle();
}
}