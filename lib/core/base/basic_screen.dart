import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scoreboard_app/shared/index.dart';
import 'index.dart';

mixin BasicScreen<Screen extends BaseScreen, B extends BaseBloc<BaseEvent, S>,
    S extends BaseState, E extends BaseEvent> on BaseScreenState<Screen> {
  late S currentState;

  B bloc() => context.read<B>();

  O otherBloc<O extends Bloc>() => context.read<O>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<B, S>(
        listener: listener,
        builder: (context, state) {
          currentState = state;
          return Stack(alignment: Alignment.center, children: [
            builder(
              context,
              state,
            ),
            Visibility(
              visible: state.isLoading,
              child: const CustomProgressIndicator(),
            ),
          ]);
        });
  }

  Widget builder(BuildContext context, S state);

  void listener(BuildContext context, S state);

  void pushEvent(E event) {
    bloc().add(event);
  }

  void pushEventToBloc<OB extends Bloc, OE>(OE event) {
    otherBloc<OB>().add(event);
  }
}
