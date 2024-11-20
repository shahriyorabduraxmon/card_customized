import 'package:flutter/material.dart';

class AppConstantsKey {
  AppConstantsKey._();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'card_customization');
}
