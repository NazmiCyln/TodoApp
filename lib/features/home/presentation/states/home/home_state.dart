import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/models/failure/failure.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required Option<Failure> failure,
    required bool isLoading,
  }) = _HomeState;

  factory HomeState.initial() {
    return HomeState(
      failure: none(),
      isLoading: false,
    );
  }
}
