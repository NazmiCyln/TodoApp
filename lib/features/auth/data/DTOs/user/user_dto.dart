import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/user_model.dart';
part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDto with _$UserDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory UserDto({
    required String email,
    required String name,
    required String surname,
    required String userId,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, Object?> json) => _$UserDtoFromJson(json);

  const UserDto._();

  UserModel toDomain() {
    return UserModel(
      email: email,
      name: name,
      surname: surname,
      userId: userId,
    );
  }
}
