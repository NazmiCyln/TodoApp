import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/status_type.dart';
part 'status_type_dto.freezed.dart';
part 'status_type_dto.g.dart';

@freezed
class StatusTypeDto with _$StatusTypeDto {
  const factory StatusTypeDto({
    required int id,
    required String title,
  }) = _StatusTypeDto;

  factory StatusTypeDto.fromJson(Map<String, Object?> json) => _$StatusTypeDtoFromJson(json);

  const StatusTypeDto._();

  StatusType toDomain() {
    return StatusType(
      id: id,
      title: title,
    );
  }
}
