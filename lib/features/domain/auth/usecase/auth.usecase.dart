import 'package:olgoo_mobile/features/domain/auth/entity/user.entity.dart';

import '../../../../core/resource/data_state.dart';
import '../repository/auth.repository.dart';

class AuthUseCases {
  AuthRepository authRepository;
  AuthUseCases(this.authRepository);
  //
  Future<DataState<dynamic>> loginUsecase(String phoneNumber) {
    return authRepository.login(phoneNumber);
  }

  //
  Future<DataState<UserEntity>> verfiyOtp(String phoneNumebr, String code) {
    return authRepository.verifyOTP(phoneNumebr, code);
  } 
  //
  Future<DataState<UserEntity>> registerUser(String username, String companyName) {
    return authRepository.registerUser(username, companyName);
  }
  
}
