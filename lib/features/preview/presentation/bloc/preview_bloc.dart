import 'package:scoreboard_app/core/index.dart';
import 'package:scoreboard_app/features/preview/data/index.dart';
import 'package:scoreboard_app/features/preview/presentation/bloc/index.dart';
import 'package:scoreboard_app/shared/data/index.dart';

class PreviewBloc extends BaseBloc<PreviewEvent, PreviewState> {
  PreviewBloc()
      : super(
          PreviewState(
            0,
            List.empty(),
          ),
        ) {
    on<FetchPreviewDataEvent>((event, emit) async {
      final list = List<PreviewOptions>.empty(growable: true);
      ScoreboardManager.instance.getRunsList().forEach((options) {
        options.optionsData.forEach((key, value) {
          if (value.value != 0) {
            list.add(PreviewOptions(title: key, value: value.value));
          }
        });
      });
      ScoreboardManager.instance.getWicketsList().forEach((options) {
        options.optionsData.forEach((key, value) {
          if (value.value != 0) {
            list.add(PreviewOptions(title: key, value: value.value));
          }
        });
      });
      ScoreboardManager.instance.getExtrasList().forEach((options) {
        options.optionsData.forEach((key, value) {
          if (value.value != 0) {
            list.add(PreviewOptions(title: key, value: value.value));
          }
        });
      });

      emit(state.getStateCopy(previewList: list));
    });
  }
}
