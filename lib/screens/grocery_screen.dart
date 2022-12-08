import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';
import 'empty_grocery_screen.dart';
import 'grocery_item_screen.dart';

class GroceryScreen extends StatelessWidget {

  const GroceryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // Regresa el GroceryManager disponible en el árbol
          final manager = Provider.of<GroceryManager>(context, listen: false);
          // Agrega una nueva ruta al stack de rutas
          Navigator.push(
            context,
            // Reemplaza la pantalla completa con una transición especifica del dispositivo
            MaterialPageRoute(
              fullscreenDialog: false,
              // Crea una nueva pantalla GroceryItemScreen 
              builder: (context) => GroceryItemScreen(
                // Define que hacer con el objeto creado
                onCreate: (item) {
                  // Agrega este objeto a la lista de objetos.
                  manager.addItem(item);
                  // Una vez que el objeto es agregado a la lista, pop() remueve la ruta de la navegación que esta más arriba, GroceryItemScreen, para mostrar la lista de grocery items.
                  Navigator.pop(context);
                },
                // Nunca va a ser llamado porque estas creando un nuevo objeto.
                onUpdate: (item) {},
              )
            )
          );
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