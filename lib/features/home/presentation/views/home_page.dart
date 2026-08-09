import 'package:animebox/core/configs/presentation/views/config_builder.dart';
import 'package:animebox/features/home/presentation/controllers/home_page_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final HomePageController homePageController;
  const HomePage({super.key, HomePageController? homePageController})
    : homePageController = homePageController ?? const HomePageControllerImpl();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ConfigBuilder(
      builder: (controller, context) =>
          Scaffold(appBar: widget.homePageController.chooseAppBar()),
    );
  }
}
