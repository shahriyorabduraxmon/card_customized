import 'package:card_customization/features/common/navigation/routs_contact.dart';
import 'package:card_customization/features/common/utils/space.dart';
import 'package:card_customization/features/common/utils/state_status.dart';
import 'package:card_customization/features/main/presentation/controller/bloc/card_bloc.dart';
import 'package:card_customization/features/main/presentation/widget/w_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MainView extends StatefulWidget {

  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  @override
  void didChangeDependencies() {
    context.read<CardBloc>().add(GetCardsEvent());
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: AppBar(
        title: const Text("Mening Kartalarim"),
        actions: [
          IconButton(
            onPressed: () {
              context.pushNamed(RoutsContact.createCard).then((value){
                if(value == 'pop'){
                  context.read<CardBloc>().add(GetCardsEvent());
                }
              });
            },
            icon: const Icon(Icons.add),
          ),
        ],

      ),
      body: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          if (state.status == FormStateStatus.success && state.cards.isNotEmpty) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.cards.length,
              separatorBuilder: (context, index) {
                return verticalSpace(16);
              },
              itemBuilder: (context, index) {
                return WCard(
                    color: state.cards[index].cardColor,
                    image: state.cards[index].cardImage,
                    gradientColors: state.cards[index].gradientColors,
                    blur: state.cards[index].blur,
                  scale: state.cards[index].scale,
                  xOffset: state.cards[index].xOffset,
                  yOffset: state.cards[index].yOffset,
                );
              },
            );
          } else if(state.status == FormStateStatus.loading) {
            return const Center(child: CircularProgressIndicator(
              color: Colors.blue,
            ));
          } else {
            return const Center(
              child: Text(
                  "To'lov kartalari topilmadi."
              ),
            );
          }
        },
      ),
    );
  }
}
