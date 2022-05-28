import 'package:bloc/bloc.dart';
import 'package:clean_architecture/core/usecases/usecase.dart';
import 'package:clean_architecture/features/todo/domain/entities/todos.dart';
import 'package:clean_architecture/features/todo/domain/usecases/todos_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'todo_state.dart';
part 'todo_cubit.freezed.dart';

@injectable
class TodoCubit extends Cubit<TodoState> {
  final GetTodosUseCase getTodosUseCase;
  TodoCubit(this.getTodosUseCase) : super(const TodoState.start());

  Future<void> getTodos() async {
    emit(const TodoState.loading());
    final request = await getTodosUseCase(NoParams());
    request.fold((error) => emit(TodoState.error(error.message)),
        (todos) => emit(TodoState.loaded(todos: todos)));
  }
}
