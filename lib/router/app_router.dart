import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tbdd/UI/Screens/login_screen.dart';
import 'package:tbdd/UI/Screens/booking_screen.dart';
import 'package:tbdd/UI/Screens/home_screen.dart';
import 'package:tbdd/UI/Screens/main_screen.dart';
import 'package:tbdd/UI/Screens/news_screen.dart';
import 'package:tbdd/UI/Screens/product_screen.dart';
import 'package:tbdd/UI/Screens/profile_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHome = GlobalKey<NavigatorState>(debugLabel: 'Home');
final _shellNavigatorNews = GlobalKey<NavigatorState>(debugLabel: 'News');
final _shellNavigatorBooking = GlobalKey<NavigatorState>(debugLabel: 'Booking');
final _shellNavigatorProduct = GlobalKey<NavigatorState>(debugLabel: 'Product');
final _shellNavigatorProfile = GlobalKey<NavigatorState>(debugLabel: 'Profile');

final GoRouter _router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      
      path: "/",
      builder: (context, state) => const LoginScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainScreen(
          navigationShell: navigationShell,
        );
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHome,
          routes: <RouteBase>[
            GoRoute(
              path: "/home",
              name: "home",
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorNews,
          routes: <RouteBase>[
            GoRoute(
              path: "/news",
              name: "news",
              builder: (context, state) => const NewsScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBooking,
          routes: <RouteBase>[
            GoRoute(
              path: "/booking",
              name: "booking",
              builder: (context, state) => const BookingScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProduct,
          routes: <RouteBase>[
            GoRoute(
              path: "/product",
              name: "product",
              builder: (context, state) => const ProductScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProfile,
          routes: <RouteBase>[
            GoRoute(
              path: "/profile",
              name: "profile",
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

GoRouter get appRouter => _router;
