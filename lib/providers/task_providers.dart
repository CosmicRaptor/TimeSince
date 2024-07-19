import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../models/streak_model.dart';

// Provider to manage the Hive box for Streaks
final streakBoxProvider = Provider<Box<Streak>>((ref) {
  throw UnimplementedError();
});

// StateNotifier for managing streaks
class StreakNotifier extends StateNotifier<List<Streak>> {
  StreakNotifier(this._box) : super(_box.values.toList());

  final Box<Streak> _box;

  void addStreak(Streak streak) {
    _box.add(streak);
    print("idhar");
    state = _box.values.toList();
  }

  void updateStreak(int index, Streak streak) {
    _box.putAt(index, streak);
    state = _box.values.toList();
  }

  void deleteStreak(int index) {
    _box.deleteAt(index);
    state = _box.values.toList();
  }
}

// Provider for StreakNotifier
final streakNotifierProvider = StateNotifierProvider<StreakNotifier, List<Streak>>((ref) {
  final box = ref.watch(streakBoxProvider);
  return StreakNotifier(box);
});
