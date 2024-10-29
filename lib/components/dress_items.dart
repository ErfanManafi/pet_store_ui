import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShopItems extends StatelessWidget {
  final String name;
  final bool selected;
  final Function() onPressed;

  const ShopItems({
    super.key,
    this.selected = false,
    required this.onPressed,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color:
                selected ? Colors.white : const Color.fromARGB(255, 29, 29, 29),
            borderRadius: const BorderRadius.all(Radius.circular(14))),
        child: Center(
          child: Text(
            name,
            style: GoogleFonts.poppins(
                fontSize: 14,
                color: selected ? Colors.black : Colors.white,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
