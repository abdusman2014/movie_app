import 'package:flutter/material.dart';

class AppSpaceComponent extends StatelessWidget {
  const AppSpaceComponent({super.key, this.height = 10});
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(height: height);
  }
}
