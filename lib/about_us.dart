import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// --- Theme Colors and Fonts ---
const Color playversePink = Colors.purple; // Deep pink/red for headers
const Color playverseBgColor = Color(
    0xFFF9F9F9,
); // Light background for contrast
const Color playverseCardColor = Colors.white;

// --- Mock Data ---

// Data for the "Our Story" Timeline
final List<Map<String, dynamic>> storyTimeline = [
  {
    'date': 'January 2024',
    'description':
        'Playverse.pk was founded in Lahore to craft genre-defining mobile games and create a unicorn from Pakistan.',
    'asset': 'assets/flag.png',
  },
  {
    'date': 'February 2024',
    'description':
        'Raised \$3M in our pre-seed round led by Venture Capital with participation from Local Angel Investors.',
    'asset': 'assets/cashbag.png',
  },
  {
    'date': 'April 2024',
    'description':
        'Launched our first title, "The Grand Game," achieving 500k downloads in the first month.',
    'asset': 'assets/ms_icon_240.png',
  },
  {
    'date': 'Present',
    'description':
        'We continue to grow our team and expand our game portfolio, focusing on quality and community.',
    'asset': 'assets/car-match-icon-copy.png',
  },
];

// Data for the "Our Values" Section
final List<Map<String, String>> companyValues = [
  {
    'title': 'Ownership',
    'detail':
        'We take pride in owning both our work and the outcomes it delivers, fostering accountability.',
  },
  {
    'title': 'Drive',
    'detail':
        'We work with high-performing individuals who share our relentless ambition to excel.',
  },
  {
    'title': 'Passion',
    'detail':
        'We bring energy and enthusiasm to everything we do, making the process enjoyable.',
  },
  {
    'title': 'Communication',
    'detail':
        'We foster clear, honest, and open dialogue to connect and inspire within the team.',
  },
  {
    'title': 'Teamwork',
    'detail':
        'We achieve greatness by working together as one team, supporting each other\'s growth.',
  },
];

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  // --- Widgets (Sections and Components) ---

  // Helper for Section Header (now accepts responsive font size)
  Widget _buildSectionHeader(String title, double fontSize) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            color: playversePink,
            fontSize: fontSize, // Responsive size
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  // Team Photo Section (image width naturally adapts to screen width)
  Widget _buildTeamSection(BuildContext context) {
    // Image.asset will naturally scale with its parent width
    return ClipRRect(
      child: Image.asset(
        'assets/playverse.png',
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
  }

  // Helper for Timeline Item: Now uses an adaptive layout (Row for wide, Column for narrow)
  Widget _buildTimelineItem(
    String date,
    String description,
    String assetPath,
    double bodyFontSize,
    double dateFontSize,
    double assetSize,
    double screenWidth,
  ) {
    final isMobile = screenWidth < 600;

    // 1. Date and Icon Block (adapts its layout based on screen size)
    Widget dateAndIconBlock;

    if (isMobile) {
      // Mobile: Stack date, icon, and text vertically
      dateAndIconBlock = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                date,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: dateFontSize,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: assetSize,
                height: assetSize,
                child: Image.asset(assetPath, fit: BoxFit.contain),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Vertical Divider is removed in mobile stack layout for simplicity
        ],
      );
    } else {
      // Desktop/Tablet: Use original Row layout with fixed date width and vertical divider
      dateAndIconBlock = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120, // Fixed width for date column on wide screens
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    date,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: dateFontSize,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Vertical Divider
                Container(
                  width: 2,
                  height: assetSize * 1.5, // Make the divider a bit taller
                  color: Colors.black,
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          // Description Text (Expanded)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: bodyFontSize,
                  color: Colors.black87,
                  height: 1.6,
                ),
              ),
            ),
          ),
          const SizedBox(width: 24),
          // Asset/Icon Column (aligned to the right)
          SizedBox(
            width: assetSize,
            height: assetSize,
            child: Center(
              child: Image.asset(assetPath, fit: BoxFit.contain),
            ),
          ),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: playverseCardColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  dateAndIconBlock, // Date and Icon on top
                  Text(
                    description, // Description below
                    style: GoogleFonts.poppins(
                      fontSize: bodyFontSize,
                      color: Colors.black87,
                      height: 1.6,
                    ),
                  ),
                ],
              )
            : dateAndIconBlock, // Use the Row layout for wide screens
      ),
    );
  }

  // Our Story Timeline Section (now passes screenWidth)
  Widget _buildStorySection(
    BuildContext context,
    double screenWidth,
    double headerTitleSize,
    double dateFontSize,
    double bodyFontSize,
    double timelineAssetSize,
    double horizontalPadding,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding), // Responsive padding
      constraints: const BoxConstraints(
        maxWidth: 1200,
      ), // Max width for web legibility
      alignment: Alignment.center,
      child: Column(
        children: [
          _buildSectionHeader('Our Story', headerTitleSize),
          // The actual timeline is built here
          ...storyTimeline.map((item) {
            return _buildTimelineItem(
              item['date'] as String,
              item['description'] as String,
              item['asset'],
              bodyFontSize,
              dateFontSize,
              timelineAssetSize,
              screenWidth, // Pass screen width for adaptive layout
            );
          }).toList(),
        ],
      ),
    );
  }

  // Cartoon Mock (now uses responsive size)
  Widget _buildCartoonMock(double size) {
    const String valuesIllustrationUrl = 'assets/cartoon.png'; // Using 'assets/' prefix
    return Image.asset(
      height: size, // Responsive size
      width: size, // Responsive size
      valuesIllustrationUrl,
      fit: BoxFit.fill,
    );
  }

  // Values List (now uses responsive font size)
  Widget _buildValuesList(double bodyFontSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: companyValues.map((value) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            decoration: BoxDecoration(
              color: playverseCardColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.poppins(
                  fontSize: bodyFontSize, // Responsive size
                  color: Colors.black54,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: '${value['title']!}: ',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: bodyFontSize, // Responsive size
                      color: Colors.black87,
                    ),
                  ),
                  TextSpan(text: value['detail']!),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  // Our Values Section (now uses responsive padding and sizes)
  Widget _buildValuesSection(
    BuildContext context,
    double headerTitleSize,
    double bodyFontSize,
    double cartoonMockSize,
    double horizontalPadding,
  ) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding), // Responsive padding
      constraints: const BoxConstraints(maxWidth: 1200),
      alignment: Alignment.center,
      child: Column(
        children: [
          _buildSectionHeader('Our Values', headerTitleSize),
          LayoutBuilder(
            builder: (context, constraints) {
              // Adjusts the layout based on available width
              if (constraints.maxWidth < 800) {
                // Narrow screen layout (Image on top, list below)
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildCartoonMock(cartoonMockSize),
                    const SizedBox(height: 32),
                    _buildValuesList(bodyFontSize),
                  ],
                );
              } else {
                // Wide screen layout (Image on left, list on right)
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCartoonMock(cartoonMockSize),
                    const SizedBox(width: 40),
                    Expanded(child: _buildValuesList(bodyFontSize)),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        // 🔹 Define responsive sizes based on screen width
        // Aggressively adjust for very small screens (<450px)
        double headerTitleSize =
            screenWidth < 450 ? 28 : screenWidth < 600 ? 32 : screenWidth < 1000 ? 40 : 50;
        double bodyFontSize =
            screenWidth < 600 ? 14 : screenWidth < 1000 ? 16 : 17;
        double dateFontSize = screenWidth < 600 ? 14 : 18; // Reduced on mobile
        double timelineAssetSize = screenWidth < 600 ? 50 : 80; // Reduced asset size
        double cartoonMockSize = screenWidth < 600 ? 200 : 300; // Reduced cartoon size
        double horizontalPadding =
            screenWidth < 600 ? 16 : screenWidth < 1000 ? 50 : 100;

        return SingleChildScrollView(
          child: Column(
            children: [
              // 1. Team Photo Section
              _buildTeamSection(context),
              const SizedBox(height: 64),
              // 2. Our Story Timeline
              _buildStorySection(
                context,
                screenWidth, // Pass screen width
                headerTitleSize,
                dateFontSize,
                bodyFontSize,
                timelineAssetSize,
                horizontalPadding,
              ),
              const SizedBox(height: 64),
              // 3. Our Values Section
              _buildValuesSection(
                context,
                headerTitleSize,
                bodyFontSize,
                cartoonMockSize,
                horizontalPadding,
              ),
              //   const SizedBox(height: 80),
              // 4. Custom Footer (Commented out original code preserved)
              // const PlaverseFooter(isPrivacyPage: false, isTermsPage: false),
            ],
          ),
        );
      },
    );
  }
}
