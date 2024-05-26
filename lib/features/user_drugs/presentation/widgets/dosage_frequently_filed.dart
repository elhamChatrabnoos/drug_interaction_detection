import 'package:drug_intraction_detector_app/app/config/app_texts.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/presentation/controllers/user_drugs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/global_widgets/custom_text.dart';
import 'custom_drop_down_button.dart';

class DosageFrequentlyFiled extends GetView<UserDrugsController> {
  const DosageFrequentlyFiled({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDropDownButton(
      value: controller.drugDosageFrequently.value,
      items: controller.dosageFrequencyList
          .map((element) => DropdownMenuItem(
                value: element,
                child: CustomText(
                  text: element,
                ),
              ))
          .toList(),
      hintText: AppText.dosageFrequently,
      onchange: (value) => controller.drugDosageFrequently.value = value,
    );
  }
}
