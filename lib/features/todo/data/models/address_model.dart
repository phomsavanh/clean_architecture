import 'package:clean_architecture/features/todo/data/models/geo_model.dart';
import 'package:clean_architecture/features/todo/domain/entities/adress.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address_model.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class AddressModel extends Address {
  @HiveField(0)
  final String street;
  @HiveField(1)
  final GeoModel geo;
  @HiveField(2)
  final String suite;
  @HiveField(3)
  final String city;
  @HiveField(4)
  final String zipcode;

  const AddressModel(this.street, this.suite, this.city, this.zipcode, this.geo)
      : super(
          street,
          suite,
          city,
          zipcode,
          geo,
        );
  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}
