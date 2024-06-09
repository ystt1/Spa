import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tbdd/UI/Widgets/ButtonWidget.dart';
import 'package:tbdd/UI/Widgets/TextField_Widget.dart';
import 'package:tbdd/blocs/authenticationBloc/authentication_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state == AuthenticationState.AuthFailure) {
              print("wrong");
            } else if (state == AuthenticationState.AuthSuccess) {
              print("Register success");
            }
          },
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              return Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Title
                      Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Hi! Welcome Back, you've been missed",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 50),
                      // Email
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFieldWidget(
                          hinttext: "Email",
                          type: false,
                          controller: _emailController,
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFieldWidget(
                          hinttext: "Username",
                          type: false,
                          controller: _usernameController,
                        ),
                      ),
                      SizedBox(height: 20),

                      // Password
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: TextFieldWidget(
                          hinttext: "Password",
                          type: true,
                          controller: _passwordController,
                        ),
                      ),
                      SizedBox(height: 20),
                      // Login Button
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: ButtonWidget(
                          text: "Sign Up",
                          ontap: () {
                            context.read<AuthenticationBloc>().add(
                                  SignUpEvent(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                      name: _usernameController.text),
                                );
                          },
                        ),
                      ),
                      SizedBox(height: 30),
                      // Create Account / Forgot Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.pushNamed("login");
                            },
                            child: Text("Đăng nhập"),
                          ),
                          SizedBox(width: 50),
                          GestureDetector(
                            onTap: () {
                              // Handle forgot password action
                            },
                            child: Text(
                              "Quên mật khẩu?",
                              style: TextStyle(
                                color: Color(0xFFE75A5A),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (state == AuthenticationState.AuthLoading)
                        const CircularProgressIndicator(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}