import 'package:pokedex_async_redux/api/models/details_pokemon_model.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/evolution_tab/pokemon_evolution_tab_connector.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/pokemon_about_tab.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/pokemon_base_stats_tab.dart';
import 'package:pokedex_async_redux/feature/pokemon_details_page.dart/widgets/pokemon_moves_tab.dart';
import 'package:pokedex_async_redux/utilities/extensions.dart';
import 'package:pokedex_async_redux/utilities/strings.dart';

class TabView extends StatelessWidget {
  const TabView({required this.pokemonDetails});
  final DetailsPokemon pokemonDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: (pokemonDetails.types?.first.type?.name ?? '').getPokemonColor,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.white,
        ),
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              TabBar(
                indicatorColor: (pokemonDetails.types?.first.type?.name ?? '').getPokemonColor,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      pokemonDetailsTabs[0],
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      pokemonDetailsTabs[1],
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      pokemonDetailsTabs[2],
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      pokemonDetailsTabs[3],
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    AboutTab(
                      weight: pokemonDetails.weight ?? 0,
                      height: pokemonDetails.height ?? 0,
                      abilities: pokemonDetails.abilities,
                      baseExperience: pokemonDetails.baseExperience ?? 0,
                    ),
                    BaseStats(stat: pokemonDetails.stats),
                    PokemonEvolutionConnector(pokemonDetails.species?.id),
                    MovesTab(
                      moves: pokemonDetails.moves,
                      color: (pokemonDetails.types?.first.type?.name ?? '').getPokemonColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
