import 'dart:io';
import 'dart:ui';
import 'package:card_customization/features/create_card/presentation/controller/bloc/create_card_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WCreateCard extends StatelessWidget {
  const WCreateCard({
    super.key,
    required this.color,
    required this.image,
    required this.gradientColors,
    required this.blur,
  });

  final String color;
  final String image;
  final List<String> gradientColors;
  final double blur;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: InteractiveViewer(
        scaleEnabled: true,
        panEnabled: true,
        minScale: 0.5,
        maxScale: 3.0,
        onInteractionUpdate: (details) {
          context.read<CreateCardBloc>().add(UpdateCardImageTransformEvent(
            scale: details.scale,
            xOffset: details.localFocalPoint.dx,
            yOffset: details.localFocalPoint.dy,
          ));
        },
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
      ),
    );
  }
}
