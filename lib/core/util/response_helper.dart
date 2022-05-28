import 'dart:io';

import 'package:clean_architecture/core/error/exceptions.dart';
import 'package:clean_architecture/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';

class ResponseHelper {
  static Exception returnResponse(DioError dioError) {
    try {
      if (dioError.error.runtimeType == SocketException &&
          dioError.type == DioErrorType.other) {
        return SocketException(dioError.message);
      } else {
        return ServerException(
          dioError.message,
        );
      }
    } catch (e) {
      return ServerException(LocaleKeys.somethingWrong.tr());
    }
  }
}
