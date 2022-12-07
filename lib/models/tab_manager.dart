import 'package:flutter/material.dart';

// Permite al objeto proveer de notificaciones de cambio a sus listeners.
class TabManager extends ChangeNotifier {
  
  int selectedTab = 0;

  void goToTab( int index ) {
    selectedTab = index;
    // Notifica a todos los widgets escuchando este estado
    notifyListeners();
  }

  void goToRecipes() {
    selectedTab = 1;
    notifyListeners();
  }
}