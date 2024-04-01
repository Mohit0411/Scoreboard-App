import 'package:flutter/material.dart';
import 'package:scoreboard_app/features/home/index.dart';
import 'package:scoreboard_app/shared/index.dart';

import '../features/preview/presentation/pages/index.dart';

class Path {
  Path(this.pattern, this.builder) : regex = _buildRegex(pattern);

  Path.empty()
      : pattern = '',
        builder = null,
        regex = RegExp('');

  static final variableRegex = RegExp(r':([a-zA-Z0-9_-]+)');

  static List<Path> routes = [
    Path(RoutesConstant.homePageRoute,
    (p0, p1) => const HomePage(),),
        Path(RoutesConstant.previewPageRoute,
    (p0, p1) => const PreviewPage(),),
  ];

  final String pattern;

  final RegExp regex;

  final Widget Function(BuildContext, Map<String, String?>)? builder;

  bool get isEmpty => pattern == '' && builder == null;

  static RegExp _buildRegex(String pattern) {
    final path = cleanRouteName(pattern);
    final nameWithParameters = path.replaceAllMapped(variableRegex, (match) {
      final groupName = match.group(1);
      return '(?<$groupName>[a-zA-Z0-9_\\-.,:;+*^%\$@!]+)';
    });
    return RegExp('^$nameWithParameters\$', caseSensitive: false);
  }

  static String cleanRouteName(String name) {
    name = name.trim();
    if (name.contains('?')) {
      name = name.split('?')[0];
    }
    final parts = name.split('/');
    parts.removeWhere((value) => value == '');
    parts.map((value) {
      if (value.startsWith(':')) {
        return value;
      } else {
        return value.toLowerCase();
      }
    });
    name = parts.join('/');
    return name;
  }
}

class Routes {
  static Path findPath(String name, {RegExpMatch? match}) {
    final cleanRouteName = Path.cleanRouteName(name);
    return Path.routes.firstWhere(
      (it) => it.regex.firstMatch(cleanRouteName) != null,
      orElse: () => Path.empty(),
    );
  }

  /// The route generator callback used when the app is navigated to a named
  /// route. Set it on the [MaterialApp.onGenerateRoute] or
  /// [WidgetsApp.onGenerateRoute] to make use of the [paths] for route
  /// matching.
  static Route<Object?>? onGenerateRoute(RouteSettings settings) {
    final cleanRouteName = Path.cleanRouteName(settings.name ?? '');
    RegExpMatch? match;
    final path = Path.routes.firstWhere(
      (it) {
        match = it.regex.firstMatch(cleanRouteName);
        return match != null;
      },
      orElse: () => Path.empty(),
    );

    // If no match is found, [WidgetsApp.onUnknownRoute] handles it.
    if (path.isEmpty) return null;

    List<String> names;
    if (match != null &&
        match!.groupCount > 0 &&
        match!.groupNames.isNotEmpty) {
      names = match!.groupNames.toList();
    } else {
      names = [];
    }

    final values = <String, String?>{
      for (var name in names) name: match?.namedGroup(name)
    };

    return MaterialPageRoute<Object?>(
      builder: (context) {
        return path.builder!(context, values);
      },
      settings: settings,
    );
  }
}
