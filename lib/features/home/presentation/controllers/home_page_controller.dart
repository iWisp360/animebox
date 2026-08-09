import 'package:flutter/material.dart';

abstract class HomePageController {
  PreferredSizeWidget chooseAppBar();
}

class HomePageControllerImpl implements HomePageController {
  @override
  PreferredSizeWidget chooseAppBar() {
    throw UnimplementedError();
  }

  const HomePageControllerImpl();
}
