import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/domain/providers/notes_provider.dart';
import 'package:notes_app/generated/locale_keys.g.dart';
import 'package:notes_app/ui/components/text_form_field_widget.dart';
import 'package:notes_app/ui/theme/app_colors.dart';
import 'package:notes_app/ui/theme/app_style.dart';
import 'package:provider/provider.dart';

class ChangeNotes extends StatelessWidget {
  const ChangeNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'Изменить заметку',
          style: AppStyle.fontStyle,
        ),
        centerTitle: true,
      ),
      body: const ChangeNotesBody(),
    );
  }
}

class ChangeNotesBody extends StatelessWidget {
  const ChangeNotesBody({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    final arg = ModalRoute.of(context)?.settings.arguments;
    final int index = arg is int ? arg : 0;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextFormFieldWidget(
            labelText: LocaleKeys.title.tr(),
            hintText: LocaleKeys.title.tr(),
            textEditingController: model.titleController,
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(
            labelText: LocaleKeys.note.tr(),
            hintText: LocaleKeys.note.tr(),
            textEditingController: model.textController,
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              onPressed: () {
                model.changeNote(context, index);
              },
              child: Text(
                LocaleKeys.change.tr(),
                style: AppStyle.fontStyle.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.purpleColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
