import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabBarVehicle extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  const TabBarVehicle({
    required this.text,
    required this.isSelected,
    required this.onTap,
   
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: isSelected ? Colors.black : Color.fromRGBO(227, 227, 227, 1),
            borderRadius: BorderRadius.circular(5)),
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
        child: Text(
          text,
          style: GoogleFonts.roboto( color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,fontSize: 12)
        ),
      ),
    );
  }
}
