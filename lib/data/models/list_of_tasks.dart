import 'package:aplikacja_zaliczenie/data/models/task.dart';
import 'package:aplikacja_zaliczenie/data/models/task_priority.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
final uuid = Uuid();

var listOfTask = [
   Task(id: uuid.v4(), title: 'first task', subTitle: 'importante', color: Colors.amber, taskPriority: TaskPriority.low),
];
