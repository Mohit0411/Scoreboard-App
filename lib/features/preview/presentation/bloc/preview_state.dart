

import 'package:scoreboard_app/core/index.dart';
import 'package:scoreboard_app/features/preview/data/index.dart';

class PreviewState extends BaseState {
  const PreviewState(int version,
  this.previewList,
      {bool isLoading = false,
      Map<String, String> fieldErrors = const {},
      String generalError = ''})
      : super(version, isLoading, fieldErrors, generalError);

  final List<PreviewOptions> previewList;    
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

  PreviewState getStateCopy(
          {bool? isLoading,
          String? email,
          String? password,
          List<PreviewOptions>? previewList,
          Map<String, String>? fieldErrors,
          String? generalError}) =>
      PreviewState(version + 1,
      previewList ?? this.previewList,
          isLoading: isLoading ?? false,
          fieldErrors: fieldErrors ?? {},
          generalError: generalError ?? '');

  @override
  List<Object?> includeProps() => [
        isLoading,
        fieldErrors,
        previewList,
        generalError,
      ];
}
