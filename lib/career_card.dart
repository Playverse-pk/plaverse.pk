import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart'; // REQUIRED: Import go_router for navigation

class CareerCard {
  /// Builds a responsive card for displaying career or blog information.
  /// Note: The context is essential here for the GoRouter navigation.
  static Widget buildCareersCard(BuildContext context, String title, String description, String imgPath) {
    // Determine the route based on the card's purpose (assuming this button is only used for blogs for now)
    const String destinationRoute = '/blogs'; 

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: const Offset(0, 3), 
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center, // Vertically center content in the row
        children: [
          const SizedBox(width: 70),
          
          // 🔹 Text Content (Left Side)
          Expanded(
            flex: 2, // Give more space to the text content
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
                const SizedBox(height: 10),

                // 2. Description
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.black,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 30),

                // 3. "See More" Button
                ElevatedButton(
                  onPressed: () {
                    // CORRECT IMPLEMENTATION: Use context.go() to navigate.
                    context.go(destinationRoute);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple, // Button color matching title
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25), // Rounded corners for the button
                    ),
                  ),
                  child: Text(
                    'See More',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      height: 1.6,
                      fontWeight: FontWeight.w600,
                      color: Colors.white, // White text on the button
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 30), // Spacing between text and image

          // 🔹 Image (Right Side)
          Expanded(
            flex: 1, // Give less space to the image
            child: Image.asset(
              imgPath, // Path to your image, e.g., 'assets/cat_rocket.png'
              fit: BoxFit.contain, // Ensures the whole image is visible
            ),
          ),
        ],
      ),
    );
  }
}
