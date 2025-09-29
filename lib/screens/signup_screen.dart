import 'package:flutter/material.dart';
import 'package:flutter_app/cubits/auth_cubit.dart';
import 'package:flutter_app/firebase_services/firestore_service.dart';
import 'package:flutter_app/screens/login_screen.dart';
import 'package:flutter_app/utils/app_font_sizes.dart';
import 'package:flutter_app/utils/app_colors.dart';
import 'package:flutter_app/utils/app_images.dart';
import 'package:flutter_app/utils/app_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
  Color buttonColor = AppColors.mainColor;

  void changeButtonColor() {
    setState(() {
      buttonColor == AppColors.mainColor
          ? buttonColor = Colors.white
          : buttonColor = AppColors.mainColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Sign Up",
              style: TextStyle(
                fontWeight: AppFontWeights.Bold,
                color: Colors.white,
              ),
            ),
            backgroundColor: AppColors.mainColor,
          ),

          body: SingleChildScrollView(
            child: Form(
              key: context.read<AuthCubit>().SignupKey,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(height: 12),
                    Image.asset(AppImages.signUp),
                    TextFormField(
                      controller: context.read<AuthCubit>().usernameController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        hintText: "Ex: user1",
                        hintStyle: TextStyle(
                          color: Colors.grey.withOpacity(0.7),
                        ),
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
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
                        await context.read<AuthCubit>().signUp(
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
                            ? {
                                await FireStoreService().createCollection(
                                  username: context
                                      .read<AuthCubit>()
                                      .usernameController
                                      .text
                                      .trim(),
                                  email: context
                                      .read<AuthCubit>()
                                      .emailController
                                      .text
                                      .trim(),
                                  password: context
                                      .read<AuthCubit>()
                                      .passwordController
                                      .text
                                      .trim(),
                                ),
                                changeButtonColor(),
                                await Future.delayed(
                                  Duration(milliseconds: 500),
                                ),
                                changeButtonColor(),

                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (builder) => LoginScreen(),
                                  ),
                                  (route) => false,
                                ),
                              }
                            : null;
                      },
                      child: AnimatedContainer(
                        curve: Curves.linear,
                        duration: Duration(seconds: 1),
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: buttonColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: 22,
                              color: buttonColor == AppColors.mainColor
                                  ? Colors.white
                                  : AppColors.mainColor,
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
                        Text("already have an account?"),
                        SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => LoginScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          child: Text(
                            "Sign In",
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
