import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../logic/blocs/auth/auth_bloc.dart';
import '../../logic/blocs/userSession/user_session_bloc.dart';

class AuthCheckScreen extends StatelessWidget {
  const AuthCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[700],
        body: Center(
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthenticatedState) {
                BlocProvider.of<UserSessionBloc>(context)
                    .add(UserSessionLogin(state.user));
                context.go('/home');
              }
              if (state is UnauthenticatedState) {
                context.go('/');
              }
            },
            child: const CircularProgressIndicator(
              color: Colors.blue,
            ),
          ),
        ));
  }
}
