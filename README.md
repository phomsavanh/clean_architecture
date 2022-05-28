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
