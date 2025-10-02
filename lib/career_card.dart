import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class CareerCard {
  /// Responsive Career Card with adaptive UI
  static Widget buildCareersCard(
      BuildContext context, String title, String description, String imgPath) {
    const String destinationRoute = '/blogs';

    return LayoutBuilder(
      builder: (context, constraints) {
        // Screen width
        final double width = constraints.maxWidth;

        // 🔹 Adaptive font sizes
        double titleSize = width > 1000
            ? 40
            : width > 700
                ? 28
                : 22;

        double descSize = width > 1000
            ? 20
            : width > 700
                ? 16
                : 14;

        double buttonFont = width > 1000
            ? 20
            : width > 700
                ? 16
                : 14;

        double paddingValue = width > 1000
            ? 40
            : width > 700
                ? 25
                : 15;

        return Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          padding: EdgeInsets.all(paddingValue),
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
          child: width > 700
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 40),

                    // 🔹 Text Section (Left Side)
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.poppins(
                              fontSize: titleSize,
                              fontWeight: FontWeight.w500,
                              color: Colors.purple,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            description,
                            style: GoogleFonts.poppins(
                              fontSize: descSize,
                              color: Colors.black,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              context.go(destinationRoute);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple,
                              padding: EdgeInsets.symmetric(
                                horizontal: paddingValue,
                                vertical: paddingValue / 2,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            child: Text(
                              'See More',
                              style: GoogleFonts.poppins(
                                fontSize: buttonFont,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 30),

                    // 🔹 Image (Right Side)
                    Expanded(
                      flex: 1,
                      child: Image.asset(
                        imgPath,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 🔹 Image (Top for small screens)
                    Image.asset(
                      imgPath,
                      fit: BoxFit.contain,
                      height: 180,
                    ),
                    const SizedBox(height: 20),

                    // 🔹 Text Section (Below Image)
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: titleSize,
                        fontWeight: FontWeight.w500,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: descSize,
                        color: Colors.black,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        context.go(destinationRoute);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        padding: EdgeInsets.symmetric(
                          horizontal: paddingValue,
                          vertical: paddingValue / 2,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: Text(
                        'See More',
                        style: GoogleFonts.poppins(
                          fontSize: buttonFont,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
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
