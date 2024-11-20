import 'dart:io';

import 'package:card_customization/features/common/utils/space.dart';
import 'package:card_customization/features/create_card/presentation/controller/bloc/create_card_bloc.dart';
import 'package:card_customization/features/create_card/presentation/controller/create_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WSelectImage extends StatelessWidget {
  const WSelectImage({
    super.key,
    required this.controller,
    required this.image,
  });

  final CreateCardController controller;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              final File? pickedImage = await controller.pickImageFromGallery();
              if (pickedImage != null) {
                context.read<CreateCardBloc>().add(UpdatePickedImageEvent(imagePath: pickedImage.path));
              }
            },
            child: Container(
              height: 40,
              width: 60,
              decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: const Color(0xff0C1829),
                  )),
              alignment: Alignment.center,
              child: const Icon(
                Icons.add,
                size: 24,
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              scrollDirection: Axis.horizontal,
              itemCount: controller.cardImages.length,
              separatorBuilder: (context, index) {
                return horizontalSpace(8);
              },
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.read<CreateCardBloc>().add(UpdateAssetImageEvent(image: controller.cardImages[index]));
                  },
                  child: Container(
                    height: 40,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                        image: AssetImage(controller.cardImages[index]),
                        fit: BoxFit.fill,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: controller.cardImages[index] == image
                        ? const Icon(
                      Icons.done,
                      color: Color(0xff00B43C),
                    )
                        : null,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
