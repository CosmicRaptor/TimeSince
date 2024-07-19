import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:streaks_app/models/streak_model.dart';
import 'package:streaks_app/pages/home_page.dart';
import 'package:streaks_app/providers/task_providers.dart';

double? screenWidth;
double? screenHeight;

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(StreakAdapter());
  //openStreakBox();
  await Hive.openBox<Streak>('streaks');
  runApp( ProviderScope(
    overrides: [
      streakBoxProvider.overrideWithValue(Hive.box<Streak>('streaks')),
    ],
      child: MaterialApp(home: HomeScreen())));
}