import 'package:card_customization/features/common/utils/space.dart';
import 'package:card_customization/features/create_card/presentation/controller/bloc/create_card_bloc.dart';
import 'package:card_customization/features/create_card/presentation/controller/create_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WSelectGradient extends StatelessWidget {
  const WSelectGradient({
    super.key,
    required this.controller,
    required this.gradientColors,
  });

  final CreateCardController controller;
  final List<String> gradientColors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: controller.cardColors.length,
        separatorBuilder: (context, index) {
          return horizontalSpace(8);
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              List<String> colors = [];
              if (gradientColors.isEmpty) {
                colors = [controller.cardColors[index], controller.cardColors[index]];
              } else if (gradientColors.length == 2 && gradientColors[0] == gradientColors[1]) {
                colors = [gradientColors[0], controller.cardColors[index]];
              } else {
                colors = [...gradientColors, controller.cardColors[index]];
              }
              context.read<CreateCardBloc>().add(UpdateGradientEvent(gradientColors: colors));
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Color(int.parse("0xFF${controller.cardColors[index]}")),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: const Color(0xff0C1829),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
