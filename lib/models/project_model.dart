import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    @JsonKey(name: 'CompanyID') required int companyId,
    @JsonKey(name: 'EngName') required String engName,
    @JsonKey(name: 'ID') required int id,
    @JsonKey(name: 'ProjectNumber') required int projectNumber,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectModelFromJson(json);
}
