import 'package:clean_architecture/core/error/failures.dart';
import 'package:clean_architecture/core/usecases/usecase.dart';
import 'package:clean_architecture/features/todo/domain/entities/todos.dart';
import 'package:clean_architecture/features/todo/domain/repositories/todos_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetTodosUseCase implements UseCase<List<Todos>, NoParams> {
  final TodosRepository todosRepository;
  GetTodosUseCase(this.todosRepository);

  @override
  Future<Either<Failure, List<Todos>>> call(NoParams noParams) async {
    return await todosRepository.getTodos();
  }
}
