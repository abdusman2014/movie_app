import 'package:flutter/material.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        //elevation: 5,
        title: Text(
          "More",
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            "More!",
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ),
    );
  }
}
