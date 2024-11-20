import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:card_customization/features/common/controllers/show_pop_up/show_pop_up_bloc.dart';

class CustomScreen extends StatelessWidget {
  final Widget child;

  const CustomScreen({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
      child: Stack(
        children: [
          Positioned.fill(child: child),
          BlocBuilder<ShowPopUpBloc, ShowPopUpState>(
            builder: (context, state) {
              return AnimatedPositioned(
                top: state.showPopUp
                    ? MediaQuery.of(context).padding.top + 68
                    : -(MediaQuery.of(context).padding.top + 68 + 92),
                duration: const Duration(milliseconds: 300),
                height: size.width >= 601
                    ? 88
                    : state.message.length > 28
                        ? 88
                        : 56,
                left: (MediaQuery.of(context).size.width - 360) / 4,
                right: (MediaQuery.of(context).size.width - 360) / 4,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: size.width >= 601 ? 32 : 12,
                    horizontal: 16,
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 32),
                  decoration: BoxDecoration(
                    color: statusColor(state.status).withOpacity(.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    state.message,
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  Color statusColor(PopStatus status) {
    switch (status) {
      case PopStatus.success:
        return const Color(0xff00B43C);
      case PopStatus.error:
        return const Color(0xffFA193E);
      case PopStatus.warning:
        return Colors.orange;
    }
  }
}
