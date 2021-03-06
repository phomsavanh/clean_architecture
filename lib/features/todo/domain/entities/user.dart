import 'package:clean_architecture/features/todo/domain/entities/adress.dart';
import 'package:clean_architecture/features/todo/domain/entities/company.dart';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int idEntity;
  final String nameEntity,
      usernameEntity,
      phoneEntity,
      websiteEntity,
      emailEntity;
  final Address addressEntity;
  final Company companyEntity;

  const User(
      this.idEntity,
      this.nameEntity,
      this.usernameEntity,
      this.phoneEntity,
      this.emailEntity,
      this.websiteEntity,
      this.addressEntity,
      this.companyEntity);

  @override
  List<Object?> get props => [
        idEntity,
        nameEntity,
        usernameEntity,
        emailEntity,
        phoneEntity,
        websiteEntity,
        addressEntity,
        companyEntity,
      ];
}
