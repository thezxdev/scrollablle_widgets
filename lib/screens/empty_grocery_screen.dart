import 'package:flutter/material.dart';

class EmptyGroceryScreen extends StatelessWidget {
 
  const EmptyGroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Image.asset('assets/fooderlich_assets/empty_list.png'),
              ),
            )
            // TODO: Add empty screen title
            // TODO: Add empty screen subtitle
            // TODO: Add browser recipes button
          ],
        ),
      ),
    );
  }
}