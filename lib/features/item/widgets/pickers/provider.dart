import '/library.dart';

class PickerState<T> {
  T? pickedState;
  bool isSelected;

  PickerState({
    required this.pickedState,
    required this.isSelected,
  });

  PickerState copyWith({
    T? pickedState,
    bool? isSelected,
  }) {
    return PickerState(
      pickedState: pickedState ?? this.pickedState,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

class PickerNotifier<T> extends StateNotifier<PickerState> {
  PickerNotifier()
      : super(PickerState<T>(pickedState: null, isSelected: false));

  void select(T pickedState) {
    state = state.copyWith(
      pickedState: pickedState,
      isSelected: true,
    );
  }

  void reset() {
    state = state.copyWith(
      pickedState: null,
      isSelected: false,
    );
  }
}

final sizePickerProvider =
    StateNotifierProvider<PickerNotifier, PickerState>((ref) {
  return PickerNotifier();
});
final colorPickerProvider =
    StateNotifierProvider<PickerNotifier, PickerState>((ref) {
  return PickerNotifier();
});
