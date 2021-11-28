import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Models/all_nugget_categories.dart';
import 'package:leadership_nuggets/Services/http_client.dart';
import 'package:leadership_nuggets/Utils/flush_bar_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllNuggetCategories extends GetxController{
  //RxList<NuggetCategories>? allNuggetInACategoryResponse;
  var allNuggetInACategoryResponse = <NuggetCategories>[].obs;
  RxBool isLoading = false.obs;
  var url = Uri.parse("https://reminder.tbmholdingltd.com/api/nuggets/category");

  getAllNuggetsInACategory() async{
    showLoading();
    SharedPreferences getToken = await SharedPreferences.getInstance();
    final token = getToken.getString("token");
    Map<String, String> headers = {"Content-Type": "application/json", "Accept": "application/json",  "Authorization" : "Bearer $token"};
    await HttpClient().getMethod(headers, url).then((value){
      final result = jsonDecode(value.body);
      if (value.statusCode == 200 || value.statusCode == 201){
        hideLoading();
        allNuggetInACategoryResponse.value = showAllNuggetCategoriesFromJson(value.body).data;
      } else{
        final errorMessage = result["message"];
        alertBar(Get.context!, errorMessage, AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
      }
    }).catchError((error){
      print(error);
    });
  }

  showLoading(){
    isLoading.toggle();
  }

  hideLoading(){
    isLoading.toggle();
  }

  @override
  void onInit() {
    getAllNuggetsInACategory();
    print("This is the response $allNuggetInACategoryResponse");
    super.onInit();
  }
}