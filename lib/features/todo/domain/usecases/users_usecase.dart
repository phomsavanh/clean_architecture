import 'package:clean_architecture/core/error/failures.dart';
import 'package:clean_architecture/core/usecases/usecase.dart';
import 'package:clean_architecture/features/todo/domain/entities/user.dart';
import 'package:clean_architecture/features/todo/domain/repositories/todos_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUsersUseCase implements UseCase<List<User>, NoParams> {
  final TodosRepository todosRepository;
  GetUsersUseCase(this.todosRepository);

  @override
  Future<Either<Failure, List<User>>> call(NoParams noParams) async {
    return await todosRepository.getUsers();
  }
}
