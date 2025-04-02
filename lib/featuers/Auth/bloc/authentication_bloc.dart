import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parking_app/featuers/Auth/bloc/authentication_event.dart';
import 'package:parking_app/featuers/Auth/bloc/authentication_state.dart';
import 'package:parking_app/featuers/Auth/models/user_model.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<SignUpEvent>(_onSignUp);
    on<SignInEvent>(_onSignIn);
    on<FetchUserEvent>(_onFetchUser);
    on<SignOutEvent>(_onSignOut);
    on<CheckUserLoggedInEvent>(_onCheckUserLoggedIn);
  }

  // SignUp
  Future<void> _onSignUp(
    SignUpEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading());
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      UserModel userModel = UserModel(
        userName: event.userName,
        email: event.email,
        role: event.role,
        password: event.password,
        confirmPassword: event.confirmPassword,
        userId: userCredential.user!.uid,
      );

      await firestore
          .collection("users")
          .doc(userModel.userId)
          .set(userModel.toJson());
      emit(Authenticated(
        userId: userModel.userId,
      ));
    } on Exception catch (e) {
      emit(AuthenticationError(message: e.toString()));
    }
  }

  // SignIn
 Future<void> _onSignIn(
  SignInEvent event,
  Emitter<AuthenticationState> emit,
) async {
  emit(AuthenticationLoading());

  try {
    FirebaseAuth.instance.setLanguageCode('en');

    UserCredential userCredential = await auth.signInWithEmailAndPassword(
      email: event.email.trim(),
      password: event.password,
    );

    DocumentSnapshot userDoc = await firestore
        .collection("users")
        .doc(userCredential.user!.uid)
        .get();

    if (userDoc.exists) {
      UserModel userModel =
          UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
      emit(UserLoaded(user: userModel));
    } else {
      emit(AuthenticationError(message: "User not found"));
    }
  } on FirebaseAuthException catch (e) {
    String errorMessage;
    switch (e.code) {
      case 'user-not-found':
        errorMessage = "No user found for this email.";
        break;
      case 'wrong-password':
        errorMessage = "Incorrect password.";
        break;
      case 'too-many-requests':
        errorMessage = "Too many attempts. Try again later.";
        break;
      case 'network-request-failed':
        errorMessage = "Check your internet connection.";
        break;
      default:
        errorMessage = "Authentication failed. Try again.";
        break;
    }
    emit(AuthenticationError(message: errorMessage));
    print("FirebaseAuthException: ${e.message}");
  } catch (e) {
    emit(AuthenticationError(message: "Something went wrong."));
    print("Exception: ${e.toString()}");
  }
}


  // Fetch User
  Future<void> _onFetchUser(
    FetchUserEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(AuthenticationLoading()); // Show loading state
    try {
      DocumentSnapshot userDoc =
          await firestore.collection("users").doc(event.userId).get();
      if (userDoc.exists) {
        UserModel userModel =
            UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
        emit(UserLoaded(user: userModel));
      } else {
        emit(AuthenticationError(message: "User not found"));
      }
    } on Exception catch (e) {
      emit(AuthenticationError(message: e.toString()));
    }
  }

  // SignOut
  Future<void> _onSignOut(
    SignOutEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    await auth.signOut();
    emit(AuthenticationInitial());
  }

  void _onCheckUserLoggedIn(
    CheckUserLoggedInEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    final user = auth.currentUser;
    if (user != null) {
      // Fetch user details from Firestore
      DocumentSnapshot userDoc =
          await firestore.collection("users").doc(user.uid).get();
      if (userDoc.exists) {
        UserModel userModel =
            UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
        emit(UserLoaded(user: userModel)); // Navigate to home screen
      } else {
        emit(AuthenticationInitial());
      }
    } else {
      emit(AuthenticationInitial());
    }
  }
}
