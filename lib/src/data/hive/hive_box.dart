import 'package:hive/hive.dart';
import 'package:notes_app/src/exports.dart';

abstract class HiveBox {
  static final Box<NotesData> notes = Hive.box<NotesData>('notes');
}
