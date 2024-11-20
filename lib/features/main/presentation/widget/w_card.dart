import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';

class WCard extends StatelessWidget {
  const WCard({
    super.key,
    required this.color,
    required this.image,
    required this.gradientColors,
    required this.blur,
    required this.scale,
    required this.xOffset,
    required this.yOffset,
  });

  final String color;
  final String image;
  final List<String> gradientColors;
  final double blur;
  final double scale;
  final double xOffset;
  final double yOffset;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: Container(
        decoration: BoxDecoration(
          color: color.isNotEmpty ? Color(int.parse("0xFF$color")).withOpacity(0.7) : null,
          borderRadius: BorderRadius.circular(8),
          gradient: gradientColors.isNotEmpty
              ? LinearGradient(
            colors: gradientColors.map((color) => Color(int.parse("0xFF$color")).withOpacity(0.7)).toList(),
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )
              : null,
          border: Border.all(color: const Color(0xFF7F92A0)),
          image: image.isNotEmpty
              ? DecorationImage(
            image: image.startsWith('/')
                ? FileImage(File(image))
                : AssetImage(image),
            fit: BoxFit.fill,
          )
              : null,
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            color: Colors.black.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
