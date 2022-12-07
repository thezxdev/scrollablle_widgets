import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'fooderlich_theme.dart';
import 'home.dart';
import 'models/models.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = FooderlichTheme.dark();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: 'Fooderlich',
      // Uso de MultiProvider para escuchar múltiples Providers
      home: MultiProvider(
        providers: [
          // Crear instancia de TabManager, que escucha a los cambios de tab
          // index y notifica a sus listeners
          ChangeNotifierProvider(
            create: (context) => TabManager()
          ),
          // TODO: Add GroceryManager Provider
        ],
        child: const Home(),
      ),
    );
  }
}
