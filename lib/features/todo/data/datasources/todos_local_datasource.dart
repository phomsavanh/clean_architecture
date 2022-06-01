import 'package:clean_architecture/core/constants/hive_path.dart';
import 'package:clean_architecture/core/services/hive_database_service.dart';
import 'package:clean_architecture/features/todo/data/models/todos_model.dart';
import 'package:clean_architecture/features/todo/data/models/user_model.dart';
import 'package:injectable/injectable.dart';

abstract class TodosLocalDatasource {
  Future<bool> createTodos(List<TodosModel> todos);
  Future<bool> createUsers(List<UserModel> users);
  List<TodosModel> getTodos();
  List<UserModel> getUsers();
}

@LazySingleton(as: TodosLocalDatasource)
class TodosLocalDatasourceImpl extends TodosLocalDatasource {
  final HiveDatabaseService hiveDatabaseService;
  TodosLocalDatasourceImpl(this.hiveDatabaseService);
  //send the resposne from local database or some third party, if error throw our exception here or you can throw on services.

  @override
  Future<bool> createTodos(List<TodosModel> todos) async {
    List<Map<String, TodosModel>> data = [];
    for (TodosModel item in todos) {
      data.add({item.id.toString(): item});
    }
    try {
      await hiveDatabaseService.multiCreate<TodosModel>(
          HiveBoxPath.todos, data);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  List<TodosModel> getTodos() {
    return hiveDatabaseService.getAll<TodosModel>(HiveBoxPath.todos);
  }

  @override
  List<UserModel> getUsers() {
    return hiveDatabaseService.getAll<UserModel>(HiveBoxPath.user);
  }

  @override
  Future<bool> createUsers(List<UserModel> users) async {
    List<Map<String, UserModel>> data = [];
    for (UserModel item in users) {
      data.add({item.id.toString(): item});
    }
    try {
      await hiveDatabaseService.multiCreate<UserModel>(HiveBoxPath.user, data);
      return true;
    } catch (e) {
      return false;
    }
  }
}
