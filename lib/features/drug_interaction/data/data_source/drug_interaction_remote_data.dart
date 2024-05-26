import 'package:dio/dio.dart';
import 'package:drug_intraction_detector_app/app/config/app_helper.dart';
import 'package:drug_intraction_detector_app/app/network/apis_addresses.dart';

import '../../../../app/exceptions/server_exception.dart';

class DrugInteractionRemoteData {
  Future<Response> searchDrug(String key) async {
    try {
      final response = await AppHelper.dioConfig.dio
          .get(ApisAddresses.searchDrug, queryParameters: {'search': key});

      return response;
    } on DioException catch (error) {
      throw ServerException(message: error.message);
    }
  }

  Future<Response> checkDrugInteraction(String drugName) async {
    try {
      final response = await AppHelper.dioConfig.dio
          .post(ApisAddresses.checkDrugInteraction, data: {'drug_name' : drugName});

      return response;
    } on DioException catch (error) {
      throw ServerException(message: error.message);
    }
  }
}
