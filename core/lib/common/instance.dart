import 'package:dio/dio.dart';

final dio = Dio(BaseOptions(
  baseUrl: 'https://www.themealdb.com/api/json/v1/1',
))..interceptors.add(LogInterceptor(
  requestBody: true,
  responseBody: true,
));

