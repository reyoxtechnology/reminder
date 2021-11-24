import 'package:get/get.dart';
import 'package:leadership_nuggets/Controllers/create_account_controller.dart';
import 'package:leadership_nuggets/Controllers/google_auth_controller.dart';
import 'package:leadership_nuggets/Controllers/login_account_controller.dart';

class GoogleSignInBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(GoogleAuthController());
    Get.put(LoginController());
    Get.put(CreateAccountController());
  }

}