import 'package:flutter/material.dart';
import 'package:streaks_app/main.dart';
import 'package:streaks_app/models/streak_model.dart';

class DaysToCard extends StatelessWidget {
  final Streak streak;
  const DaysToCard({super.key, required this.streak});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth! * 0.5,
      height: screenWidth! * 0.5,
      child: Card(
        color: Colors.blue,
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(DateTime.now().difference(streak.startDate ?? streak.endDate ?? DateTime.now()).inDays.abs().toString(), style: TextStyle(
                color: Colors.black,
                fontSize: 80,
              ),),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Day${DateTime.now().difference(streak.startDate ?? streak.endDate ?? DateTime.now()).inDays == 1 ? '' : 's'} ${DateTime.now().difference(streak.startDate ?? streak.endDate ?? DateTime.now()).inDays > 0 ? 'since' : 'to'} ${streak.name}', style: TextStyle(
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
