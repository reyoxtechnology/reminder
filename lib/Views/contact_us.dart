import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Views/dashboard.dart';
import 'package:leadership_nuggets/Widgets/custom_button.dart';
class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea( top: false, bottom: false,child: Scaffold(resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){Get.back();},color: AppTheme.black,),
        backgroundColor: Colors.transparent, elevation: 0.0, centerTitle: false,
        title: Text("Contact Us", style: TextStyle(fontFamily: "DMSans", color: AppTheme.black, fontSize: 25, fontWeight: FontWeight.w700),),),
      body: SingleChildScrollView(physics: BouncingScrollPhysics(),
        child: Column(children: [SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 49.0, right: 68),
            child: Container(height: 258, width: MediaQuery.of(context).size.height,
              child: Image.asset("assets/contact.png", fit: BoxFit.cover,),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 31.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 15,),
                Text("We are here to help you out", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 17, fontFamily: "Poppins", color: AppTheme.black),),
                SizedBox(height: 10,),
                Text("Your Messages", style: TextStyle(fontFamily: "Poppins", fontSize: 18, fontWeight: FontWeight.w400, color: AppTheme.grey.withOpacity(0.3)),),
                SizedBox(height: 10,),
                Container(width: MediaQuery.of(context).size.width, height: 202,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: AppTheme.grey.withOpacity(0.5), width: 1)),
                  child: Expanded(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField( maxLines: 10, cursorHeight: 24, cursorColor: AppTheme.black, decoration: InputDecoration(border: InputBorder.none,)),
                  )),),
                SizedBox(height: 42,),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 52.0),
                  child: CustomButton(onPressed: (){Get.off(()=>DashBoard());},
                    buttonText: "Send", borderColor: AppTheme.green, buttonHeight: 55,
                    buttonWidth: double.maxFinite, decorationColor: AppTheme.green, buttonRadius: 15,),),
                SizedBox(height: 300,),
              ],
            ),
          ),
        ],),
      ),
    ));
  }
}
