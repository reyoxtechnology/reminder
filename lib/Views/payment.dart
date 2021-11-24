import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Widgets/custom_button.dart';
import 'package:leadership_nuggets/Widgets/custom_form_field.dart';
class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false,bottom: false,
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
          body: Column(
            children: [SizedBox(height: 236,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("TOTAL: 2,000 NGR", style: TextStyle(fontWeight: FontWeight.w600, fontFamily: "DMSans"),),],
              ),
              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  children: [
                    CustomFormField(validator: (value){}, elevation: 0.0,
                      labelText: "xxxx xxxx xxxx xxxx",
                      focusedBorderColor: AppTheme.grey.withOpacity(0.3),
                      enabledBorderColor: AppTheme.grey.withOpacity(0.3),
                      height: 50, backgroundColor: Colors.transparent,
                    ),
                    Text("Powered by paystack", style: TextStyle(fontFamily: "DMSans", fontWeight: FontWeight.w600, fontSize: 14, color: AppTheme.blue),),
                    SizedBox(height: 33,),
                    CustomButton(onPressed: (){},buttonRadius: 10, buttonHeight: 52, borderColor: AppTheme.green, decorationColor: AppTheme.green, buttonText: "Proceed",)
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
