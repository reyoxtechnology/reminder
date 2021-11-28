import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:leadership_nuggets/Constants/AppTheme.dart';
import 'package:leadership_nuggets/Controllers/all_nuggets_In_a_categories_controller.dart';
import 'package:leadership_nuggets/Widgets/custom_picture_button.dart';
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final options = [
    {"image": "assets/critical_thinking_option.png", "title": "Critical Thinking"},
    {"image": "assets/communication_option.png", "title": "Communication"},
    {"image": "assets/confidence_option.png", "title": "Confidence"},
    {"image": "assets/connection_option.png", "title": "Connection"},
    {"image": "assets/community_option.png", "title": "Community"},
    {"image": "assets/competence_option.png", "title": "Competence"},
  ];

  final _controller = Get.put(AllNuggetCategories());
  @override
  Widget build(BuildContext context) {
    return SafeArea(top: false, bottom: false,
        child: Scaffold(resizeToAvoidBottomInset: false,
          appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0.0,
            leading: GestureDetector(
              onTap: (){Get.back();},
              child: Padding(padding: const EdgeInsets.all(8.0),
                child: Container(height: 44, width: 44, decoration: BoxDecoration(borderRadius: BorderRadius.circular(18), color: AppTheme.grey.withOpacity(0.2)),
                  child: Icon(Icons.arrow_back, color: AppTheme.darkGreen,),),),),),
          body: Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Align(alignment: Alignment.topCenter,child: Text("Categories", style: AppTheme.header,)),
                SizedBox(height: 20,),
                Container(height: 95, width: MediaQuery.of(context).size.width, decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/category.png")), borderRadius: BorderRadius.circular(12.77)),),
                SizedBox(height: 25,),
                Obx(
                  ()=>_controller.isLoading.isTrue ? Center(child: CircularProgressIndicator(),) : Expanded(
                    child: GridView(primary: false, physics: BouncingScrollPhysics(), shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 18, mainAxisExtent: 150),
                      children: List.generate(_controller.allNuggetInACategoryResponse.length, (index) {final data = _controller.allNuggetInACategoryResponse[index];
                        return CustomPictureButton(elevation: 0, image: "assets/critical_thinking_option.png", btnTitle: data.categoryName, onTap: (){},);}
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
