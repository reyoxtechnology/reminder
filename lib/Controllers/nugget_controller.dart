import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Models/show_all_nuggets_model.dart';
import 'package:leadership_nuggets/Services/http_client.dart';
import 'package:leadership_nuggets/Utils/flush_bar_helper.dart';
import 'package:leadership_nuggets/Views/nugget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NuggetController extends GetxController{
  //Rx<Data>? nuggetResponse;
  var nuggetResponse = <Nugget>[].obs;
  RxBool isLoading = false.obs;

  var url = Uri.parse("https://reminder.bitcash.ng/api/nugget");

  getAllNuggets() async{
    showLoading();
    SharedPreferences getToken = await SharedPreferences.getInstance();
    final token = getToken.getString("token");
    Map<String, String> headers = {"Content-Type": "application/json", "Accept": "application/json",  "Authorization" : "Bearer $token"};
    await HttpClient().getMethod(headers, url).then((value){
      final result = jsonDecode(value.body);
      if (value.statusCode == 200 || value.statusCode == 201){
        hideLoading();
        nuggetResponse.value = getAllNuggetsModelResponseFromJson(value.body).data.data;
      } else{
        final errorMessage = result["message"];
        print(errorMessage);
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
     getAllNuggets();
     print(getAllNuggets());
    super.onInit();
  }
}