import 'package:animebox/core/configs/presentation/controllers/config_controller.dart';
import 'package:animebox/core/configs/presentation/views/config_builder.dart';
import 'package:animebox/core/injector.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  final configController = ConfigController();
  await configController.loadFromFile();

  setupInjector();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: ConfigBuilder(
        builder: (controller, context) => Scaffold(
          body: Center(
            child: FilledButton.tonal(
              onPressed: () {
                var config = controller.current;
                config = config.copyWith(firstRun: !config.firstRun);
                controller.change(config);
              },
              child: Text("${controller.current.firstRun}"),
            ),
          ),
        ),
      ),
    );
  }
}
