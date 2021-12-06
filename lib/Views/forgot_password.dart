

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Utils/clipper.dart';
import 'package:leadership_nuggets/Widgets/custom_form_field.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(resizeToAvoidBottomInset: false,
          appBar: AppBar(leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){Get.back();},),elevation: 0.0, backgroundColor: AppTheme.primary,),
          body: Stack(
            children: [
              Container(height: MediaQuery.of(context).size.height * 0.3, width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/container_clip.png"), fit: BoxFit.fill),borderRadius: BorderRadius.vertical(bottom: Radius.circular(10),), ),
                child: Align(alignment: Alignment.centerLeft,child: Padding(
                  padding: const EdgeInsets.only(left: 38.0, right: 38.0, top: 60.0, bottom: 0.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Text("Forgot \nPassword", style: TextStyle(fontSize: 50, fontFamily: "DMSans", color: AppTheme.white, fontWeight: FontWeight.w800),),
                    ],
                  ),
                )),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 400,),
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width / 2.2
                        ),
                          child: Text("We’ll send you an instruction to reset your password.")),
                      SizedBox(height: 20,),
                      CustomFormField(
                          hintText: "Email",
                          backgroundColor: AppTheme.grey.withOpacity(0.15),
                          elevation: 0,
                          enabledBorderColor: Colors.transparent,
                          focusedBorderColor: Colors.transparent,
                          height: 60,
                          validator: (value){}
                      ),
                      SizedBox(height: 100,),
                      Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Reset", style: TextStyle(fontSize: 32, fontFamily: "DMSans", fontWeight: FontWeight.bold, color: AppTheme.black),),
                          Spacer(),
                          GestureDetector(onTap: (){

                          },
                            child: Container(
                              height: 70, width: 70,
                              decoration: BoxDecoration(shape: BoxShape.circle,color: AppTheme.secondary),
                              child: Icon(
                                Icons.arrow_forward, color: AppTheme.white, size: 35,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 100,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
