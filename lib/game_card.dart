import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart'; // 👈 Added GoRouter import

class GameCard {
  /// Builds a card for a specific game, including title, image, description, and download links.
  /// The BuildContext is passed as the first positional argument for clean navigation.
  static Widget buildGameCard(
    BuildContext context, // 👈 Corrected context to be the first required positional argument
    String title,
    String imgPath,
    String description, {
    String appStoreLink = '',
    String googlePlayLink = '',
  }) {
    // The route to navigate to when 'More >' is tapped (usually a detailed game screen or /games list)
    const String destinationRoute = '/games'; 

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start, // Align top for text block
        children: [
          // 🔹 Title + Description + Buttons (LEFT SIDE)
          Expanded(
            flex: 2, // Give the text/button side more space
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. Title
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 40, 
                    fontWeight: FontWeight.w500,
                    color: Colors.purple, 
                  ),
                ),
                const SizedBox(height: 19),

                // 2. Description
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    fontSize: 20, 
                    color: Colors.black,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 25),

                // 3. 'More >' Link (Navigation to game details or /games)
                GestureDetector(
                  onTap: () {
                    // Correctly uses context.go() from the positional context argument
                    context.go(destinationRoute);
                  },
                  child: Text(
                    'More >',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      height: 1.6,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 90),

                // 4. Download Buttons (Placeholder Images)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // App Store Button
                    // Note: You should handle navigation/linking for these
                    Image.asset('assets/app_store.png'),

                    const SizedBox(
                      height: 20,
                    ), // vertical spacing between buttons
                    
                    // Play Store Button
                    Image.asset('assets/play_store1.png'),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 30), // spacing between text/buttons & image
          
          // 🔹 Game Image (RIGHT SIDE)
          Expanded(
            flex: 1,
            child: FractionallySizedBox(
              widthFactor: 0.8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(imgPath, fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
