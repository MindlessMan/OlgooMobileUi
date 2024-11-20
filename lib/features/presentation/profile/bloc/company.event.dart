part of 'company.bloc.dart';

sealed class CompanyEvent extends Equatable {
  const CompanyEvent();

  @override
  List<Object> get props => [];
}

class FetchCompany extends CompanyEvent {}
