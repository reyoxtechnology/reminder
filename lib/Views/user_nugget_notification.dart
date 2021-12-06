import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Models/notification_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {


  var url = Uri.parse("https://reminder.bitcash.ng/api/all/notifications");
  Future <NotificationResponseModel>? getAllNotifications() async{
    SharedPreferences getToken = await SharedPreferences.getInstance();
    final token = getToken.getString("token");
    Map<String, String> headers = {"Content-Type": "application/json", "Accept": "application/json",  "Authorization" : "Bearer $token"};
    final response = await get(url, headers: headers,);
      if (response.statusCode == 200 || response.statusCode == 201){
        return notificationResponseModelFromJson(response.body);
      } else{
        throw Exception("Fail to load data");
      }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(resizeToAvoidBottomInset: false,
          appBar: AppBar(centerTitle: true,
            title: Text("Notification", style: TextStyle(fontFamily: "OpenSans",fontWeight: FontWeight.bold, fontSize: 30, color: AppTheme.grey),),
            backgroundColor: AppTheme.white, elevation: 0.0,
            leading: GestureDetector(
              onTap: (){Get.back();},
              child: Padding(
                padding: const EdgeInsets.only(left: 13.0),
                child: Container(height: 44, width: 44, decoration: BoxDecoration(shape: BoxShape.circle, color: AppTheme.hash),
                  child: Icon(Icons.arrow_back, color: AppTheme.darkGreen,),),
              ),),),
          body: FutureBuilder(future: getAllNotifications(),
              builder: (context,  AsyncSnapshot<NotificationResponseModel>? snapshot) {
            if (snapshot!.hasData) {
              return Container(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
                  child: ListView.builder(itemCount: snapshot.data!.unread.length, shrinkWrap: true, physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index){
                        final data = snapshot.data!.unread[index].data;
                        return Padding(padding: const EdgeInsets.only(left: 18.0, right: 8, top: 10, bottom: 10),
                          child: Container(
                            height: 55, width: MediaQuery.of(context).size.width,decoration: BoxDecoration(color: AppTheme.white, borderRadius: BorderRadius.circular(12)),
                            child: Row(children: [
                              Text(data.quote, style: TextStyle(fontSize: 16, color: AppTheme.grey),),
                            ],),
                          ),);}),);
            }else{
              return Center(child: CircularProgressIndicator(),);
            }
          })
        ),
    );
  }
}
