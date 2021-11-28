import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Widgets/custom_button.dart';
class RateUs extends StatefulWidget {
  const RateUs({Key? key}) : super(key: key);

  @override
  _RateUsState createState() => _RateUsState();
}

class _RateUsState extends State<RateUs> {
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
                        Container(child: Image.asset("assets/Emoji.png"),),
                        Container(child: Image.asset("assets/Emoji1.png"),),
                        Container(child: Image.asset("assets/Emoji2.png"),),
                      ],),),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("Tap to Review", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: AppTheme.white, fontFamily: "Inter"),),],),
                  SizedBox(height: 154,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [CustomButton(onPressed: (){}, decorationColor: AppTheme.secondary,borderColor: AppTheme.secondary,buttonWidth: MediaQuery.of(context).size.width / 1.5, buttonHeight: 52, buttonRadius: 5,textColor: AppTheme.white, buttonText: "Submit",),],
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
