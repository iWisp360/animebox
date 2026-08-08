import 'package:animebox/core/configs/presentation/controllers/config_controller.dart';
import 'package:animebox/core/injector.dart';
import 'package:flutter/material.dart';

class ConfigBuilder extends StatelessWidget {
  final ConfigController configController;
  final Widget Function(ConfigController, BuildContext) builder;

  ConfigBuilder({
    super.key,
    required this.builder,
    ConfigController? configController,
  }) : configController = configController ?? injector();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: configController,
      builder: (context, child) => builder(configController, context),
    );
  }
}
