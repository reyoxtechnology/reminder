import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Services/http_client.dart';
import 'package:leadership_nuggets/Utils/flush_bar_helper.dart';
import 'package:leadership_nuggets/Utils/progress_dialog_helper.dart';
import 'package:leadership_nuggets/Views/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RateUsController extends GetxController{
  String likeRating = "Like";
  String disLikeRating = "Dislike";
  String loveRating = "Love";

  String? captureLikeRateValue = "";
  String? captureLoveRateValue = "";
  String? captureDislikeRateValue = "";

  RxBool isLoading = false.obs;

  toggleLikeSelected(){
    isLoading.toggle();
  }


  var url = Uri.parse("https://reminder.tbmholdingltd.com/api/rating");

  onLikeRatingSelected(){
    toggleLikeSelected();
    captureLikeRateValue = likeRating;
    alertBar(Get.context!, "Like Selected", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
  }

  onLikeRatingUnselected(){
    toggleLikeSelected();
    captureLikeRateValue = "";
    alertBar(Get.context!, "Like Unselected", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
  }


  onLoveRatingSelected(){
    captureLoveRateValue = loveRating;
    alertBar(Get.context!, "Love Selected", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
  }

  onLoveRatingUnselected(){
    captureLoveRateValue = "";
    alertBar(Get.context!, "Love Unselected", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
  }


  onDislikeRatingSelected(){
    captureDislikeRateValue = disLikeRating;
    alertBar(Get.context!, "Dislike Selected", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
  }

  onDislikeRatingUnselected(){
    captureDislikeRateValue = "";
    alertBar(Get.context!, "Dislike Unselected", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
  }

  submitRating() async{
    if (captureLoveRateValue == "" && captureDislikeRateValue == "" && captureLikeRateValue == "") {
      alertBar(Get.context!, "No rating selected", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
    } else if (captureLoveRateValue != "" && captureDislikeRateValue == "" && captureLikeRateValue == ""){
      Map<String, dynamic> body = {"rating": captureLoveRateValue};
      SharedPreferences getToken = await SharedPreferences.getInstance();
      final token = getToken.getString("token");
      Map<String, String> headers = {"Content-Type": "application/json", "Accept": "application/json",  "Authorization" : "Bearer $token"};
      CustomProgressDialog().showDialog(Get.context!, "Loading...");
      await HttpClient().postMethod(headers, body, url).then((value){
        if(value.statusCode == 200 || value.statusCode == 201) {
          captureLoveRateValue = "";
          CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
          Get.off(()=>DashBoard());
        } else {
          alertBar(Get.context!, "Submission Failed", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
          CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
        }
      }).onError((error, stackTrace) {
        CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
        print("This is the error here!!!$error");
      }).timeout(Duration(seconds: 20), onTimeout: (){
        CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
        alertBar(Get.context!, "Network TimeOut! Please try again",  AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
      });
    } else if(captureLoveRateValue == "" && captureDislikeRateValue != "" && captureLikeRateValue == ""){
      Map<String, dynamic> body = {"rating": captureDislikeRateValue};
      SharedPreferences getToken = await SharedPreferences.getInstance();
      final token = getToken.getString("token");
      Map<String, String> headers = {"Content-Type": "application/json", "Accept": "application/json",  "Authorization" : "Bearer $token"};
      CustomProgressDialog().showDialog(Get.context!, "Loading...");
      await HttpClient().postMethod(headers, body, url).then((value){
        if(value.statusCode == 200 || value.statusCode == 201) {
          captureDislikeRateValue = "";
          CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
          Get.off(()=>DashBoard());
        } else {
          alertBar(Get.context!, "Submission Failed", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
          CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
        }
      }).onError((error, stackTrace) {
        CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
        print("This is the error here!!!$error");
      }).timeout(Duration(seconds: 20), onTimeout: (){
        CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
        alertBar(Get.context!, "Network TimeOut! Please try again",  AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
      });
    } else if (captureLoveRateValue == "" && captureDislikeRateValue == "" && captureLikeRateValue != ""){
      Map<String, dynamic> body = {"rating": captureDislikeRateValue};
      SharedPreferences getToken = await SharedPreferences.getInstance();
      final token = getToken.getString("token");
      Map<String, String> headers = {"Content-Type": "application/json", "Accept": "application/json",  "Authorization" : "Bearer $token"};
      CustomProgressDialog().showDialog(Get.context!, "Loading...");
      await HttpClient().postMethod(headers, body, url).then((value){
        if(value.statusCode == 200 || value.statusCode == 201) {
          captureLikeRateValue = "";
          CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
          Get.off(()=>DashBoard());
        } else {
          alertBar(Get.context!, "Submission Failed", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
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


}