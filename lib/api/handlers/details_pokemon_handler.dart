import 'dart:convert';
import 'package:pokedex_async_redux/api/models/ability_model.dart';
import 'package:pokedex_async_redux/api/models/detailed_stat_model.dart';
import 'package:pokedex_async_redux/api/models/details_pokemon_model.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_async_redux/api/models/move_model.dart';
import 'package:pokedex_async_redux/api/models/moves_model.dart';
import 'package:pokedex_async_redux/api/models/species_model.dart';
import 'package:pokedex_async_redux/api/models/specific_ability_model.dart';
import 'package:pokedex_async_redux/api/models/specific_type_model.dart';
import 'package:pokedex_async_redux/api/models/stat_model.dart';
import 'package:pokedex_async_redux/api/models/sub_type_model.dart';

class DetailsPokemonHandler {
  static Future<DetailsPokemon?> getDetails(String url) async {
    var response = http.Response('', 100);
    try {
      response = await http.get(Uri.tryParse('$url') ?? Uri());
    } catch (e) {
      print(e);
    }
    if (response.statusCode == 200) {
      var endResponse = jsonDecode(response.body);
      List statMap = endResponse['stats'];
      List typeMap = endResponse['types'];
      List movesMap = endResponse['moves'];
      List abilitiesMap = endResponse['abilities'];
      var speciesMap = endResponse['species'];
      return DetailsPokemon(
        id: endResponse['id'],
        name: endResponse['name'],
        baseExperience: endResponse['base_experience'],
        height: endResponse['height'],
        weight: endResponse['weight'],
        species: Species(
          name: speciesMap['name'],
          id: speciesMap['url'],
        ),
        abilities: abilitiesMap
            .map((e) => Ability(
                  ability: SpecificAbility(
                    name: e['ability']['name'],
                    url: e['ability']['url'],
                  ),
                  slot: e['slot'],
                  isHidden: e['is_hidden'],
                ))
            .toList(),
        stats: statMap.map((e) {
          return Stat(
            baseStat: e['base_stat'],
            stat: DetailedStat(
              name: e['stat']['name'],
              url: e['stat']['url'],
            ),
            effort: e['effort'],
          );
        }).toList(),
        types: typeMap
            .map((e) => SubType(
                slot: e['slot'],
                type: SpecificType(
                  name: e['type']['name'],
                  url: e['type']['url'],
                )))
            .toList(),
        moves: movesMap
            .map((e) => Moves(
                  move: Move(
                    name: e['move']['name'],
                    url: e['move']['url'],
                  ),
                ))
            .toList(),
      );
    } else {
      print('error pokemon details');
      return null;
    }
  }
}
