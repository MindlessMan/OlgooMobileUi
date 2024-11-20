import 'package:dio/dio.dart';
import 'package:olgoo_mobile/core/dependency_injection/locator.dart';
import 'package:olgoo_mobile/core/resource/data_state.dart';
import 'package:olgoo_mobile/core/utils/preferences_oprator.dart';
import 'package:olgoo_mobile/features/data/management/model/company.model.dart';
import 'package:olgoo_mobile/features/data/management/src/company.api.dart';
import 'package:olgoo_mobile/features/domain/profile/entity/company.entity.dart';
import 'package:olgoo_mobile/features/domain/profile/repository/compay.repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CompanyImplementRepository extends CompanyRepository {
  CompanyApiProvider apiProvider;
  PreferencesOprator preferences =
      PreferencesOprator(locator<SharedPreferences>());
  CompanyImplementRepository(this.apiProvider);
  @override
  Future<DataState<CompanyEntity>> getCompany() async {
    try {
      Response response = await apiProvider.getCompany();
      if (response.statusCode == 200) {
        CompanyEntity company = CompanyModel.fromJson(response.data);
        return SuccessData(company);
      } else {
        return const FailedData("مشکلی پیش اومده");
      }
    } catch (e) {
      print(e.toString());
      return const FailedData("مشکلی پیش اومده");
    }
  }
}
