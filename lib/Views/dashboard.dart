import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Binding/dashboard_binding.dart';
import 'package:leadership_nuggets/Binding/update_profile_binding.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Views/nugget_categories.dart';
import 'package:leadership_nuggets/Views/contact_us.dart';
import 'package:leadership_nuggets/Views/edit_profile.dart';
import 'package:leadership_nuggets/Views/favourite_nugget.dart';
import 'package:leadership_nuggets/Views/nugget.dart';
import 'package:leadership_nuggets/Views/nugget_reminder.dart';
import 'package:leadership_nuggets/Views/rate_us.dart';
import 'package:leadership_nuggets/Views/subscription.dart';
import 'package:leadership_nuggets/Views/user_nugget_notification.dart';
import 'package:leadership_nuggets/Widgets/custom_picture_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  var index;

_navigation(int index) {
    String title = dbOptions[index]["title"]!;
    switch(title) {
      case "Nuggets": {Get.to(()=>Nuggets(), binding: DashBoardBinding());}
      break;
      case "Categories": {Get.to(()=>CategoriesScreen());}
      break;
      case "Nugget Reminder": {Get.to(()=>NuggetReminderScreen());}
      break;
      case "Favourite Nuggets": {Get.to(()=>FavouriteNuggets());}
      break;
      case "Resources": {print("Resources");}
      break;
      case "Blog": {print("Blog");}
      break;
      case "Contact Us": {Get.to(()=>ContactUs());}
      break;
      case "Rate Us": {Get.to(()=>RateUs());}
      break;
      default: {Get.to(()=>DashBoard());}
      break;
    }
  }
  var _firstName;
  void initUserData() async {
    final SharedPreferences userdata = await SharedPreferences.getInstance();
    setState(() {
      _firstName = (userdata.getString("userName"));
    });
  }

  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null || now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "Click again to exit", backgroundColor: AppTheme.hash, textColor: AppTheme.black);
      return Future.value(false);
    }
    return Future.value(true);
  }


  @override
  void initState() {
    initUserData();
    super.initState();
  }

  final dbOptions = [
    {"image": "assets/nuggets.png", "title": "Nuggets"},
    {"image": "assets/categories.png", "title": "Categories"},
    {"image": "assets/nugget_reminder.png", "title": "Nugget Reminder"},
    {"image": "assets/favorite_nugget.png", "title": "Favourite Nuggets"},
    {"image": "assets/resources.png", "title": "Resources"},
    {"image": "assets/blog.png", "title": "Blog"},
    {"image": "assets/contact_us.png", "title": "Contact Us"},
    {"image": "assets/rate_us.png", "title": "Rate Us"},
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent, elevation: 0.0,
            leading: Icon(Icons.menu),
            iconTheme: IconThemeData(color: AppTheme.black),
            actions: [
              GestureDetector(onTap: (){Get.to(()=>EditProfile(), binding: UpdateProfileBinding());},
                child: CircleAvatar(backgroundColor: AppTheme.black, radius: 15, child: Icon(Icons.person, color: AppTheme.white,),),),
              GestureDetector(onTap: (){Get.to(()=>NotificationScreen());},
                  child: Image.asset("assets/notification.png")),],),
          body: WillPopScope(onWillPop: ()=>onWillPop(),
            child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Text("Welcome, ${_firstName.toString().split(" ").first}", style: AppTheme.header,),
                  SizedBox(height: 30,),
                  GestureDetector(onTap: (){
                    Get.to(()=>Subscription());
                  },
                    child: Container(
                      height: 95, width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13), color: AppTheme.primary,
                      ),child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                        Container(height: 38,width: 37, decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: AppTheme.white),
                          child: Center(child: Container(height: 20, width: 20, decoration: BoxDecoration(shape: BoxShape.circle, color: AppTheme.secondary),)),),
                      Text("Premium \nMember", style: TextStyle(fontFamily: "DMSans", color: AppTheme.white, fontWeight: FontWeight.bold, fontSize: 14),),
                      Container(height: 95, width: 15, color: AppTheme.secondary,),
                      Container(width: 134, height: 27, decoration: BoxDecoration(color: AppTheme.secondary, borderRadius: BorderRadius.circular(8)),
                        child: Center(child: Text("Today's Nugget", style: TextStyle(fontSize: 14, color: AppTheme.white),),),),
                    ],),),
                  ),
                  SizedBox(height: 17,),
                  Expanded(child: GridView(primary: false, physics: BouncingScrollPhysics(), shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 18, mainAxisExtent: 150),
                      children: List.generate(dbOptions.length, (index) {final data = dbOptions[index];
                      return CustomPictureButton(elevation: 2, image: data["image"], btnTitle: data["title"], onTap: (){_navigation(index);});}),),),
                ],
              ),
            ),
          ),
        )
    );
  }
}
