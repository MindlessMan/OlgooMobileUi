part of 'auth_bloc_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SendOtpEvent extends AuthEvent {
  final String? phoneNumber;

  const SendOtpEvent(
    this.phoneNumber,
  );
}

class VerifyOtpEvent extends AuthEvent {
  final String phoneNumber;
  final String code;
  const VerifyOtpEvent({required this.code, required this.phoneNumber});
}

class RegisterUserEvent extends AuthEvent {
  final String companyName;
  final String username;
  const RegisterUserEvent({required this.username, required this.companyName});
}
