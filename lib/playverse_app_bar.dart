import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Import GoRouter for web navigation
import 'package:playverse/nav_item.dart';

// Assuming these color constants are defined in your project's theme file
const Color playversePink = Colors.purple; 
const Color playversePurple = Colors.purple; 

class PlayverseAppBar extends StatelessWidget implements PreferredSizeWidget {
  // Optional field to indicate the current page for visual highlighting
  final String? currentPage;

  const PlayverseAppBar({super.key, this.currentPage});

  // Helper function to handle navigation to specific pages using go_router
  void _navigateToPage(BuildContext context, String title) {
    String? routeName;
    
    // Determine the GoRouter path to navigate to
    switch (title) {
      case "About Us":
        routeName = '/about-us'; 
        break;
      case "Games":
        routeName = '/games'; // Route for the Games screen
        break;
      // >>> NEW CASE: Blogs Route <<<
      case "Blogs":
        routeName = '/blogs'; 
        break;
      case "Privacy":
        routeName = '/privacy-policy'; // Corrected route path
        break;
      case "Terms":
        routeName = '/terms';
        break;
      default:
        return; 
    }

    // Use context.go() to navigate and update the browser URL
    context.go(routeName);
    }

  // Helper widget to create a clickable NavItem
  Widget _buildClickableNavItem(BuildContext context, String title) {
    final bool isCurrent = currentPage == title;
    // Assuming NavItem exists and handles its own text/style based on isCurrent
    return GestureDetector(
      onTap: isCurrent ? null : () => _navigateToPage(context, title),
      child: NavItem(title: title, isCurrent: isCurrent),
    );
  }

  // Helper to handle logo tap back to home
  void _goHome(BuildContext context) {
    // Use context.go('/') to navigate back to the root route
    context.go('/');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Updated color to use playversePink for consistency (mimics the screenshot header)
      color: playversePink, 
      padding: const EdgeInsets.only(
        left: 80,
        right: 60,
        top: 20,
        bottom: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo (Clickable to return to the Home route)
          GestureDetector(
            onTap: () => _goHome(context),
            // Assuming logo4.png exists and is the main logo.
            child: Image.asset("assets/logo4.png", height: 50),
          ),

          // Navigation Items (Now uses the clickable helper)
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
  // Define the size of the App Bar so Scaffold knows how much space to allocate
  Size get preferredSize => const Size.fromHeight(80.0); 
}
