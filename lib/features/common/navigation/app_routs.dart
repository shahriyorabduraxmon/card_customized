import 'package:card_customization/features/create_card/presentation/views/create_card_page.dart';
import 'package:card_customization/features/main/presentation/controller/bloc/card_bloc.dart';
import 'package:card_customization/features/main/presentation/views/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:card_customization/features/common/navigation/custom_transition_page.dart';
import 'package:card_customization/features/common/navigation/routs_contact.dart';
import 'package:card_customization/features/common/view/error_screen.dart';

sealed class AppRouts {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/main',
    errorBuilder: (context, state) => ErrorScreen(error: state.error?.message ?? ''),
    routes: [
      GoRoute(
        name: RoutsContact.main,
        path: '/main',
        pageBuilder: (context, state) => customTransitionPage(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => CardBloc(),
            child: const MainView(),
          ),
        ),
      ),
      GoRoute(
        name: RoutsContact.createCard,
        path: '/create_card',
        pageBuilder: (context, state) => customTransitionPage(
          context: context,
          state: state,
          child: const CreateCardPage(),
        ),
      ),
    ],
  );
}
