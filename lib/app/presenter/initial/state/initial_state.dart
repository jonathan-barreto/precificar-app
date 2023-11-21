class InitialState {
  final int index;

  InitialState({
    required this.index,
  });

  factory InitialState.initial() {
    return InitialState(
      index: 0,
    );
  }

  factory InitialState.selectIndex({required int index}) {
    return InitialState(
      index: index,
    );
  }

  InitialState copyWith({int? index}) {
    return InitialState(
      index: index ?? this.index,
    );
  }
}
