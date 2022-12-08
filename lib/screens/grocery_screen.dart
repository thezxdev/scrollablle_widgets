import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import 'empty_grocery_screen.dart';

class GroceryScreen extends StatelessWidget {

  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // TODO: Present GroceryItemScreen
        },
      ),
      body: buildGroceryScreen(),
    );
  }
}

Widget buildGroceryScreen() {
  return Consumer<GroceryManager>(
    builder: (context, manager, child) {
      if( manager.groceryItems.isNotEmpty ) {
        // TODO: Add GroceryListScreen
        return Container();
      } else {
        return const EmptyGroceryScreen();
      }
    }
  );
}