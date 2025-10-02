import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// --- Theme Colors ---
const Color playversePink = Color(0xFFE91E63);
const Color playversePurple = Color(0xFF8A2BE2);
const Color playverseBgColor = Color(0xFFF9F9F9);
const Color playverseCardColor = Colors.white;

// --- Mock Game Data ---
final List<Map<String, dynamic>> gameList = [
  {
    'title': 'Paint It: Hex Color Sort',
    'description':
        'Discover Paint It: Hex Color Sort! Mix colors in a world where every splash of water is a step into mystery. '
            'We are inviting you to sort, match, and puzzle your way through.',
    'asset_left': 'assets/leftcat.png',
    'asset_right': 'assets/rightcat.png',
  },
];

class GamesScreen extends StatelessWidget {
  const GamesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeroBanner(context),
          const SizedBox(height: 64),
          _buildGameList(context),
          const SizedBox(height: 80),
        ],
      ),
    );
  }

  // --- Hero Banner ---
  Widget _buildHeroBanner(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double width = constraints.maxWidth;

        double fontSize = width > 1000
            ? 60
            : width > 700
                ? 40
                : 28;

        return Container(
          height: width > 700 ? 400 : 250,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('assets/ourgames.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4),
                BlendMode.darken,
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
                      offset: const Offset(2, 2)),
                  Shadow(
                      color: Colors.white.withOpacity(0.8),
                      blurRadius: 1,
                      offset: const Offset(0, 0)),
                ],
                fontSize: fontSize,
                fontWeight: FontWeight.w800,
                color: Colors.purple,
                letterSpacing: 3,
              ),
            ),
          ),
        );
      },
    );
  }

  // --- Game List ---
  Widget _buildGameList(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ...gameList.asMap().entries.map((entry) {
            final index = entry.key;
            final game = entry.value;
            final isReversed = index % 2 != 0;

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

  // --- Responsive Game Card ---
  Widget _buildGameCard(
    String title,
    String description,
    String assetLeft,
    String assetRight, {
    required bool isReversed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 64.0),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;

          // 🔹 Adaptive sizes
          double titleSize = width > 1000
              ? 32
              : width > 700
                  ? 26
                  : 20;

          double descSize = width > 1000
              ? 16
              : width > 700
                  ? 14
                  : 12;

          double imageSize = width > 1000
              ? 350
              : width > 700
                  ? 250
                  : 180;

          double storeIconSize = width > 1000
              ? 50
              : width > 700
                  ? 40
                  : 30;

          // Images
          Widget leftImage = Image.asset(
            assetLeft,
            height: imageSize,
            width: imageSize,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.gamepad, size: imageSize / 2, color: Colors.grey),
          );

          Widget rightImage = Image.asset(
            assetRight,
            height: imageSize,
            width: imageSize,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.gamepad, size: imageSize / 2, color: Colors.grey),
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
                  fontSize: titleSize,
                  fontWeight: FontWeight.w700,
                  color: Colors.purple,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: width > 1000 ? 400 : width * 0.8,
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: descSize,
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
                    height: storeIconSize,
                  ),
                  const SizedBox(width: 16),
                  Image.asset(
                    'assets/play_store.png',
                    height: storeIconSize,
                  ),
                ],
              ),
            ],
          );

          if (width > 800) {
            // 💻 Desktop/tablet layout
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: isReversed
                  ? [rightImage, const SizedBox(width: 40), Flexible(child: textColumn), const SizedBox(width: 40), leftImage]
                  : [leftImage, const SizedBox(width: 40), Flexible(child: textColumn), const SizedBox(width: 40), rightImage],
            );
          } else {
            // 📱 Mobile layout
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: isReversed
                  ? [rightImage, const SizedBox(height: 26), textColumn, const SizedBox(height: 26), leftImage]
                  : [leftImage, const SizedBox(height: 26), textColumn, const SizedBox(height: 26), rightImage],
            );
          }
        },
      ),
    );
  }
}
