import 'package:drug_intraction_detector_app/features/drug_interaction/presentation/controller/drug_iteraction_controller.dart';
import 'package:drug_intraction_detector_app/features/drug_interaction/presentation/widgets/checking_iteraction_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/config/app_size.dart';
import '../../../../app/config/app_theme.dart';
import '../../../../app/global_widgets/custom_text.dart';
import '../../data/models/search_drug_response.dart';

class SearchedItem extends GetView<DrugInteractionController> {
  const SearchedItem({super.key, required this.drug});

  final SearchedDrug drug;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.getDrugInteraction(drug.drugName ?? '');
        showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) {
            return CheckingInteractionDialog(drug: drug);
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        alignment: Alignment.topLeft,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppTheme.onSecondaryContainer,
        ),
        child: CustomText(
          textAlign: TextAlign.start,
          text: drug.drugName ?? '',
          fontSize: AppSize.medium_2,
        ),
      ),
    );
  }
}
