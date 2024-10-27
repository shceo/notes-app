import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/src/exports.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesProvider extends ChangeNotifier {
  NotesProvider() {
    getTheme();
  }

  //controllers
  final titleController = TextEditingController();
  final textController = TextEditingController();

  var box = HiveBox.notes;

  //add notes
  Future<void> addNotes() async {
    await box
        .add(
          NotesData(
            title: titleController.text.isNotEmpty
                ? titleController.text
                : 'Заметка',
            text: textController.text.isNotEmpty
                ? textController.text
                : 'Описание',
          ),
        )
        .then((value) => controllerClear());
  }

  Future<void> controllerClear() async {
    titleController.clear();
    textController.clear();
  }

  //удаление заметки
  Future<void> deleteNote(BuildContext context, int index) async {
    await HiveBox.notes.deleteAt(index).then(
          (value) => Navigator.pop(context),
        );
  }

  //изменение заметки
  Future<void> changeNote(BuildContext context, int index) async {
    await HiveBox.notes
        .putAt(
          index,
          NotesData(
            title: titleController.text.isNotEmpty
                ? titleController.text
                : 'Заметка',
            text: textController.text.isNotEmpty
                ? textController.text
                : 'Описание',
          ),
        )
        .then((value) => controllerClear())
        .then(
          (value) => Navigator.pop(context),
        );
  }

  bool isTheme = false;
  changeTheme(bool value) async {
    final pref = await SharedPreferences.getInstance();
    isTheme = value;
    pref.setBool('theme', isTheme);
    notifyListeners();
  }

  getTheme() async {
    final pref = await SharedPreferences.getInstance();
    isTheme = pref.getBool('theme') ?? false;
    notifyListeners();
  }

  changeLang(BuildContext context) {
    if (context.locale == const Locale('ru')) {
      context.setLocale(const Locale('en'));
    } else {
      context.setLocale(const Locale('ru'));
    }
    notifyListeners();
  }
}
