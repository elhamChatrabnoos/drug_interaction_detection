import 'package:dartz/dartz.dart';
import 'package:drug_intraction_detector_app/app/exceptions/server_exception.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/data/models/new_drug_model.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/data/models/user_drug_model.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/domain/repository/user_drug_repository.dart';

import '../../data/models/success_response.dart';

class AddUserDrugUseCase{
  UserDrugRepository repository;

  AddUserDrugUseCase({required this.repository});

  Future<Either<ServerException, SuccessResponse>> call(NewDrugModel drug) async{
    return await repository.addUserDrug(drug);
  }

}