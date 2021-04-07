import 'package:flutter/material.dart';
import 'notifier.dart';
import 'package:provider/provider.dart';

class NoteEntryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final noteNotenotifier = Provider.of<NoteNotifier>(context);
    final priority = ValueNotifier(0);
    final titleController = TextEditingController();
    final bodyController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('New Note'),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.greenAccent, width: 25.0),
                  ),
                  labelText: 'Title'),
              controller: titleController,
            ),
            SizedBox(
              height: 20,
            ),
            DropdownButtonFormField<int>(
              value: priority.value,
              icon: Text('Priority'),
              items: List.generate(
                3,
                (index) => DropdownMenuItem(
                  value: index,
                  child: Text(index.toString()),
                ),
              ),
              onChanged: (value) => priority.value = value,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: 'Taking note of...'),
              controller: bodyController,
              maxLines: null,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final note = Note(
            body: bodyController.text,
            title: titleController.text,
            priority: priority.value,
            date: DateTime.now(),
          );
          noteNotenotifier.addNote(note);
          //notes.add(note);
          // print(notes)
          Navigator.of(context).pop();

          print(note.toString());
        },
        child: Icon(Icons.thumb_up_alt),
      ),
    );
  }
}
