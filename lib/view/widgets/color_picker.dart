import 'package:aplikacja_zaliczenie/builds/colors.dart';
import 'package:aplikacja_zaliczenie/builds/extensions.dart';
import 'package:aplikacja_zaliczenie/data/models/task.dart';
import 'package:aplikacja_zaliczenie/view/edit_task_page.dart';
import 'package:aplikacja_zaliczenie/view/widgets/color_picker_item.dart';
import 'package:flutter/material.dart';

class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.colorNotifier, this.task});

  final ValueNotifier<Color> colorNotifier;
  final Task? task;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {

  @override
  void initState() {
    super.initState();
    final color = widget.task?.color;
    if(color !=null){
      colors.toggleColor(color);
    } else{
      colors.setaAllFalse();
    }
    widget.colorNotifier.value = color ?? Colors.white;

  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: colors.entries.map((e) => GestureDetector(
        onTap: () {
          setState(() {
            colors.updateAll((key, value) {
              if (key != e.key){
                return value = false;
              }
              widget.colorNotifier.value = key;
              return value = true;
            });
          });
        },
        child: ColorPickerItem(color: e.key, isChecked: e.value))).toList(),
    );
  }
}