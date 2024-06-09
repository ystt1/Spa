import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tbdd/UI/Widgets/ButtonWidget.dart';
import 'package:tbdd/UI/Widgets/TextField_Widget.dart';
import 'package:tbdd/blocs/authenticationBloc/authentication_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController(text: 'tuan@gmail.com');
  final _passwordController = TextEditingController(text: 'tuanabc4105');

  @override
  void dispose() {
    _emailController.dispose();
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
              print("Login fail");
            } else if (state == AuthenticationState.AuthSuccess) {
              context.goNamed('home');
              print("Login success");
            }
          },
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Title
                  Text(
                    "Log In",
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
                  // Password
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextFieldWidget(
                      hinttext: "Password",
                      type: true,
                      controller: _passwordController,
                    ),
                  ),
                  SizedBox(height: 50),
                  // Login Button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      child: ButtonWidget(
                        text: "Login",
                        ontap: () {
                          context.read<AuthenticationBloc>().add(LoginEvent(
                              email: _emailController.text,
                              password: _passwordController.text));
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  // Create Account / Forgot Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pushNamed("signup");
                        },
                        child: Text("Tạo tài khoản"),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
