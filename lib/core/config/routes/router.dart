import 'package:clean_architecture/core/config/DI/configure_dependencies.dart';
import 'package:clean_architecture/features/todo/presentation/cubit/todo_cubit.dart';
import 'package:clean_architecture/features/todo/presentation/pages/todos_page.dart';
import 'package:clean_architecture/root_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  static const String initialRoute = "/";
  static const String todosRoute = "/todos";
  static Route<dynamic>? routeGenerate(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => const RootPage());
      case todosRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<TodoCubit>()..getTodos(),
            child: const TodosPage(),
          ),
          fullscreenDialog: true,
        );
      default:
        return null;
    }
  }
}
