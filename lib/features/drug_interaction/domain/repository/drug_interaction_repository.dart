import 'package:dartz/dartz.dart';
import 'package:drug_intraction_detector_app/features/drug_interaction/data/models/drug_interaction_response.dart';

import '../../../../app/exceptions/server_exception.dart';
import '../../data/models/search_drug_response.dart';

abstract class DrugInteractionRepository{
  Future<Either<ServerException, SearchedDrugResponse>> searchDrug(String key);
  Future<Either<ServerException, DrugInteractionResponse>> checkDrugInteraction(String drugName);
}