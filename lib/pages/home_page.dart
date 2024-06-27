import 'package:flutter/material.dart';
import 'package:streaks_app/main.dart';
import 'package:streaks_app/pages/add_task.dart';
import 'package:streaks_app/widgets/days_to_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                DaysToCard(),
                DaysToCard(),
              ],

            ),
            Row(
              children: [
                DaysToCard(),
                DaysToCard(),
              ],

            ),
          ],
        ),
      ),
    );
  }
}
