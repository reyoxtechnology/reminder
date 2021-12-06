import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Controllers/update_reminder_time_controller.dart';

class NuggetReminderScreen extends StatefulWidget {
  late String? selectedTime;
  NuggetReminderScreen({Key? key, this.selectedTime}) : super(key: key);

  @override
  _NuggetReminderScreenState createState() => _NuggetReminderScreenState();
}

class _NuggetReminderScreenState extends State<NuggetReminderScreen> {

  final _controller = Get.put(UpdateReminderTimeController());
  TimeOfDay? selectedTime = TimeOfDay.now();

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(context: context, initialTime: selectedTime!,
      builder: (BuildContext context, Widget? child){
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false), child: child!,);
      },
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if(timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
        widget.selectedTime = selectedTime.toString();
      });
      _controller.setReminderTime(selectedTime!.format(context));
    }
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
      child: Scaffold( resizeToAvoidBottomInset: false,
          appBar: AppBar(centerTitle: true,
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
                Text("${selectedTime!.format(context)}", style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600, color: AppTheme.white, fontFamily: "OpenSans" ),)
              ],
          ),
          ),
      ),
    );
  }
}
