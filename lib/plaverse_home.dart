import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:playverse/career_card.dart';
// import 'package:playverse/footer.dart'; // Handled by ShellRoute
import 'package:playverse/game_card.dart';
// import 'package:playverse/playverse_app_bar.dart'; // Handled by ShellRoute


class PlayverseHome extends StatelessWidget {
const PlayverseHome({super.key});

@override
Widget build(BuildContext context) {
 // FIX: Wrap the Column in a SingleChildScrollView to prevent the overflow 
 // caused by the content size (especially the height-constrained Hero section)
 // exceeding the available screen space.
 return SingleChildScrollView(
   child: Column(
    children: [
    // 🔹 Hero Section
      // NOTE: Keeping the Builder here is still important to correctly calculate 
      // the height based on the available screen size (MediaQuery).
   Builder(
       builder: (BuildContext innerContext) {
        return Container(
         // Sets the height to 86% of the screen height
         height: MediaQuery.of(innerContext).size.height * 0.86, 
         width: double.infinity,
         decoration: const BoxDecoration(
          image: DecorationImage(
           alignment: Alignment.center,
           image: AssetImage("assets/main.png"),
           fit: BoxFit.cover,
          ),
         ),
        );
       },
      ),
   
   const SizedBox(height: 50),
    
   // 🔹 About Us Section
   Column(
    children: [
    Text(
     'About Us',
     style: GoogleFonts.poppins(
     fontSize: 40,
     fontWeight: FontWeight.w700,
     color: Colors.purple,
     ),
    ),
    const SizedBox(height: 20),
    
    Padding(
     padding: const EdgeInsets.symmetric(horizontal: 100),
     child: Column(
     children: [
      Text(
      "Based in Pakistan, Playverse.pk is dedicated to shaping the future of gaming by creating genre-defining games played by millions worldwide.",
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
       fontSize: 20,
       height: 1.6,
       color: Colors.black87,
      ),
      ),
      const SizedBox(height: 20),
      Text(
      "At Playverse.pk, we believe in passionate people who embody personal growth and take full ownership of their responsibilities. Our team collaboratively builds an environment where every member contributes to our shared success.",
      textAlign: TextAlign.center,
      style: GoogleFonts.poppins(
       fontSize: 20,
       height: 1.6,
       color: Colors.black87,
      ),
      ),
     ],
     ),
    ),
    
    const SizedBox(height: 20),
    
    // Skyline Divider
    Image.asset("assets/skyline1.png", fit: BoxFit.cover, width: double.infinity,),
    ],
   ),
    
   const SizedBox(height: 30),
    
   // 🔹 Our Games Section
   Column(
    children: [
    Text(
     'Our Games',
     style: GoogleFonts.poppins(
     fontSize: 40,
     fontWeight: FontWeight.w700,
     color: Colors.purple,
     ),
    ),
    const SizedBox(height: 30),
    
    Padding(
     padding: const EdgeInsets.symmetric(horizontal: 80),
     child: Column(
     children: [
      GameCard.buildGameCard(
      context,
      "Paint It: Hex Color Sort",
      "assets/game1.png",
      "Dive into the Enchanted Realm of Magic Sort: A Mystical\nSorting Adventure!",
      ),
     ],
     ),
    ),
    ],
   ),
    
   const SizedBox(height: 50),
    CareerCard.buildCareersCard(context, 'Blogs', 'Your chance to stay ahead in the fast-evolving gaming industry is here!',"assets/career.png" ), 
   ],
    ),
 );
}
}
