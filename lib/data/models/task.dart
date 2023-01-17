import 'dart:ui';

import 'package:aplikacja_zaliczenie/data/models/task_priority.dart';

class Task{
  const Task({
    required this.id, 
    required this.title,
    required this.taskPriority,
    this.subTitle,
    this.color,
  });

  final String id;
  final Color? color;

  final String title;
  final String? subTitle;
  final TaskPriority taskPriority;

  Task copyWith({
    String? id,
    Color? color,
    String? title,
    String? subtitle,
    TaskPriority? taskPriority,
  }) {
    return Task(
      id: id ?? this.id, 
      color: color ?? this.color,
      title: title ?? this.title, 
      subTitle: subTitle ?? this.subTitle,
      taskPriority: taskPriority ?? this.taskPriority,
    );
  }
}
