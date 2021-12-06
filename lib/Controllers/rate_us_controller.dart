import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Services/http_client.dart';
import 'package:leadership_nuggets/Utils/flush_bar_helper.dart';
import 'package:leadership_nuggets/Utils/progress_dialog_helper.dart';
import 'package:leadership_nuggets/Views/dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RateUsController extends GetxController{

  // RxBool isLoading = false.obs;



  // toggleLikeSelected(){
  //   isLoading.toggle();
  // }



  // onLikeRatingSelected(){
  //   toggleLikeSelected();
  //   captureLikeRateValue = likeRating;
  //   alertBar(Get.context!, "Like Selected", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
  // }



  // onLikeRatingUnselected(){
  //   toggleLikeSelected();
  //   captureLikeRateValue = "";
  //   alertBar(Get.context!, "Like Unselected", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
  // }



  // onLoveRatingSelected(){
  //   captureLoveRateValue = loveRating;
  //   alertBar(Get.context!, "Love Selected", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
  // }



  // onLoveRatingUnselected(){
  //   captureLoveRateValue = "";
  //   alertBar(Get.context!, "Love Unselected", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
  // }



  // onDislikeRatingSelected(){
  //   captureDislikeRateValue = disLikeRating;
  //   alertBar(Get.context!, "Dislike Selected", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
  // }


  // onDislikeRatingUnselected(){
  //   captureDislikeRateValue = "";
  //   alertBar(Get.context!, "Dislike Unselected", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
  // }

}