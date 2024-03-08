import 'package:odin_cloth_wear/library.dart';

/// A [StateNotifier] that manages the state of the picker.
class PickerState<T> {
  /// A [StateNotifier] that manages the state of the picker.
  PickerState({
    required this.pickedState,
    required this.isSelected,
    required this.itemID,
  });

  /// The picked state.
  T? pickedState;

  /// Whether the state is selected.
  bool isSelected;

  /// The item id.
  String itemID;

  /// A [StateNotifier] that manages the state of the picker.
  PickerState<T> copyWith({
    T? pickedState,
    bool? isSelected,
    String? itemID,
  }) {
    return PickerState(
      pickedState: pickedState ?? this.pickedState,
      isSelected: isSelected ?? this.isSelected,
      itemID: itemID ?? this.itemID,
    );
  }
}

/// A [StateNotifier] that manages the state of the picker.
class PickerNotifier<T> extends StateNotifier<PickerState<T>> {
  /// A [StateNotifier] that manages the state of the picker.
  PickerNotifier()
      : super(PickerState<T>(pickedState: null, isSelected: false, itemID: ''));

  /// Selects a state.
  void select(T pickedState, String itemID) {
    state = state.copyWith(
      pickedState: pickedState,
      isSelected: true,
      itemID: itemID,
    );
  }

  /// Resets the state.
  void reset() {
    state = state.copyWith(
      pickedState: null,
      isSelected: false,
      itemID: '',
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
