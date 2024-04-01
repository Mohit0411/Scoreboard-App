import 'package:bloc/bloc.dart';

import 'index.dart';

abstract class BaseBloc<E extends BaseEvent, S extends BaseState>
    extends Bloc<E, S> {
  BaseBloc(super.initialState);
}
