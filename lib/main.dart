import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/cubits/auth_cubit.dart';
import 'package:flutter_app/cubits/popular_people_cubit.dart';
import 'package:flutter_app/firebase_options.dart';
import 'package:flutter_app/screens/auth_gate_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => PopularPeopleCubit()),
      ],
      child: MaterialApp(home: AuthGateScreen()),
    );
  }
}
