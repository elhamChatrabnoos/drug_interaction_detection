
import 'package:drug_intraction_detector_app/features/drug_interaction/data/data_source/drug_interaction_remote_data.dart';
import 'package:drug_intraction_detector_app/features/drug_interaction/data/repository/drug_interaction_repository_impl.dart';
import 'package:drug_intraction_detector_app/features/drug_interaction/data/repository/drug_interaction_repository_impl.dart';
import 'package:drug_intraction_detector_app/features/drug_interaction/data/repository/drug_interaction_repository_impl.dart';
import 'package:drug_intraction_detector_app/features/drug_interaction/data/repository/drug_interaction_repository_impl.dart';
import 'package:drug_intraction_detector_app/features/drug_interaction/domain/user_cases/check_drug_interaction_use_case.dart';
import 'package:drug_intraction_detector_app/features/drug_interaction/domain/user_cases/search_drug_use_case.dart';
import 'package:get_it/get_it.dart';

import '../../features/user_drugs/data/data_source/user_drugs_remote_data.dart';
import '../../features/user_drugs/data/repository/user_drug_repository_impl.dart';
import '../../features/user_drugs/domain/user_cases/add_user_drug_use_case.dart';
import '../../features/user_drugs/domain/user_cases/get_user_drugs_use_case.dart';

GetIt serviceLocator = GetIt.instance;

void setup() {


  /// ********************* drug interaction injections *********************
  serviceLocator
      .registerLazySingleton<DrugInteractionRemoteData>(() => DrugInteractionRemoteData());

  serviceLocator.registerLazySingleton<DrugInteractionRepositoryImpl>(() =>
      DrugInteractionRepositoryImpl(
          remoteData: serviceLocator.get<DrugInteractionRemoteData>()));

  /// search drug
  serviceLocator.registerLazySingleton(() =>
      SearchDrugUseCase(
          repository: serviceLocator.get<DrugInteractionRepositoryImpl>()));

  /// check drug interaction
  serviceLocator.registerLazySingleton(() =>
      CheckDrugInteractionUseCase(
          repository: serviceLocator.get<DrugInteractionRepositoryImpl>()));


  /// ********************* user drug injections *********************
  serviceLocator
      .registerLazySingleton<UserDrugsRemoteData>(() => UserDrugsRemoteData());

  serviceLocator.registerLazySingleton<UserDrugRepositoryImpl>(() =>
      UserDrugRepositoryImpl(
          remoteData: serviceLocator.get<UserDrugsRemoteData>()));

  /// get user drugs
  serviceLocator.registerLazySingleton(() =>
      GetUserDrugsUseCase(
          repository: serviceLocator.get<UserDrugRepositoryImpl>()));

  /// add user drug
  serviceLocator.registerLazySingleton(() =>
      AddUserDrugUseCase(
          repository: serviceLocator.get<UserDrugRepositoryImpl>()));

}
