import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:playverse/nav_item.dart';

// Colors
const Color playversePink = Colors.purple;
const Color playversePurple = Colors.deepPurple;

class PlayverseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? currentPage;

  const PlayverseAppBar({super.key, this.currentPage});

  void _navigateToPage(BuildContext context, String title) {
    String? routeName;

    switch (title) {
      case "About Us":
        routeName = '/about-us';
        break;
      case "Games":
        routeName = '/games';
        break;
      case "Blogs":
        routeName = '/blogs';
        break;
      case "Privacy":
        routeName = '/privacy-policy';
        break;
      case "Terms":
        routeName = '/terms';
        break;
      case "Home":
        routeName = '/';
        break;
      default:
        return;
    }

    context.go(routeName);
  }

  Widget _buildClickableNavItem(BuildContext context, String title) {
    final bool isCurrent = currentPage == title;
    return GestureDetector(
      onTap: isCurrent ? null : () => _navigateToPage(context, title),
      child: NavItem(title: title, isCurrent: isCurrent),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 800;

    if (isSmallScreen) {
      // ✅ Mobile AppBar: ONLY menu button, no second drawer
      return AppBar(
        backgroundColor: playversePink,
        elevation: 0,
        title: GestureDetector(
          onTap: () => _navigateToPage(context, "Home"),
          child: Image.asset("assets/logo4.png", height: 40),
        ),
        // ✅ Menu button triggers Scaffold.drawer
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu,color: Colors.white,),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      );
    }

    // ✅ Desktop AppBar
    return Container(
      color: playversePink,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => _navigateToPage(context, "Home"),
            child: Image.asset("assets/logo4.png", height: 50),
          ),
          Row(
            children: [
              _buildClickableNavItem(context, "About Us"),
              const SizedBox(width: 40),
              _buildClickableNavItem(context, "Games"),
              const SizedBox(width: 40),
              _buildClickableNavItem(context, "Blogs"),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}

/// ✅ Drawer widget used in Scaffold (main.dart will use this)
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: BeveledRectangleBorder(),
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: playversePink),
            child: Center(
              child: Image.asset("assets/logo4.png", height: 60),
            ),
          ),
          ListTile(
            title: const Text("Home"),
            onTap: () {
              context.go('/');
              Navigator.of(context).pop(); // ✅ close drawer after navigation
            },
          ),
          ListTile(
            title: const Text("About Us"),
            onTap: () {
              context.go('/about-us');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text("Games"),
            onTap: () {
              context.go('/games');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text("Blogs"),
            onTap: () {
              context.go('/blogs');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text("Privacy Policy"),
            onTap: () {
              context.go('/privacy-policy');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text("Terms"),
            onTap: () {
              context.go('/terms');
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
