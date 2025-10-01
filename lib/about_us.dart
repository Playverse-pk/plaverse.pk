import 'package:flutter/material.dart';
// Import custom components based on user's structure
import 'package:playverse/playverse_app_bar.dart'; 
import 'package:playverse/footer.dart'; 
import 'package:google_fonts/google_fonts.dart';

// --- Theme Colors and Fonts ---
const Color playversePink = Colors.purple; // Deep pink/red for headers
const Color playverseBgColor = Color(0xFFF9F9F9); // Light background for contrast
const Color playverseCardColor = Colors.white;

// --- Mock Data ---

// Data for the "Our Story" Timeline
final List<Map<String, dynamic>> storyTimeline = [
  {
    'date': 'January 2024',
    'description': 'Playverse.pk was founded in Lahore to craft genre-defining mobile games and create a unicorn from Pakistan.',
    // Using a mock asset path that visually represents the flag image in the design
    'asset': 'assets/flag.png', 
  },
  {
    'date': 'February 2024',
    'description': 'Raised \$3M in our pre-seed round led by Venture Capital with participation from Local Angel Investors.',
    // Using a mock asset path that visually represents the money bag in the design
    'asset': 'assets/cashbag.png', 
  },
  {
    'date': 'April 2024',
    'description': 'Launched our first title, "The Grand Game," achieving 500k downloads in the first month.',
    // Using a mock asset path that visually represents an achievement/star image
    'asset': 'assets/ms_icon_240.png', 
  },
  {
    'date': 'Present',
    'description': 'We continue to grow our team and expand our game portfolio, focusing on quality and community.',
    // Using a mock asset path that visually represents a rocket/growth image
    'asset': 'assets/car-match-icon-copy.png',
  },
];

// Data for the "Our Values" Section (Kept for completeness)
final List<Map<String, String>> companyValues = [
  {
    'title': 'Ownership',
    'detail': 'We take pride in owning both our work and the outcomes it delivers, fostering accountability.',
  },
  {
    'title': 'Drive',
    'detail': 'We work with high-performing individuals who share our relentless ambition to excel.',
  },
  {
    'title': 'Passion',
    'detail': 'We bring energy and enthusiasm to everything we do, making the process enjoyable.',
  },
  {
    'title': 'Communication',
    'detail': 'We foster clear, honest, and open dialogue to connect and inspire within the team.',
  },
  {
    'title': 'Teamwork',
    'detail': 'We achieve greatness by working together as one team, supporting each other\'s growth.',
  },
];

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Use the custom AppBar in the Scaffold's appBar property
    return Scaffold(
      // The custom PlayverseAppBar is now used, with the current page set for highlighting
      backgroundColor: playverseBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            PlayverseAppBar(currentPage: "About Us"),  
            // 1. Team Photo Section
            _buildTeamSection(context),
            const SizedBox(height: 64),
            // 2. Our Story Timeline
            _buildStorySection(context),
            const SizedBox(height: 64),
            // 3. Our Values Section
            _buildValuesSection(context),
            const SizedBox(height: 80),
            // 4. Custom Footer
            // Note: Assuming PlaverseFooter is correctly imported and takes these properties
            const PlaverseFooter(isPrivacyPage: false, isTermsPage: false),
          ],
        ),
      ),
    );
  }

  // --- Widgets (Sections and Components) ---

  Widget _buildSectionHeader(String title) {
    return Column(
      children: [
        // Using GoogleFonts.poppins for consistency as seen in other files
        Text(
          title,
          style: GoogleFonts.poppins(
            color: playversePink,
            fontSize: 40,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

 Widget _buildTeamSection(BuildContext context) {
    // A wide container to mimic the 'grand' team photo banner
    return ClipRRect(
      child: Image.asset(
       
       'assets/playverse.png', // Uses the asset path you provided
       // fit: BoxFit.fill,
       // You typically don't need a loadingBuilder for local assets, 
       // but an errorBuilder is still helpful in case the asset is missing.
                    ),
    );
  }

  Widget _buildStorySection(BuildContext context) {
    // Timeline section structure
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      constraints: const BoxConstraints(maxWidth: 1000), // Max width for web legibility
      child: Column(
        children: [
          _buildSectionHeader('Our Story'),
          // The actual timeline is built here
          // The IntrinsicHeight wrapper is removed as it's not needed for the new layout
          ...storyTimeline.map((item) {
            return _buildTimelineItem(
              item['date'] as String,
              item['description'] as String,
              item['asset'] ,
            );
          }).toList(),
        ],
      ),
    );
  }

  // NOTE: This uses Image.asset based on the user's provided code for the timeline,
  // relying on the presence of mock assets.
  Widget _buildTimelineItem(
      String date, String description, String assetPath) {
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Date Column with vertical divider
            SizedBox(
              width: 120, // Fixed width for date column
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      date,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Vertical Divider (The thin line shown in the image)
                  Container(
                    width: 2,
                    height: 80, // Fixed height for a neat separator
                    color: Colors.black, 
                  ),
                ],
              ),
            ),
            const SizedBox(width: 24),
            
            // 2. Description Text
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  description,
                  style: GoogleFonts.poppins(
                    fontSize: 16, 
                    color: Colors.black87,
                    height: 1.6,
                  ),
                ),
              ),
            ),
            
            const SizedBox(width: 24),

            // 3. Asset/Icon Column (aligned to the right)
            // Using a square Container as a mock for the cartoon image on the right
            SizedBox(
              width: 80,
              height: 80,
              child: Center(
                child: Image.asset(
                  assetPath, // assetPath should be a String like 'assets/images/cartoon.png'
                  fit: BoxFit.contain,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildValuesSection(BuildContext context) {
    // Layout for the values section (Image on left, list on right for wide screens)
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      // constraints: const BoxConstraints(maxWidth: 1000), // Max width for web legibility
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildSectionHeader('Our Values'),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                // Wide screen layout (Image on left, list on right)
                return Row(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Mock Cartoon Image Section
                    _buildCartoonMock(),
                    const SizedBox(width: 40),
                    // Values List
                    Expanded(child: _buildValuesList()),
                  ],
                );
              } else {
                // Narrow screen layout (Image on top, list below)
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildCartoonMock(),
                    const SizedBox(height: 32),
                    _buildValuesList(),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }

  // UPDATED: Using the uploaded image for the values section
  Widget _buildCartoonMock() {
    // Content ID for the purple pot/cat illustration
    const String valuesIllustrationUrl = 'cartoon.png';
    
    return Image.asset(
      height: 300,
      width: 300,
      valuesIllustrationUrl,
      fit: BoxFit.fill,
    );
  }

  // UPDATED: Compact list view using RichText to match the new UI design
  Widget _buildValuesList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: companyValues.map((value) {
        return Padding(
          // Use vertical spacing for separation between cards
          padding: const EdgeInsets.only(bottom: 16.0), 
          child: Container(
            // Use horizontal padding for the content inside the card
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20), 
            decoration: BoxDecoration(
              color: playverseCardColor,
              borderRadius: BorderRadius.circular(12), // Slightly smaller radius for sleek look
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: RichText(
              // Combining Title (bold) and Detail (regular) in one text block
              text: TextSpan(
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54, height: 1.5),
                children: [
                  TextSpan(
                    text: '${value['title']!}: ',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  TextSpan(
                    text: value['detail']!,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
