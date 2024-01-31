import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/domain/providers/notes_provider.dart';
import 'package:notes_app/generated/locale_keys.g.dart';
import 'package:notes_app/ui/app_navigator/app_routes.dart';
import 'package:notes_app/ui/theme/app_colors.dart';
import 'package:notes_app/ui/theme/app_style.dart';
import 'package:provider/provider.dart';

class DialogWindowWidget extends StatelessWidget {
  const DialogWindowWidget({
    super.key,
    required this.index,
    required this.title,
    required this.text,
  });

  final int index;
  final String title, text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: AppStyle.fontStyle.copyWith(
              fontSize: 14,
              color: AppColors.textGrey,
            ),
          ),
          TextButton.icon(
            style: TextButton.styleFrom(
              backgroundColor: AppColors.lightPurpleColor,
            ),
            onPressed: () {
              Navigator.popAndPushNamed(context, AppRoutes.changeNotes,
                  arguments: index);
            },
            icon: const Icon(
              Icons.edit,
              color: AppColors.purpleColor,
            ),
            label: Text(
              LocaleKeys.edit.tr(),
              style: AppStyle.fontStyle.copyWith(
                fontSize: 16,
                color: AppColors.purpleColor,
              ),
            ),
          ),
          DeleteNoteWidget(index: index),
        ],
      ),
    );
  }
}

class DeleteNoteWidget extends StatelessWidget {
  const DeleteNoteWidget({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return TextButton.icon(
      style: TextButton.styleFrom(
        backgroundColor: AppColors.lightRedColor,
      ),
      onPressed: () {
        // Provider.of<NotesProvider>(context, listen: false)
        //     .deleteNote(context, index);
        model.deleteNote(context, index);
      },
      icon: const Icon(
        Icons.backspace,
        color: AppColors.redColor,
      ),
      label: Text(
        LocaleKeys.delete.tr(),
        style: AppStyle.fontStyle.copyWith(
          fontSize: 16,
          color: AppColors.redColor,
        ),
      ),
    );
  }
}
