import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/models/failure/failure.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    required Option<Failure> failure,
    required bool isLoading,
  }) = _ProfileState;

  factory ProfileState.initial() {
    return ProfileState(
      failure: none(),
      isLoading: false,
    );
  }
}
