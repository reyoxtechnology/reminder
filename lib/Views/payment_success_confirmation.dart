import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Views/payment_failed.dart';
import 'package:leadership_nuggets/Widgets/custom_button.dart';

class PaymentSuccessConfirmation extends StatefulWidget {
  const PaymentSuccessConfirmation({Key? key}) : super(key: key);

  @override
  _PaymentSuccessConfirmationState createState() => _PaymentSuccessConfirmationState();
}

class _PaymentSuccessConfirmationState extends State<PaymentSuccessConfirmation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          appBar: AppBar(
            leading:  GestureDetector(
              onTap: (){Get.back();},
              child: Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: Container(height: 44, width: 44, decoration: BoxDecoration(shape: BoxShape.circle, color: AppTheme.grey.withOpacity(0.2)),
                  child: Icon(Icons.arrow_back, color: AppTheme.darkGreen,),),
              ),), backgroundColor: Colors.transparent, elevation: 0.0, centerTitle: true,
            title: Text("Payment", style: TextStyle(fontFamily: "DMSans", color: AppTheme.black, fontSize: 42, fontWeight: FontWeight.w700),),),
          body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(height: 112,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 90.0),
              child: Row(children: [
                Image.asset("assets/good.png"), Spacer(), Image.asset("assets/good.png"),],),),
            Align(alignment: Alignment.center,
              child: Container(height: MediaQuery.of(context).size.width / 2, width: MediaQuery.of(context).size.width /2,
                decoration: BoxDecoration(shape: BoxShape.circle, image: DecorationImage(image: AssetImage("assets/payment_successful.png"))),),),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 90.0),
              child: Row(children: [
                Image.asset("assets/good.png"), Spacer(), Image.asset("assets/good.png"),],),),
            SizedBox(height: 38,),
            Text("Success", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, fontFamily: "DMSans", color: AppTheme.black),),
            SizedBox(height: 15,),
            Text("Congratulation! you just \nUnlocked 365 days Nugget", style: TextStyle(fontFamily: "DMSans", fontWeight: FontWeight.w700, fontSize: 18, color: AppTheme.black),),
            SizedBox(height: 109,),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 38.0),
              child: CustomButton(
                  onPressed: (){Get.to(()=>PaymentFailed());},
                buttonText: "Continue", borderColor: AppTheme.green, decorationColor: AppTheme.green, buttonHeight: 52, buttonRadius: 10,
              ),
            )
          ],),
        )
    );
  }
}
