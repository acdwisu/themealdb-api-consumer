import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'constants.dart';

final dio = Dio(BaseOptions(
  baseUrl: '${baseUrl}api/json/v1/1',
))..interceptors.add(LogInterceptor(
  requestBody: true,
  responseBody: true,
));

late bool production;

final locator = GetIt.instance;

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();