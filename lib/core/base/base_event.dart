import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class BaseEvent extends Equatable {
  const BaseEvent({this.isLoading = false});
  final bool isLoading;

  List<Object?> includeProps();

  @override
  List<Object?> get props => [includeProps(), isLoading];
}
