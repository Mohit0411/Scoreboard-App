import 'package:scoreboard_app/core/index.dart';
import 'package:scoreboard_app/shared/data/index.dart';

class HomeState extends BaseState {
  const HomeState(int version, this.runsList, this.wicketsList, this.extrasList,
      {bool isLoading = false,
      this.selectedAttribute = '',
      this.selectedTabIndex = 0,
      this.selectedAttributeCount = 0,
      Map<String, String> fieldErrors = const {},
      String generalError = ''})
      : super(version, isLoading, fieldErrors, generalError);

  final List<ScoreboardOptions> runsList;
  final List<ScoreboardOptions> wicketsList;
  final List<ScoreboardOptions> extrasList;
  final String selectedAttribute;
  final int selectedTabIndex;
  final int selectedAttributeCount;
  @override
  BaseState getBasicStateCopy(
          {Map<String, String>? fieldErrors,
          String? generalError,
          bool? isLoading}) =>
      getStateCopy(
        isLoading: isLoading,
        fieldErrors: fieldErrors,
        generalError: generalError,
      );

  HomeState getStateCopy(
          {bool? isLoading,
          String? email,
          String? password,
          String? selectedAttribute,
          List<ScoreboardOptions>? runsList,
          List<ScoreboardOptions>? wicketsList,
          List<ScoreboardOptions>? extrasList,
          Map<String, String>? fieldErrors,
          int? selectedAttributeCount,
          int? selectedTabIndex,
          String? generalError}) =>
      HomeState(version + 1, runsList ?? this.runsList,
          wicketsList ?? this.wicketsList, extrasList ?? this.extrasList,
          selectedTabIndex: selectedTabIndex ?? this.selectedTabIndex,
          selectedAttribute: selectedAttribute ?? this.selectedAttribute,
          selectedAttributeCount:
              selectedAttributeCount ?? this.selectedAttributeCount,
          isLoading: isLoading ?? false,
          fieldErrors: fieldErrors ?? {},
          generalError: generalError ?? '');

  @override
  List<Object?> includeProps() => [
        isLoading,
        runsList,
        fieldErrors,
        generalError,
        selectedAttribute,
        selectedTabIndex,
        selectedAttributeCount,
      ];

  int getSelectionCount() {
    var selectionCount = 0;

    for (var runs in runsList) {
      for (var data in runs.optionsData.entries) {
        if (data.value.isSelected) {
          if (data.value.value != 0) {
            selectionCount++;
          }
        }
      }
    }

    for (var wickets in wicketsList) {
      for (var data in wickets.optionsData.entries) {
        if (data.value.isSelected) {
          if (data.value.value != 0) {
            selectionCount++;
          }
        }
      }
    }

    for (var extras in extrasList) {
      for (var data in extras.optionsData.entries) {
        if (data.value.isSelected) {
          if (data.value.value != 0) {
            selectionCount++;
          }
        }
      }
    }
    return selectionCount;
  }
}
