import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Services/http_client.dart';
import 'package:leadership_nuggets/Utils/flush_bar_helper.dart';
import 'package:leadership_nuggets/Utils/progress_dialog_helper.dart';
import 'package:leadership_nuggets/Views/dashboard.dart';
import 'package:leadership_nuggets/Widgets/custom_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
class RateUs extends StatefulWidget {
  const RateUs({Key? key}) : super(key: key);

  @override
  _RateUsState createState() => _RateUsState();
}

class _RateUsState extends State<RateUs> {


  String likeRating = "Like";
  String disLikeRating = "Dislike";
  String loveRating = "Love";


  String? captureLikeRateValue = "";
  String? captureLoveRateValue = "";
  String? captureDislikeRateValue = "";
  bool isLikeSelected = false;
  bool isLoveSelected = false;
  bool isDislikeSelected = false;


  var url = Uri.parse("https://reminder.bitcash.ng/api/rating");


  submitRating() async{
    if (captureLoveRateValue == "" && captureDislikeRateValue == "" && captureLikeRateValue == "") {
      alertBar(Get.context!, "No rating selected", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
    } else if (captureLoveRateValue == loveRating && captureDislikeRateValue == "" && captureLikeRateValue == ""){
      Map<String, dynamic> body = {"rating": captureLoveRateValue};
      SharedPreferences getToken = await SharedPreferences.getInstance();
      final token = getToken.getString("token");
      Map<String, String> headers = {"Content-Type": "application/json", "Accept": "application/json",  "Authorization" : "Bearer $token"};
      CustomProgressDialog().showDialog(Get.context!, "Loading...");
      await HttpClient().postMethod(headers, body, url).then((value){
        if(value.statusCode == 200 || value.statusCode == 201) {
          print(value.statusCode);
          setState(() {
            captureLoveRateValue = "";
            isLoveSelected = false;
          });
          CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
          Get.off(()=>DashBoard());
        } else {
          CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
          alertBar(Get.context!, "Submission Failed", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
        }
      }).onError((error, stackTrace) {
        CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
        print("This is the error here!!!$error");
      }).timeout(Duration(seconds: 20), onTimeout: (){
        CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
        alertBar(Get.context!, "Network TimeOut! Please try again",  AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
      });
    } else if(captureLoveRateValue == "" && captureDislikeRateValue == disLikeRating && captureLikeRateValue == ""){
      Map<String, dynamic> body = {"rating": captureDislikeRateValue};
      SharedPreferences getToken = await SharedPreferences.getInstance();
      final token = getToken.getString("token");
      Map<String, String> headers = {"Content-Type": "application/json", "Accept": "application/json",  "Authorization" : "Bearer $token"};
      CustomProgressDialog().showDialog(Get.context!, "Loading...");
      await HttpClient().postMethod(headers, body, url).then((value){
        if(value.statusCode == 200 || value.statusCode == 201) {
          setState(() {
            captureDislikeRateValue = "";
            isDislikeSelected = false;
          });
          CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
          Get.off(()=>DashBoard());
        } else {
          CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
          alertBar(Get.context!, "Submission Failed", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
        }
      }).onError((error, stackTrace) {
        CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
        print("This is the error here!!!$error");
      }).timeout(Duration(seconds: 20), onTimeout: (){
        CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
        alertBar(Get.context!, "Network TimeOut! Please try again",  AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
      });
    } else if (captureLoveRateValue == "" && captureDislikeRateValue == "" && captureLikeRateValue == likeRating){
      Map<String, dynamic> body = {"rating": captureDislikeRateValue};
      SharedPreferences getToken = await SharedPreferences.getInstance();
      final token = getToken.getString("token");
      Map<String, String> headers = {"Content-Type": "application/json", "Accept": "application/json",  "Authorization" : "Bearer $token"};
      CustomProgressDialog().showDialog(Get.context!, "Loading...");
      await HttpClient().postMethod(headers, body, url).then((value){
        if(value.statusCode == 200 || value.statusCode == 201) {
          setState(() {
            captureLikeRateValue = "";
            isLikeSelected = false;
          });
          CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
          Get.off(()=>DashBoard());
        } else {
          CustomProgressDialog().popCustomProgressDialogDialog(Get.context!);
          alertBar(Get.context!, "Submission Failed", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.error_outline, color: AppTheme.white,));
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
        bottom: false,
        child: Scaffold(
          body: Container(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight, end: Alignment.bottomLeft,
                colors: <Color>[AppTheme.primary, AppTheme.darkGreen],
              ),
            ),
            child: Padding(padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 49.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(onTap: (){ Get.back(); },
                    child: Padding(padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 44, width: 44, decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), color: AppTheme.white),
                        child: Icon(Icons.arrow_back, color: AppTheme.darkGreen,),),),),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Tell us Your Review\n    about this App", style: TextStyle(fontFamily: 'Inter', color: AppTheme.white, fontWeight: FontWeight.w700, fontSize: 18),),],),
                  SizedBox(height: 32,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(height: 251, width: 251,
                        decoration: BoxDecoration(shape: BoxShape.circle, color: AppTheme.paleGreen),
                        child:  Padding(padding: const EdgeInsets.all(20.0),
                          child: Container(decoration: BoxDecoration(shape: BoxShape.circle, color: AppTheme.grey.withOpacity(0.1),), child: Center(child: Icon(Icons.star, color: AppTheme.secondary, size: 210,)),),),),],),
                  SizedBox(height: 46,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(height: 60,width: MediaQuery.of(context).size.width / 1.8,
                      decoration: BoxDecoration(color: AppTheme.white, borderRadius: BorderRadius.circular(5)),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              captureLikeRateValue = likeRating;
                              captureDislikeRateValue = "";
                              captureLoveRateValue = "";
                              isLikeSelected = true;
                            });
                            if (captureLikeRateValue == likeRating && isLikeSelected == true) {
                              alertBar(context, "Like Selected", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.check, color: AppTheme.white,));
                              setState(() {
                                isLoveSelected = false;
                                isDislikeSelected = false;
                              });
                            } else {
                              alertBar(context, "Like Deselected", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.check, color: AppTheme.white,));
                            }
                          },
                            child: Container(child: Image.asset("assets/Emoji.png"),)),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              captureDislikeRateValue = disLikeRating;
                              captureLoveRateValue = "";
                              captureLikeRateValue = "";
                              isDislikeSelected = true;
                            });
                            if (captureDislikeRateValue == disLikeRating && isDislikeSelected == true) {
                              alertBar(context, "Like Selected", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.check, color: AppTheme.white,));
                              setState(() {
                                isLoveSelected = false;
                                isLikeSelected = false;
                              });
                            } else {
                              alertBar(context, "Like Deselected", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.check, color: AppTheme.white,));
                            }
                          },
                            child: Container(child: Image.asset("assets/Emoji1.png"),)),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              captureLoveRateValue = loveRating;
                              captureDislikeRateValue = "";
                              captureLikeRateValue = "";
                              isLoveSelected = true;
                            });
                            if(captureLoveRateValue == loveRating && isLoveSelected == true){
                              alertBar(context, "Love Selected", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.check, color: AppTheme.white,));
                              setState(() {
                                isLikeSelected = false;
                                isDislikeSelected = false;
                              });
                            }else{
                              alertBar(context, "Love Deselected", AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.check, color: AppTheme.white,));
                            }
                          },
                            child: Container(child: Image.asset("assets/Emoji2.png"),)),
                      ],),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Tap to Review", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppTheme.white, fontFamily: "Inter"),),],),
                  SizedBox(height: 154,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [CustomButton(onPressed: (){
                      submitRating();
                    }, decorationColor: AppTheme.secondary,borderColor: AppTheme.secondary,buttonWidth: MediaQuery.of(context).size.width / 1.5, buttonHeight: 52, buttonRadius: 5,textColor: AppTheme.white, buttonText: "Submit",),],
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
