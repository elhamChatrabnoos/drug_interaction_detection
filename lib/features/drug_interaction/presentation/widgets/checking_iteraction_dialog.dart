import 'package:drug_intraction_detector_app/app/config/app_texts.dart';
import 'package:drug_intraction_detector_app/features/drug_interaction/data/models/search_drug_response.dart';
import 'package:drug_intraction_detector_app/features/drug_interaction/presentation/controller/drug_iteraction_controller.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/presentation/controllers/user_drugs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/global_widgets/custom_text.dart';
import '../../../user_drugs/presentation/widgets/add_drug_dialog.dart';

class CheckingInteractionDialog extends GetView<DrugInteractionController> {
  const CheckingInteractionDialog({super.key, required this.drug});

  final SearchedDrug drug;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      title: const CustomText(text: AppText.checkingDrugInteraction),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_message()],
      ),
      actions: [
        CustomText(text: AppText.closeTxt, onClickText: () => Get.back()),
        const SizedBox(width: 10),
        _continueButton(context),
      ],
    );
  }

  Widget _message() {
    return Center(
      child: Obx(
        () => controller.checkInteractionLoading.value
            ? const CircularProgressIndicator()
            : CustomText(
                overflow: TextOverflow.clip,
                text: controller.noInteractionFound.value
                    ? AppText.continueMsg
                    : '${AppText.interactionMsg} ${controller.interactionsDrugList.join(',')}',
              ),
      ),
    );
  }

  Widget _continueButton(BuildContext context) {
    return Obx(
      () => controller.noInteractionFound.value
          ? CustomText(
              text: AppText.continueTxt,
              onClickText: () {
                Get.back();
                Get.find<UserDrugsController>().drugNameController.text =
                    drug.drugName ?? '';
                Get.find<UserDrugsController>().drugNumberController.text =
                    drug.drugNumber ?? '';
                Get.find<UserDrugsController>().addDrugFailed.value = false;
                Get.find<UserDrugsController>().addDrugSuccess.value = false;
                Get.find<UserDrugsController>().addDrugLoading.value = false;
                showDialog(
                  context: context,
                  builder: (context) {
                    return const AddDrugDialog();
                  },
                );
              },
            )
          : const SizedBox(),
    );
  }
}
