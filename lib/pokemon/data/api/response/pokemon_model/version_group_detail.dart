import 'package:app/pokemon/data/api/response/pokemon_model/named_api_resource.dart';

class VersionGroupDetail {
  NamedAPIResource moveLearnMethod;
  NamedAPIResource versionGroup;
  int levelLearnedAt;

  VersionGroupDetail({
    required this.moveLearnMethod,
    required this.versionGroup,
    required this.levelLearnedAt,
  });

  static VersionGroupDetail fromJson(Map<String, dynamic> json) {
    return VersionGroupDetail(
      moveLearnMethod: NamedAPIResource.fromJson(json['move_learn_method']),
      versionGroup: NamedAPIResource.fromJson(json['version_group']),
      levelLearnedAt: json['level_learned_at'],
    );
  }
}
