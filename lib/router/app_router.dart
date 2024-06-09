import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tbdd/Models/Branch.dart';
import 'package:tbdd/Models/News.dart';
import 'package:tbdd/Models/Product.dart';
import 'package:tbdd/Models/Service.dart';
import 'package:tbdd/UI/Screens/DetailsScreen/all_services.dart';
import 'package:tbdd/UI/Screens/DetailsScreen/branch_details.dart';
import 'package:tbdd/UI/Screens/DetailsScreen/news_details.dart';
import 'package:tbdd/UI/Screens/DetailsScreen/product_details.dart';
import 'package:tbdd/UI/Screens/DetailsScreen/profile_settings.dart';
import 'package:tbdd/UI/Screens/DetailsScreen/service_details.dart';
import 'package:tbdd/UI/Screens/Signup.dart';
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
      name: "login",
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: "/signup",
      name: "signup",
      builder: (context, state) => const SignUpScreen(),
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
                routes: [
                  GoRoute(
                      path: "service-details",
                      name: "serviceDetail",
                      builder: (context, state) {
                        Map<String, Service> extraMap =
                            state.extra as Map<String, Service>;
                        Service? service = extraMap['service'];
                        // Service service=state.extra as Service;
                        return ServiceDetails(service: service);
                      }),
                  GoRoute(
                      path: "branch-details",
                      name: "branchDetails",
                      builder: (context, state) {
                        Map<String, Branch> extraMap =
                            state.extra as Map<String, Branch>;
                        Branch? branch = extraMap['branch'];
                        return BranchDetails(brancha: branch);
                      }),
                  GoRoute(
                      path: "all-service",
                      name: "allService",
                      builder: (context, state) {
                        return const AllService();
                      })
                ]),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorNews,
          routes: <RouteBase>[
            GoRoute(
                path: "/news",
                name: "news",
                builder: (context, state) => const NewsScreen(),
                routes: [
                  GoRoute(
                      path: "news-details",
                      name: "newsDetails",
                      builder: (context, state) {
                        Map<String, News> extraMap =
                            state.extra as Map<String, News>;
                        News? news = extraMap['news'];
                        // Service service=state.extra as Service;
                        return NewsDetails(news: news);
                      }),
                ]),
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
                routes: [
                  GoRoute(
                      path: "details",
                      name: "productDetails",
                      builder: (context, state) {
                        Map<String, Product> extraMap =
                            state.extra as Map<String, Product>;
                        Product? product = extraMap['product'];
                        // Service service=state.extra as Service;
                        return ProductDetails(product: product);
                      })
                ]),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProfile,
          routes: <RouteBase>[
            GoRoute(
              path: "/profile",
              name: "profile",
              builder: (context, state) => const ProfileScreen(),
              routes: <RouteBase>[
                GoRoute(
                  path: "settings",
                  name: "profileSetting",
                  builder: (context, state) => const ProfileSettings(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

GoRouter get appRouter => _router;
