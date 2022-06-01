import 'package:clean_architecture/features/todo/domain/entities/company.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class CompanyModel extends Company {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String catchPhrase;
  @HiveField(2)
  final String bs;

  const CompanyModel(this.name, this.catchPhrase, this.bs)
      : super(
          name,
          catchPhrase,
          bs,
        );
  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);
}
