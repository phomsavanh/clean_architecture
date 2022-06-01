import 'package:clean_architecture/features/todo/data/models/address_model.dart';
import 'package:clean_architecture/features/todo/data/models/company_model.dart';
import 'package:clean_architecture/features/todo/domain/entities/user.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@HiveType(typeId: 4)
@JsonSerializable()
class UserModel extends User {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final CompanyModel company;
  @HiveField(3)
  final AddressModel address;
  @HiveField(4)
  final String username;
  @HiveField(5)
  final String email;
  @HiveField(6)
  final String phone;
  @HiveField(7)
  final String website;

  const UserModel(this.id, this.name, this.username, this.email, this.phone,
      this.website, this.company, this.address)
      : super(id, name, username, phone, email, website, address, company);
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
