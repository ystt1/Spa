import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tbdd/UI/Screens/verification.dart';
import 'package:tbdd/UI/Widgets/ButtonWidget.dart';
import 'package:tbdd/UI/Widgets/TextField_Widget.dart';
import 'package:tbdd/blocs/authenticationBloc/authentication_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _numberController = TextEditingController();

  // Future<void> _submitPhoneNumber(BuildContext context) async {
  //   String phoneNumber = _numberController.text.trim();
  //   FirebaseAuth Auth = FirebaseAuth.instance;
  //   await Auth.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //     verificationCompleted: (PhoneAuthCredential credential) async {},
  //     verificationFailed: (FirebaseAuthException e) {
  //       print(e.message.toString());
  //     },
  //     codeSent: (String verificationID, int? resendToken) {
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) =>
  //                 VerificationScreen(verificationID: verificationID),
  //           ));
  //     },
  //     codeAutoRetrievalTimeout: (String verificationID) {},

  //   );
  // }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _numberController.dispose();
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
              return SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                        "https://hillsbeauty.vn/uploads/tt_hinh/hills-spa-beauty-hoa-lu-1704181329-uev7d.jpg"),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "Thông tin đăng ký",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        child: Column(
                          children: [
                            TextFieldWidget(
                                hinttext: "Email",
                                type: false,
                                controller: _emailController),
                            TextFieldWidget(
                                hinttext: "Họ và tên",
                                type: false,
                                controller: _usernameController),
                            TextFieldWidget(
                                hinttext: "số điện thoại",
                                type: false,
                                controller: _numberController),
                            TextFieldWidget(
                                hinttext: "mật khẩu",
                                type: true,
                                controller: _passwordController),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: ButtonWidget(
                          text: "Đăng ký",
                          ontap: () {
                            // _submitPhoneNumber(context);
                            context.read<AuthenticationBloc>().add(
                                  SignUpEvent(
                                      email: _emailController.text,
                                      number: _numberController.text,
                                      password: _passwordController.text,
                                      name: _usernameController.text),
                                );
                          }),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () {
                          context.goNamed('login');
                        },
                        child: Text(
                          "Quay về Đăng nhập",
                          style: TextStyle(
                              color: Colors.blue.shade800,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
                      // Text(
                      //   "Sign up",
                      //   style: TextStyle(
                      //     fontSize: 30,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                      // SizedBox(height: 15),
                      // Text(
                      //   "Hi! Welcome Back, you've been missed",
                      //   style: TextStyle(
                      //     fontSize: 15,
                      //     fontWeight: FontWeight.w400,
                      //   ),
                      // ),
                      // SizedBox(height: 50),
                      // // Email
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      //   child: TextFieldWidget(
                      //     hinttext: "Email",
                      //     type: false,
                      //     controller: _emailController,
                      //   ),
                      // ),
                      // SizedBox(height: 20),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      //   child: TextFieldWidget(
                      //     hinttext: "Username",
                      //     type: false,
                      //     controller: _usernameController,
                      //   ),
                      // ),
                      // SizedBox(height: 20),

                      // // Password
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      //   child: TextFieldWidget(
                      //     hinttext: "Password",
                      //     type: true,
                      //     controller: _passwordController,
                      //   ),
                      // ),
                      // SizedBox(height: 20),
                      // // Login Button
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      //   child: ButtonWidget(
                      //     text: "Sign Up",
                      //     ontap: () {
                      //       context.read<AuthenticationBloc>().add(
                      //             SignUpEvent(
                      //                 email: _emailController.text,
                      //                 password: _passwordController.text,
                      //                 name: _usernameController.text),
                      //           );
                      //     },
                      //   ),
                      // ),
                      // SizedBox(height: 30),
                      // // Create Account / Forgot Password
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     GestureDetector(
                      //       onTap: () {
                      //         context.pushNamed("login");
                      //       },
                      //       child: Text("Đăng nhập"),
                      //     ),
                      //     SizedBox(width: 50),
                      //     GestureDetector(
                      //       onTap: () {
                      //         // Handle forgot password action
                      //       },
                      //       child: Text(
                      //         "Quên mật khẩu?",
                      //         style: TextStyle(
                      //           color: Color(0xFFE75A5A),
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // if (state == AuthenticationState.AuthLoading)
                      //   const CircularProgressIndicator(),