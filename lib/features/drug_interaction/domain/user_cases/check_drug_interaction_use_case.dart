import 'package:dartz/dartz.dart';
import 'package:drug_intraction_detector_app/features/drug_interaction/data/models/drug_interaction_response.dart';
import 'package:drug_intraction_detector_app/features/drug_interaction/domain/repository/drug_interaction_repository.dart';

import '../../../../app/exceptions/server_exception.dart';

class CheckDrugInteractionUseCase {
  final DrugInteractionRepository repository;

  CheckDrugInteractionUseCase({required this.repository});

  Future<Either<ServerException, DrugInteractionResponse>> call(
      String drugName) async {
    return await repository.checkDrugInteraction(drugName);
  }
}
