import 'package:scoreboard_app/shared/index.dart';

class ScoreboardManager {
  ScoreboardManager._() {
    _runsList = List.from(Constants.runsListData);
    _wicketsList = List.from(Constants.wicketsListData);
    _extrasList = List.from(Constants.extrasListData);
  }

  static final ScoreboardManager _instance = ScoreboardManager._();

  static ScoreboardManager get instance => _instance;

  late List<ScoreboardOptions> _runsList;

  late List<ScoreboardOptions> _wicketsList;

  late List<ScoreboardOptions> _extrasList;

  List<ScoreboardOptions> getRunsList() => _runsList;

  List<ScoreboardOptions> getWicketsList() => _wicketsList;

  List<ScoreboardOptions> getExtrasList() => _extrasList;
}
