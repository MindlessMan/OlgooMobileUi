import '../../../../core/resource/data_state.dart';
import '../entity/user.entity.dart';

abstract class AuthRepository {
  // method
  Future<DataState<dynamic>> login(String phone);
  Future<DataState<UserEntity>> registerUser(
      String username, String companyname);
  Future<DataState<UserEntity>> logout();
  Future<DataState<UserEntity>> sendOTP(String username, String password);
  Future<DataState<UserEntity>> getUsersCompanyInfo(
      String username, String password);
  Future<DataState<UserEntity>> verifyOTP(String phoneNumber, String code);
}
