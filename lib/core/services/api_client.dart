import 'package:clean_architecture/core/constants/api_path.dart';
import 'package:clean_architecture/features/todo/data/models/todos_model.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

@lazySingleton
@RestApi(baseUrl: ApiPaht.baseUrl)
abstract class ApiClient {
  @factoryMethod
  factory ApiClient(Dio dio) = _ApiClient;

  @GET(ApiPaht.todos)
  Future<List<TodosModel>> getTodos();
}
