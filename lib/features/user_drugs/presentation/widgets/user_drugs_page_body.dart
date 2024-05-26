import 'package:drug_intraction_detector_app/features/user_drugs/presentation/controllers/user_drugs_controller.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/presentation/widgets/user_drug_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/config/app_texts.dart';
import '../../../../app/global_widgets/custom_text.dart';
import '../../data/models/user_drug_model.dart';

class UserDrugsPageBody extends GetView<UserDrugsController> {
  const UserDrugsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () => controller.userDrugsLoading.value
            ? const Center(child: CircularProgressIndicator())
            : controller.userDrugsLoadedFailed.value
                ? const Center(
                    child: Expanded(
                      child: CustomText(text: AppText.serverError),
                    ),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.userDrugList.length,
                    itemBuilder: (context, index) {
                      return UserDrugItem(
                        drug: controller.userDrugList[index].drug ?? Drug(),
                      );
                    },
                  ),
      ),
    );
  }
}
