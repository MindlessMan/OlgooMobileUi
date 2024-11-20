// ignore_for_file: use_super_parameters

import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../domain/auth/entity/user.entity.dart';

class UserModel extends UserEntity {
  const UserModel({id, name, phone, role, status, registerAt, updatedAt, refToken,accToken})
      : super(
            id: id,
            name: name,
            phone: phone,
            updatedAt: updatedAt,
            registerDate: registerAt,
            status: status,
            role: role,
            refToken: refToken,
            accToken:accToken 
            );
             

  factory UserModel.fromJson(dynamic json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        phone: json['phoneNumber'],
        status: json['status'],
        registerAt:DateTime.parse( json['registerDate']),
        updatedAt:DateTime.parse( json['updatedAt'],),
        role: json['role'],
        refToken: json['tokens']["refresh_token"],
        accToken: json['tokens']["access_token"],
        );
  }  
  factory UserModel.fromJsonWithOutTokens(dynamic json) {
    return UserModel(
        id: json['id'],
        name: json['name'],
        phone: json['phoneNumber'],
        status: json['status'],
        registerAt:DateTime.parse( json['registerDate']),
        updatedAt:DateTime.parse( json['updatedAt'],),
        role: json['role'],
        );
  }

  factory UserModel.jwtConvert(String token) {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    return UserModel.fromJson(decodedToken);
  }
}
