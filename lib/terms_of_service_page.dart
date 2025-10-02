import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        // 🔹 Responsive adjustments based on screen width
        double headerTitleSize =
            screenWidth < 600 ? 30 : screenWidth < 1000 ? 40 : 40;
        double subtitleSize =
            screenWidth < 600 ? 16 : screenWidth < 1000 ? 18 : 20;
        double introFontSize =
            screenWidth < 600 ? 14 : screenWidth < 1000 ? 16 : 18;
        double termTitleSize =
            screenWidth < 600 ? 20 : screenWidth < 1000 ? 24 : 28;
        double bodyFontSize =
            screenWidth < 600 ? 14 : screenWidth < 1000 ? 15 : 16;
        double horizontalPadding =
            screenWidth < 600 ? 20 : screenWidth < 1000 ? 50 : 100;


        // Helper function to build a list item (for the terms sections) - now uses responsive sizes
        Widget buildTermSection(String number, String title, String content) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            // Removed SingleChildScrollView here as the main body has one.
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Section Title
                Text(
                  '$number. $title',
                  style: GoogleFonts.poppins(
                    fontSize: termTitleSize, // Responsive size
                    fontWeight: FontWeight.w700,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                // Section Content
                Text(
                  content,
                  style: GoogleFonts.poppins(
                    fontSize: bodyFontSize, // Responsive size
                    height: 1.6,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          );
        }

        return  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 🔹 Header Section
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 50.0, horizontal: horizontalPadding), // Responsive Padding
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Playverse.pk - Terms of Service Agreement',
                        style: GoogleFonts.poppins(
                          fontSize: headerTitleSize, // Responsive size
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Effective Date: December 26, 2023',
                        style: GoogleFonts.poppins(
                          fontSize: subtitleSize, // Responsive size
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Please also review Playverse.pk’ Privacy Policy which also takes effect on the same date as these Terms of Service.',
                        style: GoogleFonts.poppins(
                          fontSize: introFontSize, // Responsive size
                          color: Colors.black87,
                        ),
                      ),
                      const Divider(height: 50, color: Colors.black12),
                      
                      // 🔹 Terms Content Sections
                      buildTermSection(
                        "1", 
                        "Terms of Service for Utilization of Playverse.pk Oyun ve Yazilim Anonim Şirketi Websites and Services",
                        "Before engaging with any website (\"Site\") or mobile games/applications and services (collectively referred to as the \"Services\") provided by Playverse.pk OYUN VE YAZILIM ANONIM ŞIRKETI (\"Company\" or \"Playverse.pk\"), it is crucial that you thoroughly read and understand the following Terms of Service Agreement (\"Agreement\" or \"Terms of Service\").",
                      ),
                      buildTermSection(
                        "2", 
                        "Terms and Binding Effect",
                        "This Agreement constitutes a legally binding contract between you and Playverse.pk. By accessing the Site or any Services provided by Playverse.pk, you acknowledge your acceptance of these Terms of Service. Playverse.pk reserves the right to amend these Terms of Service at its sole discretion without prior notice. Updated terms will be posted on the Site, and it is your responsibility to review them periodically. Your continued use of the Services after any modifications to the Terms of Service constitutes acceptance of those changes.\n\nThis Agreement supersedes all prior agreements, representations, warranties, and understandings between you and Playverse.pk concerning the subject matter herein, governing your use of the Site, its content, and any products or services provided through the Site.\n\nIn the event of a breach of these Terms of Service, Playverse.pk reserves the right to take appropriate action, including the termination of your account and access to the Services.",
                      ),
                      buildTermSection(
                        "3", 
                        "Privacy",
                        "To deliver the Services effectively, Playverse.pk may require certain information from you. Your privacy is important, and we handle your information according to our Privacy Policy. Please refer to the Privacy Policy for details on how your information is collected, used, and managed, as well as the options available to you regarding your data.",
                      ),
                      buildTermSection(
                        "4", 
                        "Age of Users",
                        "Users between the ages of 13 and 18 require parental or legal guardian consent to utilize Playverse.pk' Services. Parents can provide and verify consent through the Site or an authorized third-party provider accessible through the Services. Playverse.pk advises parents to monitor their child's online activities and use of the Services closely. Parents who wish to revoke previously provided consent for their child's access to the Services should take appropriate action to disconnect from our Services.\n\nPlayverse.pk disclaims responsibility for any activities conducted by individuals under the age of 13, with or without parental permission. By providing consent for your child to use the Services, you agree to the terms governing their usage.",
                      ),
                      buildTermSection(
                        "5", 
                        "Description of Sites and Services",
                        "Playverse.pk operates online mobile gaming services, websites, and mobile applications tailored to enhance user gaming experiences.",
                      ),
                      buildTermSection(
                        "6", 
                        "Your Obligations",
                        "By registering or using the Sites and Services, you agree to:\n\n"
                        "• Use the Services only through authorized means.\n"
                        "• Use the Services in compliance with applicable laws and regulations and in accordance with these Terms of Service.\n"
                        "• Refrain from harassing, threatening, or abusing other players.\n"
                        "• Avoid using offensive or inappropriate language.\n"
                        "• Abstain from engaging in unlawful communication or activities.\n"
                        "• Comply with requests from Playverse.pk regarding your behavior.\n"
                        "• Refrain from cheating, hacking, or disrupting the Services in any manner.\n"
                        "• Avoid transmitting viruses or malicious code.\n"
                        "• Maintain the integrity of the Services and respect other users' privacy.\n"
                        "• Utilize your own credit card for transactions within the Services.\n"
                        "• Abstain from using Playverse.pk' trademarks or intellectual property without authorization.\n\n"
                        "Playverse.pk reserves the right to suspend or terminate your access to the Services if you fail to comply with these obligations or engage in unlawful activities.",
                      ),
                      buildTermSection(
                        "7", 
                        "Payment Obligations",
                        "7.1 Virtual Items\nYou may purchase Virtual Items within the Services for your personal and non-commercial entertainment. These Virtual Items remain the property of Playverse.pk and are subject to our management and control. Playverse.pk reserves the right to revoke access to Virtual Items at any time without liability.\n\n7.2 Fees, Refunds, and Return Policy\nAll sales made through the Services are final, and refunds or exchanges are not provided unless required by law. Upon termination of your account or the Services, unused Virtual Items are forfeited without compensation.",
                      ),
                      buildTermSection(
                        "8", 
                        "Prohibited Uses",
                        "Playverse.pk prohibits certain activities on its Sites and Services, including:\n\n"
                        "• Unauthorized access to the Services.\n"
                        "• Use of the Services for illegal purposes.\n"
                        "• Modifying, reverse-engineering, or interfering with the Services.\n"
                        "• Unauthorized transfers or sales of Virtual Items.\n"
                        "• Use of third-party software to modify or interfere with the Services.\n"
                        "• Hosting or providing unauthorized access to Playverse.pk' games or mobile applications.\n\n"
                        "Violation of these prohibitions may result in the termination of your account and legal action.",
                      ),
                      buildTermSection(
                        "9", 
                        "Use of Software",
                        "9.1 User Content\nWhen using the Services, you agree to abide by applicable laws and respect the intellectual property rights of others. You are responsible for any Content you provide or transmit through the Services and must not infringe upon third-party rights.\n\n9.2 Limited License To Use The Services\nPlayverse.pk grants you a limited, non-exclusive license to access and use the Services for personal, non-commercial entertainment purposes. Any unauthorized use of the Services is strictly prohibited.\n\n9.3 Suspension and Termination of Account and Services\nPlayverse.pk reserves the right to limit, suspend, terminate, modify, or delete accounts or access to the Services if users violate these Terms of Service or engage in illegal or improper use of the Services.",
                      ),
                      buildTermSection(
                        "10", 
                        "Copyright Infringement",
                        "Playverse.pk takes copyright infringement seriously and has procedures in place to address allegations of infringement. If you believe your rights have been violated, please notify us promptly.",
                      ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 50),
                
                // 🔹 Footer (Commented out components preserved)
                // const PlaverseFooter(isTermsPage: true,isPrivacyPage: false,),
              ],
            ),
          );
      },
    );
  }
}
