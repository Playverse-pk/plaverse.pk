import 'package:flutter/material.dart';
// 1. Import the necessary library for web plugins
import 'package:flutter_web_plugins/flutter_web_plugins.dart'; 
import 'package:go_router/go_router.dart'; 
import 'package:playverse/plaverse_home.dart';
import 'package:playverse/privacy_policy.dart';
import 'package:playverse/terms_of_service_page.dart';

void main() {
  // 2. Set the URL strategy to PathUrlStrategy to remove the '#'
  setUrlStrategy(PathUrlStrategy()); 
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  // 1. Define the GoRouter configuration
  final GoRouter _router =  GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      // Home Route
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return PlayverseHome(); 
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
    // 2. Use MaterialApp.router and provide the router configuration
    return MaterialApp.router(
      title: 'plaverse.pk',
      debugShowCheckedModeBanner: false,
      routerConfig: _router, // Pass the GoRouter instance
    );
  }
}
