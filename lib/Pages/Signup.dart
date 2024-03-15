import 'package:flutter/material.dart';
import 'package:tbdd/Pages/Login.dart';
import 'package:tbdd/Widget/widget_support.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xff66FFCC), Color(0xff33FFCC)])),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 2.5),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white),
              child: const Text(""),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2.7,
                      child: Center(
                        child: Image.asset('images/pngwing.com.png'),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Material(
                      borderRadius: BorderRadius.circular(20),
                      elevation: 5.0,
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: MediaQuery.of(context).size.height / 2.1,
                        child: Column(children: [
                          Text('Đăng kí',
                              style: AppWidget.highlightTextStyle()),
                          SizedBox(height: 30),
                          TextField(
                            decoration: InputDecoration(
                                hintText: 'Email',
                                hintStyle: AppWidget.regularTextStyle(),
                                prefixIcon: const Icon(Icons.email)),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: 'Mật khẩu',
                                hintStyle: AppWidget.regularTextStyle(),
                                prefixIcon: const Icon(Icons.password)),
                          ),
                          SizedBox(height: 20),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: 'Nhập lại mật khẩu',
                                hintStyle: AppWidget.regularTextStyle(),
                                prefixIcon: const Icon(Icons.password)),
                          ),
                          SizedBox(height: 40),
                          Container(
                            width: 200,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Color(0xff66FFCC),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'Đăng Kí',
                              style: TextStyle(
                                  fontFamily: "Pacifico",
                                  fontSize: 20,
                                  color: Colors.grey),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            child: GestureDetector(
                              onTap:(){ Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInPage()));},
                              child: Text(
                                "Đã có tài khoản? Đăng nhập",
                                style: AppWidget.regularTextStyle(),
                              ),
                            ),
                          )
                        ]),
                      ),
                    ),
                    SizedBox(height: 50),
                    Container(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/insta.png.png'),
                          Image.asset('images/fb.png'),
                          Image.asset('images/youtube.png.png'),
                        ],
                      ),

                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
