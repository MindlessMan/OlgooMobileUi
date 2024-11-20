import 'package:flutter/material.dart';
import 'package:olgoo_mobile/features/domain/profile/entity/company.entity.dart';


@immutable
abstract class CompanyStatus {}

class InintialCompanyStatus extends CompanyStatus {}

class LoadingCompanyStatus extends CompanyStatus {}

class FetchedCompanyStatus extends CompanyStatus {
  final CompanyEntity data;
  FetchedCompanyStatus(this.data);
}

class ErrorCompanyStatus extends CompanyStatus {
  final String errorMessage;
  ErrorCompanyStatus(this.errorMessage);
}
