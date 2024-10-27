import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/src/exports.dart';

class NotesBody extends StatelessWidget {
  const NotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutWidget();
  }
}

class LayoutWidget extends StatelessWidget {
  const LayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HiveBox.notes.listenable(),
      builder: (context, Box<NotesData> notes, _) {
        final allNotes = notes.values.toList();
        return LayoutBuilder(
          builder: (context, constraints) {
            if (constraints.maxWidth > 425) {
              return GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 25,
                    crossAxisSpacing: 25,
                    mainAxisExtent: 150),
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints:
                            const BoxConstraints(maxHeight: 190, maxWidth: 380),
                        context: context,
                        builder: (context) {
                          return DialogWindowWidget(
                            index: i,
                            title: allNotes[i].title,
                            text: allNotes[i].text,
                          );
                        },
                      );
                    },
                    child: CardWidget(
                      index: i,
                      title: allNotes[i].title,
                      date: allNotes[i].date,
                      text: allNotes[i].text,
                    ),
                  );
                },
                itemCount: allNotes.length,
              );
            } else {
              return ListView.separated(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints:
                            const BoxConstraints(maxHeight: 190, maxWidth: 380),
                        context: context,
                        builder: (context) {
                          return DialogWindowWidget(
                            index: i,
                            title: allNotes[i].title,
                            text: allNotes[i].text,
                          );
                        },
                      );
                    },
                    child: CardWidget(
                      index: i,
                      title: allNotes[i].title,
                      date: allNotes[i].date,
                      text: allNotes[i].text,
                    ),
                  );
                },
                separatorBuilder: (context, i) => const SizedBox(height: 16),
                itemCount: allNotes.length,
              );
            }
          },
        );
      },
    );
  }
}
