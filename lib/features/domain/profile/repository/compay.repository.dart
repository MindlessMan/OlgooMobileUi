import 'package:olgoo_mobile/features/domain/profile/entity/company.entity.dart';

import '../../../../core/resource/data_state.dart';

abstract class CompanyRepository {
  // method
  Future<DataState<CompanyEntity>> getCompany();
}
