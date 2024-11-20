import 'package:card_customization/features/common/utils/space.dart';
import 'package:card_customization/features/create_card/presentation/controller/bloc/create_card_bloc.dart';
import 'package:card_customization/features/create_card/presentation/controller/create_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WSelectColor extends StatelessWidget {
  const WSelectColor({
    super.key,
    required this.controller,
    required this.color,
  });

  final CreateCardController controller;
  final String color;

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
              context.read<CreateCardBloc>().add(UpdateCardColorEvent(color: controller.cardColors[index]));
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
              child: controller.cardColors[index] == color
                  ? const Icon(
                Icons.done,
                color: Color(0xff00B43C),
              )
                  : null,
            ),
          );
        },
      ),
    );
  }
}
