// import 'dart:html';

import 'package:aplikacja_zaliczenie/data/controllers/list_notifier.dart';
import 'package:aplikacja_zaliczenie/data/models/list_of_tasks.dart';
import 'package:aplikacja_zaliczenie/view/edit_task_page.dart';
import 'package:aplikacja_zaliczenie/view/widgets/my_list_tile.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
      home:  FirstWidget(),
    );
  }
}





class FirstWidget extends StatelessWidget {
   FirstWidget({Key? key}) : super(key: key);

final listNotifier = ListNotifier(listOfTask);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ValueListenableBuilder(
          valueListenable: listNotifier,
          builder: (context, value, child) {
            return ListView.builder(
              itemCount: listOfTask.length,
              itemBuilder: (context, index) => MyListTile( 
                task: listOfTask[index],
                listNotifier: listNotifier,
                ),
            );
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => EditTaskPage(listNotifier: listNotifier,))
          );
        },
      ),
    );
  }
}


