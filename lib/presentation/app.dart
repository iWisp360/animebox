import 'package:animebox/presentation/home.dart';
import 'package:animebox/widgets/themes.dart';
import 'package:flutter/material.dart';

class AnimeBoxApp extends StatelessWidget {
  const AnimeBoxApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Anime Box",
      debugShowCheckedModeBanner: false,
      home: AnimeBoxHome(),
      theme: AnimeBoxThemes.defaultTheme,
      darkTheme: AnimeBoxThemes.defaultThemeDark,
      themeMode: ThemeController().mode,
    );
  }
}
