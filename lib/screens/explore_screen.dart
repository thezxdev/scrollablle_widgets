import 'package:flutter/material.dart';

import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';
import '../components/friend_post_list_view.dart';
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
          return ListView(
            scrollDirection: Axis.vertical,
            // physics: const BouncingScrollPhysics(),
            children: [
              TodayRecipeListView(
                recipes: snapshot.data?.todayRecipes ?? []
              ),
              const SizedBox(height: 16,),
              FriendPostListView(
                friendPosts: snapshot.data?.friendPosts ?? []
              )
            ],
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


    // return FutureBuilder(
    //   future: mockService.getExploreData(),
    //   builder: (context, AsyncSnapshot<ExploreData> snapshot) {
    //     if( snapshot.connectionState == ConnectionState.done ) {
    //       final recipes = snapshot.data?.todayRecipes ?? [];
    //       return TodayRecipeListView(
    //         recipes: recipes
    //       );
    //     } else {
    //       return const Center(
    //         child: CircularProgressIndicator(),
    //       );
    //     }
    //   }
    // );