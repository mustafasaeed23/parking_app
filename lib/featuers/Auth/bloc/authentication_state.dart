import 'package:parking_app/featuers/Auth/models/user_model.dart';

abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class Authenticated extends AuthenticationState {
  final String userId;

  Authenticated({required this.userId});
}

class UserLoaded extends AuthenticationState {
  final UserModel user;

  UserLoaded({required this.user});
}

class AuthenticationError extends AuthenticationState {
  final String message;

  AuthenticationError({required this.message});
}
