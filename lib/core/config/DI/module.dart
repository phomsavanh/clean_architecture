import 'package:clean_architecture/core/middleware/interceptors.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @lazySingleton
  Dio dio(@Named('appInterceptors') AppInterceptors appInterceptors) {
    final dio = Dio();
    dio.interceptors.add(appInterceptors);
    return dio;
  }
}
