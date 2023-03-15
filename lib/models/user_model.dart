import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'UserID') required int userId,
    @JsonKey(name: 'UserName') required String userName,
    @JsonKey(name: 'Name') required String name,
    @JsonKey(name: 'Address') required String address,
    @JsonKey(name: 'Contact') required String contact,
    @JsonKey(name: 'Email') required String email,
    @JsonKey(name: 'Department') required String department,
    @JsonKey(name: 'AccessRoleID') required int accessRoleId,
    @JsonKey(name: 'AccessRoleName') required String accessRoleName,
    @JsonKey(name: 'AccClassID') required int accClassId,
    @JsonKey(name: 'AccClassName') required String accClassName,
    @JsonKey(name: 'CreatedBy') required String createdBy,
    @JsonKey(name: 'CreatedDate') required String createdDate,
    @JsonKey(name: 'ModifiedBy') required String modifiedBy,
    @JsonKey(name: 'ModifiedDate') String? modifiedDate,
    @JsonKey(name: 'UserStatus') required int userStatus,
    @JsonKey(name: 'IsBuiltIn') required bool isBuiltIn,
    @JsonKey(name: 'CompanyID') required int companyId,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
