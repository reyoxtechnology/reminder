import 'package:get/get.dart';
import 'package:leadership_nuggets/Controllers/create_account_controller.dart';

class CreateAccountBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(CreateAccountController());
  }
}