import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavItem extends StatefulWidget {
  final String title;
  final VoidCallback? onTap;

  const NavItem({super.key, required this.title, this.onTap, required bool isCurrent});

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.title,
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                height: 1.6
              ),
            ),
            const SizedBox(height: 1),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              height: 2,
              width: _isHovered ? 60 : 0, // 👈 expands on hover
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
