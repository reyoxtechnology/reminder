import 'package:leadership_nuggets/Controllers/profile_update_controller.dart';
import 'package:get/get.dart';

class UpdateProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(UpdateProfileController());
  }
}