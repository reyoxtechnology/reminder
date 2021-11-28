import 'package:get/get.dart';
import 'package:leadership_nuggets/Controllers/contact_us_controller.dart';

import 'package:leadership_nuggets/Controllers/nugget_controller.dart';
import 'package:leadership_nuggets/Controllers/profile_update_controller.dart';

class DashBoardBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(NuggetController());
    Get.put(UpdateProfileController());
  }
}