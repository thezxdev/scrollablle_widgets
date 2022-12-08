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
  
  // Este controlador escucha cuando el texto cambia. Cambia el valor del texto mostrado en un campo de texto.
  final _nameController = TextEditingController();
  // Nombre del objeto
  String _name = '';
  // Nivel de importancia
  Importance _importance = Importance.low;
  // Fecha y hora actual.
  DateTime _dueDate = DateTime.now();
  // Hora actual
  TimeOfDay _timeOfDay = TimeOfDay.now();
  // La etiqueta del color
  Color _currentCOlor = Colors.green;
  // Cantidad de un objeto
  int _currentSliderValue = 0;
  
  @override
  void initState() {
    super.initState();

    final originalItem = widget.originalItem;
    // Cuando originalItem no es nulo, el usuario esta editando un objeto existente. En este caso, debes de configurar el widget para mostrar los valores del objeto.
    if( originalItem != null ) {
      _nameController.text = originalItem.name;
      _name = originalItem.name;
      _currentSliderValue = originalItem.quantity;
      _importance = originalItem.importance;
      _currentCOlor = originalItem.color;
      final date = originalItem.date;
      _timeOfDay = TimeOfDay(hour: date.hour, minute: date.minute);
      _dueDate = date;
    }

    // Agregar un listener para escuhar los cambios del campo de texto. Cuando el texto cambia, asignaras el _name
    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
  }

  // Eliminará _nameController cuando no se este utilizando
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  // TODO: Add dispose()

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


