import 'package:dartz/dartz.dart';
import 'package:drug_intraction_detector_app/app/exceptions/server_exception.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/data/data_source/user_drugs_remote_data.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/data/models/new_drug_model.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/data/models/user_drug_model.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/domain/repository/user_drug_repository.dart';

import '../models/success_response.dart';

class UserDrugRepositoryImpl extends UserDrugRepository {
  UserDrugsRemoteData remoteData;

  UserDrugRepositoryImpl({required this.remoteData});

  @override
  Future<Either<ServerException, UserDrugModel>> getUserDrugs() async {
    try {
      final response = await remoteData.getUserDrugs();
      final receivedData = response.data;
      UserDrugModel model = UserDrugModel.fromJson(receivedData);
      if (model.message != 'success') {
        return Left(ServerException(message: model.message));
      }

      return Right(model);
    } on ServerException catch (e) {
      return Left(ServerException(message: e.toString()));
    }
  }

  @override
  Future<Either<ServerException, SuccessResponse>> addUserDrug(NewDrugModel drug) async{
    try {
      final response = await remoteData.addUserDrug(drug);
      final receivedData = response.data;
      SuccessResponse model = SuccessResponse.fromJson(receivedData);

      return Right(model);
    } on ServerException catch (e) {
      return Left(ServerException(message: e.message.toString()));
    }
  }
}
