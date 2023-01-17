import 'package:aplikacja_zaliczenie/data/controllers/list_notifier.dart';
import 'package:aplikacja_zaliczenie/view/edit_task_page.dart';
import 'package:flutter/material.dart';

import '../../data/models/task.dart';

class MyListTile extends StatefulWidget {
   const MyListTile({
    Key? key,
    required this.task, 
    required this.listNotifier,
  }) : super(key: key);

  final Task task;
  final ListNotifier listNotifier;

  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> {
  bool checkboxValue = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ColoredBox(
          color: widget.task.color ?? Colors.white,
          child: ListTile(
            leading: Checkbox(
              onChanged: (value) => setState((){
                      checkboxValue = value ?? false;
                    }),
              value: checkboxValue,
            ),
            title: Text(widget.task.title),
            subtitle: Text(widget.task.subTitle ?? ''),
            trailing: widget.task.taskPriority.icon,
            style: ListTileStyle.list,
            onTap:() => 
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => 
                EditTaskPage(listNotifier: widget.listNotifier, task: widget.task,))),
          ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}