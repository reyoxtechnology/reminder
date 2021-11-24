import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
class NuggetReminderScreen extends StatefulWidget {
  const NuggetReminderScreen({Key? key}) : super(key: key);

  @override
  _NuggetReminderScreenState createState() => _NuggetReminderScreenState();
}

class _NuggetReminderScreenState extends State<NuggetReminderScreen> {
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(context: context, initialTime: TimeOfDay.now());
    print(picked);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Nugget Reminder", style: TextStyle(fontFamily: "OpenSans",fontWeight: FontWeight.w600, fontSize: 30),),
            backgroundColor: AppTheme.primary, elevation: 0.0,
            leading: GestureDetector(
              onTap: (){Get.back();},
              child: Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: Container(height: 44, width: 44, decoration: BoxDecoration(shape: BoxShape.circle, color: AppTheme.white),
                    child: Icon(Icons.arrow_back, color: AppTheme.darkGreen,),),
              ),),),
          body: Container(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width, decoration: BoxDecoration(gradient: LinearGradient(
            begin: Alignment.topCenter, end: Alignment.bottomCenter,
            colors: <Color>[AppTheme.primary, AppTheme.secondary, AppTheme.primary],
          )),
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [Container(
                width: MediaQuery.of(context).size.width,
                  child: Image.asset("assets/clock.png"),),
                GestureDetector(onTap: (){_selectTime(context);},
                  child: Container(height: 45,width: 45,
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    shape: BoxShape.circle,), child: Icon(Icons.edit, color: AppTheme.secondary,),),
                ),
                SizedBox(height: 5,),
                Text("Everybody", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: AppTheme.white, fontFamily: "DMSans" ),),
                SizedBox(height: 5,),
                Text("06:00PM", style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600, color: AppTheme.white, fontFamily: "OpenSans" ),)
              ],
          ),
          ),
      ),
    );
  }
}
