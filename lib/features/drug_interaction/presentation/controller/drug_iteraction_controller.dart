import 'dart:async';

import 'package:drug_intraction_detector_app/app/config/app_texts.dart';
import 'package:drug_intraction_detector_app/features/drug_interaction/data/models/search_drug_response.dart';
import 'package:drug_intraction_detector_app/features/drug_interaction/domain/user_cases/check_drug_interaction_use_case.dart';
import 'package:drug_intraction_detector_app/features/drug_interaction/domain/user_cases/search_drug_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

import '../../../../app/config/service_locator.dart';

class DrugInteractionController extends GetxController {
  /// search drug
  SearchDrugUseCase searchDrugUseCase = serviceLocator();
  RxList<SearchedDrug> searchResultList = RxList([]);
  RxBool searchResultLoading = false.obs;
  RxBool nothingFound = false.obs;
  TextEditingController searchBoxController = TextEditingController();
  Timer? timer;

  Future searchItem() async {
    timer?.cancel();
    timer = Timer(const Duration(milliseconds: 800), () async {
      searchResultLoading(true);
      nothingFound(false);
      final result = await searchDrugUseCase(searchBoxController.text);
      result.fold(
        (l) {
          searchResultLoading(false);
          nothingFound(true);
        },
        (r) {
          searchResultLoading(false);
          searchResultList(r.data);
          if(searchResultList.isEmpty){
            nothingFound(true);
          }
        },
      );
    });
  }

  /// check drug interaction
  CheckDrugInteractionUseCase checkDrugInteractionUseCase = serviceLocator();
  RxString serverError = ''.obs;
  RxBool checkInteractionLoading = false.obs;
  RxBool noInteractionFound = false.obs;
  RxList<String> interactionsDrugList = RxList([]);

  Future getDrugInteraction(String drugName) async {
    checkInteractionLoading(true);
    noInteractionFound(false);
    interactionsDrugList([]);

    final result = await checkDrugInteractionUseCase(drugName);
    result.fold(
      (l) {
        checkInteractionLoading(false);
        serverError(l.message);
      },
      (r) {
        checkInteractionLoading(false);
        if(r.data!.result!.isNotEmpty){
          interactionsDrugList(r.data!.result);
        }
        else{
          noInteractionFound(true);
        }
      },
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
