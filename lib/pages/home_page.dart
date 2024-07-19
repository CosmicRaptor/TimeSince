import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streaks_app/main.dart';
import 'package:streaks_app/pages/add_task.dart';
import 'package:streaks_app/widgets/days_to_card.dart';

import '../providers/task_providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    final streaks = ref.watch(streakNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: (){
          },
        ),
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const AddTask()));
          }, icon: Icon(Icons.add))
        ],
      ),
      body: streaks.isNotEmpty ?
      GridView.builder(gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          //childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20),
      itemCount: streaks.length,
      itemBuilder: (context, index) {
        final streak = streaks[index];
        return DaysToCard(streak: streak,);
          }
            )
      : Center(
        child: Text("Nothing"),
      )
    );
  }
}
