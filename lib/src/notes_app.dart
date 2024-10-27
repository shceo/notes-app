import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/src/exports.dart';
import 'package:provider/provider.dart';

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => NotesProvider(),
      child: const MaterialAppWidget(),
    );
  }
}

class MaterialAppWidget extends StatelessWidget {
  const MaterialAppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = context.watch<NotesProvider>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppNavigator.initRoute,
      routes: AppNavigator.routes,
      onGenerateRoute: AppNavigator.generate,
      theme: model.isTheme
          ? ThemeData.dark(useMaterial3: true)
          : ThemeData.light(useMaterial3: true),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
