import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/failure/failure.dart';

part 'bottom_bar_state.freezed.dart';

@freezed
class BottomBarState with _$BottomBarState {
  const factory BottomBarState({
    required Option<Failure> failure,
    required bool isLoading,
  }) = _BottomBarState;

  factory BottomBarState.initial({required bool isLoading}) {
    return BottomBarState(
      failure: none(),
      isLoading: isLoading,
    );
  }
}
