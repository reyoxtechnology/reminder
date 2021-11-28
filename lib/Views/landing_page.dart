import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Controllers/google_auth_controller.dart';
import 'package:leadership_nuggets/Widgets/custom_button.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'login.dart';
class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  final _controller = Get.find<GoogleAuthController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
        bottom: false,
        child: Scaffold(
          body: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,child: Container(
                height: MediaQuery.of(context).size.height / 1.5, width: double.maxFinite,
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40),)),
                child: Padding(padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      SizedBox(height: 40,),
                      Container(
                        height: MediaQuery.of(context).size.width / 3,
                        width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/logo.png")
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Text("Leadership Guardian", style: AppTheme.headline,),
                      SizedBox(height: 20,),
                      CustomButton(onPressed: (){
                        _controller.signInWithGoogle();
                      },
                        buttonWidth: MediaQuery.of(context).size.width,
                        decorationColor: AppTheme.black,
                        buttonRadius: 8,
                        buttonHeight: 55,
                        buttonText: "CONTINUE WITH GOOGLE",
                      ),
                      SizedBox(height: 20,),
                      CustomButton(onPressed: (){},
                        buttonWidth: MediaQuery.of(context).size.width,
                        decorationColor: AppTheme.blue,
                        buttonRadius: 8,
                        buttonHeight: 55,
                        buttonText: "CONTINUE WITH FACEBOOK",
                      ),
                      SizedBox(height: 20,),
                      CustomButton(onPressed: (){Get.to(() => Login());},
                        buttonWidth: MediaQuery.of(context).size.width,
                        decorationColor: AppTheme.green,
                        buttonRadius: 8,
                        buttonHeight: 55,
                        buttonText: "CONTINUE WITH EMAIL",
                      ),
                      SizedBox(height: 50,),
                      Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?", style: TextStyle(fontFamily: "DMSans", fontWeight: FontWeight.bold, color: AppTheme.black, fontSize: 18),),
                          Text(" Sign In", style: TextStyle(fontFamily: "DMSans", fontWeight: FontWeight.bold, color: AppTheme.green, fontSize: 18),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              )
            ],
          ),
        ),
    );
  }
}
