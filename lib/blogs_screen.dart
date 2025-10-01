import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playverse/footer.dart';
import 'package:playverse/playverse_app_bar.dart';

// Defining color constants locally for this file's self-contained styling.
// These should match the theme used throughout your Playverse app.
const Color playversePink = Colors.purple; 
const Color playversePurple = Color(0xFF5E35B1); // A specific dark purple for accents

// --- MOCK DATA MODEL ---

/// Represents a single blog post's data.
class BlogModel {
  final String title;
  final String summary;
  final String date;
  final Color color;

  BlogModel({
    required this.title,
    required this.summary,
    required this.date,
    required this.color,
  });
}

// Mock data list for displaying cards
final List<BlogModel> mockBlogs = [
  BlogModel(
  title: "The Future of Mobile Gaming",
  summary: "Exploring how 5G, AR, and cloud gaming are reshaping the mobile gaming landscape and opening doors for immersive player experiences worldwide.",
  date: "October 1, 2025",
  color: Colors.blue.shade700,
),

BlogModel(
  title: "Esports and Competitive Gaming Growth",
  summary: "A deep dive into the rise of esports, from local tournaments to billion-dollar global championships, and what it means for players and developers.",
  date: "September 15, 2025",
  color: Colors.pink.shade700,
),

BlogModel(
  title: "The Art of Game Design: Beyond Graphics",
  summary: "Understanding the role of storytelling, character development, and gameplay mechanics in creating unforgettable gaming experiences.",
  date: "August 28, 2025",
  color: playversePurple, // Using the primary theme color
),

 
  
];

// --- WIDGETS ---

/// A reusable card for displaying a single blog post summary.
class BlogCard extends StatelessWidget {
  final BlogModel blog;

  const BlogCard({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          // TODO: Implement navigation to the detailed article page using GoRouter
          print("Reading blog: ${blog.title}");
        },
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image/Placeholder Area
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Container(
                height: 200,
                color: blog.color.withOpacity(0.8),
                child: Center(
                  // Placeholder icon for the blog image/thumbnail
                  child: Icon(Icons.article, size: 80, color: Colors.white.withOpacity(0.9)),
                ),
              ),
            ),

            // Content Area
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    blog.title,
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade900,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    blog.date,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey.shade500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    blog.summary,
                    style: GoogleFonts.inter(fontSize: 16, color: Colors.grey.shade700),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () {
                        print("Navigating to full article...");
                      },
                      icon: const Icon(Icons.arrow_forward, size: 18),
                      label: const Text("Read More"),
                      style: TextButton.styleFrom(
                        foregroundColor: blog.color,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: blog.color.withOpacity(0.5)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/// The main screen that adapts its layout based on screen width.
/// This widget provides the body content and assumes the PlayverseAppBar is handled elsewhere.
class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  // Breakpoints for responsive design
  static const double kDesktopBreakpoint = 1000.0;
  static const double kTabletBreakpoint = 650.0;

  @override
  Widget build(BuildContext context) {
    // Determine the width of the screen available for this content
    return 
    Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PlayverseAppBar(),
            LayoutBuilder(
              builder: (context, constraints) {
                // Default values for mobile view (single column)
                int crossAxisCount = 1;
                double mainAxisSpacing = 30.0;
                double crossAxisSpacing = 0.0;
                EdgeInsets padding = const EdgeInsets.all(20.0);
                double cardAspectRatio = 0.8; // Used to control height in grid
            
                if (constraints.maxWidth > kDesktopBreakpoint) {
                  // Desktop View (3 columns)
                  crossAxisCount = 3;
                  mainAxisSpacing = 40.0;
                  crossAxisSpacing = 40.0;
                  padding = const EdgeInsets.all(50.0);
                  cardAspectRatio = 0.8;
                } else if (constraints.maxWidth > kTabletBreakpoint) {
                  // Tablet View (2 columns)
                  crossAxisCount = 2;
                  mainAxisSpacing = 30.0;
                  crossAxisSpacing = 30.0;
                  padding = const EdgeInsets.all(30.0);
                  cardAspectRatio = 0.9;
                } 
                
                // This is a SingleChildScrollView that holds both the Header and the Grid/List
                return SingleChildScrollView(
                  padding: padding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header Section
                      _buildHeader(context),
                      const SizedBox(height: 50),
                      
                      // Blog Posts Content
                      if (crossAxisCount == 1) 
                        // Mobile View: Simple Column List
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: mockBlogs.map((blog) => Padding(
                            padding: const EdgeInsets.only(bottom: 25.0),
                            child: BlogCard(blog: blog),
                          )).toList(),
                        )
                      else 
                        // Tablet/Desktop View: Grid View
                        GridView.builder(
                          shrinkWrap: true, // Necessary inside SingleChildScrollView
                          physics: const NeverScrollableScrollPhysics(), // Scroll managed by parent
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: crossAxisSpacing,
                            mainAxisSpacing: mainAxisSpacing,
                            // Calculated ratio to ensure the card looks well proportioned
                            childAspectRatio: cardAspectRatio, 
                          ),
                          itemCount: mockBlogs.length,
                          itemBuilder: (context, index) {
                            return BlogCard(blog: mockBlogs[index]);
                          },
                        ),
                    ],
                  ),
                );
              },
            ),
            PlaverseFooter(isPrivacyPage: false,isTermsPage: false,)
          ],
        ),
      ),
    );
  }

  // Common Header for the Blog Page
  Widget _buildHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Insights from Playverse.pk",
          style: GoogleFonts.poppins(
            fontSize: 40,
            fontWeight: FontWeight.w700,
            color: Colors.purple,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          "Our latest articles on  game design, and tech trends.",
          style: GoogleFonts.inter(
            fontSize: 20,
            color: Colors.grey.shade600,
          ),
        ),
        Divider(color: Colors.grey.shade300, thickness: 2, height: 40),
      ],
    );
  }
}
