
import 'package:aplikacja_zaliczenie/data/models/task.dart';
import 'package:flutter/material.dart';

class ListNotifier extends ValueNotifier<List<Task>> {
  ListNotifier(super.value);

  void addTask(Task task){
    value = [...value..add(task)];
    notifyListeners();
  }

  void updateTask(String id, Task task){
    final index = value.indexWhere((element) => element.id == id);
    value = [
      ...value
      ..removeAt(index)
      ..insert(index, task)
    ];
    notifyListeners();
  }

}
