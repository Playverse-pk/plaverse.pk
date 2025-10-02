import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class GameCard {
  static Widget buildGameCard(
    BuildContext context,
    String title,
    String imgPath,
    String description, {
    String appStoreLink = '',
    String googlePlayLink = '',
  }) {
    const String destinationRoute = '/games';

    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        // ✅ Scale factor relative to desktop (1200px baseline)
        double scale = (screenWidth / 1200).clamp(0.6, 1.0);

        return Container(
          margin: EdgeInsets.symmetric(vertical: 15 * scale),
          padding: EdgeInsets.all(40 * scale),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20 * scale),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Left Side → Text & Buttons
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 40 * scale,
                        fontWeight: FontWeight.w500,
                        color: Colors.purple,
                      ),
                    ),
                    SizedBox(height: 19 * scale),

                    // Description
                    Text(
                      description,
                      style: GoogleFonts.poppins(
                        fontSize: 20 * scale,
                        height: 1.6,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 25 * scale),

                    // "More >" Link
                    GestureDetector(
                      onTap: () => context.go(destinationRoute),
                      child: Text(
                        'More >',
                        style: GoogleFonts.poppins(
                          fontSize: 20 * scale,
                          height: 1.6,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    SizedBox(height: 60 * scale),

                    // Download Buttons
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/app_store.png',
                          height: 50 * scale,
                        ),
                        SizedBox(height: 20 * scale),
                        Image.asset(
                          'assets/play_store1.png',
                          height: 50 * scale,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(width: 30 * scale),

              // 🔹 Right Side → Game Image
              Expanded(
                flex: 1,
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20 * scale),
                    child: Image.asset(
                      imgPath,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
