import 'package:flutter/material.dart';


class WaveClipper extends CustomClipper<Path> {
  @override
 Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0); // Move to top-left corner
    path.lineTo(0, size.height * 0.75); // Draw a line to 3/4th of height
    path.quadraticBezierTo(
      size.width * 0.5, size.height, // Control point
      size.width, size.height * 0.75, // End point
    );
    path.lineTo(size.width, 0); // Draw a line to top-right corner
    path.close(); // Close the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

