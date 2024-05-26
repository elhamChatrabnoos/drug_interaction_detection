import 'package:drug_intraction_detector_app/features/drug_interaction/presentation/pages/search_page.dart';
import 'package:drug_intraction_detector_app/features/user_drugs/presentation/pages/user_drugs_page.dart';
import 'package:get/get.dart';
import 'route_names.dart';

class RoutesPages {
  static final List<GetPage> routes = [
    GetPage(
      name: RoutesName.userDrugsPage,
      page: () => const UserDrugsPage(),
    ),
    GetPage(
      name: RoutesName.searchPage,
      page: () => const SearchPage(),
    ),
  ];
}
