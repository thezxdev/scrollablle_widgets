import 'dart:developer';

import 'package:flutter/material.dart';

import '../api/mock_fooderlich_service.dart';
import '../components/components.dart';
import '../components/friend_post_list_view.dart';
import '../models/explore_data.dart';

class ExploreScreen extends StatefulWidget {

  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final mockService = MockFooderlichService();

  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener( _scrollListener ); // Función a la cual escucha
    super.initState();
  }

  void _scrollListener() {
    log( _controller.offset.toString() );
    if(
      _controller.offset >= _controller.position.maxScrollExtent &&
      !_controller.position.outOfRange ) {
        log('Límite inferior');
    }
    if(
      _controller.offset <= _controller.position.minScrollExtent &&
      !_controller.position.outOfRange ) {
        log('Límite superior');
      }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: mockService.getExploreData(),
      builder: (context, AsyncSnapshot<ExploreData> snapshot) {
        if( snapshot.connectionState == ConnectionState.done ) {
          return ListView(
            scrollDirection: Axis.vertical,
            // physics: const BouncingScrollPhysics(),
            controller: _controller,
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