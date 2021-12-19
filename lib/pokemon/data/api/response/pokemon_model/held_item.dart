import 'package:app/pokemon/data/api/response/pokemon_model/named_api_resource.dart';
import 'package:app/pokemon/data/api/response/pokemon_model/version_detail.dart';

class HeldItem {
  NamedAPIResource item;
  List<VersionDetail> versionDetails;

  HeldItem({
    required this.item,
    required this.versionDetails,
  });

  static HeldItem fromJson(Map<String, dynamic> json) {
    return HeldItem(
      item: NamedAPIResource.fromJson(json['item']),
      versionDetails: (json['version_details'] as List<dynamic>)
          .map((e) => VersionDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
