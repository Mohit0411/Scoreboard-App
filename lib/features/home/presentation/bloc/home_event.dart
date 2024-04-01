import 'package:scoreboard_app/core/index.dart';

abstract class HomeEvent extends BaseEvent {}

class AttributeChangeEvent extends HomeEvent {
  AttributeChangeEvent({
    required this.attributeName,
    required this.value,
  });

  final String attributeName;
  final int value;
  @override
  List<Object?> includeProps() => [
        value,
        attributeName,
      ];
}

class AttributeSelectedEvent extends HomeEvent {
  AttributeSelectedEvent({
    required this.attributeName,
    this.isSelected = true,
  });

  final String attributeName;
  final bool isSelected;
  @override
  List<Object?> includeProps() => [
        attributeName,
        isSelected,
      ];
}

class TabChangeEvent extends HomeEvent {
  TabChangeEvent({
    required this.value,
  });

  final int value;
  @override
  List<Object?> includeProps() => [value];
}

class ClearAtrributesEvent extends HomeEvent {
  ClearAtrributesEvent();

  @override
  List<Object?> includeProps() => [];
}
