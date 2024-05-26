import 'package:dartz/dartz.dart';

import 'package:drug_intraction_detector_app/app/exceptions/server_exception.dart';
import 'package:drug_intraction_detector_app/features/drug_interaction/data/data_source/drug_interaction_remote_data.dart';
import 'package:drug_intraction_detector_app/features/drug_interaction/data/models/drug_interaction_response.dart';

import '../../domain/repository/drug_interaction_repository.dart';
import '../models/search_drug_response.dart';

class DrugInteractionRepositoryImpl extends DrugInteractionRepository {
  DrugInteractionRemoteData remoteData;

  DrugInteractionRepositoryImpl({required this.remoteData});

  @override
  Future<Either<ServerException, DrugInteractionResponse>> checkDrugInteraction(
      String drugName) async {
    try {
      final response = await remoteData.checkDrugInteraction(drugName);
      final receivedData = response.data;

      DrugInteractionResponse model = DrugInteractionResponse.fromJson(receivedData);

      return Right(model);
    } on ServerException catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerException, SearchedDrugResponse>> searchDrug(String key) async {
    try {
      final response = await remoteData.searchDrug(key);
      final receivedData = response.data;
      SearchedDrugResponse model = SearchedDrugResponse.fromJson(receivedData);

      if(model.message != 'success'){
        return Left(ServerException(message: model.message));
      }

      return Right(model);
    } on ServerException catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }
}
