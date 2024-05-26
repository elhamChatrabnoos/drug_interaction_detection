import 'package:drug_intraction_detector_app/features/user_drugs/presentation/controllers/user_drugs_controller.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/presentation/widgets/date_feild.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/presentation/widgets/usage_type_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/config/app_size.dart';
import '../../../../app/config/app_texts.dart';
import '../../../../app/global_widgets/custom_text_field.dart';
import 'dosage_frequently_filed.dart';
import 'drug_type_filed.dart';

class AddDrugDialogBody extends GetView<UserDrugsController> {
  const AddDrugDialogBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomTextField(
          readOnly: true,
          controller: controller.drugNameController,
          enableBorder: true,
          labelText: AppText.drugName,
          labelStyle: const TextStyle(fontSize: AppSize.small_2),
          width: 300,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          readOnly: true,
          controller: controller.drugNumberController,
          enableBorder: true,
          labelText: AppText.drugNumber,
          labelStyle: const TextStyle(fontSize: AppSize.medium_1),
          width: 300,
        ),
        const SizedBox(height: 20),
        const DosageFrequentlyFiled(),
        const SizedBox(height: 20),
        const DrugTypeField(),
        const SizedBox(height: 20),
        CustomTextField(
          controller: controller.drugDosageController,
          enableBorder: true,
          labelText: AppText.drugDosage,
          labelStyle: const TextStyle(fontSize: AppSize.medium_1),
          width: 300,
        ),
        const SizedBox(height: 20),
        const UsageTypeField(),
        const SizedBox(height: 20),
        DateField(
          hintText: AppText.startDate,
          textController: controller.drugStartDateController,
        ),
        const SizedBox(height: 20),
        DateField(
          hintText: AppText.endDate,
          textController: controller.drugEndDateController,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          textAlign: TextAlign.start,
          controller: controller.drugNoteController,
          enableBorder: true,
          labelText: AppText.note,
          labelStyle: const TextStyle(fontSize: AppSize.medium_1),
          width: 300,
          maxLines: 3,
        ),
      ],
    );
  }
}
