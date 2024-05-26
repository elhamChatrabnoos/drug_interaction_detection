import 'package:drug_intraction_detector_app/app/config/app_texts.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/data/models/user_drug_model.dart';
import 'package:flutter/material.dart';

import '../../../../app/config/app_size.dart';
import '../../../../app/config/app_theme.dart';
import '../../../../app/global_widgets/custom_text.dart';

class UserDrugItem extends StatelessWidget {
  const UserDrugItem({super.key, required this.drug});

  final Drug drug;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppTheme.onPrimary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: drug.drugName ?? '',
            fontSize: AppSize.medium_2,
            fontWeight: FontWeight.bold,
          ),
          CustomText(
            fontSize: AppSize.medium_1,
            text: '${AppText.dosageFrequently}: ${drug.dosageFrequency ?? ''}',
          ),
          CustomText(
            fontSize: AppSize.medium_1,
            text: '${AppText.drugType}: ${drug.drugType ?? ''}',
          ),
          CustomText(
            fontSize: AppSize.medium_1,
            text: '${AppText.usageType}: ${drug.usageType ?? ''}',
          ),
          CustomText(
            fontSize: AppSize.medium_1,
            text: '${AppText.startDate}: ${drug.startDate ?? ''}',
          ),
          CustomText(
            fontSize: AppSize.medium_1,
            text: '${AppText.endDate}: ${drug.endDate ?? ''}',
          ),
          drug.dosage != ''
              ? CustomText(
                  fontSize: AppSize.medium_1,
                  text: '${AppText.drugDosage}: ${drug.dosage}',
                )
              : const SizedBox(),
          drug.note != ''
              ? CustomText(
                  fontSize: AppSize.medium_1,
                  text: '${AppText.note}: ${drug.note}',
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
