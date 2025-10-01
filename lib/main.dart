import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart'; 
import 'package:go_router/go_router.dart';
import 'package:playverse/about_us.dart';
import 'package:playverse/blogs_screen.dart'; 
import 'package:playverse/games_screen.dart'; 
import 'package:playverse/plaverse_home.dart';
import 'package:playverse/privacy_policy.dart';
import 'package:playverse/terms_of_service_page.dart';

void main() {
  // Set the URL strategy to PathUrlStrategy to remove the '#'
  setUrlStrategy(PathUrlStrategy()); 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // Define the GoRouter configuration
  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      // Home Route
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return PlayverseHome(); 
        },
      ),
      // About Us Route
      GoRoute(
        path: '/about-us',
        builder: (BuildContext context, GoRouterState state) {
          return const AboutUsScreen();
        },
      ),
      // Games Route
      GoRoute(
        path: '/games',
        builder: (BuildContext context, GoRouterState state) {
          return const GamesScreen();
        },
      ),
      // >>> NEW ROUTE: Blogs <<<
      GoRoute(
        path: '/blogs',
        builder: (BuildContext context, GoRouterState state) {
          return const BlogScreen();
        },
      ),
      // Privacy Policy Route
      GoRoute(
        path: '/privacy-policy',
        builder: (BuildContext context, GoRouterState state) {
          return PrivacyPolicyPage();
        },
      ),
      // Terms of Service Route
      GoRoute(
        path: '/terms',
        builder: (BuildContext context, GoRouterState state) {
          return TermsOfServicePage();
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    // Use MaterialApp.router and provide the router configuration
    return MaterialApp.router(
      title: 'plaverse.pk',
      debugShowCheckedModeBanner: false,
      routerConfig: _router, // Pass the GoRouter instance
    );
  }
}
