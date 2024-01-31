import 'package:hive/hive.dart';
import 'package:notes_app/domain/hive/notes_data.dart';

abstract class HiveBox {
  static final Box<NotesData> notes = Hive.box<NotesData>('notes');
}
