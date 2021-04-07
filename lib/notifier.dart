import 'package:flutter/cupertino.dart';

class NoteNotifier extends ChangeNotifier {
  List<Note> currentNotes = [exampleNote, exampleNote];

  void addNote(Note note) {
    currentNotes.add(note);
    notifyListeners();
  }
}

class Note {
  final String title;
  final String body;
  final DateTime date;

  final int priority;

  Note({this.title, this.body, this.date, this.priority});

  @override
  String toString() {
    return 'Note(title: $title, body: $body, date: $date, priority: $priority)';
  }
}

final exampleNote = Note(
  title: 'Create a note app',
  body: 'body',
  date: DateTime(2020, 11, 7),
  priority: 1,
);
