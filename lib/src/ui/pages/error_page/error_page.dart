import 'package:flutter/material.dart';
import 'package:notes_app/src/exports.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Страница не найдена'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Ошибка 404',
          style: AppStyle.fontStyle.copyWith(
            color: Colors.brown,
            fontSize: 26,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
