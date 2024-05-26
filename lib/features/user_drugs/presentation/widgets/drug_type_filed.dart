import 'package:drug_intraction_detector_app/app/config/app_texts.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/presentation/controllers/user_drugs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/global_widgets/custom_text.dart';
import 'custom_drop_down_button.dart';

class DrugTypeField extends GetView<UserDrugsController> {
  const DrugTypeField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDropDownButton(
      value: controller.drugType.value,
      items: controller.drugTypeList
          .map(
            (element) => DropdownMenuItem(
              value: element,
              child: CustomText(
                text: element,
              ),
            ),
          )
          .toList(),
      hintText: AppText.drugType,
      onchange: (value) => controller.drugType.value = value,
    );
  }
}
