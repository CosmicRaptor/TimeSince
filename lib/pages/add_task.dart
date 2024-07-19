import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:streaks_app/main.dart';
import 'package:date_picker_plus/date_picker_plus.dart';

import '../models/streak_model.dart';
import '../providers/task_providers.dart';

class AddTask extends ConsumerStatefulWidget {
  const AddTask({super.key});

  @override
  ConsumerState<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  final nameController = TextEditingController();
  DateTime chosenTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    //final streaks = ref.watch(streakNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new task'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 15,),
              Text('Name your new task:'),
              const SizedBox(height: 10,),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  hintText: 'ex: Alcohol/Workout'
                ),
              ),
              const SizedBox(height: 25,),
              Text('Choose the date to count to/from. Could be a date in the past or in the future.'),
              const SizedBox(height: 15,),
              SizedBox(
                width: screenWidth! * 0.9,
                height: screenHeight! * 0.4,
                child: DatePicker(
                  maxDate: DateTime.now().add(const Duration(days: 365)),
                  minDate: DateTime.now().subtract(const Duration(days: 365)),
                  onDateSelected: (date){
                    chosenTime = date;
                  },
                ),
              ),
              const SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MaterialButton(onPressed: (){
                    ref.read(streakNotifierProvider.notifier).addStreak(Streak(name: nameController.text, startDate: chosenTime));
                    Navigator.of(context).pop();
                  }, color: Colors.green, elevation: 3, child: Text('Save', style: TextStyle(color: Colors.white),),),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
