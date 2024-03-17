import 'package:flutter/material.dart';
import 'package:tbdd/auth.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  logOut()
  async {
    await Auth().logOut();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: Center(child: GestureDetector(
          onTap: logOut,
          child:Text("abc")),),

      ),
    );
  }
}
