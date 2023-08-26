part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

class SignInWithGoogleRequested extends AuthenticationEvent {}
