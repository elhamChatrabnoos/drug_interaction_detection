import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../app/config/app_size.dart';
import '../../../../app/config/app_texts.dart';
import '../../../../app/config/app_theme.dart';
import '../../../../app/global_widgets/custom_text_field.dart';
import '../controller/drug_iteraction_controller.dart';


class SearchField extends GetView<DrugInteractionController>{
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: controller.searchBoxController,
      onChanged: (value) {
        controller.searchItem();
      },
      autofocus: true,
      enableBorder: true,
      fixFieldLeftToRight: true,
      margin: 30,
      contentPadding: EdgeInsets.zero,
      hintText: AppText.searchDrug,
      hintStyle: const TextStyle(
        fontSize: AppSize.medium_1,
        color: AppTheme.onSecondary,
      ),
      prefixIcon: const Icon(
        Icons.search,
        size: 20,
        color: AppTheme.onSecondary,
      ),
    );
  }
}
