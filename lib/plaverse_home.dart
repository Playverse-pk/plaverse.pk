import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playverse/career_card.dart';
import 'package:playverse/footer.dart';
import 'package:playverse/game_card.dart';
// Removing unused imports for components/pages now handled externally or not used here
// import 'package:playverse/nav_item.dart';
// import 'package:playverse/privacy_policy.dart'; 
// import 'package:playverse/terms_of_service_page.dart'; 
import 'package:playverse/playverse_app_bar.dart'; // Import the reusable app bar


class PlayverseHome extends StatelessWidget {
  const PlayverseHome({super.key});

  // Removed all navigation helper methods (_navigateToPage, _buildClickableNavItem, _goHome)
  // as the logic is now fully contained within PlayverseAppBar.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔹 The old inline "Top Navigation Bar" container has been removed.

            // 🔹 Hero Section
            PlayverseAppBar(),
            Container(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
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
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Column(
                    children: [
                      Text(
                        "Based in Pakistan, Playverse Games is dedicated to shaping the future of gaming by creating genre-defining games played by millions worldwide.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          height: 1.6,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "At Playverse Games, we believe in passionate people who embody personal growth and take full ownership of their responsibilities. Our team collaboratively builds an environment where every member contributes to our shared success.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          height: 1.6,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Skyline Divider
                Image.asset("assets/skyline1.png", fit: BoxFit.cover, width: double.infinity,),
              ],
            ),

            const SizedBox(height: 30),

            // 🔹 Our Games Section
            Column(
              children: [
                Text(
                  'Our Games',
                  style: GoogleFonts.poppins(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: Colors.purple,
                  ),
                ),
                const SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80),
                  child: Column(
                    children: [
                      GameCard.buildGameCard(
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
            CareerCard.buildCareersCard('Careers', 'Your opportunity to take ownership and make an impact awaits here!',"assets/career.png" ),
            // Footer on the home page must set both flags to false so links are enabled
            const PlaverseFooter(isPrivacyPage: false, isTermsPage: false)
          ],
        ),
      ),
    );
  }
}
