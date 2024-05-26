import 'package:drug_intraction_detector_app/app/config/service_locator.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/domain/user_cases/add_user_drug_use_case.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/domain/user_cases/get_user_drugs_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../data/models/new_drug_model.dart';
import '../../data/models/user_drug_model.dart';

class UserDrugsController extends GetxController {
  /// load user drug
  RxBool userDrugsLoading = false.obs;
  RxBool userDrugsLoadedSuccess = false.obs;
  RxBool userDrugsLoadedFailed = false.obs;
  RxList<DrugModel> userDrugList = RxList([]);

  GetUserDrugsUseCase getUserDrugsUseCase = serviceLocator();

  Future getUserDrugs() async {
    userDrugsLoading(true);
    userDrugsLoadedFailed(false);
    userDrugsLoadedSuccess(false);

    final result = await getUserDrugsUseCase();
    result.fold(
      (l) {
        userDrugsLoading(false);
        userDrugsLoadedFailed(true);
      },
      (r) {
        userDrugsLoading(false);
        userDrugsLoadedSuccess(true);
        userDrugList(r.data);
      },
    );
  }

  /// add new drug
  List<String> dosageFrequencyList = ['od', 'bid'];
  List<String> drugTypeList = ['supplement', 'medicine'];
  List<String> usageTypeList = ['oral', 'topical', 'rectal'];

  RxString drugDosageFrequently = ''.obs;
  RxString drugType = ''.obs;
  RxString drugUsageType = ''.obs;

  TextEditingController drugNameController = TextEditingController();
  TextEditingController drugNumberController = TextEditingController();
  TextEditingController drugDosageController = TextEditingController();
  TextEditingController drugNoteController = TextEditingController();
  TextEditingController drugStartDateController = TextEditingController();
  TextEditingController drugEndDateController = TextEditingController();

  AddUserDrugUseCase addUserDrugUseCase = serviceLocator();

  RxBool addDrugLoading = false.obs;
  RxBool addDrugSuccess = false.obs;
  RxBool addDrugFailed = false.obs;
  RxString successMessage = ''.obs;

  Future addNewDrug() async {
    NewDrugModel drug = NewDrugModel(
      dosage: drugDosageController.text,
      dosageFrequency: drugDosageFrequently.value,
      drugName: drugNameController.text,
      drugNumber: drugNumberController.text,
      drugType: drugType.value,
      endDate: drugEndDateController.text,
      startDate: drugStartDateController.text,
      note: drugNoteController.text,
      usageType: drugUsageType.value,
    );

    addDrugLoading(true);

    final result = await addUserDrugUseCase(drug);
    result.fold(
      (l) {
        addDrugLoading(false);
        addDrugFailed(true);
      },
      (r) {
        addDrugLoading(false);
        addDrugSuccess(true);
        successMessage(r.message);
        drugDosageController.text = '';
        drugNoteController.text = '';
        drugStartDateController.text = '';
        drugEndDateController.text = '';
        getUserDrugs();
      },
    );
  }

  @override
  void onInit() {
    getUserDrugs();
    drugDosageFrequently = dosageFrequencyList[0].obs;
    drugType = drugTypeList[0].obs;
    drugUsageType = usageTypeList[0].obs;

    super.onInit();
  }

  @override
  void dispose() {
    drugNameController.dispose();
    drugNumberController.dispose();
    drugDosageController.dispose();
    drugNoteController.dispose();
    drugStartDateController.dispose();
    drugEndDateController.dispose();
    super.dispose();
  }
}
