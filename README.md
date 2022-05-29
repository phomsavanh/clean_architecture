# clean_architecture

## Before run the app:
1. Generate DI
    ``` 
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

2. Generate localize key
    ``` 
    flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart
    ```
## How to crerate hive box
1. Create model
    ```
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
    ```
    ### Note: typeId should be unique.
2. Generate hive
    ```
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
3. Initialize hive
- go to lib\core\services\hive_database_service.dart
- then looking for initialize method
- you will commend call: resgister adapter and open box
- if step work well, just register model:
    ```
    Hive.registerAdapter(TodosModelAdapter());
    ```
    ### Note: the adapter will be created on step, and the name of adapter is "Model name + Adapter"
- you have the open box like this:
    ```
    await Hive.openBox<TodosModel>(HiveBoxPath.todos);
    ```
    ### Note: put type as you model and hive box path just string or some names that you want to define.
4. Test your hive database
