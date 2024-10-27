import 'package:flutter/material.dart';
import 'package:notes_app/src/exports.dart';


class AppNavigator {
  static String initRoute = AppRoutes.home;

  static Map<String, WidgetBuilder> get routes {
    return {
      AppRoutes.home: (_) => const HomePage(),
      AppRoutes.addNotes: (_) => const AddNotesPage(),
      AppRoutes.changeNotes: (_) => const ChangeNotes(),
      AppRoutes.searchNotes:(_) => const SearchNotes()
    };
  }

  static Route generate(RouteSettings settings) {
    final _settings = RouteSettings(
      name: '/404',
      arguments: settings.arguments,
    );
    return MaterialPageRoute(
      settings: _settings,
      builder: (_) => const ErrorPage(),
    );
  }
}
