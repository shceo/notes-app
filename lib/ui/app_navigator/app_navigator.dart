import 'package:flutter/material.dart';
import 'package:notes_app/ui/app_navigator/app_routes.dart';
import 'package:notes_app/ui/pages/add_notes_page/add_notes_page.dart';
import 'package:notes_app/ui/pages/change_notes/change_notes.dart';
import 'package:notes_app/ui/pages/error_page/error_page.dart';
import 'package:notes_app/ui/pages/home_page/home_page.dart';
import 'package:notes_app/ui/pages/search_notes/search_notes.dart';

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
