import 'package:dartz/dartz.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/data/models/new_drug_model.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/data/models/user_drug_model.dart';

import '../../../../app/exceptions/server_exception.dart';
import '../../data/models/success_response.dart';

abstract class UserDrugRepository{
  Future<Either<ServerException, UserDrugModel>> getUserDrugs();
  Future<Either<ServerException, SuccessResponse>> addUserDrug(NewDrugModel drug);
}