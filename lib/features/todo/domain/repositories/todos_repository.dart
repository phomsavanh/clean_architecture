import 'package:clean_architecture/core/error/failures.dart';
import 'package:clean_architecture/features/todo/domain/entities/todos.dart';
import 'package:clean_architecture/features/todo/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class TodosRepository {
  Future<Either<Failure, List<Todos>>> getTodos();
  Future<Either<Failure, List<User>>> getUsers();
}
