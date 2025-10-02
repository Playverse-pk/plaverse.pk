import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  // --- Helper: Body Text ---
  Widget _buildTextBlock(String text, double fontSize) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          height: 1.6,
          color: Colors.black87,
        ),
      ),
    );
  }

  // --- Helper: Section Title ---
  Widget _buildSectionTitle(String title, double fontSize) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 10.0),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  // --- Helper: Link Text ---
  Widget _buildLinkText(String text, String url, double fontSize) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 5.0),
      child: SelectableText.rich(
        TextSpan(
          text: '$text: ',
          style: GoogleFonts.poppins(fontSize: fontSize, color: Colors.black),
          children: [
            TextSpan(
              text: url,
              style: GoogleFonts.poppins(
                fontSize: fontSize,
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double screenWidth = constraints.maxWidth;

        // 🔹 Responsive adjustments
        double titleSize =
            screenWidth < 600 ? 24 : screenWidth < 1000 ? 30 : 36;
        double sectionTitleSize =
            screenWidth < 600 ? 18 : screenWidth < 1000 ? 20 : 22;
        double bodyFontSize =
            screenWidth < 600 ? 14 : screenWidth < 1000 ? 15 : 16;
        double horizontalPadding =
            screenWidth < 600 ? 16 : screenWidth < 1000 ? 50 : 100;
        
        // NEW: Responsive size for the AppBar title

        return  SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // --- Main Title ---
                  Text(
                    "Playverse.pk Privacy Policy",
                    style: GoogleFonts.poppins(
                      fontSize: titleSize,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // --- Intro ---
                  _buildTextBlock(
                    'Playverse.pk provides free mobile games and will process your data when you play these games. This privacy statement explains our procedures for collecting and sharing information when users access and/or use our mobile applications. We know you care about how your personal information is used and shared, and we take your privacy seriously. Please read the following to learn more about how we use your information, what type of information and for which purposes.',
                    bodyFontSize,
                  ),

                  _buildSectionTitle(
                      'Questions Answered in the Privacy Policy:',
                      sectionTitleSize),

                  // --- Questions List ---
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextBlock(
                            '1. What Information do we collect from you?',
                            bodyFontSize),
                        _buildTextBlock(
                            '2. How do we use information & Information security?',
                            bodyFontSize),
                        _buildTextBlock(
                            '3. How do we share and disclose your information?',
                            bodyFontSize),
                        _buildTextBlock(
                            '4. Which third parties are involved?', bodyFontSize),
                        _buildTextBlock(
                            '5. What is our policy regarding children?',
                            bodyFontSize),
                        _buildTextBlock(
                            '6. What advertising means are involved?',
                            bodyFontSize),
                        _buildTextBlock(
                            '7. How do we ensure your security?', bodyFontSize),
                        _buildTextBlock(
                            '8. How do we proceed with our store purchases?',
                            bodyFontSize),
                        _buildTextBlock(
                            '9. Is data transferred internationally?',
                            bodyFontSize),
                        _buildTextBlock('10. How is data retained?',
                            bodyFontSize),
                      ],
                    ),
                  ),

                  // --- Sections (Example few, rest same style) ---
                  _buildSectionTitle(
                      'Collection and use of data in Mobile Apps',
                      sectionTitleSize),
                  Text(
                    'Personally identifiable information:',
                    style: GoogleFonts.poppins(
                      fontSize: sectionTitleSize - 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  _buildTextBlock(
                    'We don’t collect or record your email address or personal information. Our primary goal is to provide and improve features...',
                    bodyFontSize,
                  ),

                  Text(
                    'Non-Personally identifiable information:',
                    style: GoogleFonts.poppins(
                      fontSize: sectionTitleSize - 2,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  _buildTextBlock(
                    'Collection and use of data is also relied on by third parties...',
                    bodyFontSize,
                  ),

                  _buildSectionTitle('Analytics', sectionTitleSize),
                  _buildTextBlock(
                    'We use Unity Analytics to automatically receive and store certain types of information...',
                    bodyFontSize,
                  ),
                  _buildLinkText('Unity Analytics Policy',
                      'https://unity3d.com/legal/privacy-policy', bodyFontSize),
                      
                  // Consent Management & CMP/ GDPR
                  _buildSectionTitle('Consent Management & CMP/ GDPR', sectionTitleSize),
                  _buildTextBlock(
                    'Consent is to provide a better gaming experience to user based on personalized advertising / content with audience reach and services development.',
                    bodyFontSize,
                  ),

                  // Advertising
                  _buildSectionTitle('Advertising', sectionTitleSize),
                  _buildTextBlock(
                    'We also accept advertisements from **third party ad networks** as mentioned before. These advertisements may be displayed in our games/apps. We select ad networks attentively to maintain compliance with applicable privacy laws. Advertisers may use cookies and other web-tracking technologies to collect non-personal information about your device and/or personally identifiable information (as described in collection and use of data in Mobile apps/games), in case the user clicks on any of these advertisements. Furthermore, we may advertise our other apps/games within our apps/games or other promotions. You can read about our advertising partners\' privacy policies here.',
                    bodyFontSize,
                  ),
                  _buildLinkText('Audience Network',
                      'https://developers.facebook.com/docs/audience-network/policy/',
                      bodyFontSize),
                  _buildLinkText('Admob', 'https://www.google.com/policies/privacy',
                      bodyFontSize),
                  _buildLinkText('Unity Ads', 'https://unity3d.com/legal/privacy-policy',
                      bodyFontSize),
                  _buildLinkText('Applovin', 'https://www.applovin.com/privacy/',
                      bodyFontSize),
                  _buildLinkText('BidMachine',
                      'https://bidmachine.io/privacy-policy/ and https://bidmachine.io/ccpa-privacy-policy/',
                      bodyFontSize),
                  _buildLinkText('Digital Turbine (Fyber)',
                      'https://www.digitalturbine.com/privacy-policy/',
                      bodyFontSize),
                  _buildLinkText('Google (AdMob)',
                      'https://policies.google.com/privacy?hl=en-US',
                      bodyFontSize),
                  _buildLinkText('InMobi', 'https://www.inmobi.com/privacy-policy',
                      bodyFontSize),
                  _buildLinkText('Ironsource',
                      'https://developers.ironsrc.com/ironsource-mobile/air/ironsource-mobile-privacy-policy/',
                      bodyFontSize),
                  _buildLinkText('Meta', 'https://www.facebook.com/privacy/policy/',
                      bodyFontSize),
                  _buildLinkText('Unity', 'https://unity3d.com/legal/privacy-policy',
                      bodyFontSize),
                  _buildLinkText('Vungle', 'https://vungle.com/privacy/', bodyFontSize),
                  _buildLinkText('Mintegral', 'https://www.mintegral.com/en/privacy/',
                      bodyFontSize),

                  // User Acquisition
                  _buildSectionTitle('User Acquisition', sectionTitleSize),
                  _buildLinkText('Google',
                      'https://support.google.com/adspolicy/answer/54817?hl=en',
                      bodyFontSize),

                  // Security
                  _buildSectionTitle('Security', sectionTitleSize),
                  _buildTextBlock(
                    'To save your confidentiality and security of your information, we use device applications industry technologies and standards to protect but not limited to **firewalls**. We usually encrypt transmissions and data of your information, but unfortunately no data encryptions on the internet can be safe, we cannot guarantee the security of your information transmitted while we strive to protect your information. You will use these services at your own risk.',
                    bodyFontSize,
                  ),

                  // Stores
                  _buildSectionTitle('Stores', sectionTitleSize),
                  _buildTextBlock(
                    'If you purchase our game or do an In-app like remove ads, power ups, you may be asked to enter credit card or payment methods which will require your personal information. But all information you provide is secure because all transactions are handled securely through the app stores and your credit card information is not seen by us. Play store use fully secure technology standards to protect you. As clearly defined by google payment corp GPC. Please visit Google Payment Privacy notice link below for more details.',
                    bodyFontSize,
                  ),
                  _buildLinkText('Google Payment Privacy notice',
                      'https://payments.google.com/payments/apis-secure/get_legal_document?ldo=0&ldt=privacynotice',
                      bodyFontSize),

                  // In apps & Subscription
                  _buildSectionTitle('In apps & Subscription', sectionTitleSize),
                  _buildTextBlock(
                    'You may be able to buy and/or otherwise obtain things in-game enhancements or virtual currencies and there are some additional legal rules for them. They do not have any “real world” monetary value and you cannot buy, sell or trade these with other users.',
                    bodyFontSize,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextBlock('• **No trial duration** for any subscription.',
                            bodyFontSize),
                        _buildTextBlock(
                            '• **Auto- Renewal** will be on the same date of purchase or subscription.',
                            bodyFontSize),
                        _buildTextBlock('• Subscriber will be charged on a **weekly basis**.',
                            bodyFontSize),
                        _buildTextBlock('• Users can **cancel subscriptions** at any time.',
                            bodyFontSize),
                        _buildTextBlock('• User can **re-subscribe** at any time',
                            bodyFontSize),
                      ],
                    ),
                  ),

                  // Manage Control
                  _buildSectionTitle('Manage Control', sectionTitleSize),
                  _buildTextBlock(
                    'You can always control your information and confidentiality to share with us on our services. So, if you want that advertisers don’t show you contextual ads that are according to your preference you can manage the option in app **Consent Screen**. The Consent Screen comes when you first play the game and in settings or the main menu of the game. According to the Digital Advertising Alliance DAA, European Interactive Digital Advertising Alliance EDAA and Network Advertising Initiative NAI offers individuals to manage the certain advertisements all right reserved for end users.',
                    bodyFontSize,
                  ),

                  // Information related to children
                  _buildSectionTitle('Information related to children', sectionTitleSize),
                  _buildTextBlock(
                    'Information related to children policy appointment is to provide the legal guardian of a child under the age of 13 with guidance regarding our privacy policies that concern collecting, using and disclosing personal information of children under 13. Parents and legal guardians of children under 13 have certain rights under **Children\'s Online Privacy Protection Act of 1998 (COPPA)**, and we recognize those rights. We do not knowingly and directly collect and store any personal information from children under the age 13. Some information may be collected by third party providers of services (advertising networks, etc.).',
                    bodyFontSize,
                  ),

                  // International Transfer
                  _buildSectionTitle('International Transfer', sectionTitleSize),
                  _buildTextBlock(
                    'All personal information collected may be stored anywhere in the world, including, but not limited to, in the cloud, on our servers, on the servers of our affiliates or the servers of our service providers. When we transfer your personal information internationally, we will take reasonable steps to ensure that it is treated securely, lawfully and in the manner we describe here. By providing information, you consent to the storage of your personal information in these locations. If you are using our services from the European Union or other regions with laws governing data collection and use, please note that you are agreeing to the transfer of your information to **Turkey and the United States** and to processing of your data globally. By choosing to visit the site, utilize the services or otherwise provide information to us, you agree that any dispute over privacy or the terms contained in this Privacy Policy will be governed by the laws and the adjudication of any disputes arising in connection or the site will be in accordance with the Terms and Services.',
                    bodyFontSize,
                  ),

                  // Data Retention
                  _buildSectionTitle('Data Retention', sectionTitleSize),
                  _buildTextBlock(
                    'We employ reasonable security measures to protect your information from being accessed by unauthorized persons, against unlawful processing, accidental loss, destruction and damage. We will retain your information for the duration of your membership of the games and/or whilst you continue to have access to the games and for a reasonable period thereafter or as long as the law requires or permits. Your personal information will be stored unless you explicitly send us a request to delete your account and to erase your personal data via email or support function in the game. Once you send us a request, we will proceed to delete your personal data as soon as technically possible. The average time of processing an account and personal data deletion request can take up to one month.',
                    bodyFontSize,
                  ),
                  _buildTextBlock(
                    'The personal data can be stored and processed after this moment for archiving purposes, scientific or historical research purposes or statistical purposes. We will process the personal data which is needed to comply with the requirements of applicable laws (e.g. tax and accounting requirements) or for our detection, investigation and prevention of cheating in the game and EULA violations. Also, we can process anonymous information for purposes, specified in this privacy policy, after you request to give up game usage or request us to delete your personal data.',
                    bodyFontSize,
                  ),

                  // Third Party Links
                  _buildSectionTitle('Third Party', sectionTitleSize),
                  _buildTextBlock(
                    'The games may contain links to websites and microsites that are operated by third parties. If you click such links, you can be transferred to those websites and microsites. We do not control those websites and microsites and this privacy policy does not apply to them. Please consult the terms and conditions and privacy policies of those third-party websites and microsites to find out how they collect and use your personal data and to establish whether and for what purpose they use cookies.',
                    bodyFontSize,
                  ),

                  // Changes to the Privacy Policy
                  _buildSectionTitle('Changes to the Privacy Policy', sectionTitleSize),
                  _buildTextBlock(
                    'We may update this privacy statement to reflect changes in our information practices. We encourage you to periodically review this page for the latest information on our privacy practices for your better data and information protection and improved user service.',
                    bodyFontSize,
                  ),

                  const SizedBox(height: 40),

                  // --- Contact ---
                  Text(
                    'Thank you for playing with us! For further information contact us at support@playverse.pk',
                    style: GoogleFonts.poppins(
                      fontSize: bodyFontSize + 2,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              )
            ),
        );
      },
    );
  }
}
