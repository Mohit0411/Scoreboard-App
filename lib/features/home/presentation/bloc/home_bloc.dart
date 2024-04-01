import 'package:scoreboard_app/core/index.dart';
import 'package:scoreboard_app/features/home/presentation/bloc/index.dart';
import 'package:scoreboard_app/shared/index.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(
          HomeState(
              0,
              ScoreboardManager.instance.getRunsList(),
              ScoreboardManager.instance.getWicketsList(),
              ScoreboardManager.instance.getExtrasList()),
        ) {
    on<AttributeSelectedEvent>((event, emit) {
      if (state.selectedTabIndex == 0) {
        ScoreboardManager.instance.getRunsList().forEach((options) {
          if (options.optionsData.containsKey(event.attributeName)) {
            options.optionsData.update(event.attributeName, (value) {
              return OptionsData(
                  value: value.value, isSelected: event.isSelected);
            });
          }
        });
      } else if (state.selectedTabIndex == 1) {
        ScoreboardManager.instance.getWicketsList().forEach((options) {
          if (options.optionsData.containsKey(event.attributeName)) {
            options.optionsData.update(
              event.attributeName,
              (value) {
                return OptionsData(
                    value: value.value, isSelected: event.isSelected);
              },
            );
          }
        });
      } else {
        ScoreboardManager.instance.getExtrasList().forEach((options) {
          if (options.optionsData.containsKey(event.attributeName)) {
            options.optionsData.update(event.attributeName, (value) {
              return OptionsData(
                  value: value.value, isSelected: event.isSelected);
            });
          }
        });
      }
      emit(
        state.getStateCopy(
          selectedAttribute: event.attributeName,
        ),
      );
    });
    on<AttributeChangeEvent>((event, emit) {
      if (state.selectedTabIndex == 0) {
        ScoreboardManager.instance.getRunsList().forEach((options) {
          if (options.optionsData.containsKey(event.attributeName)) {
            options.optionsData.update(
              event.attributeName,
              (value) =>
                  OptionsData(value: event.value, isSelected: value.isSelected),
            );
          }
        });
      } else if (state.selectedTabIndex == 1) {
        ScoreboardManager.instance.getWicketsList().forEach((options) {
          if (options.optionsData.containsKey(event.attributeName)) {
            options.optionsData.update(
              event.attributeName,
              (value) =>
                  OptionsData(value: event.value, isSelected: value.isSelected),
            );
          }
        });
      } else {
        ScoreboardManager.instance.getExtrasList().forEach((options) {
          if (options.optionsData.containsKey(event.attributeName)) {
            options.optionsData.update(
              event.attributeName,
              (value) =>
                  OptionsData(value: event.value, isSelected: value.isSelected),
            );
          }
        });
      }
      emit(
        state.getStateCopy(
          selectedAttribute: event.attributeName,
        ),
      );
    });

    on<TabChangeEvent>((event, emit) {
      emit(
        state.getStateCopy(selectedTabIndex: event.value),
      );
    });

    on<ClearAtrributesEvent>((event, emit) {
      if (state.selectedTabIndex == 0) {
        ScoreboardManager.instance.getRunsList().forEach((options) {
          for (var key in options.optionsData.keys) {
            options.optionsData.update(
              key,
              (value) => OptionsData(value: 0, isSelected: false),
            );
          }
        });
      } else if (state.selectedTabIndex == 1) {
        ScoreboardManager.instance.getWicketsList().forEach((options) {
          for (var key in options.optionsData.keys) {
            options.optionsData.update(
              key,
              (value) => OptionsData(value: 0, isSelected: false),
            );
          }
        });
      } else {
        ScoreboardManager.instance.getExtrasList().forEach((options) {
          for (var key in options.optionsData.keys) {
            options.optionsData.update(
              key,
              (value) => OptionsData(value: 0, isSelected: false),
            );
          }
        });
      }
      emit(
        state.getStateCopy(),
      );
    });
  }
}
