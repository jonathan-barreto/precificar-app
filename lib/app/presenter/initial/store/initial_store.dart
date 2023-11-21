import 'package:flutter/material.dart';
import 'package:precificar_app/app/core/state/raw_state.dart';
import 'package:precificar_app/app/presenter/initial/state/initial_state.dart';

class InitialStore extends ValueNotifier<RawState> {
  InitialStore() : super(const IdleState());

  void selectIndex({required int index}) {
    value = SuccessState<InitialState>(
      output: InitialState.selectIndex(index: index),
    );
  }
}
