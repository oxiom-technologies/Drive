import 'package:flutter/material.dart';

class TabBarItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const TabBarItem({
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
            color: isSelected ? Colors.white : const Color.fromRGBO(37, 51, 52, 1),
            borderRadius: BorderRadius.circular(5)),
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
