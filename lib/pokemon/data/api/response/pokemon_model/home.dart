class Home {
  String? frontDefault;
  String? frontShiny;
  String? frontFemale;
  String? frontShinyFemale;

  Home({
    this.frontDefault,
    this.frontShiny,
    this.frontFemale,
    this.frontShinyFemale,
  });

  static Home fromJson(Map<String, dynamic> json) {
    return Home(
      frontDefault: json['frontDefault'],
      frontShiny: json['frontShiny'],
      frontFemale: json['frontFemale'],
      frontShinyFemale: json['frontShinyFemale'],
    );
  }
}
