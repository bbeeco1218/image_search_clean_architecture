import 'package:flutter/material.dart';

class PhotoFailView extends StatelessWidget {
  const PhotoFailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('이미지 불러오기 실패'),
    );
  }
}
