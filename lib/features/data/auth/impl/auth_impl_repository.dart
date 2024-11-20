import 'package:dio/dio.dart';
import 'package:olgoo_mobile/config/errors/error_handling.dart';
import 'package:olgoo_mobile/core/dependency_injection/locator.dart';
import 'package:olgoo_mobile/core/resource/data_state.dart';
import 'package:olgoo_mobile/core/utils/preferences_oprator.dart';
import 'package:olgoo_mobile/features/data/auth/model/user.model.dart';
import 'package:olgoo_mobile/features/domain/auth/entity/user.entity.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../domain/auth/repository/auth.repository.dart';
import '../src/remote/auth.api.dart';

class AuthIMPLRepository extends AuthRepository {
  AuthApiProvider apiProvider;
  PreferencesOprator preferencesOprator =
      PreferencesOprator(locator<SharedPreferences>());
  AuthIMPLRepository({required this.apiProvider});

  @override
  Future<DataState<UserEntity>> getUsersCompanyInfo(
      String username, String password) {
    // TODO: implement getUsersCompanyInfo
    throw UnimplementedError();
  }

  @override
  Future<DataState<dynamic>> login(String phone) async {
    try {
      Response response = await apiProvider.callLogin(phone);
      if (response.statusCode == 201) {
        return SuccessData(response.data);
      } else {
        return FailedData(errorHandling(response.statusCode!));
      }
    } on DioException catch (e) {
      return FailedData(errorHandling(e.response!.statusCode!));
    }
  }

  @override
  Future<DataState<UserEntity>> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<DataState<UserEntity>> sendOTP(String username, String password) {
    throw UnimplementedError();
  }

  @override
  Future<DataState<UserEntity>> registerUser(
      String username, String companyname) async {
    try {
      Response response = await apiProvider.registerUser(username, companyname);
      if (response.statusCode == 201) {
        UserEntity user = UserModel.fromJsonWithOutTokens(response.data);
        return SuccessData(user);
      } else {
        return FailedData(errorHandling(response.statusCode!));
      }
    } on DioException catch (e) {
      return FailedData(errorHandling(e.response!.statusCode!));
    }
  }

  @override
  Future<DataState<UserEntity>> verifyOTP(
      String phoneNumber, String code) async {
    try {
      Response response = await apiProvider.verifyOTP(phoneNumber, code);
      if (response.statusCode == 201) {
        UserEntity user = UserModel.fromJson(response.data);
        preferencesOprator.saveUserData(user);
        return SuccessData(user);
      } else {
        return FailedData(errorHandling(response.statusCode!));
      }
    } on DioException catch (e) {
      print(e.response);
      return FailedData(errorHandling(e.response!.statusCode!));
    }
  }
}
