import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Widgets/nugget_tile.dart';
class FavouriteNuggets extends StatefulWidget {
  const FavouriteNuggets({Key? key}) : super(key: key);

  @override
  _FavouriteNuggetsState createState() => _FavouriteNuggetsState();
}

class _FavouriteNuggetsState extends State<FavouriteNuggets> {
  final favouriteNuggetItem = [
    {"image": "assets/6.png", "title": "Never doubt that a small group of thoughtful, concerned citizens can change...", "subtitle": "John Maxwell", "tag": "Leadership"},
    {"image": "assets/7.png", "title": "A leader is one who knows the way, goes the way, and shows the way.",  "subtitle": "John Maxwell","tag": "Leadership"},
    {"image": "assets/8.png", "title": "A leader is one who knows the way, goes the way, and shows the way.",  "subtitle": "John Maxwell", "tag": "Leadership"},
    {"image": "assets/9.png", "title": "A leader is one who knows the way, goes the way, and shows the way.",  "subtitle": "John Maxwell", "tag": "Leadership"},
    {"image": "assets/10.png", "title": "A leader is one who knows the way, goes the way, and shows the way.",  "subtitle": "John Maxwell", "tag": "Leadership"},
    {"image": "assets/11.png", "title": "A leader is one who knows the way, goes the way, and shows the way.",  "subtitle": "John Maxwell", "tag": "Leadership"},
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
      child: Scaffold(
          appBar: AppBar(centerTitle: true,
            title: Text("Favoutite Nuggets", style: TextStyle(fontFamily: "DMSans",fontWeight: FontWeight.w600, fontSize: 26),), backgroundColor: AppTheme.primary, elevation: 0.0,
            leading: GestureDetector(
              onTap: (){Get.back();},
              child: Padding(padding: const EdgeInsets.only(left: 13.0),
                child: Container(height: 44, width: 44, decoration: BoxDecoration(shape: BoxShape.circle, color: AppTheme.white),
                  child: Icon(Icons.arrow_back, color: AppTheme.darkGreen,),),),),),
          body: Container(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: <Color>[AppTheme.primary, AppTheme.secondary, AppTheme.primary],)),
            child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Image.asset("assets/swipe.png"),
                    Text("swipe on quote to delete", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, fontFamily: "Inter", color: AppTheme.white),),],),
                ListView.builder(itemCount: favouriteNuggetItem.length, shrinkWrap: true, physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index){
                      final data = favouriteNuggetItem[index];
                      return Padding(padding: const EdgeInsets.only(left: 18.0, right: 8, top: 15, bottom: 15),
                        child: NuggetTile(title: data["title"], image: data["image"], subtitle: data["subtitle"], tag: data["tag"],),);
                    }),
              ],
            ),
          )
      ),
    );
  }
}