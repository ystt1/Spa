import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:tbdd/blocs/newsBLoC/news_bloc.dart';
import 'package:tbdd/until/color.dart';

import '../../blocs/ServicesBLoC/services_bloc.dart';
import '../../blocs/brachesBLoC/branches_bloc.dart';

class MainScreen extends StatefulWidget {
  final StatefulNavigationShell navigationShell;

  const MainScreen({super.key, required this.navigationShell});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BranchesBloc>(
            create: (BuildContext context) => BranchesBloc()),
        BlocProvider<ServicesBloc>(
            create: (BuildContext context) => ServicesBloc()),
        BlocProvider<NewsBloc>(
            create: (BuildContext context) => NewsBloc()),
      ],
      child: Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: widget.navigationShell,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: color.colorPrimary,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Booking',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Product',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
            _goBranch(_selectedIndex);
          },
        ),
      ),
    );
  }
}
