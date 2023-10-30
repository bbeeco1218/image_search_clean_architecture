import 'package:flutter/material.dart';

class PhotoLoadingView extends StatelessWidget {
  const PhotoLoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
