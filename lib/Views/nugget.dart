import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Controllers/nugget_controller.dart';
import 'package:leadership_nuggets/Widgets/nugget_tile.dart';
class Nuggets extends StatefulWidget {
  const Nuggets({Key? key}) : super(key: key);

  @override
  _NuggetsState createState() => _NuggetsState();
}

class _NuggetsState extends State<Nuggets> {

  final _controller = Get.find<NuggetController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(
          appBar: AppBar(centerTitle: true,
            title: Text("Nuggets", style: TextStyle(fontFamily: "DMSans",fontWeight: FontWeight.w600, fontSize: 26),), backgroundColor: AppTheme.primary, elevation: 0.0,
            leading: GestureDetector(
              onTap: (){Get.back();},
              child: Padding(padding: const EdgeInsets.only(left: 13.0),
                child: Container(height: 44, width: 44, decoration: BoxDecoration(shape: BoxShape.circle, color: AppTheme.white),
                  child: Icon(Icons.arrow_back, color: AppTheme.darkGreen,),),),),),
          body: Obx(() =>
            _controller.isLoading.isTrue ?  Center(child: CircularProgressIndicator(),) :
            Container(height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: <Color>[AppTheme.primary, AppTheme.secondary, AppTheme.primary],)),
              child: ListView.builder(itemCount: _controller.nuggetResponse.length, shrinkWrap: true, physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index){
                    final data = _controller.nuggetResponse[index];
                    return Padding(padding: const EdgeInsets.only(left: 18.0, right: 8, top: 15, bottom: 15),
                      child: NuggetTile(title: data.title, image: data.image, subtitle: data.quote, tag: data.author,),);
                  }),
            )
          )
          ),
    );
  }
}
