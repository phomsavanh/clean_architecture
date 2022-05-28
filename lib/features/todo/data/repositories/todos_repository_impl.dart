import 'dart:io';

import 'package:clean_architecture/core/error/exceptions.dart';
import 'package:clean_architecture/core/error/failures.dart';
import 'package:clean_architecture/features/todo/data/datasources/todos_local_datasource.dart';
import 'package:clean_architecture/features/todo/data/datasources/todos_remote_datasource.dart';
import 'package:clean_architecture/features/todo/domain/entities/todos.dart';
import 'package:clean_architecture/features/todo/domain/repositories/todos_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: TodosRepository)
class TodosRepositoryImpl implements TodosRepository {
  final TodosRemoteDatasource todosRemoteDatasource;
  final TodosLocalDatasource todosLocalDatasource;

  TodosRepositoryImpl(
    this.todosRemoteDatasource,
    this.todosLocalDatasource,
  );

  @override
  Future<Either<Failure, List<Todos>>> getTodos() async {
    try {
      final data = await todosRemoteDatasource.getTodos();
      //save to local
      await todosLocalDatasource.createTodos(data);
      return Right(data);
    } on SocketException catch (_) {
      final offlineData = todosLocalDatasource.getTodos();
      return Right(offlineData);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message.toString()));
    }
  }
}
