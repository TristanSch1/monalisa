import 'package:flutter/material.dart';
import 'package:monalisa/src/artwork.dart';

class MuseumApp extends StatelessWidget {
  const MuseumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Museum',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal)
      ),
      home: const Artwork(),
    );
  }
}