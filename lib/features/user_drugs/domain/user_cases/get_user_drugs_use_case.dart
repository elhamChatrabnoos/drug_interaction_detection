import 'package:dartz/dartz.dart';
import 'package:drug_intraction_detector_app/app/exceptions/server_exception.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/data/models/user_drug_model.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/domain/repository/user_drug_repository.dart';

class GetUserDrugsUseCase{
  UserDrugRepository repository;

  GetUserDrugsUseCase({required this.repository});

  Future<Either<ServerException, UserDrugModel>> call() async{
    return await repository.getUserDrugs();
  }
}