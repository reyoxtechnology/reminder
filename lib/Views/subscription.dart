import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Views/payment.dart';
import 'package:leadership_nuggets/Views/payment_success_confirmation.dart';
class Subscription extends StatefulWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  _SubscriptionState createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold( resizeToAvoidBottomInset: false,
          appBar: AppBar(
            leading:  GestureDetector(
              onTap: (){Get.back();},
              child: Padding(padding: const EdgeInsets.only(left: 13.0),
                child: Container(height: 44, width: 44, decoration: BoxDecoration(shape: BoxShape.circle, color: AppTheme.white),
                  child: Icon(Icons.arrow_back, color: AppTheme.darkGreen,),),),),
            backgroundColor: Colors.transparent, elevation: 0.0, centerTitle: false,
            title: Text("Contact Us", style: TextStyle(fontFamily: "DMSans", color: AppTheme.black, fontSize: 25, fontWeight: FontWeight.w700),),),
          body: Column(
            children: [SizedBox(height: 20,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [Container(height: MediaQuery.of(context).size.width /2, width: MediaQuery.of(context).size.width / 2, child: Image.asset("assets/sub.png", fit: BoxFit.cover,),),],
              ),SizedBox(height: 10,),
              Text("You’re using 7 days Free Trial ", style: TextStyle(fontFamily: "DMSans", fontSize: 22, fontWeight: FontWeight.w500),),
              SizedBox(height: 20,),
              Container(height: 33,
                child: Padding(padding: const EdgeInsets.all(3.0),
                  child: Text("3 days Left", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22, fontFamily: "DMSans", color: AppTheme.white),),),
                decoration: BoxDecoration(color: AppTheme.secondary, borderRadius: BorderRadius.circular(5)),),
              SizedBox(height: 49,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: InkWell(
                  onTap: (){Get.to(()=>PaymentSuccessConfirmation());},
                  child: Container(height: 118, width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(gradient: LinearGradient(
                          begin: Alignment.topCenter, end: Alignment.bottomCenter,
                          colors: <Color>[AppTheme.green, AppTheme.primary, AppTheme.primary],), borderRadius: BorderRadius.circular(15)),
                    child: Padding(padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Image.asset("assets/man.png"),
                          Spacer(),
                          Column( crossAxisAlignment: CrossAxisAlignment.end, children: [
                            Text("Yearly Subscription", style: TextStyle(fontFamily: "DMSans", fontSize: 24, fontWeight: FontWeight.w700, color: AppTheme.white),),
                            Text("2,000 NGN", style: TextStyle(fontFamily: "DMSans", fontSize: 18, fontWeight: FontWeight.w700, color: AppTheme.white),),
                            Spacer(),
                            Container( height: 23, width: MediaQuery.of(context).size.width / 4,
                              child: Center(child: Text("Tap here", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, fontFamily: "DMSans"),)), decoration: BoxDecoration(color: AppTheme.white, borderRadius: BorderRadius.circular(5)),),
                            SizedBox(height: 10,),
                          ],),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
