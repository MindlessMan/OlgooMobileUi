import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:olgoo_mobile/features/domain/auth/usecase/auth.usecase.dart';
import 'package:olgoo_mobile/features/presentation/authentication/bloc/auth/auth_status.dart';

import '../../../../../core/resource/data_state.dart';

part 'auth_bloc_event.dart';
part 'auth_bloc_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthUseCases useCases;
  AuthBloc(this.useCases) : super(AuthState(status: InintialAuthStatus())) {
    //! check user info event
    on<SendOtpEvent>((event, emit) async {
      emit(AuthState(status: LoadingAuthStatus()));
      DataState data = await useCases.loginUsecase(event.phoneNumber!);
      if (data is SuccessData) {
        emit(state.copyWith(newStatus: NeedOTPStatus()));
      } else {
        emit(state.copyWith(newStatus: ErrorAuthStatus(data.error!)));
      }
    });
    //! verfy otp code
    on<VerifyOtpEvent>(
      (event, emit) async {
        emit(AuthState(status: LoadingAuthStatus()));
        DataState data =
            await useCases.verfiyOtp(event.phoneNumber, event.code);
        if (data is SuccessData) {
          emit(state.copyWith(newStatus: SuccessAuthStatus(user: data.data)));
        } else {
          emit(state.copyWith(newStatus: ErrorAuthStatus(data.error!)));
        }
      },
    );
    //! register user 
    on<RegisterUserEvent>(
      (event, emit) async {
        emit(AuthState(status: LoadingAuthStatus()));
        DataState data =
            await useCases.registerUser(event.username, event.companyName);
        if (data is SuccessData) {
          emit(state.copyWith(newStatus: SuccessRegisterUser(user: data.data)));
        } else {
          emit(state.copyWith(newStatus: ErrorAuthStatus(data.error!)));
        }
      },
    );
  
  }

}
