import 'package:flutter/material.dart';

class PhotoEmptyView extends StatelessWidget {
  const PhotoEmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('이미지가 없습니다.'),
    );
  }
}
