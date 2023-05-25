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
        child: Column(
          children: [
            Text(
              "data",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const Text("data"),
            
          ],
        ),
      ),
    );
  }
}
