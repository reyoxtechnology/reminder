import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Controllers/add_nugget_to_favorite_controller.dart';
import 'package:leadership_nuggets/Models/show_nugget_model.dart';
import 'package:leadership_nuggets/Views/dashboard.dart';
import 'package:leadership_nuggets/Views/nugget_reminder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewNugget extends StatefulWidget {
  final int id;
  final String? imageUrl;
  const ViewNugget({Key? key, required this.id, this.imageUrl}) : super(key: key);

  @override
  _ViewNuggetState createState() => _ViewNuggetState();
}

class _ViewNuggetState extends State<ViewNugget> {
  final _controller = Get.put(AddNuggetToFavouriteController());

  Future <Data>? showNugget(int id) async {
    SharedPreferences getToken = await SharedPreferences.getInstance();
    final token = getToken.getString("token");
    var url = Uri.parse("https://reminder.bitcash.ng/api/nugget/$id");
    final response = await get(url, headers: {"Content-Type": "application/json", "Accept": "application/json", "Authorization" : "Bearer $token"},);
    if(response.statusCode == 200 || response.statusCode == 201) {
      return showNuggetsModelFromJson(response.body).data;
    } else {
      throw Exception("Fail to load data");
    }
  }

  String? selectedTime;

  var newDt = DateFormat.yMMMEd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80.0),
            child: Container(decoration: const BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: <Color>[AppTheme.primary, AppTheme.primary],),),
                child: Column(mainAxisAlignment: MainAxisAlignment.end,
                  children: [Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(onPressed: (){
                            Navigator.of(context).pop();
                          }, icon: Icon(Icons.arrow_back_ios,color: AppTheme.white,)),
                          SizedBox(width: 80,),
                          Container(child: Column(
                            children: [
                              Text("Today's Nugget" , textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, fontFamily: "Lato", color: AppTheme.white),),
                              Text(newDt , textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, fontFamily: "Lato", color: AppTheme.white),),
                            ],
                          )),
                        ],
                      ),
                    ),
                  ],
                )
            ),
          ),
          body: FutureBuilder(future: showNugget(widget.id),
              builder: (context, AsyncSnapshot<Data?> snapshot){
            if (snapshot.hasData){
              return Column(
                children: [
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 26),
                    child: Card(elevation: 3, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child: Container(height: MediaQuery.of(context).size.height / 2.3, width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),),
                        child: Padding(padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 12),
                          child: Column(
                            children: [
                              Container(height: 107, width: MediaQuery.of(context).size.width / 3, decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),), child: Image.network(widget.imageUrl!),),
                              SizedBox(height: 20,),
                              Text(snapshot.data!.title, style: TextStyle(fontWeight: FontWeight.w800, fontFamily: "DMSans", fontSize: 24, color: AppTheme.darkGreen),),
                              SizedBox(height: 20,),
                              ConstrainedBox(constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.3), child: Text("“${snapshot.data!.quote}”", style: TextStyle(fontWeight: FontWeight.w400, fontFamily: "DMSans", fontSize: 20, color: AppTheme.darkGreen),)),
                              SizedBox(height: 20,),
                              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                Text(snapshot.data!.author, style: TextStyle(fontSize: 22, fontFamily: "DMSans", fontWeight: FontWeight.w800, color: AppTheme.darkText),)],),
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
                            GestureDetector(onTap: (){_controller.addNuggetAsFavourite(widget.id.toString());},
                              child: Container(
                                width: MediaQuery.of(context).size.width / 2.6, height: 35,
                                decoration: BoxDecoration(color: AppTheme.primary, borderRadius: BorderRadius.circular(5),),
                                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.favorite_border, color: AppTheme.white,),
                                    SizedBox(width: 5,),
                                    Text("Today's Nuggets", style: TextStyle(fontWeight: FontWeight.w400, fontFamily: "DMSans", color: AppTheme.white),)
                                  ],
                                ),),
                            ),
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
                                  Text("Everyday", style: TextStyle(fontWeight: FontWeight.w400, fontFamily: "DMSans", color: AppTheme.white),)],),),
                            GestureDetector(onTap: (){Get.to(()=>NuggetReminderScreen(selectedTime: selectedTime,));},
                              child: Container(width: MediaQuery.of(context).size.width / 2.6, height: 35,
                                decoration: BoxDecoration(color: AppTheme.hash, borderRadius: BorderRadius.circular(5),),
                                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(selectedTime ?? "6:30PM", style: TextStyle(fontWeight: FontWeight.w400, fontFamily: "DMSans", color: AppTheme.black),)
                                  ],
                                ),),
                            ),
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
              );
            } else{
              return Center(child: CircularProgressIndicator(),);
            }
          })
        )
    );
  }
}
