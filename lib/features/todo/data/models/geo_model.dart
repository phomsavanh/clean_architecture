import 'package:clean_architecture/features/todo/domain/entities/geo.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
part 'geo_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class GeoModel extends Geo {
  @HiveField(0)
  final String lng;
  @HiveField(1)
  final String lat;

  const GeoModel(this.lat, this.lng) : super(lat, lng);
  factory GeoModel.fromJson(Map<String, dynamic> json) =>
      _$GeoModelFromJson(json);
  Map<String, dynamic> toJson() => _$GeoModelToJson(this);
}
