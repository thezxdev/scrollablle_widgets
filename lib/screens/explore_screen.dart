import 'package:flutter/material.dart';

import '../api/mock_fooderlich_service.dart';

class ExploreScreen extends StatelessWidget {

  final mockService = MockFooderlichService();

  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Explore Screen'),
    );
  }
}