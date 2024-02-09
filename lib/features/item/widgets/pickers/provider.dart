import 'package:odin_cloth_wear/library.dart';

/// A [StateNotifier] that manages the state of the picker.
class PickerState<T> {
  /// A [StateNotifier] that manages the state of the picker.
  PickerState({
    required this.pickedState,
    required this.isSelected,
  });

  /// The picked state.
  T? pickedState;

  /// Whether the state is selected.
  bool isSelected;

  /// A [StateNotifier] that manages the state of the picker.
  PickerState<T> copyWith({
    T? pickedState,
    bool? isSelected,
  }) {
    return PickerState(
      pickedState: pickedState ?? this.pickedState,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}

/// A [StateNotifier] that manages the state of the picker.
class PickerNotifier<T> extends StateNotifier<PickerState<T>> {
  /// A [StateNotifier] that manages the state of the picker.
  PickerNotifier()
      : super(PickerState<T>(pickedState: null, isSelected: false));

  /// Selects a state.
  void select(T pickedState) {
    state = state.copyWith(
      pickedState: pickedState,
      isSelected: true,
    );
  }
}

/// A [StateNotifier] that manages the state of the picker.
final sizePickerProvider =
    StateNotifierProvider<PickerNotifier<String>, PickerState<String>>((ref) {
  return PickerNotifier();
});

/// A [StateNotifier] that manages the state of the picker.
final colorPickerProvider =
    StateNotifierProvider<PickerNotifier<int>, PickerState<int>>((ref) {
  return PickerNotifier();
});
