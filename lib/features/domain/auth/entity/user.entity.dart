import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int? id;
  final String? name;
  final String? phone;
  final DateTime? registerDate;
  final DateTime? updatedAt;
  final String? status;
  final List<dynamic>? role;
  final String? refToken;
  final String? accToken;

  const UserEntity({
    this.id,
    this.name,
    this.phone,
    this.status,
    this.registerDate,
    this.updatedAt,
    this.role,
    this.refToken,
    this.accToken,
  });

  @override
  List<Object?> get props => [id, name, phone, role, status, refToken];
}

