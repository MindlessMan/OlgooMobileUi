import 'package:olgoo_mobile/features/domain/profile/entity/company.entity.dart';
import 'package:olgoo_mobile/features/domain/profile/repository/compay.repository.dart';

import '../../../../core/resource/data_state.dart';

class CompanyUseCases {
  CompanyRepository repository;
  CompanyUseCases(this.repository);

  Future<DataState<CompanyEntity>> getCompany() {
    return repository.getCompany();
  }
}
