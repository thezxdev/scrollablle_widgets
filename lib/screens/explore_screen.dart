import 'package:flutter/material.dart';

import '../api/mock_fooderlich_service.dart';
import '../models/explore_data.dart';

class ExploreScreen extends StatelessWidget {

  final mockService = MockFooderlichService();

  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if( snapshot.connectionState == ConnectionState.done ) {
          final recipes = snapshot.data?.todayRecipes ?? [];
          return const  Center(
            child: Text('Show TodayRecipeListView'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }
}