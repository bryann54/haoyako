// authentication_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationSignInEvent>(_onSignIn);
    on<AuthenticationSignUpEvent>(_onSignUp);
    on<AuthenticationLogoutEvent>(_onLogout);
  }

  Future<void> _onSignIn(AuthenticationSignInEvent event,
      Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(AuthenticationSuccess(userCredential.user!.uid));
    } catch (error) {
      emit(AuthenticationFailure(error.toString()));
    }
  }

  Future<void> _onSignUp(AuthenticationSignUpEvent event,
      Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      emit(AuthenticationSuccess(userCredential.user!.uid));
    } catch (error) {
      emit(AuthenticationFailure(error.toString()));
    }
  }

  Future<void> _onLogout(AuthenticationLogoutEvent event,
      Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      await _firebaseAuth.signOut();
      emit(AuthenticationInitial());
    } catch (error) {
      emit(AuthenticationFailure(error.toString()));
    }
  }
}
