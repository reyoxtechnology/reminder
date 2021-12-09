import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Controllers/google_auth_controller.dart';
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
    return SafeArea(top: false, bottom: false,
        child: Scaffold(backgroundColor: AppTheme.primary,
          body: Stack(
            children: [
              Align(alignment: Alignment.bottomCenter,child: Container(
                height: MediaQuery.of(context).size.height / 1.5, width: double.maxFinite,
                decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40),), color: AppTheme.white),
                child: Padding(padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(children: [
                      SizedBox(height: 40,),
                      Container(height: MediaQuery.of(context).size.width / 3, width: MediaQuery.of(context).size.width / 3,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/logo.png")),),
                      ),
                      SizedBox(height: 15,),
                      Text("Leadership Guardian", style: AppTheme.headline,),
                      SizedBox(height: 20,),
                      // CustomButton(onPressed: (){
                      //   _controller.signInWithGoogle();
                      // },
                      //   imageUrl: "assets/google.png",
                      //   buttonWidth: MediaQuery.of(context).size.width,
                      //   decorationColor: AppTheme.black,
                      //   buttonRadius: 8,
                      //   buttonHeight: 55,
                      //   buttonText: "CONTINUE WITH GOOGLE",
                      // ),
                      // SizedBox(height: 20,),
                      // CustomButton(onPressed: (){},
                      //   imageUrl: "assets/facebook.png",
                      //   buttonWidth: MediaQuery.of(context).size.width,
                      //   decorationColor: AppTheme.blue,
                      //   buttonRadius: 8,
                      //   buttonHeight: 55,
                      //   buttonText: "CONTINUE WITH FACEBOOK",
                      // ),
                      SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){Get.to(()=>Login());},
                    child: Container(
                      height: 55,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: AppTheme.green,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(color:AppTheme.green)),
                      child: Row( mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/email.png"),
                          SizedBox(width: 30,),
                          Material(
                            color: Colors.transparent,
                            child: Center(
                              child: Text(
                                "CONTINUE WITH EMAIL",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontFamily: 'Inter', fontSize:16, fontWeight: FontWeight.w600, color: AppTheme.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                      SizedBox(height: 50,),
                      GestureDetector( onTap: (){Get.to(()=>Login());},
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?", style: TextStyle(fontFamily: "DMSans", fontWeight: FontWeight.bold, color: AppTheme.black, fontSize: 18),),
                            Text(" Sign In", style: TextStyle(fontFamily: "DMSans", fontWeight: FontWeight.bold, color: AppTheme.green, fontSize: 18),),
                          ],
                        ),
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
