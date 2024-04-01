import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  const BaseState(
    this.version,
    this.isLoading,
    this.fieldErrors,
    this.generalError,
  );

  final int version;
  final bool isLoading;
  final Map<String, String> fieldErrors;
  final String generalError;

  BaseState getBasicStateCopy({
    Map<String, String>? fieldErrors,
    String? generalError,
    bool? isLoading,
  });

  String? getError(String field) => fieldErrors[field];

  @override
  List<Object?> get props => [
        includeProps(),
        version,
        fieldErrors,
        generalError,
        isLoading,
      ];

  List<Object?> includeProps();

  @override
  bool? get stringify => true;
}
