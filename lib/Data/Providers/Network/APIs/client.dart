import 'package:dio/dio.dart';
import 'package:movie_app/app/Config/settings.dart';

final options = BaseOptions(
  baseUrl: Settings.baseUrl,
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 3),
);

final dio = Dio(options);
