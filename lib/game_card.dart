import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameCard {
  static Widget buildGameCard(
    String title,
    String imgPath,
    String description, {
    String appStoreLink = '',
    String googlePlayLink = '',
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(40), // Increased padding for more space
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        // Removed BoxShadow for a flatter look, closer to the source image
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align top for text block
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
                    fontSize: 40, // Increased font size
                    fontWeight: FontWeight.w500,
                    color: Colors
                        .purple, // Changed to pinkAccent to match image
                  ),
                ),
                const SizedBox(height: 19),

                // 2. Description
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    fontSize: 20, // Increased font size
                    color: Colors.black,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 25),

                // 3. 'More >' Link
                Text(
                  'More >',
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    height: 1.6,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 90),

                // 4. Download Buttons
                // Note: You would typically use Image.asset or an equivalent for these in production
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // App Store Button
                    Image.asset('assets/app_store.png'),

                    const SizedBox(
                      height: 20,
                    ), // 👈 vertical spacing between buttons
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
              widthFactor: 0.8, // 👈 shrink width to 60%
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
