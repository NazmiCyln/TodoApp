import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/models/task.dart';
import '../status_type/status_type_dto.dart';

part 'task_dto.freezed.dart';
part 'task_dto.g.dart';

@freezed
class TaskDto with _$TaskDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TaskDto({
    required String createdAt,
    required String description,
    required StatusTypeDto statusType,
    required String title,
    required String updatedAt,
  }) = _TaskDto;

  factory TaskDto.fromJson(Map<String, Object?> json) => _$TaskDtoFromJson(json);

  const TaskDto._();

  Tasks toDomain() {
    return Tasks(
      createdAt: createdAt,
      description: description,
      statusType: statusType.toDomain(),
      title: title,
      updatedAt: updatedAt,
    );
  }
}
