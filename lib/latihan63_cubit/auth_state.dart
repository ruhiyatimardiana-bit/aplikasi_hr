import 'package:equatable/equatable.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

// Kondisi awal
class AuthInitial extends AuthState {}

// Saat login berlangsung
class AuthLoading extends AuthState {}

// Login berhasil
class AuthSuccess extends AuthState {
  final String username;

  const AuthSuccess(this.username);

  @override
  List<Object?> get props => [username];
}

// Login gagal
class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}
