import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/src/exports.dart';


class SearchNotes extends StatefulWidget {
  const SearchNotes({super.key});

  @override
  State<SearchNotes> createState() => _SearchNotesState();
}

class _SearchNotesState extends State<SearchNotes> {
  final searchController = TextEditingController();
  final _notes = HiveBox.notes.values.toList();
  var filteredNotes = <NotesData>[];

  void _searchNotes() {
    final query = searchController.text;
    if (query.isNotEmpty) {
      filteredNotes = _notes.where((NotesData noteList) {
        return noteList.title.toLowerCase().contains(query.toLowerCase()) ||
            noteList.text.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      filteredNotes = _notes;
    }
    setState(() {});
  }

  @override
  void initState() {
    filteredNotes = _notes;
    searchController.addListener(_searchNotes);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: TextField(
          controller: searchController,
          cursorColor: AppColors.blackColor,
          style: AppStyle.fontStyle,
          decoration: InputDecoration(
            hintText: '${LocaleKeys.search.tr()}...',
            hintStyle: AppStyle.fontStyle,
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: HiveBox.notes.listenable(),
        builder: (context, Box<NotesData> box, child) {
          return ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (context, i) {
              final note = filteredNotes[i];
              return CardWidget(
                index: i,
                title: note.title,
                date: note.date,
                text: note.text,
              );
            },
            separatorBuilder: (context, i) => const SizedBox(height: 16),
            itemCount: filteredNotes.length,
          );
        },
      ),
    );
  }
}
