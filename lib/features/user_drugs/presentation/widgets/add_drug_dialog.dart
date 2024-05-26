import 'package:drug_intraction_detector_app/app/config/app_texts.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/presentation/controllers/user_drugs_controller.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/presentation/widgets/add_drug_dialog_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/global_widgets/custom_text.dart';

class AddDrugDialog extends GetView<UserDrugsController> {
  const AddDrugDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      title: const CustomText(text: AppText.addNewDrugDialogTitle),
      content: Obx(
        () => SingleChildScrollView(
          child: controller.addDrugLoading.value
              ? const Center(child: CircularProgressIndicator())
              : controller.addDrugFailed.value
                  ? const CustomText(text: AppText.serverError)
                  : controller.addDrugSuccess.value
                      ? CustomText(text: controller.successMessage.value, overflow: TextOverflow.clip,)
                      : const AddDrugDialogBody(),
        ),
      ),
      actions: [
        CustomText(text: AppText.closeTxt, onClickText: () => Get.back()),
        Obx(
          () => Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 10),
              controller.addDrugFailed.value ||
                      controller.addDrugLoading.value ||
                      controller.addDrugSuccess.value
                  ? const SizedBox()
                  : CustomText(
                      text: AppText.submit,
                      onClickText: () => controller.addNewDrug(),
                    ),
            ],
          ),
        )
      ],
    );
  }
}
