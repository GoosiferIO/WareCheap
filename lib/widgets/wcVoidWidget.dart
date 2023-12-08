import 'package:flutter/material.dart';

class VoidWidget extends StatelessWidget {
  final VoidCallback onPressed;

  VoidWidget({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    onPressed();
    return Container();
  }
}
