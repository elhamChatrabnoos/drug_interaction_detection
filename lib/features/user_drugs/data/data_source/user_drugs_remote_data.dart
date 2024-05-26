import 'package:dio/dio.dart';
import 'package:drug_intraction_detector_app/app/config/app_helper.dart';
import 'package:drug_intraction_detector_app/app/network/apis_addresses.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/data/models/new_drug_model.dart';

import '../../../../app/exceptions/server_exception.dart';

class UserDrugsRemoteData {
  Future<Response> getUserDrugs() async {
    try {
      final response =
          await AppHelper.dioConfig.dio.get(ApisAddresses.getUserDrugs);

      return response;
    } on DioException catch (error) {
      throw ServerException(message: error.message);
    }
  }

  Future<Response> addUserDrug(NewDrugModel drug) async {
    try {
      final response = await AppHelper.dioConfig.dio.post(
        ApisAddresses.addNewDrug,
        data: drug.toJson(),
      );

      return response;
    } on DioException catch (error) {
      throw ServerException(message: error.message);
    }
  }
}
