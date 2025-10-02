import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Colors
const Color playversePurple = Color(0xFF5E35B1);
const Color playverseBgColor = Color(0xFFF9F9F9);

// --- Model ---
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

// Mock Data
final List<BlogModel> mockBlogs = [
  BlogModel(
    title: "The Future of Mobile Gaming",
    summary:
        "Exploring how 5G, AR, and cloud gaming are reshaping the mobile gaming landscape and opening doors for immersive player experiences worldwide.",
    date: "October 1, 2025",
    color: Colors.blue,
  ),
  BlogModel(
    title: "Esports and Competitive Gaming Growth",
    summary:
        "A deep dive into the rise of esports, from local tournaments to billion-dollar global championships, and what it means for players and developers.",
    date: "September 15, 2025",
    color: Colors.pink,
  ),
  BlogModel(
    title: "The Art of Game Design: Beyond Graphics",
    summary:
        "Understanding the role of storytelling, character development, and gameplay mechanics in creating unforgettable gaming experiences.",
    date: "August 28, 2025",
    color: playversePurple,
  ),
];

// --- Blog Card ---
class BlogCard extends StatelessWidget {
  final BlogModel blog;
  final double titleSize;
  final double bodySize;
  final double dateSize;
  final double imageHeight;

  const BlogCard({
    super.key,
    required this.blog,
    required this.titleSize,
    required this.bodySize,
    required this.dateSize,
    required this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Image Area
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Container(
              height: imageHeight,
              color: blog.color.withOpacity(0.85),
              child: Center(
                child: Icon(Icons.article,
                    size: imageHeight / 2.5, color: Colors.white),
              ),
            ),
          ),

          // Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  blog.title,
                  style: GoogleFonts.poppins(
                    fontSize: titleSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade900,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 6),
                Text(
                  blog.date,
                  style: GoogleFonts.poppins(
                    fontSize: dateSize,
                    color: Colors.grey.shade600,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  blog.summary,
                  style: GoogleFonts.inter(
                      fontSize: bodySize, color: Colors.grey.shade700),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton.icon(
                    onPressed: () {
                      debugPrint("Read more: ${blog.title}");
                    },
                    icon: const Icon(Icons.arrow_forward, size: 18),
                    label: Text("Read More",
                        style: GoogleFonts.inter(fontSize: bodySize)),
                    style: TextButton.styleFrom(
                      foregroundColor: blog.color,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: blog.color.withOpacity(0.4)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// --- Blog Screen ---
class BlogScreen extends StatelessWidget {
  const BlogScreen({super.key});

  static const double kDesktopBreakpoint = 1000;
  static const double kTabletBreakpoint = 650;

  Widget _buildHeader(BuildContext context, double headerSize, double subtitleSize) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Insights from Playverse.pk",
          style: GoogleFonts.poppins(
            fontSize: headerSize,
            fontWeight: FontWeight.w700,
            color: Colors.purple,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Our latest articles on game design and tech trends.",
          style: GoogleFonts.inter(
            fontSize: subtitleSize,
            color: Colors.grey.shade600,
          ),
        ),
        Divider(color: Colors.grey.shade300, thickness: 1, height: 40),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;

          // Default (Mobile)
          int crossAxisCount = 1;
          double headerSize = 26;
          double subtitleSize = 14;
          double cardTitleSize = 16;
          double cardBodySize = 13;
          double cardDateSize = 11;
          double cardImageHeight = 140;
          double aspectRatio = 0.75;
          EdgeInsets padding = const EdgeInsets.all(16);

          if (screenWidth >= kTabletBreakpoint && screenWidth < kDesktopBreakpoint) {
            // Tablet
            crossAxisCount = 2;
            headerSize = 32;
            subtitleSize = 16;
            cardTitleSize = 18;
            cardBodySize = 14;
            cardDateSize = 12;
            cardImageHeight = 160;
            aspectRatio = 0.78; // Looser ratio so text doesn’t cut off
            padding = const EdgeInsets.all(24);
          } else if (screenWidth >= kDesktopBreakpoint) {
            // Desktop
            crossAxisCount = 3;
            headerSize = 38;
            subtitleSize = 18;
            cardTitleSize = 20;
            cardBodySize = 15;
            cardDateSize = 13;
            cardImageHeight = 180;
            aspectRatio = 0.85;
            padding = const EdgeInsets.all(40);
          }

          return Container(
            color: playverseBgColor,
            child: Padding(
              padding: padding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(context, headerSize, subtitleSize),
                  const SizedBox(height: 30),

                  // Switch between List & Grid
                  crossAxisCount == 1
                      ? Column(
                          children: mockBlogs
                              .map((blog) => Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 20.0),
                                    child: BlogCard(
                                      blog: blog,
                                      titleSize: cardTitleSize,
                                      bodySize: cardBodySize,
                                      dateSize: cardDateSize,
                                      imageHeight: cardImageHeight,
                                    ),
                                  ))
                              .toList(),
                        )
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: mockBlogs.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            childAspectRatio: aspectRatio,
                          ),
                          itemBuilder: (context, index) {
                            return BlogCard(
                              blog: mockBlogs[index],
                              titleSize: cardTitleSize,
                              bodySize: cardBodySize,
                              dateSize: cardDateSize,
                              imageHeight: cardImageHeight,
                            );
                          },
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
