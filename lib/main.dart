import 'package:flutter/material.dart';
import 'package:notes/notifier.dart';
import 'package:notes/notesapp.dart';
import 'package:provider/provider.dart';
import 'notifier.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NoteNotifier(),
      child: MaterialApp(
        title: 'Flutter demo',
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
        home: NotesApp(),
      ),
    );
  }
}
