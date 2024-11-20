import 'package:dio/dio.dart';
import 'package:olgoo_mobile/core/dependency_injection/locator.dart';
import 'package:olgoo_mobile/core/utils/api_constants.dart';
import 'package:olgoo_mobile/core/utils/preferences_oprator.dart';

class AuthApiProvider {
  final PreferencesOprator preferencesOprator = PreferencesOprator(locator());
  final Dio _dio = Dio();
  //
  Future<dynamic> callLogin(String phoneNumber) async {
    var url = "${ApiConstants.domainName}${ApiConstants.login}$phoneNumber";
    print(url);
    var respons = await _dio.post(
      url,
    );
    return respons;
  }

  //
  Future<dynamic> verifyOTP(String phoneNumber, String code) async {
    var url = "${ApiConstants.domainName}${ApiConstants.verfiyOtp}";
    var respons =
        await _dio.post(url, data: {"phoneNumber": phoneNumber, "otp": code});
    return respons;
  }

  //
  Future<dynamic> registerUser(String username, String companyName) async {
    String? token = preferencesOprator.getAccToken();
    var url = "${ApiConstants.domainName}${ApiConstants.signup}";
    var respons = await _dio.post(url,
        data: {"name": username, "companyTitle": companyName},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': "Bearer $token",
            'accept': 'application/json'
          },
        ));

    return respons;
  }

}
