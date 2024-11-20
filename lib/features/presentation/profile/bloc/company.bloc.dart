import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:olgoo_mobile/features/domain/profile/usecase/company.usecase.dart';
import 'package:olgoo_mobile/features/presentation/profile/bloc/company.status.dart';
import '../../../../../core/resource/data_state.dart';
part 'company.event.dart';
part 'company.state.dart';


class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
   final CompanyUseCases useCases;
  CompanyBloc(this.useCases)
      : super(CompanyState(status: InintialCompanyStatus())) {
    //! check user info event
    on<FetchCompany>((event, emit) async {
      emit(CompanyState(status: LoadingCompanyStatus()));
      DataState data = await useCases.getCompany();
      if (data is SuccessData) {
        emit(state.copyWith(newStatus: FetchedCompanyStatus(data.data)));
      } else {
        emit(state.copyWith(newStatus: ErrorCompanyStatus(data.error!)));
      }
    });
  }
}
