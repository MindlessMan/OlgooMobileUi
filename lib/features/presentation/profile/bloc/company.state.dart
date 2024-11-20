part of 'company.bloc.dart';

class CompanyState {
  CompanyStatus status;
  CompanyState({required this.status});

  CompanyState copyWith({CompanyStatus? newStatus}) {
    return CompanyState(status: newStatus ?? status);
  }
}
