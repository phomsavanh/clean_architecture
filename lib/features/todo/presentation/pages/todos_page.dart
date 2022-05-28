import 'package:clean_architecture/features/todo/domain/entities/todos.dart';
import 'package:clean_architecture/features/todo/presentation/cubit/todo_cubit.dart';
import 'package:clean_architecture/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.todosTitle.tr()),
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          return state.when(start: () {
            return const SizedBox();
          }, loading: () {
            return const Center(child: CircularProgressIndicator());
          }, loaded: (todos) {
            return ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                Todos todo = todos[index];
                return Text(todo.titleEntity);
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider();
              },
            );
          }, error: (error) {
            return Center(
              child: Text(
                error,
                style: Theme.of(context).textTheme.displaySmall,
              ),
            );
          });
        },
      ),
    );
  }
}
