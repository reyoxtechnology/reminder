import 'package:get/get.dart';
import 'package:leadership_nuggets/Models/show_all_nugget_in_a_category_model.dart';
import 'package:leadership_nuggets/Services/http_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowNuggetsInACategoryByIdController extends GetxController{
  var nuggetInACategory = <NuggetsInACategory>[].obs;
  RxBool isLoading = false.obs;

  Future showNuggetsInACategoryById(int id) async{
    var url = Uri.parse("https://reminder.bitcash.ng/api/nugget/$id");
    showLoading();
    SharedPreferences getToken = await SharedPreferences.getInstance();
    final token = getToken.getString("token");
    Map<String, String> headers = {"Content-Type": "application/json", "Accept": "application/json",  "Authorization" : "Bearer $token"};
    await HttpClient().getMethod(headers, url).then((value){
      if (value.statusCode == 200 || value.statusCode == 201){
        hideLoading();
        nuggetInACategory.value = showAllNuggetsInACategoryFromJson(value.body).data;
      }
    }).catchError((error){
      print(error);
    });
  }
  showLoading(){
    isLoading.toggle();
  }

  hideLoading(){
    isLoading.toggle();
  }
}