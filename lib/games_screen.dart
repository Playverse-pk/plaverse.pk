import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// --- Theme Colors (Defined in other files, duplicated here for standalone testing) ---
const Color playversePink = Color(0xFFE91E63); // Deep pink/red for headers
const Color playversePurple = Color(0xFF8A2BE2); // Purple for accents/branding
const Color playverseBgColor = Color(0xFFF9F9F9); // Light background
const Color playverseCardColor = Colors.white;

// --- Mock Game Data based on user's screenshots ---
final List<Map<String, dynamic>> gameList = [
  {
    'title': 'Paint It: Hex Color Sort',
    'description': 'Discover Paint It: Hex Color Sort! Mix colors in a world where every splash of water is a step into mystery. We are inviting you to sort, match, and puzzle your way through.',
    // Placeholder image asset based on the cat wizard in the screenshot
    'asset_left': 'assets/leftcat.png', 
    'asset_right': 'assets/rightcat.png',
  },
];

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Column(
          children: [
            // 1. Hero Banner Section
            // const PlayverseAppBar(currentPage: "Games"),
            _buildHeroBanner(context),
            const SizedBox(height: 64),
            // 2. Game Listing Section
            _buildGameList(context),
            const SizedBox(height: 80),
            // 3. Footer
            // const PlaverseFooter(isPrivacyPage: false, isTermsPage: false),
          ],
        
      ),
    );
  }

  // --- Widget Builders ---

  Widget _buildHeroBanner(BuildContext context) {
    // This mimics the wide header image with a title overlay from the screenshot
    return Container(
      height: 400, // Fixed height for a dramatic banner
      width: double.infinity,
      decoration: BoxDecoration(
        // Using the uploaded image for the background
        image: DecorationImage(
          image: AssetImage(
            'assets/ourgames.jpg',
          ),
          fit: BoxFit.cover,
          // Apply a subtle dark overlay for text contrast
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4), 
            BlendMode.darken
          ),
        ),
      ),
      child: Center(
        child: Text(
          'OUR GAMES',
          style: GoogleFonts.poppins(
            shadows: [
              Shadow(
                color: Colors.white.withOpacity(0.5), 
                blurRadius: 10, 
                offset: const Offset(2, 2)
              ),
               Shadow(
                color: Colors.white.withOpacity(0.8), // A bright white outline/glow effect
                blurRadius: 1, 
                offset: const Offset(0, 0)
              ),
            ],
            fontSize: 60,
            fontWeight: FontWeight.w800,
            color: Colors.purple,
            letterSpacing: 4,
          ),
        ),
      ),
    );
  }

  Widget _buildGameList(BuildContext context) {
    return Container(
      // constraints: const BoxConstraints(maxWidth: 1000), // Max width for content legibility
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          // Iterate through the game list, alternating the layout direction
          ...gameList.asMap().entries.map((entry) {
            final index = entry.key;
            final game = entry.value;
            final isReversed = index % 2 != 0; // Alternate layout: left/right/left/right

            return _buildGameCard(
              game['title'] as String,
              game['description'] as String,
              game['asset_left'] as String,
              game['asset_right'] as String,
              isReversed: isReversed,
            );
          }).toList(),
        ],
      ),
    );
  }

 Widget _buildGameCard(
  String title,
  String description,
  String assetLeft,
  String assetRight,
  {required bool isReversed}) {
  
  // Left Image
  Widget leftImage = Image.asset(
    assetLeft,
    height: 350,
    width: 350,
    fit: BoxFit.contain,
    errorBuilder: (context, error, stackTrace) =>
        Icon(Icons.gamepad, size: 80, color: Colors.grey),
  );

  // Right Image
  Widget rightImage = Image.asset(
    assetRight,
    height: 350,
    width: 350,
    fit: BoxFit.contain,
    errorBuilder: (context, error, stackTrace) =>
        Icon(Icons.gamepad, size: 80, color: Colors.grey),
  );

  // Text content
  Widget textColumn = Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: Colors.purple, // match screenshot
        ),
      ),
      const SizedBox(height: 16),
      SizedBox(
        width: 400, // keep description nicely wrapped
        child: Text(
          description,
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Colors.black87,
            height: 1.6,
          ),
        ),
      ),
      const SizedBox(height: 24),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/app_store.png',
            height: 50,
          ),
          const SizedBox(width: 16),
          Image.asset(
            'assets/play_store.png',
            height: 50,
          ),
        ],
      ),
    ],
  );

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 64.0),
    child: LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 800) {
          // 💻 Desktop layout: Left image | Center text | Right image
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftImage,
              const SizedBox(width: 40),
              Flexible(child: textColumn),
              const SizedBox(width: 40),
              rightImage,
            ],
          );
        } else {
          // 📱 Mobile layout: stacked
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              leftImage,
              const SizedBox(height: 26),
              textColumn,
              const SizedBox(height: 26),
              rightImage,
            ],
          );
        }
      },
    ),
  );
}

}
