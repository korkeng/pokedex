import 'package:app/pokemon/data/api/response/pokemon_model/named_api_resource.dart';
import 'package:app/pokemon/data/api/response/pokemon_model/version_group_detail.dart';

class Move {
  NamedAPIResource move;
  List<VersionGroupDetail> versionGroupDetails;

  Move({
    required this.move,
    required this.versionGroupDetails,
  });

  static Move fromJson(Map<String, dynamic> json) {
    return Move(
      move: NamedAPIResource.fromJson(json['move']),
      versionGroupDetails: (json['version_group_details'] as List<dynamic>)
          .map((e) => VersionGroupDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
