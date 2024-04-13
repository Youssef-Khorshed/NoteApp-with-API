part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthSuccrss extends AuthState {
  UserEntiy entiy;
  bool change;
  AuthSuccrss({required this.entiy, required this.change});
  @override
  List<Object?> get props => [entiy];
}

class AuthLoading extends AuthState {
  bool change;
  AuthLoading({required this.change});
  @override
  List<Object?> get props => [change];
}

class AuthFail extends AuthState {
  String message;
  bool change;
  AuthFail({required this.message, required this.change});
  @override
  List<Object?> get props => [message];
}
