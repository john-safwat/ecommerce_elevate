import 'package:json_annotation/json_annotation.dart';

part 'edit_profile_request_dto.g.dart';

@JsonSerializable()
class EditProfileRequestDto {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
 // String? gender;

  EditProfileRequestDto({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    //this.gender,
  });

  factory EditProfileRequestDto.fromJson(Map<String, dynamic> json) =>
      _$EditProfileRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EditProfileRequestDtoToJson(this);
}
