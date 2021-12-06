import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Controllers/get_all_favourite_nugget_controller.dart';
import 'package:leadership_nuggets/Widgets/custom_button.dart';
import 'package:leadership_nuggets/Widgets/nugget_tile.dart';
class FavouriteNuggets extends StatefulWidget {
  const FavouriteNuggets({Key? key}) : super(key: key);

  @override
  _FavouriteNuggetsState createState() => _FavouriteNuggetsState();
}

class _FavouriteNuggetsState extends State<FavouriteNuggets> {


  _buildDialog(BuildContext context, String id) => showDialog(context: context, barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return Dialog(backgroundColor: Colors.transparent, elevation: 0.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
          child: Container(height: MediaQuery.of(context).size.height / 2, color: Colors.transparent,
            child: Stack(
              children: [
                Align(alignment: Alignment.bottomCenter,
                  child: Container(height: MediaQuery.of(context).size.height / 4, color: AppTheme.white,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Are you sure you want to remove this nugget from favourite?",
                          textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700, fontFamily: "Nunito"),),
                        SizedBox(height: 20,),
                        Row( mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                          CustomButton( buttonText: "No, Cancel", textColor: AppTheme.grey,
                              decorationColor: AppTheme.hash, buttonRadius: 5, borderColor: AppTheme.hash,
                              buttonWidth: MediaQuery.of(context).size.width / 3, onPressed: () => Navigator.of(context).pop(false),),
                          CustomButton( buttonText: "Yes, Please", textColor: AppTheme.white,
                              decorationColor: AppTheme.green, buttonRadius: 5, borderColor: AppTheme.green,
                              buttonWidth: MediaQuery.of(context).size.width / 3, onPressed: (){
                                _controller.removeNuggetFromFavourite(id);
                              }),
                        ],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(alignment: Alignment.center,
                  child: Container(
                    height: 80, width: 80,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: AppTheme.white),
                    child: Center(child: Container(height: 60, width: 60,
                      decoration: BoxDecoration(color: AppTheme.secondary, shape: BoxShape.circle),
                      child: Icon(Icons.error_outline, size: 30, color: AppTheme.white,),),),
                  ),
                ),
              ],
            ),
          ),
        );
      });
  final _controller = Get.put(AllFavouriteNuggetController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
      child: Scaffold(
          appBar: AppBar(centerTitle: true,
            title: Text("Favourite Nuggets", style: TextStyle(fontFamily: "DMSans",fontWeight: FontWeight.w600, fontSize: 26),), backgroundColor: AppTheme.primary, elevation: 0.0,
            leading: GestureDetector(
              onTap: (){Get.back();},
              child: Padding(padding: const EdgeInsets.only(left: 13.0),
                child: Container(height: 44, width: 44, decoration: BoxDecoration(shape: BoxShape.circle, color: AppTheme.white),
                  child: Icon(Icons.arrow_back, color: AppTheme.darkGreen,),),),),),
          body: Obx(()=> _controller.allFavouriteNuggetResponse.isEmpty ?   Center(child: Column( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10,),
              Text("Loading Favourite Nuggets...", style: TextStyle(fontFamily: "Inter", fontWeight: FontWeight.w400, fontSize: 16),),
            ],
          )) :
             Container(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: <Color>[AppTheme.primary, AppTheme.secondary, AppTheme.primary],)),
              child: Column(children: [
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Image.asset("assets/swipe.png"),
                      Text("swipe on quote to delete", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12, fontFamily: "Inter", color: AppTheme.white),),],),
                  ListView.builder(itemCount: _controller.allFavouriteNuggetResponse.first.length, shrinkWrap: true, physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index){
                        final data = _controller.allFavouriteNuggetResponse.first[index];
                        return Padding(padding: const EdgeInsets.only(left: 18.0, right: 8, top: 15, bottom: 15),
                          child: Dismissible(
                            key: Key(data.toString()),
                              onDismissed: (DismissDirection direction){
                              if(direction == DismissDirection.endToStart){
                                _controller.allFavouriteNuggetResponse.first.removeAt(index);
                              } else {
                                print("No function to run");}
                              },
                              direction: DismissDirection.endToStart,
                              background: Container(color: Colors.red, child: Padding(padding: const EdgeInsets.all(15),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                                    children: [Icon(Icons.remove_circle_outline_sharp, color: Colors.white), Text('Remove from favorite', style: TextStyle(color: Colors.white)),],),),),
                              confirmDismiss: (DismissDirection direction)async{
                              return await _buildDialog(context, data.id.toString());},
                              child: NuggetTile(title: data.title, image: data.image, subtitle: data.quote, tag: data.author)),);
                      }),
                ],
              ),
            ),
          )
      ),
    );
  }
}