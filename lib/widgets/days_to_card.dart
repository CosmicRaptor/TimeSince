import 'package:flutter/material.dart';
import 'package:streaks_app/main.dart';

class DaysToCard extends StatelessWidget {
  const DaysToCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth! * 0.5,
      height: screenWidth! * 0.5,
      child: const Card(
        color: Colors.blue,
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('7', style: TextStyle(
                color: Colors.black,
                fontSize: 80,
              ),),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Days since something happened', style: TextStyle(
                      color: Colors.black87
                    ),),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
