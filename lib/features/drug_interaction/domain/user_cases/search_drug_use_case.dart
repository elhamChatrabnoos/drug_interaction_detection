import 'package:dartz/dartz.dart';
import 'package:drug_intraction_detector_app/features/drug_interaction/domain/repository/drug_interaction_repository.dart';

import '../../../../app/exceptions/server_exception.dart';
import '../../data/models/search_drug_response.dart';

class SearchDrugUseCase{
  final DrugInteractionRepository repository;

  SearchDrugUseCase({required this.repository});

  Future<Either<ServerException, SearchedDrugResponse>> call(String key) async {
    return await repository.searchDrug(key);
  }
}