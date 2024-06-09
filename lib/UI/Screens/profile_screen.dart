import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tbdd/UI/Widgets/profile_screen_profile_tab.dart';
import 'package:tbdd/UI/Widgets/profile_screen_top_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const TopCard(),
          DefaultTabController(
            length: 2,
            child: Expanded(
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 3,
                        spreadRadius: 4,
                        offset: Offset(0, -1),
                      )
                    ]),
                    child: const TabBar(tabs: [
                      Tab(
                        text: "Gói dịch vụ",
                      ),
                      Tab(
                        text: "Thông tin cá nhân",
                      )
                    ]),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        height: 520,
                        width: double.infinity,
                        child: TabBarView(
                            children: [Text("Gói dịch vụ"), ProfileTab()]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
