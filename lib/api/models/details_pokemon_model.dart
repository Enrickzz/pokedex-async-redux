import 'package:pokedex_async_redux/api/models/ability_model.dart';
import 'package:pokedex_async_redux/api/models/game_index_model.dart';
import 'package:pokedex_async_redux/api/models/move_model.dart';
import 'package:pokedex_async_redux/api/models/pokemon_type_model.dart';
import 'package:pokedex_async_redux/api/models/species_model.dart';
import 'package:pokedex_async_redux/api/models/sprites_model.dart';
import 'package:pokedex_async_redux/api/models/stat_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'details_pokemon_model.freezed.dart';
part 'details_pokemon_model.g.dart';

@freezed
class DetailsPokemon with _$DetailsPokemon {
  factory DetailsPokemon({
    @JsonKey(name: 'abilities') List<Ability>? abilities,
    @JsonKey(name: 'baseExperience') int? baseExperience,
    @JsonKey(name: 'forms') List<Species>? forms,
    @JsonKey(name: 'gameIndices') List<GameIndex>? gameIndices,
    @JsonKey(name: 'height') int? height,
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'isDefault') bool? isDefault,
    @JsonKey(name: 'moves') List<Move>? moves,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'species') Species? species,
    @JsonKey(name: 'sprites') Sprites? sprites,
    @JsonKey(name: 'stats') List<Stat>? stats,
    @JsonKey(name: 'types') List<PokemonType>? types,
    @JsonKey(name: 'weight') int? weight,
  }) = _DetailsPokemon;

  factory DetailsPokemon.fromJson(Map<String, dynamic> json) => _$DetailsPokemonFromJson(json);
}
