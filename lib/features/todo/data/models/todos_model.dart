import 'package:clean_architecture/features/todo/domain/entities/todos.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'todos_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class TodosModel extends Todos {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int userId;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final bool completed;

  const TodosModel(this.userId, this.id, this.title, this.completed)
      : super(userId, id, title, completed);
  factory TodosModel.fromJson(Map<String, dynamic> json) =>
      _$TodosModelFromJson(json);
  Map<String, dynamic> toJson() => _$TodosModelToJson(this);
}
