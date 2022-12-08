import 'package:flutter/material.dart';

import '../models/models.dart';

class GroceryItemScreen extends StatefulWidget {

  final Function(GroceryItem) onCreate;
  final Function(GroceryItem) onUpdate;
  final GroceryItem? originalItem;
  final bool isUpdating;

  const GroceryItemScreen({
    super.key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
  }) : isUpdating = (originalItem != null);

  @override
  State<GroceryItemScreen> createState() => _GroceryItemScreenState();
}

class _GroceryItemScreenState extends State<GroceryItemScreen> {
  // TODO: Add grocery item screen state properties
  
  @override
  Widget build(BuildContext context) {
    // TODO: Add GroceryItemScreen Scaffold
    return Container(
      color: Colors.orange,
    );

    // TODO: Add buildNameField()

    // TODO: Add buildImportanceField()

    // TODO: Add buildDateField()

    // TODO: Add buildTimeField()

    // TODO: Add buildColorPicker()

    // TODO: add buildQuantityField()
  }
}



