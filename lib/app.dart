import 'package:card_customization/features/common/controllers/show_pop_up/show_pop_up_bloc.dart';
import 'package:card_customization/features/common/navigation/app_routs.dart';
import 'package:card_customization/features/common/view/custom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ShowPopUpBloc()),
      ],
      child: MaterialApp.router(
        title: "Card Create",
        debugShowCheckedModeBanner: false,
        builder: (context, child) => CustomScreen(
          child: child ?? const SizedBox(),
        ),
        routerConfig: AppRouts.router,
      ),
    );
  }
}

