import 'package:flutter/material.dart';
import 'package:image_search_clean_architecture/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Image Search',
      home: HomeScreen(),
    );
  }
}
