import 'package:clean_architecture/core/error/exceptions.dart';
import 'package:clean_architecture/core/services/api_client.dart';
import 'package:clean_architecture/core/util/response_helper.dart';
import 'package:clean_architecture/features/todo/data/models/todos_model.dart';
import 'package:clean_architecture/features/todo/data/models/user_model.dart';
import 'package:clean_architecture/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

abstract class TodosRemoteDatasource {
  Future<List<TodosModel>> getTodos();
  Future<List<UserModel>> getUsers();
}

@LazySingleton(as: TodosRemoteDatasource)
class TodosRemoteDatasourceImpl extends TodosRemoteDatasource {
  final ApiClient apiClient;
  TodosRemoteDatasourceImpl(this.apiClient);

  //send the resposne from Remote database or some third party, if error throw our exception here or you can throw on services.
  @override
  Future<List<TodosModel>> getTodos() async {
    try {
      return await apiClient.getTodos();
    } on DioError catch (e) {
      throw ResponseHelper.returnResponse(e);
    } catch (e) {
      throw ServerException(LocaleKeys.somethingWrong.tr());
    }
  }

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      return await apiClient.getUsers();
    } on DioError catch (e) {
      throw ResponseHelper.returnResponse(e);
    } catch (e) {
      throw ServerException(LocaleKeys.somethingWrong.tr());
    }
  }
}
