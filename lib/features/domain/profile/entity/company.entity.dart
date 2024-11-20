import 'package:equatable/equatable.dart';

class CompanyEntity extends Equatable {
  final int id;
  final String title;
  final String? phoneNumber; 
  final DateTime registerDate;
  final DateTime updatedAt;
  final DateTime? deletedAt; 
  final String status;

  const CompanyEntity({
    required this.id,
    required this.title,
    this.phoneNumber,
    required this.registerDate,
    required this.updatedAt,
    this.deletedAt,
    required this.status,
  });
  
  @override
  List<Object?> get props => [id , phoneNumber];

}

