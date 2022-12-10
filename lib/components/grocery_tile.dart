import 'package:flutter/material.dart';

import '../models/models.dart';



class GroceryTile extends StatelessWidget {
  
  final GroceryItem item;
  // callback que deja saber cuando el usuario activo o desactivo el checkbox
  final Function(bool?)? onComplete;
  final TextDecoration textDecoration; 

  GroceryTile({
    super.key,
    required this.item,
    this.onComplete,
  }) : textDecoration = item.isComplete
    ? TextDecoration.lineThrough
    : TextDecoration.none;

  @override
  Widget build(BuildContext context) {
    // TODO: Change this Widget
    return Container(
      height: 100,
      // TODO: Replace this color
      color: Colors.red
    );
  }

  // TODO: Add buildImportance()

  // TODO: Add buildDate()

  // TODO: Add buildCheckbox()
}