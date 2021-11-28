import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';

import 'package:leadership_nuggets/Models/update_profile.dart';
import 'package:leadership_nuggets/Utils/flush_bar_helper.dart';
import 'package:leadership_nuggets/Utils/progress_dialog_helper.dart';
import 'package:leadership_nuggets/Widgets/custom_button.dart';
import 'package:leadership_nuggets/Widgets/edit_profile_tile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:leadership_nuggets/Services/http_client.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
 var name, email, phoneNumber, password, interest, gender, token;
 final scaffoldKey = GlobalKey<ScaffoldState>();


 @override
  void initState() {
   initUserData();
   super.initState();
  }

  void initUserData() async {
    final SharedPreferences userdata = await SharedPreferences.getInstance();
    setState(() {
      name = (userdata.getString("userName"));
      email = (userdata.getString("userEmail"));
      phoneNumber = (userdata.getString("userPhoneNumber"));
      password = (userdata.getString("userPassword"));
      interest = (userdata.getString("interest"));
      gender = (userdata.getString("gender"));
      token = (userdata.getString("token"));
    });
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
        setState(() {
          interest = updatedData.setString("interest", interest!);
          gender = updatedData.setString("gender", gender!);
          email = updatedData.setString("userEmail", response.data?.email ?? email!);
          name = updatedData.setString("userName", response.data?.name ?? name!);
          phoneNumber = updatedData.setString("userPhoneNumber", phoneNumber!);
          password = updatedData.setString("userPassword", password!);
          alertBar(context, response.message.toString(),  AppTheme.secondary.withOpacity(0.3), false, Icon(Icons.done));
        });
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
                    Text("Are you sure you want to edit your profile?",
                      textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: "Nunito"),),
                    SizedBox(height: 20,),
                    Row( mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                        CustomButton( buttonText: "No, Cancel", textColor: AppTheme.grey,
                          decorationColor: AppTheme.hash, buttonRadius: 5, borderColor: AppTheme.hash,
                          buttonWidth: MediaQuery.of(context).size.width / 3, onPressed: ()=>Get.back()),
                        CustomButton( buttonText: "Yes, Please", textColor: AppTheme.white,
                            decorationColor: AppTheme.green, buttonRadius: 5, borderColor: AppTheme.green,
                            buttonWidth: MediaQuery.of(context).size.width / 3, onPressed: ()=>updateUserProfile()),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(alignment: Alignment.center,
              child: Container(
                height: 80, width: 80,
                decoration: BoxDecoration(shape: BoxShape.circle, color: AppTheme.white),
                child: Center(child: Container(height: 60, width: 60,
                  decoration: BoxDecoration(color: AppTheme.secondary, shape: BoxShape.circle),
                  child: Icon(Icons.error_outline, size: 30, color: AppTheme.white,),),),
              ),
            ),
          ],
        ),
      ),
    );
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(resizeToAvoidBottomInset: false, key: scaffoldKey,
          appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){Get.back();},color: AppTheme.black,),
               backgroundColor: Colors.transparent, elevation: 0.0, centerTitle: false,
            title: Text("Edit Profile", style: TextStyle(fontFamily: "Inter", color: AppTheme.black,),),),
          body: SingleChildScrollView(physics: BouncingScrollPhysics(),
            child: Padding(padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [SizedBox(height: 30,),
                Align(alignment: Alignment.center,
                  child: Container(height: 184, width: 184, decoration: BoxDecoration(shape: BoxShape.circle, color: AppTheme.paleGreen.withOpacity(0.2),),
                   child: Padding(padding: const EdgeInsets.all(10.0),
                     child: Center(child: Container(height: 97,width: 97, decoration: BoxDecoration(shape: BoxShape.circle, color: AppTheme.paleGreen,),
                      child: CircleAvatar(radius: 45, child: Icon(Icons.person, color: AppTheme.white, size: 70,), backgroundColor: AppTheme.green,),),),
                   ),),
                ),
                SizedBox(height: 10,),
                EditProfileTile(icon: Icon(Icons.calendar_today_outlined, color: AppTheme.blue,), title: "Name", controller: TextEditingController(text: name),),
                EditProfileTile(icon: Icon(Icons.calendar_today_outlined, color: AppTheme.blue,), title: "Interest", controller: TextEditingController(text: interest),),
                EditProfileTile(icon: Icon(Icons.email_outlined, color: AppTheme.blue,), title: "Email", controller: TextEditingController(text: email),),
                EditProfileTile(icon: Icon(Icons.phone_android, color: AppTheme.blue,), title: "Phone Number", controller: TextEditingController(text: phoneNumber),),
                EditProfileTile(icon: Image.asset("assets/Gender.png"), title: "Gender", controller: TextEditingController(text: gender),),
                EditProfileTile(icon: Icon(Icons.lock_outline, color: AppTheme.blue,), title: "Change Password", controller: TextEditingController(text: password)),
                SizedBox(height: 40,),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 31.0),
                  child: CustomButton(onPressed: ()=>_buildDialog(context),
                    textColor: AppTheme.green, buttonRadius: 10.0, buttonHeight: 55,buttonWidth: MediaQuery.of(context).size.width,
                    borderColor: AppTheme.green, buttonText: "Update", decorationColor: AppTheme.green,),),
                SizedBox(height: 400,),
              ],),
            ),
          ),
    ));
  }
}
