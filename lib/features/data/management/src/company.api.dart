import 'package:dio/dio.dart';
import 'package:olgoo_mobile/core/dependency_injection/locator.dart';

import '../../../../core/utils/api_constants.dart';
import '../../../../core/utils/preferences_oprator.dart';

class CompanyApiProvider {
  final PreferencesOprator preferencesOprator = PreferencesOprator(locator());
  final Dio _dio = Dio();

  Future<dynamic> getCompany() async {
    var url = "${ApiConstants.domainName}${ApiConstants.getCompany}";
    var token = preferencesOprator.getAccToken();
    print(token);
    print(url);
    var respons = await _dio.get(url,
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
