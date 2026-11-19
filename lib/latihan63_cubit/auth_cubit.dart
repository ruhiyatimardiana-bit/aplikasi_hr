import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> login(String username, String password) async {
    emit(AuthLoading());

    await Future.delayed(const Duration(seconds: 2));

    if (username == 'admin' && password == '12345') {
      emit(AuthSuccess(username));
    } else {
      emit(const AuthError('Username atau password salah!'));
    }
  }

  void logout() {
    emit(AuthInitial());
  }
}
