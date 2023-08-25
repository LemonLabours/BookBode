import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import '../../../services/Authentication/authentication.dart';
part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationService _authService = AuthenticationService();

  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<SignInWithGoogleRequested>((event, emit) async {
      emit(AuthenticationInProgress());
      try {
        await _authService.signInWithGoogle();
        emit(AuthenticationSuccess());
      } catch (error, stacktrace) {
        if (kDebugMode) {
          print('Error during signInWithGoogle: $error');
        }
        if (kDebugMode) {
          print('Stacktrace: $stacktrace');
        }
        emit(AuthenticationFailed(error.toString()));
      }
    });
  }
}
