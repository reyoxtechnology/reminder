import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';

import 'dashboard.dart';

class NuggetsSettings extends StatefulWidget {
  const NuggetsSettings({Key? key}) : super(key: key);
  @override
  _NuggetsSettingsState createState() => _NuggetsSettingsState();
}
class _NuggetsSettingsState extends State<NuggetsSettings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
        bottom: false,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: <Color>[AppTheme.primary, AppTheme.primary],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(onPressed: (){
                            Navigator.of(context).pop();
                          }, icon: Icon(Icons.arrow_back_ios,color: AppTheme.white,)),
                          SizedBox(width: 80,),
                          Container(child: Column(
                            children: [
                              Text("Today's Nugget" , textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, fontFamily: "Lato", color: AppTheme.white),),
                              Text("3rd-May-2021" , textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, fontFamily: "Lato", color: AppTheme.white),),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ],
                )
            ),
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 26),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    height: MediaQuery.of(context).size.height / 2.3,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 12),
                      child: Column(
                        children: [
                          Text("Leadership Nugget", style: TextStyle(fontWeight: FontWeight.w800, fontFamily: "DMSans", fontSize: 24, color: AppTheme.darkGreen),),
                          SizedBox(height: 20,),
                          ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.3), child: Text("Leadership is the capacity to translate vision into reality", style: TextStyle(fontWeight: FontWeight.w400, fontFamily: "DMSans", fontSize: 20, color: AppTheme.darkGreen),)),
                          SizedBox(height: 20,),
                          Container(height: 5, width: MediaQuery.of(context).size.width, color: AppTheme.secondary,),
                          SizedBox(height: 20,),
                          Text("Leadership Quote for Today", style: TextStyle(fontWeight: FontWeight.w800, fontFamily: "DMSans", fontSize: 24, color: AppTheme.darkGreen),),
                          SizedBox(height: 20,),
                          ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.3), child: Text("“Leadership is the capacity to translate vision into reality”", style: TextStyle(fontWeight: FontWeight.w400, fontFamily: "DMSans", fontSize: 20, color: AppTheme.darkGreen),)),
                          SizedBox(height: 20,),
                          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                            Text("Mark Watson", style: TextStyle(fontSize: 22, fontFamily: "DMSans", fontWeight: FontWeight.w800, color: AppTheme.darkText),)],),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 48,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Column(
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.6, height: 35,
                          decoration: BoxDecoration(color: AppTheme.primary, borderRadius: BorderRadius.circular(5),),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.favorite_border, color: AppTheme.white,),
                            SizedBox(width: 5,),
                            Text("Today's Nuggets", style: TextStyle(fontWeight: FontWeight.w400, fontFamily: "DMSans", color: AppTheme.white),)
                          ],
                        ),),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.6, height: 35,
                          decoration: BoxDecoration(color: AppTheme.secondary, borderRadius: BorderRadius.circular(5),),
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.share, color: AppTheme.white,),
                            SizedBox(width: 5,),
                            Text("Share Nuggets", style: TextStyle(fontWeight: FontWeight.w400, fontFamily: "DMSans", color: AppTheme.white),)
                          ],
                        ),),
                      ],
                    ),
                    SizedBox(height: 50,),
                    Icon(Icons.notifications_active, color: AppTheme.secondary, size: 30,),
                    Text("Your Notification Settings", style: AppTheme.body1WithBlackText,),
                    SizedBox(height: 25,),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.6, height: 35,
                          decoration: BoxDecoration(color: AppTheme.primary, borderRadius: BorderRadius.circular(5),),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.favorite_border, color: AppTheme.white,),
                              SizedBox(width: 5,),
                              Text("Everyday", style: TextStyle(fontWeight: FontWeight.w400, fontFamily: "DMSans", color: AppTheme.white),)
                            ],
                          ),),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.6, height: 35,
                          decoration: BoxDecoration(color: AppTheme.secondary, borderRadius: BorderRadius.circular(5),),
                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.share, color: AppTheme.white,),
                              SizedBox(width: 5,),
                              Text("6:30PM", style: TextStyle(fontWeight: FontWeight.w400, fontFamily: "DMSans", color: AppTheme.white),)
                            ],
                          ),),
                      ],
                    ),
                    SizedBox(height: 40,),
                    GestureDetector(
                      onTap: (){
                        Get.off(()=>DashBoard());
                      },
                      child: Container(
                        height: 30,width: 30,
                        decoration: BoxDecoration(
                            color: AppTheme.paleBlue.withOpacity(0.1), shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/homepage.png"),
                          )
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
