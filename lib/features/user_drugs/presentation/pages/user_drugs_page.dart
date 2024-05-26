import 'package:drug_intraction_detector_app/app/config/app_size.dart';
import 'package:drug_intraction_detector_app/app/config/app_texts.dart';
import 'package:drug_intraction_detector_app/app/config/app_theme.dart';
import 'package:drug_intraction_detector_app/app/global_widgets/custom_text.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/presentation/controllers/user_drugs_controller.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/presentation/widgets/add_drug_dialog.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/presentation/widgets/user_drugs_page_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../drug_interaction/presentation/pages/search_page.dart';

class UserDrugsPage extends GetView<UserDrugsController> {
  const UserDrugsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const CustomText(
          paddingLeft: 10,
          paddingBottom: 10,
          text: AppText.drugList,
          fontSize: AppSize.large_1,
          fontWeight: FontWeight.w800,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Get.toNamed(RoutesName.searchPage);
          Get.to(() => const SearchPage());
        },
        backgroundColor: AppTheme.primary,
        child: const Icon(
          Icons.add,
          color: AppTheme.secondary,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: const UserDrugsPageBody(),
    );
  }
}
