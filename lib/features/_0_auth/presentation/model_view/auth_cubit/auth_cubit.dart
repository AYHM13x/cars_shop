import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/auth_responce/auth_responce.dart';
import '../../../data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final AuthRepo authRepo;

  String _name = "";
  String _token = "";
  String _message = "";

  String getName() => _name;

  String getToken() => _token;

  void setToken(String token) {
    _token = token;
  }

  String getMwssage() => _message;

  initData() {
    _name = "";
    _token = "";
    _message = "";
  }

  Future<void> logInPostRequest({
    required String email,
    required String password,
  }) async {
    initData();
    emit(AuthLoading());
    var result = await authRepo.logInPostRequest(
      email: email,
      password: password,
    );

    result.fold(
      (failure) {
        emit(
          AuthFailure(failure.errMessage),
        );
      },
      (response) {
        getData(response);
        emit(
          AuthSuccess(response),
        );
      },
    );
  }

  Future<void> singUpPostRequest({
    required String name,
    required String email,
    required String password,
    required String cpassword,
  }) async {
    emit(AuthLoading());

    var result = await authRepo.signUpPostRequest(
      name: name,
      email: email,
      password: password,
      cpassword: cpassword,
    );

    result.fold(
      (failure) {
        emit(
          AuthFailure(failure.errMessage),
        );
      },
      (response) {
        getData(response);
        emit(
          AuthSuccess(response),
        );
      },
    );
  }

  void getData(AuthResponse response) {
    _name = response.data!.name!;
    _token = response.data!.token!;
    _message = response.message!;
  }
}
