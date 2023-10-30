import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_search_clean_architecture/presentation/home/bloc/home_screen_bloc.dart';
import 'package:image_search_clean_architecture/presentation/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Search',
      home: BlocProvider(
        create: (context) => HomeScreenBloc(),
        child: const HomeScreen(),
      ),
    );
  }
}
