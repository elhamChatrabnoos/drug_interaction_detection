import 'package:drug_intraction_detector_app/app/config/app_binding.dart';
import 'package:drug_intraction_detector_app/app/config/service_locator.dart';
import 'package:drug_intraction_detector_app/app/routers/route_pages.dart';
import 'package:drug_intraction_detector_app/features/drug_interaction/presentation/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/user_drugs/presentation/pages/user_drugs_page.dart';

void main(){
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AppBinding(),
      debugShowCheckedModeBanner: false,
      title: 'Drug interaction detector',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      locale: const Locale("en", "Us"),
      getPages: RoutesPages.routes,
      home: const UserDrugsPage(),
    );
  }
}
