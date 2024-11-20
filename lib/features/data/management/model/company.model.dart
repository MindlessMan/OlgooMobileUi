import 'package:olgoo_mobile/features/domain/profile/entity/company.entity.dart';

class CompanyModel extends CompanyEntity {
  const CompanyModel({id, title, registerDate, updatedAt, status})
      : super(
            id: id,
            title: title,
            registerDate: registerDate,
            updatedAt: updatedAt,
            status: status);

  factory CompanyModel.fromJson(dynamic json) {
    return CompanyModel(
      id: json['id'],
      title: json['title'],
      registerDate: DateTime.parse(json['registerDate']),
      updatedAt: DateTime.parse(json['updatedAt']),
      status: json['status'],
    );
  }
}
