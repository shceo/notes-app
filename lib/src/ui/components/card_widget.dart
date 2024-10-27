import 'package:flutter/material.dart';
import 'package:notes_app/src/exports.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.index,
    this.title = '',
    this.text = '',
    this.date = '',
  });

  final String title, text, date;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.4),
            blurRadius: 2,
            spreadRadius: 0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppStyle.fontStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          Text(
           date,
            style: AppStyle.fontStyle.copyWith(
              fontSize: 14,
              color: AppColors.lightGrey,
            ),
          ),
          const SizedBox(height: 9),
          Text(
           text,
            style: AppStyle.fontStyle.copyWith(
              fontSize: 14,
              color: AppColors.textGrey,
            ),
          ),
        ],
      ),
    );
  }
}
