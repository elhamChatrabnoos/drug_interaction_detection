import 'package:drug_intraction_detector_app/features/user_drugs/presentation/controllers/user_drugs_controller.dart';
import 'package:get/get.dart';

import '../../features/drug_interaction/presentation/controller/drug_iteraction_controller.dart';

class AppBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => DrugInteractionController(), fenix: true);
    Get.lazyPut(() => UserDrugsController(), fenix: true);
  }


}
