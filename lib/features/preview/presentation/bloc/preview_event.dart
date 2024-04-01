
import 'package:scoreboard_app/core/index.dart';

abstract class PreviewEvent extends BaseEvent {}

class FetchPreviewDataEvent extends PreviewEvent{
  @override
  List<Object?> includeProps() => [];

}