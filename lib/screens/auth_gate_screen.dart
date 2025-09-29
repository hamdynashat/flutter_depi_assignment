import 'package:flutter/material.dart';
import 'package:flutter_app/cubits/auth_cubit.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthGateScreen extends StatelessWidget {
  const AuthGateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
      if (state is AuthInitial) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is AuthUnAuthenticated) {
        return LoginScreen();
      } else {
        return HomeScreen();
      }
    }
    );
  }
}