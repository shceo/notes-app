import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'notes_data.g.dart';


//flutter packages pub run build_runner build --delete-conflicting-outputs

@HiveType(typeId: 0)
class NotesData {
  @HiveField(0)
  String title;

  @HiveField(1)
  String text;

  @HiveField(2)
  late String date;

  NotesData({required this.title, required this.text}) {
    final DateTime dateTime = DateTime.now();
    date = DateFormat('dd.MM.yyyy').format(dateTime);
  }
}
