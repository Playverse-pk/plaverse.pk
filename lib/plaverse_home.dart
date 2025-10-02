import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playverse/career_card.dart';
import 'package:playverse/game_card.dart';

class PlayverseHome extends StatelessWidget {
  const PlayverseHome({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen width
    final screenWidth = MediaQuery.of(context).size.width;

    // ✅ Define responsive values
    double horizontalPadding = screenWidth > 1200
        ? 100
        : screenWidth > 800
            ? 60
            : 20;

    double sectionTitleSize = screenWidth > 1200
        ? 40
        : screenWidth > 800
            ? 30
            : 24;

    double bodyTextSize = screenWidth > 1200
        ? 20
        : screenWidth > 800
            ? 18
            : 16;

    double heroHeight = screenWidth > 800
        ? MediaQuery.of(context).size.height * 0.86
        : MediaQuery.of(context).size.height * 0.5;

    return SingleChildScrollView(
      child: Column(
        children: [
          // 🔹 Hero Section
          Container(
            height: heroHeight,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.center,
                image: AssetImage("assets/main.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 50),

          // 🔹 About Us Section
          Column(
            children: [
              Text(
                'About Us',
                style: GoogleFonts.poppins(
                  fontSize: sectionTitleSize,
                  fontWeight: FontWeight.w700,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(height: 20),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  children: [
                    Text(
                      "Based in Pakistan, Playverse.pk is dedicated to shaping the future of gaming by creating genre-defining games played by millions worldwide.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: bodyTextSize,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "At Playverse.pk, we believe in passionate people who embody personal growth and take full ownership of their responsibilities. Our team collaboratively builds an environment where every member contributes to our shared success.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: bodyTextSize,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // Skyline Divider
              Image.asset(
                "assets/skyline1.png",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ],
          ),

          const SizedBox(height: 30),

          // 🔹 Our Games Section
          Column(
            children: [
              Text(
                'Our Games',
                style: GoogleFonts.poppins(
                  fontSize: sectionTitleSize,
                  fontWeight: FontWeight.w700,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(height: 30),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  children: [
                    GameCard.buildGameCard(
                      context,
                      "Paint It: Hex Color Sort",
                      "assets/game1.png",
                      "Dive into the Enchanted Realm of Magic Sort: A Mystical\nSorting Adventure!",
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 50),

          // 🔹 Career Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: CareerCard.buildCareersCard(
              context,
              'Blogs',
              'Your chance to stay ahead in the fast-evolving gaming industry is here!',
              "assets/career.png",
            ),
          ),
        ],
      ),
    );
  }
}
