import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // ACTIVATE: Import go_router for web routing
import 'package:google_fonts/google_fonts.dart';

class PlaverseFooter extends StatelessWidget {
  final bool isPrivacyPage;
  final bool isTermsPage; 

  const PlaverseFooter({
    super.key, 
    this.isPrivacyPage = false,
    this.isTermsPage = false,
  });

  // --- Router Navigation Function ---
  // This function now uses go_router's deep-linking method.
  void _navigateToRoute(BuildContext context, String routePath) {
    // To update the URL in the browser bar and navigate, 
    // we use context.go() from the go_router package.
    context.go(routePath);
    
    // The old Navigator.push fallback logic has been removed.
    
    print('Navigating internally to route: $routePath');
  }

  @override
  Widget build(BuildContext context) {
    // Define the internal routes that correspond to the desired browser URLs.
    // IMPORTANT: These strings MUST match the paths defined in your GoRouter configuration in main.dart:
    const String privacyRoute = '/privacy-policy'; // Corrected from /privacy-policy
    const String termsRoute = '/terms';     // Corrected from /terms-of-service

    return Container(
      // Set the background color to the vibrant pink/red from the image
      color: Colors.purple, 
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
      
      child: Column(
        mainAxisSize: MainAxisSize.min, // Wrap content height
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. Logo 
          Image.asset(
            'assets/logo4.png', // Replace with your actual asset path
            height: 40,
            color: Colors.white, // Assuming the logo itself should be white
          ),
          const SizedBox(height: 30),

          // 2. Social Media Icons (LinkedIn and Facebook)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // LinkedIn Icon Placeholder
              IconButton(
                icon: Image.asset(
                  'assets/linkedin.png',
                  height: 30, // control size
                  width: 30,
                ),
                onPressed: () { /* Launch external URL if needed, or define a GoRouter route */ },
              ),
              const SizedBox(width: 20),
              // Facebook Icon Placeholder
              IconButton(
                icon: const Icon(Icons.facebook, color: Colors.white, size: 30), 
                onPressed: () { /* Launch external URL if needed, or define a GoRouter route */ },
              ),
            ],
          ),
          const SizedBox(height: 30),
          
          // 3. Legal Links (Privacy, Terms)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Privacy Link: Disabled if isPrivacyPage is true
              _buildFooterLink(
                'Privacy', 
                // Navigate using the deep-link route
                isPrivacyPage ? null : () => _navigateToRoute(context, privacyRoute),
                isDisabled: isPrivacyPage,
              ),
              const SizedBox(width: 40),
              // Terms Link: Disabled if isTermsPage is true
              _buildFooterLink(
                'Terms', 
                // Navigate using the deep-link route
                isTermsPage ? null : () => _navigateToRoute(context, termsRoute),
                isDisabled: isTermsPage,
              ),
            ],
          ),
          const SizedBox(height: 30),

          // 4. Copyright Information
          Text(
            'All rights reserved. © 2024 - Playverse Games',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // Helper widget for the footer links to keep code clean
  Widget _buildFooterLink(String text, VoidCallback? onPressed, {bool isDisabled = false}) {
    return TextButton(
      // If onPressed is null (disabled), it will not be clickable
      onPressed: onPressed, 
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        // Overlay color to ensure the link doesn't look clickable when disabled
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          // Change color to a slightly dimmed white/gray if disabled
          color: isDisabled ? Colors.white.withOpacity(0.5) : Colors.white, 
        ),
      ),
    );
  }
}
