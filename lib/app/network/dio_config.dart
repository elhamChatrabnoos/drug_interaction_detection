import 'package:dio/dio.dart';
import 'package:drug_intraction_detector_app/app/network/apis_addresses.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


class DioConfig {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: ApisAddresses.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  DioConfig(BuildContext? context) {
    _dio.interceptors.add(
      InterceptorsWrapper(
          onRequest: (options, handler) {
            options.headers['Authorization'] = 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE4NzEzMzAwLCJpYXQiOjE3MTYxMjEzMDAsImp0aSI6ImQ5YmY4NWE0YmRjZjQzZDJiNTgwZWY0ZjZkNGZmYWNjIiwidXNlcl9pZCI6MjN9.Q6ZJGmcbajpj3M8D-oaPHJbxlBaLrAO2fV1OMuuxMF4';
            return handler.next(options);
          },
          onError: (DioException e, handler) async {
            return handler.next(e);
          },
          onResponse: (response, handler) => handler.next(response)),
    );
    _dio.interceptors.add(PrettyDioLogger(requestHeader: true));
  }

  Dio get dio => _dio;
}
