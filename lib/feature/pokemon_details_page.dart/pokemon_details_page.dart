import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pokedex_async_redux/api/models/details_pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/pokemon_tab_view.dart';
import 'package:pokedex_async_redux/feature/widgets/pill_container_widget.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:pokedex_async_redux/utilities/extensions.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({
    required this.pokemon,
    Key? key,
  }) : super(key: key);
  final DetailsPokemon pokemon;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        backgroundColor: (pokemon.types?.first.type?.name ?? '').getPokemonColor,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: (pokemon.types?.first.type?.name ?? '').getPokemonColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Text(
                    pokemon.name?.capitalize ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                    child: Text(
                      '#${pokemon.id.toString().padLeft(3, '0')}',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                  child: Row(
                    children: pokemon.types
                            ?.map((e) => PillContainerWidget(
                                  text: e.type!.name,
                                  color: typeDetailsPageBackgroundColor,
                                ))
                            .toList() ??
                        [],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 220,
                  child: Image.network(
                    '$pokemonImgUrl${pokemon.id}.png',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const SpinKitSpinningLines(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Expanded(child: PokemonTabView(pokemonDetails: pokemon))
        ],
      ),
    );
  }
}
