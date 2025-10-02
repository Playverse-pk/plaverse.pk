import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart'; 
import 'package:go_router/go_router.dart';
// Import all screens
import 'package:playverse/about_us.dart';
import 'package:playverse/blogs_screen.dart'; // Assuming this is BlogScreen
import 'package:playverse/games_screen.dart'; 
import 'package:playverse/plaverse_home.dart';
import 'package:playverse/privacy_policy.dart';
import 'package:playverse/terms_of_service_page.dart';
// Import the common layout components
import 'package:playverse/playverse_app_bar.dart'; 
import 'package:playverse/footer.dart'; 


void main() {
  setUrlStrategy(PathUrlStrategy()); 
  runApp(MyApp());
}

// Define the global and shell navigator keys
// We don't strictly need the root key here, but it's good practice
final _shellNavigatorKey = GlobalKey<NavigatorState>(); 

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This static function defines the common layout for ALL pages
  static Widget _commonLayoutBuilder(
      BuildContext context, GoRouterState state, Widget child) {
    
    final currentPath = state.uri.path;

    // Helper to determine the current page title for the AppBar
    String getPageTitleFromPath(String path) {
      if (path == '/') return 'Home';
      if (path.startsWith('/about-us')) return 'About Us';
      if (path.startsWith('/games')) return 'Games';
      if (path.startsWith('/blogs')) return 'Blogs';
      return '';
    }

    final currentPageTitle = getPageTitleFromPath(currentPath);
    
    // The Scaffold provides the structure (AppBar, SingleChildScrollView body, Footer)
    return Scaffold(
      // The PlayverseAppBar is now the persistent header
      // appBar: PlayverseAppBar(currentPage: currentPageTitle),
      backgroundColor: Colors.white,
      // The body contains the scrolling view for the page content and the footer
      body: SingleChildScrollView(
        child: Column(
          children: [
            PlayverseAppBar(currentPage: currentPageTitle),
            // This is the actual screen content (PlayverseHome, GamesScreen, etc.)
            child, 
            // The PlaverseFooter scrolls with the content
            PlaverseFooter(
              isPrivacyPage: currentPath == '/privacy-policy',
              isTermsPage: currentPath == '/terms',
            ),
          ],
        ),
      ),
    );
  }

  // Define the GoRouter configuration with ShellRoute
  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      // Define the ShellRoute for the persistent layout
      ShellRoute(
        // Use the shell navigator key for the content inside the shell
        navigatorKey: _shellNavigatorKey, 
        // Reference the static function that defines the layout
        builder: _commonLayoutBuilder,
        routes: <RouteBase>[
          // All pages are children of the ShellRoute
          GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state) {
              // RETURN ONLY THE PAGE CONTENT (NO Scaffold, AppBar, or Footer)
              return const PlayverseHome(); 
            },
          ),
          GoRoute(
            path: '/about-us',
            builder: (BuildContext context, GoRouterState state) {
              return const AboutUsScreen(); // Only content
            },
          ),
          GoRoute(
            path: '/games',
            builder: (BuildContext context, GoRouterState state) {
              return const GamesScreen(); // Only content
            },
          ),
          // Note: Assuming 'BlogScreen' in your imports is what you want to render
          GoRoute(
            path: '/blogs',
            builder: (BuildContext context, GoRouterState state) {
              return const BlogScreen(); // Only content
            },
          ),
          GoRoute(
            path: '/privacy-policy',
            builder: (BuildContext context, GoRouterState state) {
              return PrivacyPolicyPage(); // Only content
            },
          ),
          GoRoute(
            path: '/terms',
            builder: (BuildContext context, GoRouterState state) {
              return TermsOfServicePage(); // Only content
            },
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'plaverse.pk',
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}