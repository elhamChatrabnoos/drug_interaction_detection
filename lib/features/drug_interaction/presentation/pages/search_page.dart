import 'package:drug_intraction_detector_app/app/global_widgets/custom_text.dart';
import 'package:drug_intraction_detector_app/features/drug_interaction/presentation/controller/drug_iteraction_controller.dart';
import 'package:drug_intraction_detector_app/features/drug_interaction/presentation/widgets/search_feild.dart';
import 'package:drug_intraction_detector_app/features/drug_interaction/presentation/widgets/searched_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../app/config/app_texts.dart';

class SearchPage extends GetView<DrugInteractionController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            const SearchField(),
            Obx(() {
              return controller.searchResultLoading.value
                  ? const Expanded(
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : controller.nothingFound.value
                      ? const Expanded(
                          child: Center(
                            child: CustomText(text: AppText.nothingFound),
                          ),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.searchResultList.length,
                          itemBuilder: (context, index) {
                            return SearchedItem(
                              drug: controller.searchResultList[index],
                            );
                          },
                        );
            })
          ],
        ),
      ),
    );
  }
}
