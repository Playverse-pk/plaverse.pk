import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// NOTE: Assuming these imports point to your custom widgets
import 'package:playverse/footer.dart'; 
import 'package:playverse/playverse_app_bar.dart'; 

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  // Helper function to build the main body text blocks
  Widget _buildTextBlock(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          fontSize: 16,
          height: 1.6,
          color: Colors.black87,
        ),
      ),
    );
  }

  // Helper function to build section titles (like 1. What Information do we collect)
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 10.0),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black, // Changed to match your app's accent color
        ),
      ),
    );
  }

  // Helper function for URL links
  Widget _buildLinkText(String text, String url) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 5.0),
      child: SelectableText.rich(
        TextSpan(
          text: '$text: ',
          style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
          children: [
            TextSpan(
              text: url,
              style: GoogleFonts.poppins(
                fontSize: 16, 
                color: Colors.blue, 
                decoration: TextDecoration.underline
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
           
PlayverseAppBar(),
            // 🔹 Privacy Policy Content Area
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main Title
                  Text(
                    "Playverse.pk Privacy Policy",
                    style: GoogleFonts.poppins(
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Introduction
                  _buildTextBlock(
                    'Playverse.pk provides free mobile games and will process your data when you play these games. This privacy statement explains our procedures for collecting and sharing information when users access and/or use our mobile applications. We know you care about how your personal information is used and shared, and we take your privacy seriously. Please read the following to learn more about how we use your information, what type of information and for which purposes.',
                  ),

                  _buildSectionTitle('Questions Answered in the Privacy Policy:'),
                  // Questions List
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextBlock('1. What Information do we collect from you?'),
                        _buildTextBlock('2. How do we use information & Information security?'),
                        _buildTextBlock('3. How do we share and disclose your information?'),
                        _buildTextBlock('4. Which third parties are involved?'),
                        _buildTextBlock('5. What is our policy regarding children?'),
                        _buildTextBlock('6. What advertising means are involved?'),
                        _buildTextBlock('7. How do we ensure your security?'),
                        _buildTextBlock('8. How do we proceed with our store purchases?'),
                        _buildTextBlock('9. Is data transferred internationally?'),
                        _buildTextBlock('10. How is data retained?'),
                      ],
                    ),
                  ),

                  // --- Collection and use of data in Mobile Apps ---
                  _buildSectionTitle('Collection and use of data in Mobile Apps'),
                  
                  // Personally identifiable information
                  Text(
                    'Personally, identifiable information:',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildTextBlock(
                    'We don’t collect or record your email address or personal information. Our primary goal is to provide and improve features and resources, unless you send us an email or voluntarily agree to submit information to contact us (in which case your email is stored in our email servers). We recognize you specifically as a service user. We do not sell your contact details, private emails, or other information to marketers or other marketing firms. The goal to collect information from email servers is to improve customer services for our product users.',
                  ),

                  // Non-Personally identifiable information
                  Text(
                    'Non-Personally identifiable information:',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  _buildTextBlock(
                    'Collection and use of data is also relied on by third parties. The information is about you and your device such as your device locale (to provide support and to deliver targeted advertising and promotions for your better experience) and device information (type of device, your device capability, status, & operating system). IDFA android advertiser ID or other types of advertising identifier are collected for in-game activities, mobile network connection and access, internet signals strength relating to WIFI, application and device version and all similar technical data about your device which don’t include your personal information is used to personalize your experience and improve customer services.',
                  ),

                  // Analytics
                  _buildSectionTitle('Analytics'),
                  _buildTextBlock(
                    'We use **Unity Analytics** to automatically receive and store certain types of information whenever you interact with our games. It includes how often you play, how long you play for and what things you’ve unlocked. This type of data helps us to improve our gameplay for your better experience. This information is often in the multiplayers option to match your better competitor by considering your gameplay experience and how much you have an interest in the game. All of this information comes to us as raw data with no personal information attached to it.',
                  ),
                  _buildTextBlock('You can read about Unity Analytics Privacy Policy here:'),
                  _buildLinkText('Unity Analytics Privacy Policy', 'https://unity3d.com/legal/privacy-policy'),

                  // Consent Management & CMP/ GDPR
                  _buildSectionTitle('Consent Management & CMP/ GDPR'),
                  _buildTextBlock(
                    'Consent is to provide a better gaming experience to user based on personalized advertising / content with audience reach and services development.',
                  ),

                  // Advertising
                  _buildSectionTitle('Advertising'),
                  _buildTextBlock(
                    'We also accept advertisements from **third party ad networks** as mentioned before. These advertisements may be displayed in our games/apps. We select ad networks attentively to maintain compliance with applicable privacy laws. Advertisers may use cookies and other web-tracking technologies to collect non-personal information about your device and/or personally identifiable information (as described in collection and use of data in Mobile apps/games), in case the user clicks on any of these advertisements. Furthermore, we may advertise our other apps/games within our apps/games or other promotions. You can read about our advertising partners\' privacy policies here.',
                  ),
                  _buildLinkText('Audience Network', 'https://developers.facebook.com/docs/audience-network/policy/'),
                  _buildLinkText('Admob', 'https://www.google.com/policies/privacy'),
                  _buildLinkText('Unity Ads', 'https://unity3d.com/legal/privacy-policy'),
                  _buildLinkText('Applovin', 'https://www.applovin.com/privacy/'),
                  _buildLinkText('BidMachine', 'https://bidmachine.io/privacy-policy/ and https://bidmachine.io/ccpa-privacy-policy/'),
                  _buildLinkText('Digital Turbine (Fyber)', 'https://www.digitalturbine.com/privacy-policy/'),
                  _buildLinkText('Google (AdMob)', 'https://policies.google.com/privacy?hl=en-US'),
                  _buildLinkText('InMobi', 'https://www.inmobi.com/privacy-policy'),
                  _buildLinkText('Ironsource', 'https://developers.ironsrc.com/ironsource-mobile/air/ironsource-mobile-privacy-policy/'),
                  _buildLinkText('Meta', 'https://www.facebook.com/privacy/policy/'),
                  _buildLinkText('Unity', 'https://unity3d.com/legal/privacy-policy'),
                  _buildLinkText('Vungle', 'https://vungle.com/privacy/'),
                  _buildLinkText('Mintegral', 'https://www.mintegral.com/en/privacy/'),

                  // User Acquisition
                  _buildSectionTitle('User Acquisition'),
                  _buildLinkText('Google', 'https://support.google.com/adspolicy/answer/54817?hl=en'),

                  // Security
                  _buildSectionTitle('Security'),
                  _buildTextBlock(
                    'To save your confidentiality and security of your information, we use device applications industry technologies and standards to protect but not limited to **firewalls**. We usually encrypt transmissions and data of your information, but unfortunately no data encryptions on the internet can be safe, we cannot guarantee the security of your information transmitted while we strive to protect your information. You will use these services at your own risk.',
                  ),

                  // Stores
                  _buildSectionTitle('Stores'),
                  _buildTextBlock(
                    'If you purchase our game or do an In-app like remove ads, power ups, you may be asked to enter credit card or payment methods which will require your personal information. But all information you provide is secure because all transactions are handled securely through the app stores and your credit card information is not seen by us. Play store use fully secure technology standards to protect you. As clearly defined by google payment corp GPC. Please visit Google Payment Privacy notice link below for more details.',
                  ),
                  _buildLinkText('Google Payment Privacy notice', 'https://payments.google.com/payments/apis-secure/get_legal_document?ldo=0&ldt=privacynotice'),

                  // In apps & Subscription
                  _buildSectionTitle('In apps & Subscription'),
                  _buildTextBlock(
                    'You may be able to buy and/or otherwise obtain things in-game enhancements or virtual currencies and there are some additional legal rules for them. They do not have any “real world” monetary value and you cannot buy, sell or trade these with other users.',
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildTextBlock('• **No trial duration** for any subscription.'),
                        _buildTextBlock('• **Auto- Renewal** will be on the same date of purchase or subscription.'),
                        _buildTextBlock('• Subscriber will be charged on a **weekly basis**.'),
                        _buildTextBlock('• Users can **cancel subscriptions** at any time.'),
                        _buildTextBlock('• User can **re-subscribe** at any time'),
                      ],
                    ),
                  ),

                  // Manage Control
                  _buildSectionTitle('Manage Control'),
                  _buildTextBlock(
                    'You can always control your information and confidentiality to share with us on our services. So, if you want that advertisers don’t show you contextual ads that are according to your preference you can manage the option in app **Consent Screen**. The Consent Screen comes when you first play the game and in settings or the main menu of the game. According to the Digital Advertising Alliance DAA, European Interactive Digital Advertising Alliance EDAA and Network Advertising Initiative NAI offers individuals to manage the certain advertisements all right reserved for end users.',
                  ),

                  // Information related to children
                  _buildSectionTitle('Information related to children'),
                  _buildTextBlock(
                    'Information related to children policy appointment is to provide the legal guardian of a child under the age of 13 with guidance regarding our privacy policies that concern collecting, using and disclosing personal information of children under 13. Parents and legal guardians of children under 13 have certain rights under **Children\'s Online Privacy Protection Act of 1998 (COPPA)**, and we recognize those rights. We do not knowingly and directly collect and store any personal information from children under the age 13. Some information may be collected by third party providers of services (advertising networks, etc.).',
                  ),

                  // International Transfer
                  _buildSectionTitle('International Transfer'),
                  _buildTextBlock(
                    'All personal information collected may be stored anywhere in the world, including, but not limited to, in the cloud, on our servers, on the servers of our affiliates or the servers of our service providers. When we transfer your personal information internationally, we will take reasonable steps to ensure that it is treated securely, lawfully and in the manner we describe here. By providing information, you consent to the storage of your personal information in these locations. If you are using our services from the European Union or other regions with laws governing data collection and use, please note that you are agreeing to the transfer of your information to **Turkey and the United States** and to processing of your data globally. By choosing to visit the site, utilize the services or otherwise provide information to us, you agree that any dispute over privacy or the terms contained in this Privacy Policy will be governed by the laws and the adjudication of any disputes arising in connection or the site will be in accordance with the Terms and Services.',
                  ),
                  
                  // Data Retention
                  _buildSectionTitle('Data Retention'),
                  _buildTextBlock(
                    'We employ reasonable security measures to protect your information from being accessed by unauthorized persons, against unlawful processing, accidental loss, destruction and damage. We will retain your information for the duration of your membership of the games and/or whilst you continue to have access to the games and for a reasonable period thereafter or as long as the law requires or permits. Your personal information will be stored unless you explicitly send us a request to delete your account and to erase your personal data via email or support function in the game. Once you send us a request, we will proceed to delete your personal data as soon as technically possible. The average time of processing an account and personal data deletion request can take up to one month.',
                  ),
                  _buildTextBlock(
                    'The personal data can be stored and processed after this moment for archiving purposes, scientific or historical research purposes or statistical purposes. We will process the personal data which is needed to comply with the requirements of applicable laws (e.g. tax and accounting requirements) or for our detection, investigation and prevention of cheating in the game and EULA violations. Also, we can process anonymous information for purposes, specified in this privacy policy, after you request to give up game usage or request us to delete your personal data.',
                  ),

                  // Third Party Links
                  _buildSectionTitle('Third Party'),
                  _buildTextBlock(
                    'The games may contain links to websites and microsites that are operated by third parties. If you click such links, you can be transferred to those websites and microsites. We do not control those websites and microsites and this privacy policy does not apply to them. Please consult the terms and conditions and privacy policies of those third-party websites and microsites to find out how they collect and use your personal data and to establish whether and for what purpose they use cookies.',
                  ),

                  // Changes to the Privacy Policy
                  _buildSectionTitle('Changes to the Privacy Policy'),
                  _buildTextBlock(
                    'We may update this privacy statement to reflect changes in our information practices. We encourage you to periodically review this page for the latest information on our privacy practices for your better data and information protection and improved user service.',
                  ),

                  // Contact
                  const SizedBox(height: 30),
                  Text(
                    'Thank you for playing with us! For further information contact us at **support@playverse.pk**',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 50),
                ],
              ),
            ),

            // 🔹 Footer (reused)
            // Note: We use the constructor from the separate footer.dart
            PlaverseFooter(isPrivacyPage: true, isTermsPage: false,),
          ],
        ),
      ),
    );
  }
}
