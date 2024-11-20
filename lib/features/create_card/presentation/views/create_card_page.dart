import 'package:card_customization/features/common/controllers/show_pop_up/show_pop_up_bloc.dart';
import 'package:card_customization/features/common/utils/space.dart';
import 'package:card_customization/features/common/utils/state_status.dart';
import 'package:card_customization/features/common/widgets/w_button.dart';
import 'package:card_customization/features/create_card/presentation/controller/bloc/create_card_bloc.dart';
import 'package:card_customization/features/create_card/presentation/controller/create_card_controller.dart';
import 'package:card_customization/features/create_card/presentation/widgets/w_create_card.dart';
import 'package:card_customization/features/create_card/presentation/widgets/w_select_color.dart';
import 'package:card_customization/features/create_card/presentation/widgets/w_select_gradient.dart';
import 'package:card_customization/features/create_card/presentation/widgets/w_select_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CreateCardPage extends StatefulWidget {
  const CreateCardPage({super.key});

  @override
  State<CreateCardPage> createState() => _CreateCardPageState();
}

class _CreateCardPageState extends State<CreateCardPage> {
  final CreateCardController controller = CreateCardController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateCardBloc(),
      child: BlocBuilder<CreateCardBloc, CreateCardState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xffFFFFFF),
            appBar: AppBar(
              title: const Text(
                "To'lov kartasini yaratish",
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WCreateCard(
                    color: state.cardColor,
                    image: state.cardImage,
                    gradientColors: state.gradientColors,
                    blur: state.blur,
                  ),
                  verticalSpace(16),
                  const Text(
                    "Fon uchun rasm tanlang",
                    style: TextStyle(fontSize: 16),
                  ),
                  verticalSpace(8),
                  WSelectImage(
                    controller: controller,
                    image: state.cardImage,
                  ),
                  verticalSpace(16),
                  const Text(
                    "Fon uchun rang tanlang",
                    style: TextStyle(fontSize: 16),
                  ),
                  verticalSpace(8),
                  WSelectColor(
                    controller: controller,
                    color: state.cardColor,
                  ),
                  verticalSpace(16),
                  const Text(
                    "Fon uchun Gradient tanlang",
                    style: TextStyle(fontSize: 16),
                  ),
                  verticalSpace(8),
                  WSelectGradient(
                    controller: controller,
                    gradientColors: state.gradientColors,
                  ),
                  verticalSpace(16),
                  const Text(
                    "Fon uchun Blur tanlang",
                    style: TextStyle(fontSize: 16),
                  ),
                  verticalSpace(8),
                  Slider(
                    value: state.blur,
                    activeColor: const Color(0xff1A79FF),
                    min: 0.0,
                    max: 10.0,
                    divisions: 20,
                    onChanged: (value) {
                      context.read<CreateCardBloc>().add(UpdateBlurEvent(blur: value));
                    },
                  ),
                ],
              ),
            ),
            bottomNavigationBar: WButton(
              margin: const EdgeInsets.all(16),
              isLoading: state.status == FormStateStatus.loading,
              onTap: () {
                context.read<CreateCardBloc>().add(SaveCreateCardEvent(
                    onSuccess: () {
                      context.read<ShowPopUpBloc>().add(ShowPopUp(message: 'Karta muvaffaqiyatli saqlandi', status: PopStatus.success));
                      context.pop('pop');
                    },
                    onError: () {
                      context.read<ShowPopUpBloc>().add(ShowPopUp(message: "Saqlashda muomo chiqdi. Keyinroq urinib ko'ring", status: PopStatus.error));
                    }
                ));
              },
              text: 'Saqlash',
            ),
          );
        },
      ),
    );
  }
}
