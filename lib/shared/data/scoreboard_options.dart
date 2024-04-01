import 'package:scoreboard_app/shared/index.dart';

class ScoreboardOptions {
  ScoreboardOptions({
    required this.title,
    required this.optionsData,
    required this.canShowToolTip,
    required this.maxSelectionLimit,
  });

  String title;
  int maxSelectionLimit;
  bool canShowToolTip;
    Map<String, OptionsData> optionsData;
}
