import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:go_router/go_router.dart';

// Import all screens
import 'package:playverse/about_us.dart';
import 'package:playverse/blogs_screen.dart';
import 'package:playverse/games_screen.dart';
import 'package:playverse/plaverse_home.dart';
import 'package:playverse/privacy_policy.dart';
import 'package:playverse/terms_of_service_page.dart';

// Common layout components
import 'package:playverse/playverse_app_bar.dart';
import 'package:playverse/footer.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(MyApp());
}

final _shellNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // Common layout
  static Widget _commonLayoutBuilder(
      BuildContext context, GoRouterState state, Widget child) {
    final currentPath = state.uri.path;

    // Helper to map path -> title
    String getPageTitleFromPath(String path) {
      if (path == '/') return 'Home';
      if (path.startsWith('/about-us')) return 'About Us';
      if (path.startsWith('/games')) return 'Games';
      if (path.startsWith('/blogs')) return 'Blogs';
      return '';
    }

    final currentPageTitle = getPageTitleFromPath(currentPath);

    return Scaffold(
      backgroundColor: Colors.white,

      // ✅ Drawer added here
      drawer: AppDrawer(),

      body: SingleChildScrollView(
        child: Column(
          children: [
            PlayverseAppBar(currentPage: currentPageTitle),
            child,
            PlaverseFooter(
              isPrivacyPage: currentPath == '/privacy-policy',
              isTermsPage: currentPath == '/terms',
            ),
          ],
        ),
      ),
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: _commonLayoutBuilder,
        routes: <RouteBase>[
          GoRoute(
            path: '/',
            builder: (context, state) => const PlayverseHome(),
          ),
          GoRoute(
            path: '/about-us',
            builder: (context, state) => const AboutUsScreen(),
          ),
          GoRoute(
            path: '/games',
            builder: (context, state) => const GamesScreen(),
          ),
          GoRoute(
            path: '/blogs',
            builder: (context, state) => const BlogScreen(),
          ),
          GoRoute(
            path: '/privacy-policy',
            builder: (context, state) => PrivacyPolicyPage(),
          ),
          GoRoute(
            path: '/terms',
            builder: (context, state) => TermsOfServicePage(),
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
