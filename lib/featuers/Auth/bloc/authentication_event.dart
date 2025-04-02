abstract class AuthenticationEvent {}

// Sign Up Event
class SignUpEvent extends AuthenticationEvent {
  final String userName;
  final String email;
  final String role;
  final String password;
  final String confirmPassword;
  SignUpEvent({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.role,
    required this.userName,
  });
}

// Sign In Event
class SignInEvent extends AuthenticationEvent {
  final String email;
  final String password;
  SignInEvent({
    required this.email,
    required this.password,
  });
}

// Sign Out Event
class SignOutEvent extends AuthenticationEvent {}

// Fetch User Event
class FetchUserEvent extends AuthenticationEvent {
  final String userId;
  FetchUserEvent({required this.userId});
}

class CheckUserLoggedInEvent extends AuthenticationEvent {}

