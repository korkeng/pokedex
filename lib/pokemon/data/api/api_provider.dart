import 'dart:convert';
import 'dart:io';
import 'package:app/common/constants/api_constants.dart';
import 'package:app/pokemon/data/api/response/get_pokemon_detail_response.dart';
import 'package:app/pokemon/data/api/response/get_pokemon_list_response.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  Future<PokemonList> fetchPokemonList(String? nextUrl) async {
    final response = await Dio().get(nextUrl ?? ApiConstants.getPokemonListURL);

    switch (response.statusCode) {
      case HttpStatus.ok:
        Map<String, dynamic> parsedJson = json.decode(response.toString());
        return PokemonList.fromJson(parsedJson);
      default:
        throw Exception(
            ApiConstants.loadApiFailed(response.statusCode.toString()));
    }
  }

  Future<PokemonDetail> fetchPokemonDetail(String url) async {
    final response = await Dio().get(url);

    switch (response.statusCode) {
      case HttpStatus.ok:
        Map<String, dynamic> parsedJson = json.decode(response.toString());
        return PokemonDetail.fromJson(parsedJson);
      default:
        throw Exception(
            ApiConstants.loadApiFailed(response.statusCode.toString()));
    }
  }
}
