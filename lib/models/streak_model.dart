import 'package:hive/hive.dart';

part 'streak_model.g.dart';

@HiveType(typeId: 0)
class Streak {
  //name of the streak
  @HiveField(0)
  String name;

  //starting date
  @HiveField(1)
  DateTime? startDate;

  //ending date(for opposite streaks)
  @HiveField(2)
  DateTime? endDate;

  Streak ({
    required this.name,
    this.startDate,
    this.endDate
});

  // //last completed on
  // @HiveField(2)
  // DateTime? lastUpdatedDate;
  //
  // //current number of days its running for
  // @HiveField(3)
  // int currentStreak;
  //
  // //longest its run for
  // @HiveField(4)
  // int longestStreak;
  //
  // @HiveField(5)
  // String targetFrequency; // e.g., "daily", "weekly"
  //
  // //could be useful in the future for push notifications
  // @HiveField(6)
  // bool remindersEnabled;
  //
  // //time for the reminder if enabled
  // @HiveField(7)
  // DateTime? reminderTime; // Could be TimeOfDay if using Flutter's TimeOfDay type
  //
  // //additional notes if any
  // @HiveField(8)
  // String? notes;
  //
  // @HiveField(9)
  // String status; // e.g., "active", "paused", "completed"
  //
  // @HiveField(10)
  // List<String> categories; // Tags or categories
  //
  // @HiveField(11)
  // String icon; // Icon reference
  //
  // Streak({
  //   required this.name,
  //   required this.startDate,
  //   this.lastUpdatedDate,
  //   this.currentStreak = 0,
  //   this.longestStreak = 0,
  //   this.targetFrequency = "daily",
  //   this.remindersEnabled = false,
  //   this.reminderTime,
  //   this.notes = "",
  //   this.status = "active",
  //   this.categories = const [],
  //   this.icon = "",
  // });
}

Future<void> openStreakBox() async {
  await Hive.openBox<Streak>('streaks');
}
