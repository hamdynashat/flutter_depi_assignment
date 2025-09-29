import 'package:flutter/material.dart';
import 'package:flutter_app/cubits/auth_cubit.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/signup_screen.dart';
import 'package:flutter_app/utils/app_images.dart';
import 'package:flutter_app/utils/app_words.dart';
import 'package:flutter_app/utils/app_font_sizes.dart';
import 'package:flutter_app/utils/app_colors.dart';
import 'package:flutter_app/utils/app_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              AppWords.signIn,
              style: TextStyle(
                fontWeight: AppFontWeights.Bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: AppColors.mainColor,
          ),

          body: SingleChildScrollView(
            child: Form(
              key: context.read<AuthCubit>().LoginKey,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(height: 12),
                    Image.asset(AppImages.signIn),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: context.read<AuthCubit>().emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (v) {
                        return AppValidator.appValidator(
                          v ?? "",
                          ValidationType.email,
                        );
                      },
                      decoration: InputDecoration(
                        hintText: "Ex: username@domain.com",
                        hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.7),
                        ),
                        prefixIcon: Icon(Icons.email_sharp),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      obscureText: true,
                      controller: context.read<AuthCubit>().passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (v) {
                        return AppValidator.appValidator(
                          v ?? "",
                          ValidationType.pass,
                        );
                      },
                      decoration: InputDecoration(
                        hintText: "********",
                        hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.7),
                        ),
                        prefixIcon: Icon(Icons.password_sharp),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    InkWell(
                      onTap: () async {
                        await context.read<AuthCubit>().signIn(
                                  context
                                      .read<AuthCubit>()
                                      .emailController
                                      .text
                                      .trim(),
                                  context
                                      .read<AuthCubit>()
                                      .passwordController
                                      .text
                                      .trim(),
                                ) ==
                                true
                            ? Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (builder) => HomeScreen(),
                                ),
                                (route) => false,
                              )
                            : null;
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        SizedBox(width: 4),
                        Text("Don't have an account?"),
                        SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => SignupScreen(),
                              ),
                                  (route) => false,
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
