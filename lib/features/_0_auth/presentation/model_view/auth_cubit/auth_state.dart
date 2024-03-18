part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final AuthResponse authResponse;

  AuthSuccess(this.authResponse);
}

class AuthSuccessCommentAndRate extends AuthState {
  final String message;

  AuthSuccessCommentAndRate(this.message);
}

class AuthFailure extends AuthState {
  final String errMessage;

  AuthFailure(this.errMessage);
}
