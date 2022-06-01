import 'package:clean_architecture/core/constants/hive_path.dart';
import 'package:clean_architecture/features/todo/data/models/address_model.dart';
import 'package:clean_architecture/features/todo/data/models/company_model.dart';
import 'package:clean_architecture/features/todo/data/models/geo_model.dart';
import 'package:clean_architecture/features/todo/data/models/todos_model.dart';
import 'package:clean_architecture/features/todo/data/models/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class HiveDatabaseService {
  static initialize() async {
    await Hive.initFlutter();
    //resgister adapter
    Hive.registerAdapter(TodosModelAdapter());
    Hive.registerAdapter(AddressModelAdapter());
    Hive.registerAdapter(CompanyModelAdapter());
    Hive.registerAdapter(GeoModelAdapter());
    Hive.registerAdapter(UserModelAdapter());

    //open box
    await Hive.openBox<TodosModel>(HiveBoxPath.todos);
    await Hive.openBox<TodosModel>(HiveBoxPath.adress);
    await Hive.openBox<TodosModel>(HiveBoxPath.company);
    await Hive.openBox<TodosModel>(HiveBoxPath.geo);
    await Hive.openBox<TodosModel>(HiveBoxPath.user);
  }

  Box<T> getBox<T>(String name) {
    return Hive.box<T>(name);
  }

  List<T> getAll<T>(String name) {
    final result = Hive.box<T>(name).values.toList();
    return result;
  }

  List<T> getByCondition<T>(String name, bool Function(T value) takeWhile) {
    List<T> data = getAll<T>(name).where(takeWhile).toList();
    return data;
  }

  T? getByKey<T>(String name, String key) {
    final result = Hive.box<T>(name).get(key);
    return result;
  }

  Future<void> deleteByKey<T>(String name, String key) async {
    await Hive.box<T>(name).delete(key);
  }

  Future<void> deleteAll<T>(String name) async {
    await Hive.box<T>(name).clear();
  }

  Future<void> multiCreate<T>(String name, List<Map<String, T>> data) async {
    for (Map<String, T> item in data) {
      await Hive.box<T>(name).putAll(item);
    }
  }

  Future<void> createOne<T>(String name, String key, T data) async {
    await Hive.box<T>(name).put(key, data);
  }
}
