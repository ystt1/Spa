import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tbdd/repositories/AuthRepository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthRepository _authRepository;

  AuthenticationBloc(this._authRepository)
      : super(AuthenticationState.AuthInitail) {
    on<AuthenticationInitiasFetchEvent>((event, emit) async {
      emit(AuthenticationState.AuthLoading);
      try {
        final isAuthenicated = await _authRepository.checkUserAuthentication();
        if (isAuthenicated) {
          emit(AuthenticationState.AuthSuccess);
        } else {
          emit(AuthenticationState.AuthFailure);
        }
      } catch (_) {
        emit(AuthenticationState.AuthFailure);
      }
    });

    on<SignUpEvent>((event, emit) async {
      emit(AuthenticationState.AuthLoading);
      try {
        final res = await _authRepository.signUpUser(
          username: event.name,
          email: event.email,
          password: event.password,
        );
        if (res == "success") {
          emit(AuthenticationState.AuthSuccess);
        } else {
          emit(AuthenticationState.AuthFailure);
        }
      } catch (_) {
        emit(AuthenticationState.AuthFailure);
      }
    });

    on<LoginEvent>(((event, emit) async {
      emit(AuthenticationState.AuthLoading);
      try {
        final res = await _authRepository.loginUser(
            email: event.email, password: event.password);
        if (res == "success") {
          emit(AuthenticationState.AuthSuccess);
        } else {
          emit(AuthenticationState.AuthFailure);
        }
      } catch (_) {
        emit(AuthenticationState.AuthFailure);
      }
    }));
  }
}
