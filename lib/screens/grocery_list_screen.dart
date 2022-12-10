

import 'package:flutter/material.dart';

import '../components/grocery_tile.dart';
import '../models/models.dart';
import 'grocery_item_screen.dart';

class GroceryListScreen extends StatelessWidget {

  final GroceryManager manager;

  const GroceryListScreen({
    super.key,
    required this.manager
  });

  @override
  Widget build(BuildContext context) {

    final groceryItems = manager.groceryItems;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView.separated(
        itemCount: groceryItems.length,
        itemBuilder: (context, index) {
          final item = groceryItems[index];
          // TODO: Wrap in a Dismissable
          return InkWell(
            child: GroceryTile(
              key: Key(item.id),
              item: item,
              onComplete: (change) {
                if( change != null ) {
                  manager.completeItem(index, change);
                }
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GroceryItemScreen(
                    originalItem: item,
                    onUpdate: (item) {
                      manager.updateItem(item, index);
                      Navigator.pop(context);
                    },
                    onCreate: (item) {},
                  )
                )
              );
            },
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 16,),
      ),
    );
  }
}