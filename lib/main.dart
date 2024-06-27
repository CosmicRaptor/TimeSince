import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:streaks_app/models/streak_model.dart';
import 'package:streaks_app/pages/home_page.dart';

double? screenWidth;
double? screenHeight;

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(StreakAdapter());
  runApp(const ProviderScope(child: MaterialApp(home: HomeScreen())));
}