import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Widgets/custom_button.dart';
import 'package:leadership_nuggets/Widgets/edit_profile_tile.dart';
class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(resizeToAvoidBottomInset: false,
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
                EditProfileTile(icon: Icon(Icons.calendar_today_outlined, color: AppTheme.blue,), title: "Name",),
                EditProfileTile(icon: Icon(Icons.calendar_today_outlined, color: AppTheme.blue,), title: "Interest",),
                EditProfileTile(icon: Icon(Icons.email_outlined, color: AppTheme.blue,), title: "Email",),
                EditProfileTile(icon: Icon(Icons.phone_android, color: AppTheme.blue,), title: "Phone Number",),
                EditProfileTile(icon: Image.asset("assets/Gender.png"), title: "Gender",),
                EditProfileTile(icon: Icon(Icons.lock_outline, color: AppTheme.blue,), title: "Change Password",),
                SizedBox(height: 40,),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 31.0),
                  child: CustomButton(onPressed: (){},
                    textColor: AppTheme.green, buttonRadius: 10.0, buttonHeight: 55,buttonWidth: MediaQuery.of(context).size.width,
                    borderColor: AppTheme.green, buttonText: "Update", decorationColor: AppTheme.green,),),
                SizedBox(height: 400,),
              ],),
            ),
          ),
    ));
  }
}
